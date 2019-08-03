
function GetCloudberryUserList(){
    CloudberryGetRequest -access_token $Global:Cloudberry_Access_Token -endpoint "Users" # | Select -Property 'Destinations'
}

function CreateCloudberryUser{
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory=$True)]
            [string]$Email,

            [Parameter(Mandatory=$False)]
            [string]$FirstName,

            [Parameter(Mandatory=$False)]
            [string]$LastName,

            [Parameter(Mandatory=$False)]
            [string[]]$NotificationEmails,

            [Parameter(Mandatory=$False)]
            [string]$Company,

            [Parameter(Mandatory=$True)]
            [string]$Enabled = $true,

            [Parameter(Mandatory=$True)]
			[ValidateLength(6,100)]
            [string]$Password,

            [Parameter(Mandatory=$False)]
            [hashtable]$DestinationList, #AccountID = string, Destination = string, PackageID =123

            [Parameter(Mandatory=$False)]
            [bool]$SendEmailInstruction,

            [Parameter(Mandatory=$False)]
			[ValidateRange(0,2)]
			#Manual	0 A user can activate only a limited number of paid licenses
			#Automatic 1 A user can activate paid licenses from a global pool
			#CompanySettings 2 User company has it's own licenses activating settings. Can not be changed directly
            [Int]$LicenseManagmentMode
        )
		
		
		CloudberryPostRequest -access_token $Global:Cloudberry_Access_Token -endpoint "Users" -postParams $PSBoundParameters
		#Write-Host 'Create User result'
		#Write-Host $_
		return
}

function RemoveCloudberryUser{
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory=$True)]
            [string]$ID
		)
		
		CloudberryPostRequest -DELETE $true -access_token $Global:Cloudberry_Access_Token -endpoint "Users/$ID/Account" -postParams $PSBoundParameters
}