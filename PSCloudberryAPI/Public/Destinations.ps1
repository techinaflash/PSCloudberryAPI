function GetCloudberryDestination{
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory=$True)]
            [string]$Email
		)

    CloudberryGetRequest -access_token $Global:Cloudberry_Access_Token -endpoint "Destinations/$Email"
}

function AddCloudberryUserDestination{
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory=$True)]
            [string]$UserID,

            [Parameter(Mandatory=$True)]
            [string]$AccountID,

            [Parameter(Mandatory=$True)]
            [string]$Destination,

            [Parameter(Mandatory=$True)]
            [int]$PackagedID
        )
		
	 CloudberryPostRequest -access_token $Global:Cloudberry_Access_Token -endpoint "Destinations"
		
}