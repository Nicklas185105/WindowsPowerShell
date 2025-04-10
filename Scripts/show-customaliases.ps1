function Show-CustomAliases {
    if ($Global:MyCustomAliases -and $Global:MyCustomAliases.Count -gt 0) {
        # Retrieve aliases that match the names in the custom list.
        $customAliases = Get-Alias | Where-Object { $Global:MyCustomAliases -contains $_.Name }
        if ($customAliases) {
            Write-Host "Custom Aliases:" -ForegroundColor Green
            $customAliases | Format-Table Name, Definition -AutoSize
        }
        else {
            Write-Host "No custom aliases found matching your list." -ForegroundColor Yellow
        }
    }
    else {
        Write-Host "Custom alias list is not defined or is empty." -ForegroundColor Red
    }
}
