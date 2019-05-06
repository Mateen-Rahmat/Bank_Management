

mainmenu()
{

	echo "===================================================================="
	echo "             Customer Account Banking System            "
	echo "===================================================================="

	echo -e "\e[31m1) Create a new customer account\e[0m"
	echo -e "\e[32m2) Update Account Data\e[0m" 
	echo -e "\e[33m3) View and Manage Transaction\e[0m" 
	echo -e "\e[34m4) Check Customer's Account Details\e[0m"
	echo "5) Delete Customer's Account"
	echo -e "\e[36m6) Exit\e[0m"
	
	echo ""
	echo ""

	echo "Enter the Option:"
	read options
	clear
	case $options in
	1) AccCreate ;;
	2) AccEdit ;;
	3) transactions ;;
	4) AccView ;;
	5) delete ;;
	6) Exit ;;
	esac
}



AccCreate()
{
	clear
	echo "Please Enter your Full Name: "
	read cusName
	while ! [[ $cusName =~ ^-?[[:alpha:]]+$ || $cusName =~ " " ]]
do
	echo "Please enter a valid Full Name"
	read cusName
done
	cusName=${cusName^}
	echo ""

	echo "Please Enter your Date of Birth: "
	read cusBirth
	echo ""

	echo "Please Enter your National ID Number: "
	read nationalID
	while ! [[ $nationalID =~ ^-?[[:digit:]]+$ ]]
do
	echo "Please enter a Valid National ID Number"
	read nationalID
done


	nationalID=${nationalID^}
	echo ""

	echo "Please Enter your Email Address: "
	read cusEmail
	echo ""


	echo "Please Enter your City Name: "
	read cityName
	echo ""
	while ! [[ $cityName =~ ^-?[[:alpha:]]+$ || $cityName =~ " " ]]
do
	echo "Please enter a Valid City Name"
	read cityName
done
	cityName=${cityName^}

	echo "Please Enter your Country Name: "
	read countryName
while ! [[ $countryName =~ ^-?[[:alpha:]]+$ || $countryName =~ " " ]]
do
	echo "Please enter a Valid Country Name"
	read countryName
done
	countryName=${countryName^}
	echo ""

	echo "Please Enter your Phone Number:  "
	read phoneNumber
	while ! [[ $phoneNumber =~ ^-?[[:digit:]]+$ ]]
do
	echo "Please enter a Valid Phone Number"
	read phoneNumber
done
	echo "Please Select your Account Type: "
		echo "1) Savings Account"
		echo "2) Current Account"
		read accountType
		case $accountType in 
		1)	accountType="Savings_Account" ;;
		2)	accountType="Current_Account" ;;
		esac
	
	echo "Please Enter Initial Deposit Amount: "
	read initialDeposit




touch /home/mateen/Desktop/Customer_Database.csv #Adding Recoded Values to CSV File
echo "$(($(tail -1 Customer_Database.csv | awk '{print $1}' FS=",")+1)),$cusName,$cusBirth,$nationalID,$cusEmail,$cityName,$countryName,$phoneNumber,$accountType,$initialDeposit" >> /home/mateen/Desktop/Customer_Database.csv 

echo -e "\nYour Details are Recorded"
echo -e "\nPress Any Keys To Go to Previous Menu, Press (q) to Quit"
read response

if [ $response == "q" ]; then
	exit
else 
	clear
fi

}

