function CloudberryGetRequest {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory=$False)]
            [string]$access_token = $Global:Cloudberry_Access_Token,

            [Parameter(Mandatory=$True)]
            [string]$endpoint
        )

    if (!$access_token) {
        throw "Access token has not been set. Please use Get-CloudberryAccessToken before calling this function."
    } else {
        $Headers = @{
            Authorization = "Bearer $($access_token)"
            Accept="application/json"
        }
		try {
			Invoke-RestMethod -Method GET -Uri $Global:APIBaseURI$endpoint -Headers $Headers -ContentType "application/json"
			return
		} catch {
			# Dig into the exception to get the Response details.
			# Note that value__ is not a typo.
			Write-Host $_.Exception.Message
			Write-Host "StatusCode:" $_.Exception.Response.StatusCode.value__ 
			Write-Host "StatusDescription:" $_.Exception.Response.StatusDescription
		}
		
    }
}

function CloudberryPostRequest {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory=$False)]
            [string]$access_token = $Global:Cloudberry_Access_Token,

            [Parameter(Mandatory=$True)]
            [string]$endpoint,

            [Parameter(Mandatory=$True)]
            [hashtable]$postParams,
			
			[Parameter(Mandatory=$False)]
            [bool]$DELETE
        )

    if (!$access_token) {
        throw "Access token has not been set. Please use Get-CloudberryAccessToken before calling this function."
    } else {
        $Headers = @{
            Authorization = "Bearer $($access_token)"
            Accept = "application/json"
        }
		
        try {
            
            if (!$DELETE){
				#Write-Host 'Invoking POST web request'
				Invoke-RESTMethod -Uri $Global:APIBaseURI$endpoint -Method POST -Body ($postParams|ConvertTo-JSON) -headers $headers -ContentType 'application/json'
			}else{
				#Write-Host 'Invoking DELETE web request'
				Invoke-RESTMethod -Uri $Global:APIBaseURI$endpoint -Method DELETE -Body ($postParams|ConvertTo-JSON) -headers $headers -ContentType 'application/json'
			}
            return 
        } catch {
			# Dig into the exception to get the Response details.
			# Note that value__ is not a typo.
			Write-Host $_.Exception.Message
			Write-Host "StatusCode:" $_.Exception.Response.StatusCode.value__ 
			Write-Host "StatusDescription:" $_.Exception.Response.StatusDescription   
        }  
    }
}