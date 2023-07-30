## fraud_detection

The objective of this repository is to analyze historical credit card transactions and consumption patterns using SQL, Python and Pandas to detect possible fraudulent transactions. It is done by completing three tasks: 
1) Defining a database model and creating a PostgresSQL database (See ERD.PNG)
2) Creating and populating a database schema on PostgresSQL (See..)
3) Analyzing the Data (See..)

Below are the observations from the analysis. 

# Transactions less than $2.00
Calculating the number of transactions that are less than $2 dls (in the "small_transaction" view queries.sql) we can see that all cardholders have transactions less than $2 dolars. However, most of them have 10 or less of these transactions compared to an average of 140 transactions per cardholder. Taking the average of the count of small transactions against the average of 140 transactions we can see that they account to only 5%. Cardholders 12,24 and 20 hold more small transactions then the rest with 16, 14 and 13 small transactions respectively (accounting from 6% to 12% of their transactions). I would recommend keeping an eye on cardholders that have 10 or more transactions to see if they continue to occur or if these transactions continue to increase. 

When looking at the "small_transaction_per_merchant" view in queries, we can see that all merchants have less than 5 transactions less than $2 dolars. Merchants 48,65,141,129,63 and 50 have 4 or 5 transactions. 

# Highest Transactions made between 7:00 am to 9:00 am vs 
Comparing the transactions made between 7am and 9am to the transactions made at other times, we can see that only 10 out of the 100 top transactions exceed $500 dls compared to 80 transactions at other times. Given the difference in time range between the two comparisons, I believe the result was to be expected. Additionally, the 10 largest transactions seen in the date between 7am and 9am are of different cardholder which can mean less risk of fraud as opposed to have the same cardholder make all those charges. It is important to note that 86 out of 100 transactions evaluated between 7:00 am to 9:00 am are less than $20, we could look at the risk of small transactions between those time frames for further analyisis. I believe more information would be necessary to make a better assesment. 
