
function GetCloudberryCompanyList (){
    CloudberryGetRequest -access_token $Global:Cloudberry_Access_Token -endpoint "Companies" 
}

function CreateCloudberryCompany {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory=$True)]
            [string]$Name,

            [Parameter(Mandatory=$False)]
            [int]$StorageLimit,

            [Parameter(Mandatory=$False)]
            [ValidateRange(0,2)]
			[int]$LicenseSettings
			
			#Company license settings: 0 - Custom (Users have custom license settings) 1 - Global Pool(Users activate paid licenses from the global pool automatically) 2 - Company Pool(Users can activate only limited number of paid licenses from the company pool)

        )
		
		
		CloudberryPostRequest -access_token $Global:Cloudberry_Access_Token -endpoint "Companies" -postParams $PSBoundParameters
		#Write-Host 'Create User result'
		#Write-Host $_
		return
}

function RemoveCloudberryCompany {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory=$True)]
            [string]$ID
		)
		
		CloudberryPostRequest -DELETE $true -access_token $Global:Cloudberry_Access_Token -endpoint "Companies/$ID" -postParams $PSBoundParameters
}