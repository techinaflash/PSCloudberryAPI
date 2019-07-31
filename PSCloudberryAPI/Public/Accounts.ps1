
function GetCloudberryAccountList (){
    CloudberryGetRequest -access_token $Global:Cloudberry_Access_Token -endpoint "Accounts" # | Select -Property 'Destinations'
}