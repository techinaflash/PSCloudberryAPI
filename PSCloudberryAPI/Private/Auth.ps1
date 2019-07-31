function Get-CloudberryAccessToken {
    [cmdletbinding()]
    Param (
        [Parameter(Mandatory = $false)]
        [Alias('CloudberryAdminUsername')]
        [string]$Admin_Username,
		
		[Parameter(Mandatory = $false)]
        [Alias('CloudberryAdminPassword')]
        [string]$Admin_Password
		
		
    )
    if ($Admin_Username -and $Admin_Password) {
        $postParams = @{UserName=$Admin_Username;Password=$Admin_Password}

		$resp = try {
			$R = Invoke-RESTMethod -Uri "$($Global:APIBaseURI)Provider/Login" -Method POST -Body $postParams -ContentType 'application/x-www-form-urlencoded'
			Set-Variable -Name "Cloudberry_Access_Token" -Value $R.access_token -Option ReadOnly -Scope global -Force
			Return $R
		} catch {
			Write-Host "ERROR! in web request"    
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