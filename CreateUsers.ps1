# Create File Path to csv File
$UsersFilePath = ".\Users.csv"

# Assign Directory
$Directory = "your-directory"
 
# Import the csv files
$Users = import-csv $UsersFilePath

# Create Groups list
$Groups = Get-AzureADGroup

# Loop through each user in Users
Foreach($User in $Users){

    $Dept = $User.Department
    $UPN = $User.UserName + "@" + $Directory
    $State = $User.State
    $FullName = $User.FirstName + " " + $User.LastName
    $Pos = $User.Position

    # Create PasswordProfile for each User
    $PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
    $PasswordProfile.Password = $User.UserName + "SJVC"
    $PasswordProfile.ForceChangePasswordNextLogin = 1
    #$Pass = $User.Username + "SJVC"

    # Create var exist to check if the user already in the AD
    try {
        $Exist = Get-AzureADUser -Filter "startswith(UserPrincipalName, '$User.UserName')"
    }

    catch{

    }

    # If not exist create the user
    if(!$Exist){

        # Create Password Profile to assign Password
        #Write-Host $PasswordProfile
        New-AzureADUser -UserPrincipalName $UPN `
                    -DisplayName $FullName `
                    -PasswordProfile $PasswordProfile `
                    -AccountEnabled $true `
                    -MailNickName $User.UserName `
                    -Department $Dept `
                    -State $State `
                    -JobTitle $Pos
        
        # Create temp variable as the user with the current UPN
        $Temp = Get-AzureADUser -ObjectId $UPN

        # Go through groups list if group match with user department add user to that group
        foreach($Group in $Groups){
            if($Temp.Department -match $Group.DisplayName){
                Add-AzureADGroupMember -ObjectId $Group.ObjectId -RefObjectId $Temp.ObjectId
                #Set-AzureADUserPassword -ObjectId $Temp.ObjectID -Password (ConvertTo-SecureString -String $Pass -AsPlainText -Force)

            }
        }

        # Export to CSV

        # Create Headers for the table
        $CSV = "" | Select Username, Name, Password

        # Add values to the Table
        $CSV.Username = $User.UserName
        $CSV.Name = $FullName
        $CSV.Password = $Pass

        # Export to csv file
        $CSV | Export-CSV -Path .\ADDUser.csv -NoTypeInformation -Append

        }
}