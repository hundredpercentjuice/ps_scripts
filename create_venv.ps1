<#
.SYNOPSIS
    Create Virtual Environment
.DESCRIPTION
    .
.EXAMPLE
    C:\PS> create_venv.ps1 scratchwork 
    Create scratchwork virtualenv
.NOTES
    Author: JS Irick
    Date:   2022_05_20
#>
## Pull variable from command line
param(
  [string] $venv_name #Virtual Environment Name
 )

$venv_root = "$env:USERPROFILE\.venv\"

 ## Validate variables
 if($venv_name -eq ''){
    write-host "Venv name required"
    write-host "get-help create_venv.ps1 for more info"
    exit
 }

  ## Create virtual environment
 $venv_path = join-path $venv_root $venv_name

 if((test-path $venv_path)){
    write-host "Virtual environment already exists"
 }
 else{
    $venv_create = "python -m venv $venv_path"
    Invoke-Expression $venv_create

   #check if command successful
    if(!($?)){
      write-host "Create virtual environment failed(!!)"
      exit
    }

    $venv_activate = join-path $venv_root $venv_name "Scripts\Activate.ps1"
    Invoke-Expression $venv_activate

    python -m pip install --upgrade pip
 }