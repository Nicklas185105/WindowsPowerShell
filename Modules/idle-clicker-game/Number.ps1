# Make sure we can see BigInteger
$ref = [System.IO.Path]::Combine([System.Runtime.InteropServices.RuntimeEnvironment]::GetRuntimeDirectory(), "System.Numerics.dll")

# Define the Number class with IComparable
$cs = @"
using System;
using System.Numerics;

namespace IdleClicker {
    public class Number : IComparable, IComparable<Number>
    {
        private BigInteger _numerator;
        private BigInteger _denominator;

        public BigInteger Numerator
        {
            get { return _numerator; }
        }
        public BigInteger Denominator
        {
            get { return _denominator; }
        }

        // Public constructor from string, supports '.' or ','.
        public Number(string text)
        {
            if (String.IsNullOrEmpty(text))
                throw new ArgumentException("Input cannot be empty", "text");
            string[] parts = text.Split(new char[]{'.',','});
            string intPart  = parts[0];
            string fracPart = parts.Length > 1 ? parts[1] : String.Empty;
            _numerator   = BigInteger.Parse(intPart + fracPart);
            _denominator = BigInteger.Pow(10, fracPart.Length);
        }

        // Internal constructor for fractions
        private Number(BigInteger num, BigInteger den)
        {
            _numerator   = num;
            _denominator = den;
        }

        // IComparable<Number>
        public int CompareTo(Number other)
        {
            if (other == null) return 1;
            BigInteger left  = BigInteger.Multiply(_numerator, other._denominator);
            BigInteger right = BigInteger.Multiply(other._numerator, _denominator);
            return left.CompareTo(right);
        }

        // Non-generic IComparable
        int IComparable.CompareTo(object obj)
        {
            return CompareTo(obj as Number);
        }

        public override string ToString()
        {
            BigInteger whole = BigInteger.Divide(_numerator, _denominator);
            BigInteger rem   = BigInteger.Remainder(_numerator, _denominator);
            if (rem.IsZero) return whole.ToString();
            // width = number of decimal places = (length of _denominator as string) - 1
            int width = _denominator.ToString().Length - 1;
            string frac = rem.ToString().PadLeft(width, '0');
            return String.Format("{0}.{1}", whole, frac.TrimEnd('0'));
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
            BigInteger wholeBI = BigInteger.Divide(Numerator, Denominator);
            BigInteger remBI   = BigInteger.Remainder(Numerator, Denominator);
            // Cast parts to decimal (should fit within range)
            decimal wholeDec = (decimal)wholeBI;
            decimal remDec   = (decimal)remBI;
            decimal denDec   = (decimal)Denominator;
            return wholeDec + remDec / denDec;
        }

        public Number Ceiling()
        {
            BigInteger whole = BigInteger.Divide(_numerator, _denominator);
            BigInteger rem   = BigInteger.Remainder(_numerator, _denominator);
            if (!rem.IsZero) whole = BigInteger.Add(whole, BigInteger.One);
            return new Number(whole.ToString());
        }

        public Number Pow(Number exp)
        {
            if (exp._denominator != BigInteger.One)
                throw new ArgumentException("Exponent must be an integer", "exp");
            int e = (int)exp._numerator;
            BigInteger n = BigInteger.Pow(_numerator, e);
            BigInteger d = BigInteger.Pow(_denominator, e);
            return new Number(n, d);
        }

        public static Number operator +(Number a, Number b)
        {
            BigInteger den = BigInteger.Multiply(a._denominator, b._denominator);
            BigInteger num = BigInteger.Add(
                BigInteger.Multiply(a._numerator, b._denominator),
                BigInteger.Multiply(b._numerator, a._denominator));
            return new Number(num, den);
        }

        public static Number operator -(Number a, Number b)
        {
            BigInteger den = BigInteger.Multiply(a._denominator, b._denominator);
            BigInteger num = BigInteger.Subtract(
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
        
        // Formats with K/M/B/T/Qa/Qi/Sx/Sp suffix and rounds up one decimal
        public string FormatCompact()
        {
            if (_numerator < 10) return this.ToString();
            
            BigInteger whole = BigInteger.Divide(_numerator, _denominator);
            decimal decVal;
            string suffix;

            if (whole < BigInteger.Pow(10, 3))
            {
                decVal = (decimal)whole;
                suffix = string.Empty;
                if (decVal < 10)
                    return decVal.ToString("F1");
                else
                    return decVal.ToString("F0");
            }
            else if (whole < BigInteger.Pow(10, 6))
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
            decimal rounded = Math.Round(decVal / 10) / 10;
            int decimals = rounded < 10 ? 1 : 0;
            if (decimals == 1)
                return String.Format("{0:F1}{1}", rounded, suffix);
            else
                return String.Format("{0}{1}", (int)rounded, suffix);
        }
    }
}
"@

Add-Type -TypeDefinition $cs -Language CSharp -ReferencedAssemblies $ref