AccView()
{
	echo -e "Please Choose an Option:"
	echo -e "1) Search by ID:"
	echo -e "2) Search by Name:"
	echo -e "3) Search by Account Type:"
	echo -e ""
	read searchOption
	clear
	case $searchOption in 
	1)
		echo -e "Enter the ID Number of the Account you want to view: \n"
		read enterID
		echo "ID","Name", "DOB", "NID", "Email", "City", "Country", "Number", "Type", "Deposit"
        	awk -v id=$enterID 'BEGIN{FS=","; OFS="|"; NR==1} { if ($1 == id) { print } }' Customer_Database.csv | head
		#awk -F, '$1 == $enterID {print $0}' Customer_Database.csv
	;;
	2)	
		echo -e "Enter the Name of the Person you want to view: \n"
		read enterName
		echo "ID","Name", "DOB", "NID", "Email", "City", "Country", "Number", "Type", "Deposit"
        	awk -v name=$enterName 'BEGIN{FS=","; OFS="|"; NR==1} { if ($2 == name) { print } }' Customer_Database.csv | head
		#awk -F, '$1 == $enterID {print $0}' Customer_Database.csv
	;;
	3)
		echo -e "Please Choose an Option:"
		echo -e "1) Saving Accounts:"
		echo -e "2) Current Accounts:"
		echo -e ""
		read typeOption

		case $typeOption in
		1)

		acctypee="Savings_Account"
		echo "ID","Name", "DOB", "NID", "Email", "City", "Country", "Number", "Type", "Deposit"
        	awk -v typee=$acctypee 'BEGIN{FS=","; OFS="|"; NR==1} { if ($9 == typee) { print } }' Customer_Database.csv | head
		#awk -F, '$1 == $enterID {print $0}' Customer_Database.csv
		;;

		2)

		acctypee="Current_Account"
		echo "ID","Name", "DOB", "NID", "Email", "City", "Country", "Number", "Type", "Deposit"
        	awk -v typee=$acctypee 'BEGIN{FS=","; OFS="|"; NR==1} { if ($9 == typee) { print } }' Customer_Database.csv | head
		#awk -F, '$1 == $enterID {print $0}' Customer_Database.csv
		;;
		esac
	esac
}



AccEdit()
{
	clear
	echo "1) Edit Name"
	echo "2) Edit Birth date"
	echo "3) Edit National Number"
	echo "4) Edit Email"
	echo "5) Edit City"
	echo "6) Edit Country"
	echo "7) Phone Number"
	echo "8) Edit Account Type"
	echo "9) Edit Account Balance: "

	echo "Enter the option: " 


	read editInput
	case $editInput in
	
	1)
		echo -e "insert the ID of the account you want to edit: \n"
		read upID

		echo -e "Insert the new Name"
		read nameInput
		awk -v id=$upID -v name="$nameInput" 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $2=name; print}' Customer_Database.csv > 			Data.tmp && mv Data.tmp Customer_Database.csv


		echo -e "\nYour Details are Recorded"
		echo -e "\nPress Any Keys To Go to Previous Menu, Press (q) to Quit"
		read response

		if [ $response == "q" ]; then
			exit
		else 
			clear
		fi
	;;


	2)	echo -e "insert the ID of the account you want to edit: \n"
		read upID

		echo -e "Insert the new data"
		read birthInput

		
		awk -v id=$upID -v input=$birthInput 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $3=input; print}' Customer_Database.csv > 			Data.tmp && mv Data.tmp Customer_Database.csv



		echo -e "\nYour Details are Recorded"
		echo -e "\nPress Any Keys To Go to Previous Menu, Press (q) to Quit"
		read response

		if [ $response == "q" ]; then
			exit
		else 
			clear
		fi
	;;
	
	3)	
		echo -e "insert the ID of the account you want to edit: \n"
		read upID

		echo -e "Insert the new data"
		read nationalInput

		
		awk -v id=$upID -v input=$nationalInput 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $4=input; print}' Customer_Database.csv > 			Data.tmp && mv Data.tmp Customer_Database.csv



		echo -e "\nYour Details are Recorded"
		echo -e "\nPress Any Keys To Go to Previous Menu, Press (q) to Quit"
		read response

		if [ $response == "q" ]; then
			exit
		else 
			clear
		fi
	;;

	4) 

		echo -e "insert the ID of the account you want to edit: \n"
		read upID

		echo -e "Insert the new data"
		read emailInput

		
		awk -v id=$upID -v input="$emailInput" 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $5=input; print}' Customer_Database.csv > 		Data.tmp && mv Data.tmp Customer_Database.csv


		echo -e "\nYour Details are Recorded"
		echo -e "\nPress Any Keys To Go to Previous Menu, Press (q) to Quit"
		read response

		if [ $response == "q" ]; then
			exit
		else 
			clear
		fi

	;;

	5)	

		echo -e "insert the ID of the account you want to edit: \n"
		read upID

		echo -e "Insert the new data"
		read cityInput

		
		awk -v id=$upID -v input="$cityInput" 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $6=input; print}' Customer_Database.csv > Data.tmp 			&& mv Data.tmp Customer_Database.csv


		echo -e "\nYour Details are Recorded"
		echo -e "\nPress Any Keys To Go to Previous Menu, Press (q) to Quit"
		read response

		if [ $response == "q" ]; then
			exit
		else 
			clear
		fi
	;;

	6) 	

		echo -e "insert the ID of the account you want to edit: \n"
		read upID

		echo -e "Insert the new data"
		read countryInput

		

		awk -v id=$upID -v input="$countryInput" 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $7=input; print}' Customer_Database.csv > 			Data.tmp && mv Data.tmp Customer_Database.csv

		echo -e "\nYour Details are Recorded"
		echo -e "\nPress Any Keys To Go to Previous Menu, Press (q) to Quit"
		read response

		if [ $response == "q" ]; then
			exit
		else 
			clear
		fi


		

	;;

	7) 	
		echo -e "insert the ID of the account you want to edit: \n"
		read upID

		echo -e "Insert the new data"
		read phoneInput

		awk -v id=$upID -v input="$phoneInput" 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $8=input; print}' Customer_Database.csv > 		Data.tmp && mv Data.tmp Customer_Database.csv
		


		echo -e "\nYour Details are Recorded"
		echo -e "\nPress Any Keys To Go to Previous Menu, Press (q) to Quit"
		read response

		if [ $response == "q" ]; then
			exit
		else 
			clear
		fi

	;;

	8) 

		echo -e "insert the ID of the account you want to edit: \n"
		read upID

		echo -e "Insert the new data"
		read accountInput

		

		awk -v id=$upID -v input="$accountInput" 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $9=input; print}' Customer_Database.csv > 			Data.tmp && mv Data.tmp Customer_Database.csv

		echo -e "\nYour Details are Recorded"
		echo -e "\nPress Any Keys To Go to Previous Menu, Press (q) to Quit"
		read response

		if [ $response == "q" ]; then
			exit
		else 
			clear
		fi

	;;

	9)

		echo -e "insert the ID of the account you want to edit: \n"
		read upID

		echo -e "Insert the new data"
		read balanceInput

		

		awk -v id=$upID -v input="$balanceInput" 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $10=input; print}' Customer_Database.csv > 			Data.tmp && mv Data.tmp Customer_Database.csv

		echo -e "\nYour Details are Recorded"
		echo -e "\nPress Any Keys To Go to Previous Menu, Press (q) to Quit"
		read response

		if [ $response == "q" ]; then
			exit
		else 
			clear
		fi
	;;	
