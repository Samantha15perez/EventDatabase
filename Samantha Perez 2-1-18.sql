USE MASTER;

IF (Select COUNT(*) from sys.databases where name = 'EventDB') >0

 BEGIN
 DROP DATABASE EventDB
END

  PRINT '-- Database Reset';

 CREATE DATABASE EventDB
 
 GO

 Use EventDB;

  PRINT '-- EventDB Created';

     IF (Select COUNT(*) from INFORMATION_SCHEMA.tables t where t.TABLE_NAME = 'Members') > 0 
 BEGIN
 DROP TABLE Members
 END 
 
 CREATE TABLE Members
 (
 MemberID Varchar(10) NOT NULL PRIMARY KEY,
 Firstname Varchar(20) NOT NULL,
 MiddleName Varchar(20),
 LastName Varchar(20) Not null,
 Email varchar(50),
 Phone varchar(15),
 Joindate date,
 Birthdate date,
 Gender Varchar
 )

 Print '--Members Table Created'


 INSERT INTO Members (MemberID, Firstname, MiddleName, Lastname, Email, Phone, Joindate, Birthdate, Gender)
 VALUES

('M0001', 'Otis', 'Brooke', 'Fallon', 'bfallon0@artisteer.com', '818-873-3863', '04/07/2017', '06/29/1971', 'M'),
('M0002', 'Katee', 'Virgie', 'Gepp', 'vgepp1@nih.gov', '503-689-8066', '11/29/2017', '04/03/1972', 'F'),
('M0003', 'Lilla', 'Charmion', 'Eatttok', 'ceatttok2@google.com.br', '210-426-7426','02/26/2017', '12/13/1975', 'F'),
('M0004', 'Ddene', 'Shelba', 'Clapperton', 'sclapperton3@mapquest.com', '716-674-1640','11/05/2017', '01/19/1997', 'F'),
('M0005', 'Audrye', 'Agathe', 'Dawks', 'adawks4@mlb.com', '305-415-9419','01/15/2016','02/07/1989', 'F'),
('M0006', 'Fredi', 'Melisandra', 'Burgyn', 'mburgyn5@cbslocal.com', '214-650-9837','03/13/2017','05/31/1956', 'F'),
('M0007', 'Dimitri', 'Francisco', 'Bellino', 'fbellino6@devhub.com', '937-971-1026','08/09/2017','10/12/1972', 'M'),
('M0008', 'Enrico', 'Cleve', 'Seeney', 'cseeney7@macromedia.com', '407-445-6895','09/09/2016','02/29/1988', 'M'),
('M0009', 'Marylinda', 'Jenine', 'O' + '''' + 'Siaghail', 'josiaghail8@tuttocitta.it', '206-484-6850','11/21/2016','02/06/1965', 'F'),
('M0010', 'Luce', 'Codi', 'Kovalski', 'ckovalski9@facebook.com', '253-159-6773','12/22/2017','03/31/1978', 'M'),
('M0011', 'Claiborn', 'Shadow', 'Baldinotti', 'sbaldinottia@discuz.net', '253-141-4314','03/19/2017','12/26/1991', 'M'),
('M0012', 'Isabelle', 'Betty', 'Glossop', 'bglossopb@msu.edu', '412-646-5145','04/25/2016','02/17/1965', 'F'),
('M0013', 'Davina', 'Lira', 'Wither', 'lwitherc@smugmug.com', '404-495-3676','03/21/2016','12/16/1957', 'F'),
('M0014', 'Panchito', 'Hashim', 'De Gregorio', 'hdegregoriod@a8.net', '484-717-6750','01/27/2017','10/14/1964', 'M'),
('M0015', 'Rowen', 'Arvin', 'Birdfield', 'abirdfielde@over-blog.com', '915-299-3451','10/06/2017','01/09/1983', 'M')

PRINT '--Members Table Populated'

     IF (Select COUNT(*) from INFORMATION_SCHEMA.tables t where t.TABLE_NAME = 'MemberAddresses') > 0 
 BEGIN
 DROP TABLE MemberAddresses
 
 CREATE TABLE MemberAddresses
 (
 MemberID Varchar(10) NOT NULL PRIMARY KEY,
 [Address] Varchar(50) NOT NULL,
 City Varchar(20) NOT NULL,
 [State] Varchar(20)
 )






     IF (Select COUNT(*) from INFORMATION_SCHEMA.tables t where t.TABLE_NAME = 'MemberNotes') > 0 
 BEGIN
 DROP TABLE MemberNotes
 END 
 
 CREATE TABLE MemberNotes
 (
 MemberNoteID INT NOT NULL Identity(1,1),
 MemberID Varchar(10) NOT NULL,
 Date_Time date,
 [subject] varchar(20),
 Content varchar(max)
 CONSTRAINT FK_Membernotes_Members FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
 )

 Print '--MemberNotes Table Created'



      IF (Select COUNT(*) from INFORMATION_SCHEMA.tables t where t.TABLE_NAME = 'MemberEvents') > 0 
 BEGIN
 DROP TABLE MemberEvents
 END 
 
 CREATE TABLE MemberEvents
 (
 MemberID INT NOT NULL,
 EventID INT not null identity(1,1),
 rating int DEFAULT 1,
 feedback Varchar(max)
 )

 Print '--MemberEvents Table Created'



 --     IF (Select COUNT(*) from INFORMATION_SCHEMA.tables t where t.TABLE_NAME = 'Events') > 0 
 --BEGIN
 --DROP TABLE Events
 --END 
 
 --CREATE TABLE Events
 --(

 --)

 --Print '--Events Table Created'