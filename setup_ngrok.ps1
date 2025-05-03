<#
.SYNOPSIS
    Set up ngrok
.DESCRIPTION
    .
.EXAMPLE
    C:\PS> setup_ngrok.ps1 8000
    Set up ngrok port forwarding
.NOTES
    Author: JS Irick
    Date:   2022_11_29
#>
## Pull variable from command line
param(
  [string] $target_port #Port to forward
 )

 
 $sb = {
    ngrok http $args[0]
 }

 Start-Job -ScriptBlock $sb -ArgumentList $target_port