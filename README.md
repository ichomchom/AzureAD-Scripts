# AzureAD-Scripts

Some python and powershell scripts to help with the automation in create users and group in AzureAD

## Files List:

* EmployeeSampleDataset.csv - Employee dataset
* ImportDataSet.py - Import dataset to database using pandas, numpy and sqlalchemy
* Department.sql - Query to get Department from database
* Department.csv - Export data from Department.sql
* CreateGroup.ps1 - Create group on AzureAD base on Deparment.csv
* Users.sql - Querty to create username using Lastname + 4 digit of ID
* Users.csv - Export data from Users.sql
* CreateUsers.ps1 - Create users on AzureAD from file Users.csv and assign user into the their group base on their Department and export username and passwor to csv file(ADDUser.csv)



## Authors

* **Huey Phan** - [ichomchom](https://github.com/ichomchom)


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

