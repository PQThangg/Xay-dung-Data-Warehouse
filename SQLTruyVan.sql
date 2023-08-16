CREATE DATABASE PetFinder
GO

USE PetFinder
GO

CREATE TABLE PetFinder_Fact (
    PetID int,
	MaturitySize varchar(13),
	FurLength varchar(13),
	Vaccinated varchar(8),
	Dewormed varchar(8),
	Sterilized varchar(8),
	Health varchar(14),
	RescuerID int,
	CONSTRAINT pk_PetFinder_Fact PRIMARY KEY(PetID)
);

CREATE TABLE PetFinder_Dim1 (
    PetID int,
	Type varchar(3),
	Age int,
	Breed1 varchar(255),
	Breed2	varchar(255),
	Gender varchar(6),
	Color1 varchar(255),
	Color2 varchar(255),
	Color3 varchar(255),
	CONSTRAINT pk_PetFinder_Dim1 PRIMARY KEY(PetID)
);

CREATE TABLE PetFinder_Dim2 (
    PetID int,
	Quantity int,
	Fee int,
	State varchar(255),
	CONSTRAINT pk_PetFinder_Dim2 PRIMARY KEY(PetID)
);

--3 truy vấn nghiệp vụ
--Có bao nhiêu vật nuôi được tiêm phòng cũng được triệt sản?
--Có bao nhiêu vật nuôi ở một bang?
--Có bao nhiêu vật nuôi không có phí nhận nuôi?
/*
USE PetFinder

SELECT TimPhong_TrietSan = COUNT(PetID)
FROM PetFinder_Fact A
WHERE A.Vaccinated = 'Yes' AND A.Sterilized = 'Yes';

SELECT A.State,
	AvgPriceByCategory = COUNT(PetID)
FROM PetFinder_Dim2 A
GROUP BY A.State;

SELECT COUNT(PetID)
FROM PetFinder_Dim2 A
WHERE A.Fee = 0;*/

