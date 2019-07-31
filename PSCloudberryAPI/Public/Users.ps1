
function GetCloudberryAccountList (){
    CloudberryGetRequest -access_token $Global:CloudberryAccessToken -endpoint "$($Global:CloudberryAPIURI)Accounts" | Select -Property 'Destinations'
}