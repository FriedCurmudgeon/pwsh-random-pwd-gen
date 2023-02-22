 Function Get-RandomPassword
{
    #define parameters
    param([int]$PasswordLength = 10)
 
    #ASCII Character set for Password
    $CharacterSet = @{
            Uppercase   = (97..122) | Get-Random -Count 10 | % {[char]$_}
            Lowercase   = (65..90)  | Get-Random -Count 10 | % {[char]$_}
            Numeric     = (48..57)  | Get-Random -Count 10 | % {[char]$_}
            SpecialChar = (33..38) | Get-Random -Count 10 | % {[char]$_}
    }
 
    #Frame Random Password from given character set
    $StringSet = $CharacterSet.Uppercase + $CharacterSet.Lowercase + 
$CharacterSet.Numeric + $CharacterSet.SpecialChar
 
    -join(Get-Random -Count $PasswordLength -InputObject $StringSet)
}

echo ''
echo '### INSTRUCTIONS'
echo '### '
echo '### Copy the randomly generated password and use it when 
creating/resetting a users password.'
echo '### Remember to send the new password to the user - preferably not 
by email'
echo ''
echo ''

$choices = [System.Management.Automation.Host.ChoiceDescription[]] 
@("&YES","&NO")
while ( $true ) {
  #Call the function to generate random password of 12 characters
echo ''
echo '### Random password generated ###'
echo ''
Get-RandomPassword -PasswordLength 12
echo ''
echo '#################################'
echo ''

  $choice = $Host.UI.PromptForChoice("Generate another 
password?","",$choices,0)
  if ( $choice -ne 0 ) {
    break
  }
}

 

