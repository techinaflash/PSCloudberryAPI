$projectRoot = Resolve-Path "$PSScriptRoot\.."
$moduleRoot = Split-Path (Resolve-Path "$projectRoot\*\*.psm1")
$moduleName = Split-Path $moduleRoot -Leaf

Describe "Testing the intenetal authorization function:" {

	InModuleScope GetCloudberryAuth{
	
		It "Supplied username and password:" {
			$result = GetCloudberryAuth -APIUser $env:CBUSERNAME -APIpassword $env:CBPASSWORD
			$result.access_token | Should -Not -Be $null
		}
	}
}