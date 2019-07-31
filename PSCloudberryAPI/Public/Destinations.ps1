function GetCloudberryDestination {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory=$True)]
            [string]$Email
		)

    CloudberryGetRequest -access_token $Global:Cloudberry_Access_Token -endpoint "Destinations/$Email" # | Select -Property 'Destinations'
}