esac
	
}	



transactions(){
	echo -e "Welcome! Please Enter your Account's ID to Deposit/Withdraw Money"
	echo -e ""
	read accountID
	echo -e ""
	echo -e "Do you Want to Deposit or Withdraw Money?"
	echo -e "1) Deposit Money"
	echo -e "2) Withdraw Money"
	echo -e "3) Current Balance"
	echo -e ""
	read option
	case $option in

	1) 	
		echo -e "Please Enter the Amount you Want to Deposit"
		echo -e ""
		read amount
		curbalance=`awk -F, '$1 == '$accountID' {print $10}' Customer_Database.csv`
		newbalance=`expr $amount + $curbalance `
		awk -v id=$accountID -v input="$newbalance" 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $10=input; print}' Customer_Database.csv > 			Data.tmp && mv Data.tmp Customer_Database.csv 
		clear
		echo "Congratulations, Amount Depositted to Your Account!"
		echo -e "Your Current Balance is:"
		echo -e `awk -F, '$1 == '$accountID' {print $10}' Customer_Database.csv`
	;;


	2) 
		echo -e "Please Enter the Amount you Want to Withdraw"
		echo -e ""
		read amount
		curbalance=`awk -F, '$1 == '$accountID' {print $10}' Customer_Database.csv`
		newbalance=`expr $curbalance - $amount `
		awk -v id=$accountID -v input="$newbalance" 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $10=input; print}' Customer_Database.csv > 			Data.tmp && mv Data.tmp Customer_Database.csv 
		clear
		echo "Congratulations, Amount Withdrawn from Your Account!"
		echo -e "Your Current Balance is:"
		echo -e `awk -F, '$1 == '$accountID' {print $10}' Customer_Database.csv` 
	;;
	3)	
		clear
		echo "Your Current Balance is:"
		echo -e `awk -F, '$1 == '$accountID' {print $10}' Customer_Database.csv`
	;;
	esac
	
}

delete(){
		echo -e "Please Insert the ID of the Account you want to Delete: \n"
		read delID
		#sed -i '/1/d' ./Customer_Database.csv
		sed -i '/\b\('$del'\)\b/d' ./Customer_Database.csv
		echo -e "Account $delID Deleted..."
		

}

Exit (){
	exit
}

while(true)
do
	mainmenu "$@"
done
