<#
.SYNOPSIS
    Quickjump into repositories
.DESCRIPTION
    .
.EXAMPLE
    C:\PS> quick_jump.ps1 scratchwork 
    Start scratchwork virtualenv and hop into repo
.NOTES
    Author: JS Irick
    Date:   2022_05_20
#>
## Pull variable from command line
param(
  [string] $repo_name #Shortname of the repository
 )

$repo_root = "$env:USERPROFILE\Desktop\repos\"
$venv_root = "$env:USERPROFILE\.venv\"

 ## Validate variables
 if($repo_name -eq ''){
    write-host "Repository name required"
    write-host "get-help quick_jump.ps1 for more info"
    exit
 }

 ## Go to repository
 $repo_path = join-path $repo_root $repo_name
 if(!(test-path $repo_path)){
    write-host "Repo at $repo_path does not exist"
 }
 else
 {
    Set-Location $repo_path
 }

 ## Launch virtual environment
 $venv_activate = join-path $venv_root $repo_name "Scripts\Activate.ps1"

 if(!(test-path $venv_activate)){
    write-host "Venv script at $venv_activate does not exist"
 }
 else{
    Invoke-Expression $venv_activate
 }