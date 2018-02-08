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


 
 CREATE TABLE Members
 (
 MemberID Varchar(10) NOT NULL PRIMARY KEY,
 Firstname Varchar(20) NOT NULL,
 MiddleName Varchar(20),
 LastName Varchar(20) Not null,
 Email varchar(50),
 Phone varchar(15),
 Gender Varchar(1),
 AddressID Varchar(50),
 Joindate date,
 CurrentFlag Bit,
 Birthdate date,
 )

 Print '--Members table created'

  INSERT INTO Members (MemberID, Firstname, MiddleName, Lastname, Email, Phone, Joindate, Birthdate, Gender, currentflag)
 VALUES

('M0001', 'Otis', 'Brooke', 'Fallon', 'bfallon0@artisteer.com', '818-873-3863', '04/07/2017', '06/29/1971', 'M',1),
('M0002', 'Katee', 'Virgie', 'Gepp', 'vgepp1@nih.gov', '503-689-8066', '11/29/2017', '04/03/1972', 'F',1),
('M0003', 'Lilla', 'Charmion', 'Eatttok', 'ceatttok2@google.com.br', '210-426-7426','02/26/2017', '12/13/1975', 'F',1),
('M0004', 'Ddene', 'Shelba', 'Clapperton', 'sclapperton3@mapquest.com', '716-674-1640','11/05/2017', '01/19/1997', 'F',1),
('M0005', 'Audrye', 'Agathe', 'Dawks', 'adawks4@mlb.com', '305-415-9419','01/15/2016','02/07/1989', 'F',1),
('M0006', 'Fredi', 'Melisandra', 'Burgyn', 'mburgyn5@cbslocal.com', '214-650-9837','03/13/2017','05/31/1956', 'F',1),
('M0007', 'Dimitri', 'Francisco', 'Bellino', 'fbellino6@devhub.com', '937-971-1026','08/09/2017','10/12/1972', 'M',1),
('M0008', 'Enrico', 'Cleve', 'Seeney', 'cseeney7@macromedia.com', '407-445-6895','09/09/2016','02/29/1988', 'M',1),
('M0009', 'Marylinda', 'Jenine', 'O' + '''' + 'Siaghail', 'josiaghail8@tuttocitta.it', '206-484-6850','11/21/2016','02/06/1965', 'F',0),
('M0010', 'Luce', 'Codi', 'Kovalski', 'ckovalski9@facebook.com', '253-159-6773','12/22/2017','03/31/1978', 'M',1),
('M0011', 'Claiborn', 'Shadow', 'Baldinotti', 'sbaldinottia@discuz.net', '253-141-4314','03/19/2017','12/26/1991', 'M',1),
('M0012', 'Isabelle', 'Betty', 'Glossop', 'bglossopb@msu.edu', '412-646-5145','04/25/2016','02/17/1965', 'F',1),
('M0013', 'Davina', 'Lira', 'Wither', 'lwitherc@smugmug.com', '404-495-3676','03/21/2016','12/16/1957', 'F',1),
('M0014', 'Panchito', 'Hashim', 'De Gregorio', 'hdegregoriod@a8.net', '484-717-6750','01/27/2017','10/14/1964', 'M',1),
('M0015', 'Rowen', 'Arvin', 'Birdfield', 'abirdfielde@over-blog.com', '915-299-3451','10/06/2017','01/09/1983', 'M',0)


Create Table SubscriptionPrices
(
SubType varchar(10) Primary Key,
SubPrice Money,
)

PRINT '--SubscriptionPrices Table Created'

INSERT INTO SubscriptionPrices (Subtype, Subprice)
values
('Bi-Yearly', '189'),
('Yearly', '99'),
('Quarterly', '27'),
('Monthly', '9.99')

 
Create table SubscriptionLevels
(
MemberID Varchar(10) PRIMARY KEY,
Subtype Varchar(10),
SubDescription Varchar(max),
Active BIT,
 CONSTRAINT FK_SubscriptionLevels_Members FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
 CONSTRAINT FK_SubscriptionLevels_SubscriptionPrices FOREIGN KEY (Subtype) REFERENCES SubscriptionPrices(Subtype)
)

Print '--SubscriptionLevels table created'

INSERT INTO SubscriptionLevels (MemberID, Subtype, Active)
Values 
('M0001', 'Monthly',1),
('M0002', 'Monthly',1),
('M0003', 'Quarterly',1),
('M0004', 'Quarterly',1),
('M0005', 'Monthly',1),
('M0006', 'Yearly',1),
('M0007', 'Monthly',1),
('M0008', 'Yearly',1),
('M0009', 'Yearly',0),
('M0010', 'Monthly',1),
('M0011', 'Monthly',1),
('M0012', 'Quarterly',1),
('M0013', 'Yearly',1),
('M0014', 'Monthly',1),
('M0015', 'Monthly',0)



 


 CREATE TABLE Addresses
 (
 MemberID Varchar(10) NOT NULL PRIMARY KEY,
 [Address] Varchar(50) NOT NULL,
 City Varchar(30) NOT NULL,
 [State] Varchar(20),
 Postalcode Varchar (15),
 BillingAddress Bit,
 CONSTRAINT FK_Addresses_Members FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
 )

 Print '--Addresses table created'

 INSERT INTO Addresses (MemberID, [Address], City, [State], Postalcode, BillingAddress)
 VALUES
 ('M0001','020 New Castle Way','Port Washington','New York','11054',1),
 ('M0002', '8 Corry Parkway','Newton','Massachusetts','2458',0),
 ('M0003', '39426 Stone Corner Drive','Peoria','Illinois','61605',	1),
 ('M0004','921 Granby Junction','Oklahoma City','Oklahoma','73173',1),
 ('M0005','77 Butternut Parkway','Saint Paul','Minnesota','55146',1),
 ('M0006','821 Ilene Drive','Odessa','Texas','79764',1),
 ('M0007','1110 Johnson Court','Rochester','New York','14624',1),
 ('M0008','6 Canary Hill','Tallahassee','Florida','32309',0),
 ('M0009','9 Buhler Lane','Bismarck','North Dakota','58505',1),
 ('M0010','99 Northwestern Pass','Midland','Texas','79710',1),
 ('M0011','69 Spenser Hill','Provo','Utah','84605',1),
 ('M0012','3234 Kings Court','Tacoma','Washington','98424',0),
 ('M0013','3 Lakewood Gardens Circle','Columbia','South Carolina','29225',1),
 ('M0014','198 Muir Parkway','Fairfax','Virginia','22036',1),
 ('M0015','258 Jenna Drive','Pensacola','Florida','32520',1)


  CREATE TABLE BillingAddresses
 (
 MemberID Varchar(10) NOT NULL PRIMARY KEY,
 BillingAddress Varchar(50) NOT NULL,
 City Varchar(30) NOT NULL,
 [State] Varchar(20),
 Postalcode Varchar (15),
 CONSTRAINT FK_BillingAddresses_Members FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
 )

 Print '--Addresses table created'

 INSERT INTO BillingAddresses (MemberID, BillingAddress, City, [state], Postalcode)
 VALUES
 ('M0002', 'P.O. Box 7088', 'Newton', 'Massachusetts', '2458'),
 ('M0008', 'P.O. Box 255', 'Tallahassee', 'Florida', '32309'),
 ('M0012', 'P.O. Box 1233', 'Tacoma', 'Washington', '98424')



 CREATE TABLE MemberNotes
 (
  MemberID Varchar(10) NOT NULL Primary Key,
 NoteDate datetime,
 [Subject] Varchar(30), 
 Content varchar(max),
 CONSTRAINT FK_MemberNotes_Members FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
 )

 Print '--MemberNotes table created'

 INSERT INTO MemberNotes (MemberID,  Content, Notedate)
 Values
('M0001', 'nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id', getdate()),
('M0002', 'a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus', getdate()),
('M0003', 'porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl', getdate()),
('M0004', 'morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis', getdate()),
('M0005', 'nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer', getdate()),
('M0006', 'congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien', getdate()),
('M0007', 'eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium', getdate()),
('M0008', 'dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum', getdate()),
('M0009', 'curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam', getdate()),
('M0010', 'magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus', getdate()),
('M0011', 'lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo', getdate()),
('M0012', 'magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus', getdate()),
('M0013', 'bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at', getdate()),
('M0014', 'imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse', getdate()),
('M0015', 'etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius', getdate())




 CREATE TABLE MemberCCInfo
 (
CCID Varchar(20) NOT NULL PRIMARY KEY,
Memberid Varchar(10) NOT NULL,
Cardtype Varchar(40),
SecCode INT,
Expdate Date
 )

 Print '--MemberCCInfo table created'

 INSERT INTO MemberCCInfo (MemberID, CardType, CCID, ExpDate)
 VALUES
('M0001', 'americanexpress', '337941553240515', '09/30/2019'),
('M0002', 'visa', '4041372553875903', '01/31/2020'),
('M0003', 'visa', '4041593962566', '03/31/2019'),
('M0004', 'jcb', '3559478087149594', '04/30/2019'),
('M0005', 'jcb', '3571066026049076', '07/31/2018'),
('M0006', 'diners-club-carte-blanche', '30423652701879', '05/31/2018'),
('M0007', 'jcb', '3532950215393858', '02/28/19'),
('M0008', 'jcb', '3569709859937370', '03/31/2019'),
('M0009', 'jcb', '3529188090740670', '05/31/2019'),
('M0010', 'jcb', '3530142576111598', '11/30/2019'),
('M0011', 'mastercard', '5108756299877313', '07/31/2018'),
('M0012', 'jcb', '3543168150106220', '06/30/2018'),
('M0013', 'jcb', '3559166521684728', '10/31/2019'),
('M0014', 'diners-club-carte-blanche', '30414677064054', '06/30/2018'),
('M0015', 'jcb', '3542828093985763', '03/31/2020')




 CREATE TABLE CCTransactions
 (
 MemberID Varchar(10) NOT NULL, 
 TransID INT PRIMARY KEY IDENTITY(1,1),
 CCID Varchar(20),
 TransDate Date,
 Amount money,
 CCresultCode varchar(20),
 CONSTRAINT FK_CCtransactions_MemberCCInfo FOREIGN KEY (CCID) REFERENCES MemberCCinfo(CCID),
 CONSTRAINT FK_CCTransactions_Members FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
 )

 Print '--CCTransactions table created'

 INSERT INTO CCTransactions (MemberID, CCID, TransDate, Amount, CCresultCode)
 VALUES
('M0005', '3571066026049076','1/15/2016','$9.99 ','Approved'),
('M0005', '3571066026049076','2/15/2016','$9.99 ','Approved'),
('M0005', '3571066026049076','3/15/2016','$9.99 ','Approved'),
('M0013', '3559166521684728','3/21/2016','$99.00 ','Approved'),
('M0005', '3571066026049076','4/15/2016','$9.99 ','Approved'),
('M0013', '3559166521684728','4/21/2016','$99.00 ','Approved'),
('M0012', '3543168150106220','4/25/2016','$27.00 ','Approved'),
('M0005', '3571066026049076','5/15/2016','$9.99 ','Approved'),
('M0005', '3571066026049076','6/15/2016','$9.99 ','Approved'),
('M0005', '3571066026049076','7/15/2016','$9.99 ','Approved'),
('M0012', '3543168150106220','7/25/2016','$27.00 ','Approved'),
('M0005', '3571066026049076','8/15/2016','$9.99 ','Approved'),
('M0008', '3569709859937370','9/9/2016','$99.00 ','Approved'),
('M0005', '3571066026049076','9/15/2016','$9.99 ','Approved'),
('M0005', '3571066026049076','10/15/2016','$9.99 ','Approved'),
('M0012', '3543168150106220','10/25/2016','$27.00 ','Approved'),
('M0005', '3571066026049076','11/15/2016','$9.99 ','Approved'),
('M0009', '3529188090740670','11/21/2016','$99.00 ','Approved'),
('M0005', '3571066026049076','12/15/2016','$9.99 ','Approved'),
('M0005', '3571066026049076','1/15/2017','$9.99 ','Approved'),
('M0012', '3543168150106220','1/25/2017','$27.00 ','Approved'),
('M0014', '30414677064054','1/27/2017','$9.99 ','Approved'),
('M0005', '3571066026049076','2/15/2017','$9.99 ','Approved'),
('M0003', '4041593962566','2/26/2017','$27.00 ','Approved'),
('M0014', '30414677064054','2/27/2017','$9.99 ','Approved'),
('M0006', '30423652701879','3/13/2017','$99.00 ','Approved'),
('M0005', '3571066026049076','3/15/2017','$9.99 ','Approved'),
('M0011', '5108756299877313','3/19/2017','$9.99 ','Approved'),
('M0014', '30414677064054','3/27/2017','$9.99 ','Approved'),
('M0001', '337941553240515','4/7/2017','$9.99 ','Approved'),
('M0005', '3571066026049076','4/15/2017','$9.99 ','Approved'),
('M0011', '5108756299877313','4/19/2017','$9.99 ','Approved'),
('M0012', '3543168150106220','4/25/2017','$27.00 ','Approved'),
('M0014', '30414677064054','4/27/2017','$9.99 ','Approved'),
('M0001', '337941553240515','5/7/2017','$9.99 ','Approved'),
('M0005', '3571066026049076','5/15/2017','$9.99 ','Approved'),
('M0011', '5108756299877313','5/19/2017','$9.99 ','Approved'),
('M0003', '4041593962566','5/26/2017','$27.00 ','Approved'),
('M0014', '30414677064054','5/27/2017','$9.99 ','Approved'),
('M0001', '337941553240515','6/7/2017','$9.99 ','Declined'),
('M0001', '337941553240515','6/8/2017','$9.99 ','Approved'),
('M0005', '3571066026049076','6/15/2017','$9.99 ','Approved'),
('M0011', '5108756299877313','6/19/2017','$9.99 ','Approved'),
('M0014', '30414677064054','6/27/2017','$9.99 ','Approved'),
('M0001', '337941553240515','7/7/2017','$9.99 ','Approved'),
('M0005', '3571066026049076','7/15/2017','$9.99 ','Approved'),
('M0011', '5108756299877313','7/19/2017','$9.99 ','Declined'),
('M0011', '5108756299877313','7/20/2017','$9.99 ','Approved'),
('M0012', '3543168150106220','7/25/2017','$27.00 ','Approved'),
('M0014', '30414677064054','7/27/2017','$9.99 ','Approved'),
('M0001', '337941553240515','8/7/2017','$9.99 ','Approved'),
('M0007', '3532950215393858','8/9/2017','$9.99 ','Approved'),
('M0005', '3571066026049076','8/15/2017','$9.99 ','Approved'),
('M0011', '5108756299877313','8/19/2017','$9.99 ','Approved'),
('M0003', '4041593962566','8/26/2017','$27.00 ','Approved'),
('M0014', '30414677064054','8/27/2017','$9.99 ','Approved'),
('M0001', '337941553240515','9/7/2017','$9.99 ','Approved'),
('M0007', '3532950215393858','9/9/2017','$9.99 ','Approved'),
('M0008', '3569709859937370','9/9/2017','$99.00 ','Approved'),
('M0005', '3571066026049076','9/15/2017','$9.99 ','Approved'),
('M0011', '5108756299877313','9/19/2017','$9.99 ','Approved'),
('M0014', '30414677064054','9/27/2017','$9.99 ','Approved'),
('M0015', '3542828093985763','10/6/2017','$9.99 ','Invalid Card'),
('M0001', '337941553240515','10/7/2017','$9.99 ','Approved'),
('M0007', '3532950215393858','10/9/2017','$9.99 ','Approved'),
('M0005', '3571066026049076','10/15/2017','$9.99 ','Approved'),
('M0011', '5108756299877313','10/19/2017','$9.99 ','Approved'),
('M0012', '3543168150106220','10/25/2017','$27.00 ','Approved'),
('M0014', '30414677064054','10/27/2017','$9.99 ','Approved'),
('M0004', '3559478087149594','11/5/2017','$27.00 ','Approved'),
('M0001', '337941553240515','11/7/2017','$9.99 ','Approved'),
('M0007', '3532950215393858','11/9/2017','$9.99 ','Approved'),
('M0005', '3571066026049076','11/15/2017','$9.99 ','Approved'),
('M0011', '5108756299877313','11/19/2017','$9.99 ','Approved'),
('M0003', '4041593962566','11/26/2017','$27.00 ','Declined'),
('M0003', '4041593962566','11/27/2017','$27.00 ','Approved'),
('M0014', '30414677064054','11/27/2017','$9.99 ','Approved'),
('M0002', '4041372553875903','11/29/2017','$9.99 ','Approved'),
('M0001', '337941553240515','12/7/2017','$9.99 ','Approved'),
('M0007', '3532950215393858','12/9/2017','$9.99 ','Approved'),
('M0005', '3571066026049076','12/15/2017','$9.99 ','Approved'),
('M0011', '5108756299877313','12/19/2017','$9.99 ','Approved'),
('M0010', '3530142576111598','12/22/2017','$9.99 ','Approved'),
('M0014', '30414677064054','12/27/2017','$9.99 ','Approved'),
('M0002', '4041372553875903','12/29/2017','$9.99 ','Approved'),
('M0001', '337941553240515','1/7/2018','$9.99 ','Approved'),
('M0007', '3532950215393858','1/9/2018','$9.99 ','Approved'),
('M0005', '3571066026049076','1/15/2018','$9.99 ','Approved'),
('M0011', '5108756299877313','1/19/2018','$9.99 ','Approved'),
('M0010', '3530142576111598','1/22/2018','$9.99 ','Approved'),
('M0012', '3543168150106220','1/25/2018','$27.00 ','Approved'),
('M0014', '30414677064054','1/27/2018','$9.99 ','Approved')


 
 CREATE TABLE MemberInterests
 (
 MemberID Varchar(10) Primary KEy,
 Interest1 Varchar(50),
 Interest2 Varchar(50),
 Interest3 Varchar(50),
 CONSTRAINT FK_MemberInterests_Members FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
 )

 Print '--MemberInterests table created'

 INSERT INTO MemberInterests (MemberID, Interest1, Interest2, Interest3)
 VALUES
('M0001','Acting','Video Games','Crossword Puzzles'),
('M0002','Calligraphy',NULL,NULL),
('M0003','Movies','Restaurants','Woodworking'),
('M0004','Juggling','Quilting',NULL),
('M0005','Electronics',NULL,NULL),
('M0006','Sewing','Cooking','Movies'),
('M0007','Botany','Skating',NULL),
('M0008','Dancing','Coffee','Foreign Languages'),
('M0009','Fashion',NULL,NULL),
('M0010','Woodworking',NULL,NULL),
('M0011','Homebrewing','Geneology','Movies, Scrapbooking'),
('M0012','Surfing','Amateur Radio',NULL),
('M0013','Computers',NULL,NULL),
('M0014','Writing','Singing',NULL),
('M0015','Reading','Pottery',NULL)



  CREATE TABLE MemberEvents
 (
 EventID INT Identity(1,1) Primary Key,
 Eventdate Date,
 Starttime datetime,
 Endtime datetime,
 eventtitle varchar(50),
 Description varchar(max),
 Organizer Varchar(20),
 comments varchar(max)
 )

 Print '--MemberEvents table created'

 INSERT INTO MemberEvents (EventDate, EventTitle, Organizer)
 VALUES
 ('1/12/2017', 'The History Of Human Emotions', 'Tiffany Watt Smith'),
 ('2/22/2017', 'How Great Leaders Inspire Action', 'Simon Sinek'),
 ('3/5/2017', 'The Puzzle Of Motivation', 'Dan Pink'),
 ('4/16/2017', 'Your Elusive Creative Genius', 'Elizabeth Gilbert'),
 ('5/1/2017', 'Why Are Programmers So Smart?', 'Andrew Comeau')




 CREATE TABLE EventAttendance
 (
 MemberID varchar(10) PRIMARY KEY, 
 Firstname Varchar(20),
 Lastname Varchar(20),
 Event1 bit,
 Event2 Bit,
 event3 bit,
 event4 bit,
 event5 bit,
  CONSTRAINT FK_EventAttendance_Members FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
  )

  PRINT '--EventAttendance Table Created'


  INSERT INTO EventAttendance (MemberID, Firstname, Lastname, event1, event2, event3, event4, event5)
  VALUES
('M0001','Otis','Fallon',0,0,1,1,1),
('M0002','Katee','Gepp',1,0,1,1,0),
('M0003','Lilla','Eatttok',1,1,1,0,1),
('M0004','Ddene','Clapperton',1,1,1,1,1),
('M0005','Audrye','Dawks',1,1,1,1,0),
('M0006','Fredi','Burgyn',1,0,1,1,0),
('M0007','Dimitri','Bellino',0,1,1,1,0),
('M0008','Enrico','Seeney',1,1,1,1,0),
('M0009','Marylinda','OSiaghail',0,1,1,1,0),
('M0010','Luce','Kovalski',1,1,0,0,0),
('M0011','Claiborn','Baldinotti',1,1,0,0,0),
('M0012','Isabelle','Glossop',1,0,1,1,1),
('M0013','Davina','Smith',1,1,0,0,1),
('M0014','Panchito','De Gregorio',0,1,1,1,0),
('M0015','Rowen','Birdfield',1,1,1,1,0)


 -----FUNCTIONS
;
 --A complete contact list for current members with name, physical mailing address, phone number and e-mail.

 GO 
 create view MailingList 
 AS
 Select CONCAT(M.Firstname, ' ', M.Middlename, ' ', M.Lastname) [Name], A.[Address], A.City, A.[State], A.postalcode, M.Phone, M.Email
 from members M
 INNER JOIN Addresses A
 ON M.memberid = A.memberID
 WHERE Currentflag = 1
 ;

 select * from MailingList


 --An e-mail list with the member name and e-mail.
 CREATE VIEW EmailList
 AS
 select CONCAT(Firstname,' ', Lastname) [Name], Email
 FROM Members

 Select * from EmailList

 --A list of members who are celebrating their birthday this month.
 CREATE VIEW BirthdaysThisMonth
 AS
 select CONCAT(Firstname,' ', Lastname) [Name], birthdate
 FROM Members
 WHERE datepart(Month, birthdate) = datepart(Month, getdate())

Select * from BirthdaysThisMonth

 --Members are charged for renewals according to their payment plan 
 --(monthly, quarterly, etc..) on the anniversary of the date they joined.
 -- A user who joined on the 7th should always be billed on the 7th,
 -- whether it's every one, three or 12 months. Some method is needed to 
 --scan for current members who are up for renewal and to initiate the
 -- billing to their credit card.

 CREATE VIEW Subscription_Renewals
 AS 
 select M.MemberID,M.Firstname, M.Lastname, M.Joindate, SL.Subtype, SP.Subprice, MCCI.CCID
 FROM Members M
 INNER JOIN SubscriptionLevels SL
 ON SL.MemberID = M.MemberID
 INNER JOIN SubscriptionPrices SP
 ON SP.SubType = SL.subtype
  INNER JOIN MemberCCInfo MCCI
 ON M.MemberID = MCCI.Memberid
 WHERE SL.Active = 1 
 and datepart(day, Joindate) = datepart(day, getdate()) 
 AND SL.Subtype = 'Monthly'

 --This query selects the Member Information by checking the current date against the log of
 --join dates within the database, but only for active members, and members with the Subscription type 'Monthly'
 
 UNION ALL 
 select M.MemberID,M.Firstname, M.Lastname, M.Joindate, SL.Subtype, SP.Subprice, MCCI.CCID
 FROM Members M
 INNER JOIN SubscriptionLevels SL
 ON SL.MemberID = M.MemberID
 INNER JOIN SubscriptionPrices SP
 ON SP.SubType = SL.subtype
  INNER JOIN MemberCCInfo MCCI
 ON M.MemberID = MCCI.Memberid
 WHERE SL.Active = 1
 AND SL.Subtype = 'Quarterly'
 AND datepart(day, Joindate) = datepart(day, getdate())
 AND datepart(month, getdate()) IN 
 ((select (datepart(month, M.joindate) + 3)),
  (select (datepart(month, M.joindate) + 6)),
  (select (datepart(month, M.joindate) + 9)))

  --This query selects the Member Information by checking the current date against the log of
 --join dates within the database, but only for active members, members with the Subscription type 'Quarterly',
 --and members who's calculated quarterly renewal date falls on today's date.
 UNION ALL 
 select M.MemberID,M.Firstname, M.Lastname, M.Joindate, SL.Subtype, SP.Subprice, MCCI.CCID
 FROM Members M
 INNER JOIN SubscriptionLevels SL
 ON SL.MemberID = M.MemberID
 INNER JOIN SubscriptionPrices SP
 ON SP.SubType = SL.subtype
  INNER JOIN MemberCCInfo MCCI
 ON M.MemberID = MCCI.Memberid
 WHERE SL.Active = 1
 AND SL.Subtype = 'Yearly'
AND datepart(day, M.joindate) = datepart(day, getdate())
AND datepart(month, m.joindate) = datepart(month, getdate())

  --This query selects the Member Information by checking the current date against the log of
 --join dates within the database, but only for active members, members with the Subscription type 'Yearly',
 --and members whos' joindate is exactly a year from today. 


 UNION ALL 
 select M.MemberID, M.Firstname, M.Lastname, M.Joindate, SL.Subtype, SP.Subprice, MCCI.CCID
 FROM Members M
 INNER JOIN SubscriptionLevels SL
 ON SL.MemberID = M.MemberID
 INNER JOIN SubscriptionPrices SP
 ON SP.SubType = SL.subtype
  INNER JOIN MemberCCInfo MCCI
 ON M.MemberID = MCCI.Memberid
 WHERE SL.Active = 1
 AND SL.Subtype = 'Bi-Yearly'
AND getdate() IN 
((select dateadd(month, 24, M.Joindate)),
 (select dateadd(month, 48, M.Joindate)),
  (select dateadd(month, 72, M.Joindate)))

  --This query selects the Member Information by checking the current date against the log of
 --join dates within the database, but only for active members, members with the Subscription type 'Yearly',
 --and members whos' joindate is exactly two years from today. The UNION ALL command combines the results
 --of all of these queries and brings them together, so that the same view can be run every day to get
 --the proper information for members who need to be charged for renewal.

 select * from subscription_Renewals

 CREATE PROCEDURE SP_SubscriptionRenewalCharge
 AS
 BEGIN
	IF EXISTS (select * from Subscription_Renewals)
		BEGIN
			INSERT INTO CCTransactions (MemberID, CCID, Transdate, Amount, CCresultCode)
			VALUES ((select MemberID from Subscription_renewals),
					(select CCID from Subscription_Renewals),
					getdate(),
					(select Subprice from Subscription_Renewals),
					'Pending')
		END
	SELECT * from CCTransactions WHERE CCresultCode = 'Pending'
END

--This Procedure takes all of the information from the view I created earlier, and uses it to properly charge the Members'
--Accounts for the amount their subscription calls for.
--If you run this procedure every day, it will automatically charge the proper members for you. 



 --The database should identify expired credit cards before it tries to bill to them.
 CREATE VIEW ExpiredCCIDs
 AS
 Select M.Firstname, M.Lastname, CCID, ExpDate
 FROM MemberCCInfo C
 INNER JOIN Members M
 ON C.Memberid = m.MemberID
 WHERE Expdate <= getdate()

 Select * from ExpiredCCIDs

 --We need to see the monthly income from member renewals over a given time frame.
 CREATE VIEW MonthlyIncome
 AS
 select SUM(Amount) [Income]
 from CCTransactions
 WHERE CCresultcode = 'Approved' AND Transdate BETWEEN '2017-01-01' AND '2018-01-01'

 Select * from MonthlyIncome

 --New member sign-ups per month over a given time frame.
 CREATE VIEW MemberSignUps
 AS
 select COUNT (Firstname)[Members], CONCAT((datepart(Month, Joindate)), '/',(datepart(Year, Joindate))) [Month]
 FROM Members
 GROUP BY datepart(Month, Joindate), datepart(year, Joindate)

 Select * from MemberSignUps


 --Attendance per event over a given time frame.
 CREATE VIEW AttendanceByEvent
 AS
 Select 
 (Select COUNT(event1) [Attendees] FROM eventattendance WHERE event1 = 1) [Event1],
 (Select COUNT(event2) [Attendees] FROM eventattendance WHERE event2 = 1) [Event2],
 (Select COUNT(event3) [Attendees] FROM eventattendance WHERE event3 = 1) [Event3],
 (Select COUNT(event4) [Attendees] FROM eventattendance WHERE event4 = 1) [Event4],
 (Select COUNT(event5) [Attendees] FROM eventattendance WHERE event5 = 1) [Event5]

 Select * from AttendanceByEvent

 --I have a seperate table within my database just for attendance. 