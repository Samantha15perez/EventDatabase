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

 Print '--Members table created --'

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



 
Create table SubscriptionLevels
(
MemberID Varchar(10) Primary Key,
Subtype Varchar(10),
SubDescription Varchar(max),
RenewalAmt Money,
Active BIT,
 CONSTRAINT FK_SubscriptionLevels_Members FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
)

Print '--SubscriptionLevels table created --'

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
 AddressID INT Identity(1,1)PRIMARY KEY,
 MemberID Varchar(10) NOT NULL ,
 [Address] Varchar(50) NOT NULL,
 City Varchar(30) NOT NULL,
 [State] Varchar(20),
 Postalcode Varchar (15),
 BillingAddress Bit,
 CONSTRAINT FK_Addresses_Members FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
 )

 Print '--Addresses table created --'

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



 CREATE TABLE MemberNotes
 (
  MemberID Varchar(10) NOT NULL Primary Key,
 NoteDate datetime,
 [Subject] Varchar(30), 
 Content varchar(max),
 CONSTRAINT FK_MemberNotes_Members FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
 )

 Print '--MemberNotes table created --'

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



 
-- CREATE TABLE AccountCharges
-- (
-- ChargeID INT identity(1,1) Primary Key,
--MemberID Varchar(10) NOT NULL,
--Chargedate Date,
--Amount money,
--paymentmethod Varchar(30),
--PaymentIDRef Varchar(30),
-- CONSTRAINT FK_AccountCharges_Members FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
-- )

-- Print '--AccountCharges table created --'



 CREATE TABLE MemberCCInfo
 (
CCID Varchar(20) NOT NULL PRIMARY KEY,
Memberid Varchar(10) NOT NULL,
Cardtype Varchar(40),
SecCode INT,
Expdate Date
 )

 Print '--MemberCCInfo table created --'

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


 PRINT '--MemberCCInfo Table Populated'

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

 Print '--CCTransactions table created --'

 INSERT INTO CCTransactions (MemberID, TransDate, Amount, CCresultCode)
 VALUES
