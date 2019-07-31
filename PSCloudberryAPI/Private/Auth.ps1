function GetCloudberryAuth ($APIuser,$APIpassword) {
  #Write-Host "APIuser is $($APIuser)"
  #Write-Host "APIpassword is $($APIpassword)"
  $postParams = @{UserName=$APIuser;Password=$APIpassword}
  #@{UserName="matthew@techinaflash.net";Password="Snoqualmie10!"}
  $resp = try {
    #Write-Host 'Invoking web request'
    $R = Invoke-RESTMethod -Uri "https://api.mspbackups.com/api/Provider/Login" -Method POST -Body $postParams -ContentType 'application/x-www-form-urlencoded'
    Write-Host $R
    #Set-CloudberryAccessToken -access_token $R.access_token
    #return $R.access_token
  } catch {
    Write-Host "ERROR! in web request"    
  }  
}

function CloudberryGetRequest {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory=$False)]
            [string]$access_token = $Global:CloudberryAccessToken,

            [Parameter(Mandatory=$True)]
            [string]$endpoint
        )

    if (!$access_token) {
        throw "Access token has not been set. Please use GetCloudberryAuth before calling this function."
    } else {
        $Headers = @{
            Authorization = "Bearer $($access_token)"
            Accept="application/json"
        }
    
        $Response = Invoke-RestMethod -Method GET -Uri $endpoint -Headers $Headers -ContentType "application/json"
    
        return $Response
    }
}