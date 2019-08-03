
function GetCloudberryLicenseList{
	[CmdletBinding()]
        Param(
            [Parameter(Mandatory=$True)]
            [boolean]$IsAvailable
		)
    CloudberryGetRequest -access_token $Global:Cloudberry_Access_Token -endpoint "Licenses?/IsAvailable=$IsAvailable" 
}
function GrantCloudberryLicense{
	[CmdletBinding()]
        Param(
            [Parameter(Mandatory=$True)]
            [string]$LicenseID,
			
			[Parameter(Mandatory=$True)]
            [string]$UserID
			
		)
    CloudberryPostRequest -access_token $Global:Cloudberry_Access_Token -endpoint "Licenses/Grant" -postParams $PSBoundParameters
}

