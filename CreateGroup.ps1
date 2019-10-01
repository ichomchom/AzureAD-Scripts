$CSVFilePath = ".\Department.csv"

$Depts = import-csv -Path $CSVFilePath

Foreach($Dept in $Depts) {
    New-AzureADGroup -Description $Dept.Department -DisplayName $Dept.Department -MailEnabled $false -SecurityEnabled $true -MailNickName $Dept.Department
}