('M0005','1/15/2016','$9.99 ','Approved'),
('M0005','2/15/2016','$9.99 ','Approved'),
('M0005','3/15/2016','$9.99 ','Approved'),
('M0013','3/21/2016','$99.00 ','Approved'),
('M0005','4/15/2016','$9.99 ','Approved'),
('M0013','4/21/2016','$99.00 ','Approved'),
('M0012','4/25/2016','$27.00 ','Approved'),
('M0005','5/15/2016','$9.99 ','Approved'),
('M0005','6/15/2016','$9.99 ','Approved'),
('M0005','7/15/2016','$9.99 ','Approved'),
('M0012','7/25/2016','$27.00 ','Approved'),
('M0005','8/15/2016','$9.99 ','Approved'),
('M0008','9/9/2016','$99.00 ','Approved'),
('M0005','9/15/2016','$9.99 ','Approved'),
('M0005','10/15/2016','$9.99 ','Approved'),
('M0012','10/25/2016','$27.00 ','Approved'),
('M0005','11/15/2016','$9.99 ','Approved'),
('M0009','11/21/2016','$99.00 ','Approved'),
('M0005','12/15/2016','$9.99 ','Approved'),
('M0005','1/15/2017','$9.99 ','Approved'),
('M0012','1/25/2017','$27.00 ','Approved'),
('M0014','1/27/2017','$9.99 ','Approved'),
('M0005','2/15/2017','$9.99 ','Approved'),
('M0003','2/26/2017','$27.00 ','Approved'),
('M0014','2/27/2017','$9.99 ','Approved'),
('M0006','3/13/2017','$99.00 ','Approved'),
('M0005','3/15/2017','$9.99 ','Approved'),
('M0011','3/19/2017','$9.99 ','Approved'),
('M0014','3/27/2017','$9.99 ','Approved'),
('M0001','4/7/2017','$9.99 ','Approved'),
('M0005','4/15/2017','$9.99 ','Approved'),
('M0011','4/19/2017','$9.99 ','Approved'),
('M0012','4/25/2017','$27.00 ','Approved'),
('M0014','4/27/2017','$9.99 ','Approved'),
('M0001','5/7/2017','$9.99 ','Approved'),
('M0005','5/15/2017','$9.99 ','Approved'),
('M0011','5/19/2017','$9.99 ','Approved'),
('M0003','5/26/2017','$27.00 ','Approved'),
('M0014','5/27/2017','$9.99 ','Approved'),
('M0001','6/7/2017','$9.99 ','Declined'),
('M0001','6/8/2017','$9.99 ','Approved'),
('M0005','6/15/2017','$9.99 ','Approved'),
('M0011','6/19/2017','$9.99 ','Approved'),
('M0014','6/27/2017','$9.99 ','Approved'),
('M0001','7/7/2017','$9.99 ','Approved'),
('M0005','7/15/2017','$9.99 ','Approved'),
('M0011','7/19/2017','$9.99 ','Declined'),
('M0011','7/20/2017','$9.99 ','Approved'),
('M0012','7/25/2017','$27.00 ','Approved'),
('M0014','7/27/2017','$9.99 ','Approved'),
('M0001','8/7/2017','$9.99 ','Approved'),
('M0007','8/9/2017','$9.99 ','Approved'),
('M0005','8/15/2017','$9.99 ','Approved'),
('M0011','8/19/2017','$9.99 ','Approved'),
('M0003','8/26/2017','$27.00 ','Approved'),
('M0014','8/27/2017','$9.99 ','Approved'),
('M0001','9/7/2017','$9.99 ','Approved'),
('M0007','9/9/2017','$9.99 ','Approved'),
('M0008','9/9/2017','$99.00 ','Approved'),
('M0005','9/15/2017','$9.99 ','Approved'),
('M0011','9/19/2017','$9.99 ','Approved'),
('M0014','9/27/2017','$9.99 ','Approved'),
('M0015','10/6/2017','$9.99 ','Invalid Card'),
('M0001','10/7/2017','$9.99 ','Approved'),
('M0007','10/9/2017','$9.99 ','Approved'),
('M0005','10/15/2017','$9.99 ','Approved'),
('M0011','10/19/2017','$9.99 ','Approved'),
('M0012','10/25/2017','$27.00 ','Approved'),
('M0014','10/27/2017','$9.99 ','Approved'),
('M0004','11/5/2017','$27.00 ','Approved'),
('M0001','11/7/2017','$9.99 ','Approved'),
('M0007','11/9/2017','$9.99 ','Approved'),
('M0005','11/15/2017','$9.99 ','Approved'),
('M0011','11/19/2017','$9.99 ','Approved'),
('M0003','11/26/2017','$27.00 ','Declined'),
('M0003','11/27/2017','$27.00 ','Approved'),
('M0014','11/27/2017','$9.99 ','Approved'),
('M0002','11/29/2017','$9.99 ','Approved'),
('M0001','12/7/2017','$9.99 ','Approved'),
('M0007','12/9/2017','$9.99 ','Approved'),
('M0005','12/15/2017','$9.99 ','Approved'),
('M0011','12/19/2017','$9.99 ','Approved'),
('M0010','12/22/2017','$9.99 ','Approved'),
('M0014','12/27/2017','$9.99 ','Approved'),
('M0002','12/29/2017','$9.99 ','Approved'),
('M0001','1/7/2018','$9.99 ','Approved'),
('M0007','1/9/2018','$9.99 ','Approved'),
('M0005','1/15/2018','$9.99 ','Approved'),
('M0011','1/19/2018','$9.99 ','Approved'),
('M0010','1/22/2018','$9.99 ','Approved'),
('M0012','1/25/2018','$27.00 ','Approved'),
('M0014','1/27/2018','$9.99 ','Approved')


 
 CREATE TABLE MemberInterests
 (
 MemberID Varchar(10) Primary KEy,
 Interest1 Varchar(50),
 Interest2 Varchar(50),
 Interest3 Varchar(50),
 CONSTRAINT FK_MemberInterests_Members FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
 )

 Print '--MemberInterests table created --'

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
 Organizer Varchar(10),
 comments varchar(max)
 CONSTRAINT FK_MemberEvents_Members FOREIGN KEY (Organizer) REFERENCES Members(MemberID)
 )

 Print '--MemberEvents table created --'

 INSERT INTO MemberEvents (EventDate, EventTitle, Organizer)
 VALUES
 ('1/12/2017', 'The History Of Human Emotions', 'Tiffany Watt Smith'),
 ('2/22/2017', 'How Great Leaders Inspire Action', 'Simon Sinek'),
 ('3/5/2017', 'The Puzzle Of Motivation', 'Dan Pink'),
 ('4/16/2017', 'Your Elusive Creative Genius', 'Elizabeth Gilbert')
 -------------------------------------------------------------------------------------------------THIS IS WHERE I LEFT OFF


  CREATE TABLE EventMembers
 (
 EventID INT Primary Key,
 MemberID Varchar(10),
 Rating INT,
 Feedback Varchar(max),
 CONSTRAINT FK_EventMembers_Members FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
 CONSTRAINT FK_EventMembers_MemberEvents FOREIGN KEY (EventID) REFERENCES MemberEvents(EventID)
 )

 Print '--EventMember table created --'

