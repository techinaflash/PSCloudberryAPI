$projectRoot = Resolve-Path "$PSScriptRoot\.."
$moduleRoot = Split-Path (Resolve-Path "$projectRoot\*\*.psm1")
$moduleName = Split-Path $moduleRoot -Leaf

Describe "Testing the intenetal authorization function:" {

	InModuleScope GetCloudberryAuth{
	
		It "Supplied username and password, checking access_token exists:" {
			$result = Get-CloudberryAccessToken -Admin_Username $env:CBUSERNAME -Admin_Password $env:CBPASSWORD
			$Global:Cloudberry_Access_Token
			$result.access_token | Should -Not -Be $null
		}
	}
}