# Bank_Management
ITC 350 Open Source Project bash Bank Management system


ITC – 350 / Open Source
Supervised by: Dr. Sami Naji
Abdul Mateen Rahmat – 34833
Khujasta Ahmadi – 34878
Emal Ismail - 32821


1)	Menu function: Displays the user’s options on the screen which include creating a new account, updating account data, viewing and managing transactions, checking customer account details, deleting an account and exiting.
2)	New account function: Creates a customer account by asking the user for the following inputs; customer name, date of birth, national number, email address, city, country, phone number, type of account (saving or current), and the amount to be deposited at first. 
3)	View function: Enables the user to view their account information (name, date of birth, phone number etc.).
4)	Edit function: Allows the user to edit the customer’s current account information such as the phone number and email address which usually require updating.
5)	Transaction function: Enables user to deposit or withdraw money to and from their account.
6)	Delete function: Enables user to delete an account using the customer ID.
Problem statement: 

No prior knowledge in some parts of the project. For example we did not have any prior knowledge or familiarity with storing data in a csv file, retrieving data from it and updating existing data. Also querying data was a new concept as well.


Challenges:

•	Storing all customer information is a csv file.
•	Updating the stored data. 
•	Retrieving and querying data.
•	We had to learn (awk) to retrieve and update or modify data
•	Learning (sed) line editor was difficult because there  was no other way of deleting data from .csv
Solutions: 

•	Setting header argument to set the first row for column names. 
o	.csv | head
•	Using awk command which scans each input file for line that match any set of patterns specified literally in prog or in one or more files specified as –f file.
•	Import data from a .csv file using write.csv (…) function.
•	Using awk to view the column of data in a csv file.
o	To view a specific fields you can use (awk –F “\” *, * ”\” ‘{print $0}’ file.csv
•	Updating data using : awk –F 


Conclusion:
This project is developed to nurture the needs of a user in a banking sector by embedding all the tasks of transactions taking place. It serves as a good approach to deposit and withdraw money and saves manual work. Alongside, it helped us learn the usage of csv files that include storing and retrieving data and other aforementioned challenges.

