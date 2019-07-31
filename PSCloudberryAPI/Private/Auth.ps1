function Get-CloudberryAccessToken {
    [cmdletbinding()]
    Param (
        [Parameter(Mandatory = $true)]
        [Alias('CloudberryAdminUsername')]
        [string]$Admin_Username,
		
		[Parameter(Mandatory = $true)]
        [Alias('CloudberryAdminPassword')]
        [string]$Admin_Password
		
		
    )
    if ($Admin_Username -and $Admin_Password) {
        $postParams = @{UserName=$Admin_Username;Password=$Admin_Password}
		Write-Host $Admin_Username
		Write-Host $Admin_Password
		try {
			$R = Invoke-RESTMethod -Uri "$($Global:APIBaseURI)Provider/Login" -Method POST -Body $postParams -ContentType 'application/x-www-form-urlencoded'
			Set-Variable -Name "Cloudberry_Access_Token" -Value $R.access_token -Option ReadOnly -Scope global -Force
			Return $R
		} catch {
			# Dig into the exception to get the Response details.
			# Note that value__ is not a typo.
			Write-Host $_.Exception.Message
			Write-Host $_.Exception.ItemName
			Write-Host "StatusCode:" $_.Exception.Response.StatusCode.value__ 
			Write-Host "StatusDescription:" $_.Exception.Response.StatusDescription
		}  
	}else {
        Write-Host "Admin username or admin password not supplied to get access token"
        Exit 1
    }
}

function Remove-CloudberryAccessToken {
    Remove-Variable -Name "Cloudberry_Access_Token" -Scope global -Force
}

New-Alias -Name Set-CloudberryAPIKey -Value Get-CloudberryAccessToken
New-Alias -Name Add-CloudberryAPIKey -Value Get-CloudberryAccessToken