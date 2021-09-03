IF DB_ID('CodingExam') IS NOT NULL 
DROP DATABASE CodingExam
GO

CREATE DATABASE [CodingExam] ON PRIMARY 
( 
	NAME = 'CodingExam', 
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER1\MSSQL\DATA\CodingExam.mdf', 
	FILEGROWTH = 1024KB 
)

LOG ON 
( 
	NAME = 'CodingExamDB_log', 
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER1\MSSQL\DATA\CodingExam_log.ldf' , 
	FILEGROWTH = 10%
);
GO

USE CodingExam
GO

CREATE TABLE Account (
	 AccountNumber	int identity(1,1) NOT NULL				
	,FirstName		varchar(50) NOT NULL
	,LastName		varchar(50) NOT NULL
	,LoanAmount		bigint NOT NULL
	,CONSTRAINT	PK_AccountNumber PRIMARY KEY (AccountNumber),			
);	
GO


CREATE TABLE Payment (
	AccountNumber		int NOT NULL
	,TransactionDate	date NOT NULL
	,PaymentAmount		bigint NOT NULL
);
GO


INSERT INTO Account (FirstName, LastName, LoanAmount)
VALUES
('John', 'Smith', 10000)
GO

INSERT INTO Payment (AccountNumber, TransactionDate, PaymentAmount)
VALUES
(1, '07/02/2021', 1000)
,(1, '08/31/2021', 3000)
,(1, '09/01/2021', 6000)
GO



CREATE VIEW	vAccountDetails
AS  
SELECT	Payment.TransactionDate as 'Transaction Date'
		,Payment.PaymentAmount as 'Amount Paid'
		,Balance = Account.LoanAmount-sum(Payment.PaymentAmount)OVER
(PARTITION BY Account.AccountNumber
ORDER BY Account.AccountNumber
rows BETWEEN UNBOUNDED PRECEDING AND CURRENT row)
		,CASE 
		WHEN (Account.LoanAmount-sum(Payment.PaymentAmount)OVER
(PARTITION BY Account.AccountNumber
ORDER BY Account.AccountNumber, Payment.TransactionDate
rows BETWEEN UNBOUNDED PRECEDING AND CURRENT row)) = 0 THEN 'Fully Paid'
		ELSE 'In progress'
		END as 'Loan Status'
FROM Account
INNER JOIN Payment
ON Account.AccountNumber = Payment.Accountnumber
GO

