create database Nurses_DB


use Nurses_DB;



create table Nurses_DB.Nurses_OP.Doctor (
	D_EmployID VARCHAR (50) PRIMARY KEY,
	D_FirstName VARCHAR (50) NOT NULL,
	D_LastName VARCHAR (50) NOT NULL,
	D_PhoneNum VARCHAR (50) NOT NULL,
	D_Address VARCHAR (255) NOT NULL
);




create table Nurses_DB.Nurses_OP.Patient (
	P_ID INT PRIMARY KEY IDENTITY (1, 1),
	P_FullName VARCHAR (100) NOT NULL,
	P_DateAdmitted DATE NOT NULL,
	P_RoomNumber INT NULL
);

create table Nurses_DB.Nurses_OP.Payslip (
	PayslipNumber INT PRIMARY KEY,
	SalaryDepositDate DATE NOT NULL,
	BonusAwarded VARCHAR(10) NOT NULL,
	SalaryDeposited INT NOT NULL,
	BankAccountNumber VARCHAR(50) NOT NULL

);

create table Nurses_DB.Nurses_OP.Department (
	Dept_Number INT PRIMARY KEY IDENTITY (1, 1),
	Dept_Name VARCHAR (50) NOT NULL,
	Dept_Location VARCHAR (50) NOT NULL,
	D_EmployID VARCHAR (50) NOT NULL,
	FOREIGN KEY (D_EmployID) REFERENCES Nurses_DB.Nurses_OP.Doctor (D_EmployID)
);

alter table Nurses_DB.Nurses_OP.Nurses
alter column Dept_Number INT NULL;


create table Nurses_DB.Nurses_OP.Nurses (
    N_EmployID VARCHAR (50) PRIMARY KEY, 
    N_FirstName VARCHAR (50) NOT NULL,
    N_LastName VARCHAR (50) NOT NULL,
    N_PhoneNum VARCHAR (255),
	N_Address VARCHAR (100) NULL,
	Dept_Number INT NOT NULL,
	PayslipNumber INT NOT NULL,
    FOREIGN KEY (Dept_Number) REFERENCES Nurses_DB.Nurses_OP.Department (Dept_Number),
	FOREIGN KEY (PayslipNumber) REFERENCES Nurses_DB.Nurses_OP.Payslip (PayslipNumber)
);

create table Nurses_DB.Nurses_OP.Shifts (
	ShiftCode INT PRIMARY KEY IDENTITY (1, 1),
	Timeslot VARCHAR (50) NOT NULL,
	Days VARCHAR (50) NOT NULL
);

create table Nurses_DB.Nurses_OP.Nurses_Shift (
	N_employID VARCHAR (50) NOT NULL,
	ShiftCode INT NOT NULL,
	PRIMARY KEY (N_employID,ShiftCode),
	FOREIGN KEY (N_employID) REFERENCES Nurses_DB.Nurses_OP.Nurses (N_EmployID),
	FOREIGN KEY (ShiftCode) REFERENCES Nurses_DB.Nurses_OP.Shifts (ShiftCode), 
);

create table Nurses_DB.Nurses_OP.Nurses_Patients (
	N_employID VARCHAR (50) NOT NULL,
	P_ID INT,
	PRIMARY KEY (N_employID,P_ID),
	FOREIGN KEY (N_employID) REFERENCES Nurses_DB.Nurses_OP.Nurses (N_EmployID),
	FOREIGN KEY (P_ID) REFERENCES Nurses_DB.Nurses_OP.Patient (P_ID)
);

-- I choose Nurses and Departments

-- a. Show your table records 
select * from Nurses_DB.Nurses_OP.Nurses;
select * from Nurses_DB.Nurses_OP.Department;

select * from Nurses_DB.Nurses_OP.Payslip;
-- b.  Create inner joins between two tables

select * from Nurses_DB.Nurses_OP.Nurses A
inner join Nurses_DB.Nurses_OP.Department B on A.Dept_Number = B.Dept_Number;

-- c.  Create full joins between two tables

select * from Nurses_DB.Nurses_OP.Nurses A
full outer join Nurses_DB.Nurses_OP.Department B on A.Dept_Number = B.Dept_Number;

-- d.  Create left outer joins between two tables

select * from Nurses_DB.Nurses_OP.Nurses A
left outer join Nurses_DB.Nurses_OP.Department B on A.Dept_Number = B.Dept_Number;

-- e. Create right outer joins between two tables

select * from Nurses_DB.Nurses_OP.Nurses A
right outer join Nurses_DB.Nurses_OP.Department B on A.Dept_Number = B.Dept_Number;


-- f. Create intersect between two tables

select Dept_Number from Nurses_DB.Nurses_OP.Nurses
intersect
select Dept_Number from Nurses_DB.Nurses_OP.Department;



-- g. Create union between two tables

select Dept_Number from Nurses_DB.Nurses_OP.Nurses
where Dept_Number in (1,2)
union
select Dept_Number from Nurses_DB.Nurses_OP.Department
where Dept_Number in  (3);

--h. Create except between two tables

select Dept_Number from Nurses_DB.Nurses_OP.Nurses
except
select Dept_Number from Nurses_DB.Nurses_OP.Department
where Dept_Number in (3);