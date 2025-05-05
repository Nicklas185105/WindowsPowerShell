using System.Numerics;

namespace CookieClicker;

public class Number : IComparable, IComparable<Number>
{
    private readonly BigInteger _numerator;
    private BigInteger _denominator;

    // Public constructor from string, supports '.' or ','.
    public Number(string text)
    {
        if (string.IsNullOrEmpty(text))
            throw new ArgumentException("Input cannot be empty", nameof(text));
        var parts = text.Split('.', ',');
        var intPart = parts[0];
        var fracPart = parts.Length > 1 ? parts[1] : string.Empty;
        _numerator = BigInteger.Parse(intPart + fracPart);
        _denominator = BigInteger.Pow(10, fracPart.Length);
    }

    // Internal constructor for fractions
    private Number(BigInteger num, BigInteger den)
    {
        _numerator = num;
        _denominator = den;
    }

    // IComparable<Number>
    public int CompareTo(Number other)
    {
        if (other == null) return 1;
        var left = BigInteger.Multiply(_numerator, other._denominator);
        var right = BigInteger.Multiply(other._numerator, _denominator);
        return left.CompareTo(right);
    }

    // Non-generic IComparable
    int IComparable.CompareTo(object obj)
    {
        return CompareTo(obj as Number);
    }

    public override string ToString()
    {
        var whole = BigInteger.Divide(_numerator, _denominator);
        var rem = BigInteger.Remainder(_numerator, _denominator);
        if (rem.IsZero) return whole.ToString();
        // width = number of decimal places = (length of _denominator as string) - 1
        var width = _denominator.ToString().Length - 1;
        var frac = rem.ToString().PadLeft(width, '0');
        return $"{whole}.{frac.TrimEnd('0')}";
    }

    // Factory for operator results
    public static Number FromFraction(BigInteger num, BigInteger den)
    {
        return new Number(num, den);
    }

    /// <summary>
    /// Converts this Number to a System.Decimal safely by splitting into whole and remainder.
    /// </summary>
    public decimal ToDecimal()
    {
        // Split into integer and fractional parts
        var wholeBi = BigInteger.Divide(_numerator, _denominator);
        var remBi = BigInteger.Remainder(_numerator, _denominator);
        // Cast parts to decimal (should fit within range)
        var wholeDec = (decimal)wholeBi;
        var remDec = (decimal)remBi;
        var denDec = (decimal)_denominator;
        return wholeDec + remDec / denDec;
    }

    public Number Ceiling()
    {
        var whole = BigInteger.Divide(_numerator, _denominator);
        var rem = BigInteger.Remainder(_numerator, _denominator);
        if (!rem.IsZero) whole = BigInteger.Add(whole, BigInteger.One);
        return new Number(whole.ToString());
    }

    public Number Pow(Number exp)
    {
        if (exp._denominator != BigInteger.One)
            throw new ArgumentException("Exponent must be an integer", nameof(exp));
        var e = (int)exp._numerator;
        var n = BigInteger.Pow(_numerator, e);
        var d = BigInteger.Pow(_denominator, e);
        return new Number(n, d);
    }

    public static Number operator +(Number a, Number b)
    {
        var den = BigInteger.Multiply(a._denominator, b._denominator);
        var num = BigInteger.Add(
            BigInteger.Multiply(a._numerator, b._denominator),
            BigInteger.Multiply(b._numerator, a._denominator));
        return new Number(num, den);
    }

    public static Number operator ++(Number a)
    {
        return a + new Number("1");
    }

    public static Number operator -(Number a, Number b)
    {
        var den = BigInteger.Multiply(a._denominator, b._denominator);
        var num = BigInteger.Subtract(
            BigInteger.Multiply(a._numerator, b._denominator),
            BigInteger.Multiply(b._numerator, a._denominator));
        return new Number(num, den);
    }

    public static Number operator *(Number a, Number b)
    {
        return new Number(
            BigInteger.Multiply(a._numerator, b._numerator),
            BigInteger.Multiply(a._denominator, b._denominator));
    }

    public static Number operator /(Number a, Number b)
    {
        return new Number(
            BigInteger.Multiply(a._numerator, b._denominator),
            BigInteger.Multiply(a._denominator, b._numerator));
    }

    public static bool operator >(Number a, Number b)
    {
        return a.CompareTo(b) > 0;
    }

    public static bool operator <(Number a, Number b)
    {
        return a.CompareTo(b) < 0;
    }

    public static bool operator >=(Number a, Number b)
    {
        return a.CompareTo(b) >= 0;
    }

    public static bool operator <=(Number a, Number b)
    {
        return a.CompareTo(b) <= 0;
    }

    // Formats with K/M/B/T/Qa/Qi/Sx/Sp suffix and rounds up one decimal
    public string FormatCompact()
    {
        if (_numerator < 10) return ToString();

        var whole = BigInteger.Divide(_numerator, _denominator);
        decimal decVal;
        string suffix;

        if (whole < BigInteger.Pow(10, 3))
        {
            decVal = (decimal)whole;
            return decVal.ToString(decVal < 10 ? "F1" : "F0");
        }

        if (whole < BigInteger.Pow(10, 6))
        {
            decVal = (decimal)((whole * 100) / BigInteger.Parse("1000"));
            suffix = "K";
        }
        else if (whole < BigInteger.Pow(10, 9))
        {
            decVal = (decimal)((whole * 100) / BigInteger.Pow(10, 6));
            suffix = "M";
        }
        else if (whole < BigInteger.Pow(10, 12))
        {
            decVal = (decimal)((whole * 100) / BigInteger.Pow(10, 9));
            suffix = "B";
        }
        else if (whole < BigInteger.Pow(10, 15))
        {
            decVal = (decimal)((whole * 100) / BigInteger.Pow(10, 12));
            suffix = "T";
        }
        else if (whole < BigInteger.Pow(10, 18))
        {
            decVal = (decimal)((whole * 100) / BigInteger.Pow(10, 15));
            suffix = "Qa";
        }
        else if (whole < BigInteger.Pow(10, 21))
        {
            decVal = (decimal)((whole * 100) / BigInteger.Pow(10, 18));
            suffix = "Qi";
        }
        else if (whole < BigInteger.Pow(10, 24))
        {
            decVal = (decimal)((whole * 100) / BigInteger.Pow(10, 21));
            suffix = "Sx";
        }
        else if (whole < BigInteger.Pow(10, 27))
        {
            decVal = (decimal)((whole * 100) / BigInteger.Pow(10, 24));
            suffix = "Sp";
        }
        else if (whole < BigInteger.Pow(10, 30))
        {
            decVal = (decimal)((whole * 100) / BigInteger.Pow(10, 27));
            suffix = "Oc";
        }
        else if (whole < BigInteger.Pow(10, 33))
        {
            decVal = (decimal)((whole * 100) / BigInteger.Pow(10, 30));
            suffix = "No";
        }
        else if (whole < BigInteger.Pow(10, 36))
        {
            decVal = (decimal)((whole * 100) / BigInteger.Pow(10, 33));
            suffix = "Dc";
        }
        else if (whole < BigInteger.Pow(10, 39))
        {
            decVal = (decimal)((whole * 100) / BigInteger.Pow(10, 36));
            suffix = "Udc";
        }
        else if (whole < BigInteger.Pow(10, 42))
        {
            decVal = (decimal)((whole * 100) / BigInteger.Pow(10, 39));
            suffix = "Ddc";
        }
        else if (whole < BigInteger.Pow(10, 45))
        {
            decVal = (decimal)((whole * 100) / BigInteger.Pow(10, 42));
            suffix = "Tdc";
        }
        else if (whole < BigInteger.Pow(10, 48))
        {
            decVal = (decimal)((whole * 100) / BigInteger.Pow(10, 45));
            suffix = "Qadc";
        }
        else if (whole < BigInteger.Pow(10, 51))
        {
            decVal = (decimal)((whole * 100) / BigInteger.Pow(10, 48));
            suffix = "Qidc";
        }
        else if (whole < BigInteger.Pow(10, 54))
        {
            decVal = (decimal)((whole * 100) / BigInteger.Pow(10, 51));
            suffix = "Sxdc";
        }
        else if (whole < BigInteger.Pow(10, 57))
        {
            decVal = (decimal)((whole * 100) / BigInteger.Pow(10, 54));
            suffix = "Spdc";
        }
        else if (whole < BigInteger.Pow(10, 60))
        {
            decVal = (decimal)((whole * 100) / BigInteger.Pow(10, 57));
            suffix = "Ocdc";
        }
        else if (whole < BigInteger.Pow(10, 63))
        {
            decVal = (decimal)((whole * 100) / BigInteger.Pow(10, 60));
            suffix = "Nmdc";
        }
        else if (whole < BigInteger.Pow(10, 66))
        {
            decVal = (decimal)((whole * 100) / BigInteger.Pow(10, 63));
            suffix = "Vg";
        }
        else if (whole < BigInteger.Pow(10, 69))
        {
            decVal = (decimal)((whole * 100) / BigInteger.Pow(10, 66));
            suffix = "Uvg";
        }
        else if (whole < BigInteger.Pow(10, 72))
        {
            decVal = (decimal)((whole * 100) / BigInteger.Pow(10, 69));
            suffix = "DvG";
        }
        else if (whole < BigInteger.Pow(10, 75))
        {
            decVal = (decimal)((whole * 100) / BigInteger.Pow(10, 72));
            suffix = "Tvg";
        }
        else //if (whole < BigInteger.Pow(10, 78))
        {
            decVal = (decimal)((whole * 100) / BigInteger.Pow(10, 75));
            suffix = "Qav";
        }

        // Round up to one decimal
        var rounded = Math.Round(decVal / 10) / 10;
        var decimals = rounded < 10 ? 1 : 0;
        return decimals == 1 ? $"{rounded:F1}{suffix}" : $"{(int)rounded}{suffix}";
    }
}