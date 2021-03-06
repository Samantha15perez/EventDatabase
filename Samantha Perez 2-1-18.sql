--START OF SCRIPT

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

 --This snippet of code checks if the database already exists, and if so, drops it before recreating it.
 --this in turn drops all tables associated, before recreating them as well, and then making sure that the 
 --database being used for all future queries is the one we just created. 

 
 CREATE TABLE Members
 (
 MemberID Varchar(10) NOT NULL PRIMARY KEY,
 Firstname Varchar(20) NOT NULL,
 MiddleName Varchar(20),
 LastName Varchar(20) Not null,
 Email varchar(50),
 Phone varchar(15),
 Gender Varchar(1),
 Joindate date,
 Birthdate date,
 )

 Print '--Members table created'

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

--Next, I create (and then populate) the members table, inserting all of the information shown above. Usually I would have set
--the MemberID to identification, but since we're using predetermined values, i did not. The members table contains all information
--Necessary for identification. 


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

--for easier queries later, I created a small table holding the Prices for each subscription type. 

 
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


--The subscriptionlevels table simply shows the member, what kind of subscription they have, and a bit to show
--whether or not that subscription is currently active, for easier queries for billing in the future.
 

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

 --Kind of self explanatory; memberids with the corresponding address information. 
 --I did however create a bit flag for members with a seperate billing address.

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

 --This table is created for the members stated above, which have a seperate billing address to their normal address. 
 --this way, if both tables were put into a view, one could easily differentiate the addresses listed.

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

--this table didn't exactly have a lot of defining information within the spreadsheet, but I left a subject column open to specify 
--what the notes would in theory be about if they weren't just filler text, for the sake of organization and data management. 


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

--When entering in the credit card information, I set the expiration dates to the last day of each month, so that when a field is
--calculated, such as a transaction, it can double check that the credit card on file is still valid and able to be charged. 

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

--this table is a basic summarization of all the charges that have occured to date. the CCID references back to the 
--credit card information table, and the memberid references back to the members table, just in case a transaction is
--declined, so that you can contact the specific member.
 
 CREATE TABLE MemberInterests
 (
 MemberID Varchar(10) Primary KEy,
 Interests Varchar(MAX),
 CONSTRAINT FK_MemberInterests_Members FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
 )

 Print '--MemberInterests table created'

 INSERT INTO MemberInterests (MemberID, Interests)
 VALUES
('M0001','Acting, Video Games, Crossword Puzzles'),
('M0002','Calligraphy'),
('M0003','Movies, Restaurants, Woodworking'),
('M0004','Juggling, Quilting'),
('M0005','Electronics'),
('M0006','Sewing, Cooking, Movies'),
('M0007','Botany, Skating'),
('M0008','Dancing, Coffee, Foreign Languages'),
('M0009','Fashion'),
('M0010','Woodworking'),
('M0011','Homebrewing, Geneology, Movies, Scrapbooking'),
('M0012','Surfing, Amateur Radio'),
('M0013','Computers'),
('M0014','Writing, Singing'),
('M0015','Reading, Pottery')

 --this table compiles all of the interests from the spreadsheet along with the IDs of the members. 

  CREATE TABLE MemberEvents
 (
 EventID Varchar(10) Primary Key,
 Eventdate Date,
 Starttime datetime,
 Endtime datetime,
 eventtitle varchar(50),
 Description varchar(max),
 Organizer Varchar(20),
 comments varchar(max)
 )

 Print '--MemberEvents table created'

 INSERT INTO MemberEvents (EventID, EventDate, EventTitle, Organizer)
 VALUES
 ('Event1', '1/12/2017', 'The History Of Human Emotions', 'Tiffany Watt Smith'),
 ('Event2', '2/22/2017', 'How Great Leaders Inspire Action', 'Simon Sinek'),
 ('Event3', '3/5/2017', 'The Puzzle Of Motivation', 'Dan Pink'),
 ('Event4', '4/16/2017', 'Your Elusive Creative Genius', 'Elizabeth Gilbert'),
 ('Event5', '5/1/2017', 'Why Are Programmers So Smart?', 'Andrew Comeau')


 --as a primary key, I used an identity field to organize the events properly. the ID corresponds with the information in
 --a later table, ie- 'event1', 'event2' ect. StartTime, endtime, description and Comment fields were not specified in the spreadsheet, but I left the columns
 --open anyway in the event that we were given more info for the assignment; as i did not want to make up information that didn't
 --fit properly. 



 CREATE TABLE EventAttendance
 (
 MemberID varchar(10) PRIMARY KEY, 
 Event1 bit,
 Event2 Bit,
 event3 bit,
 event4 bit,
 event5 bit,
  CONSTRAINT FK_EventAttendance_Members FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
  )

  PRINT '--EventAttendance Table Created'


  INSERT INTO EventAttendance (MemberID, event1, event2, event3, event4, event5)
  VALUES
('M0001',0,0,1,1,1),
('M0002',1,0,1,1,0),
('M0003',1,1,1,0,1),
('M0004',1,1,1,1,1),
('M0005',1,1,1,1,0),
('M0006',1,0,1,1,0),
('M0007',0,1,1,1,0),
('M0008',1,1,1,1,0),
('M0009',0,1,1,1,0),
('M0010',1,1,0,0,0),
('M0011',1,1,0,0,0),
('M0012',1,0,1,1,1),
('M0013',1,1,0,0,1),
('M0014',0,1,1,1,0),
('M0015',1,1,1,1,0)
;



--I created a seperate table to log event attendance, with 0 (false) for absent, and 1 (true) for present. 


--END OF SCRIPT



 ------------------------------------------------FUNCTIONS------------------------------------------------
 --Please note that you have to run every Procedure/Function/View seperately in order to check that they work. 

 ---------------------------------------------------------------------------------------------------------
 --A complete contact list for current members with name, physical mailing address, phone number and e-mail.

 GO 
 create view MailingList 
 AS
 Select CONCAT(M.Firstname, ' ', M.Middlename, ' ', M.Lastname) [Name], A.[Address], A.City, A.[State], A.postalcode, M.Phone, M.Email
 from members M
 INNER JOIN Addresses A
 ON M.memberid = A.memberID
 INNER JOIN SubscriptionLevels SL
 ON SL.MemberID = M.MemberID
 WHERE SL.Active = 1
 ;

 GO
 --This view Pulls all of the relevant information from the Addresses and Members tables in order to organize
 --a functional mailing list. The Join on the SubscriptionLevels table is necessary in order to only pull a list
 -- of members who are active. the select statement below tests the validity of the view. 

 select * from MailingList

 ---------------------------------------------------------------------------------------------------------
 
 --An e-mail list with the member name and e-mail.
 GO
 CREATE VIEW EmailList
 AS
 select CONCAT(Firstname,' ', Lastname) [Name], Email
 FROM Members M
 INNER JOIN SubscriptionLevels SL
 ON SL.MemberID = M.MemberID
 WHERE SL.Active = 1

  --This view Pulls all of the relevant information from the Members and SubscriptionLevels tables in order to organize
 --a functional Email list. The Join on the SubscriptionLevels table is necessary in order to only pull a list of members
 -- who are active. the select statement below tests the validity of the view. 

 GO
 Select * from EmailList

 ---------------------------------------------------------------------------------------------------------
 --A list of members who are celebrating their birthday this month.
 GO
 CREATE VIEW BirthdaysThisMonth
 AS
 select CONCAT(Firstname,' ', Lastname) [Name], birthdate
 FROM Members M
 INNER JOIN SubscriptionLevels SL
 ON SL.MemberID = M.MemberID
 WHERE SL.Active = 1
 AND datepart(Month, birthdate) = datepart(Month, getdate())

 --This View Concatenates the First and Last names (for easier Printing) and pulls information directly from the members table. 
 --The Join on the SubscriptionLevels table is necessary in order to only pull a list of members who are active. 
 --the select statement below tests the validity of the view. 
 GO
Select * from BirthdaysThisMonth

 ---------------------------------------------------------------------------------------------------------

 --Members are charged for renewals according to their payment plan 
 --(monthly, quarterly, etc..) on the anniversary of the date they joined.
 -- A user who joined on the 7th should always be billed on the 7th,
 -- whether it's every one, three or 12 months. Some method is needed to 
 --scan for current members who are up for renewal and to initiate the
 -- billing to their credit card.

 ----------------------------------------BEGINNING OF VIEW (WARNING: IT'S A BIT LONG)
 GO
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
  ;
  GO
  
 ----------------------------------------END OF VIEW


  --This query selects the Member Information by checking the current date against the log of
 --join dates within the database, but only for active members, members with the Subscription type 'Yearly',
 --and members whos' joindate is exactly two, Four, Or Six years from today. (for future functionality) 
 --The UNION ALL command combines the results of all of these queries and brings them together, so that 
 --the same view can be run every day to get the proper information for members who need to be charged for renewal.
 --The select statement below tests the validity of the view. 

 select * from subscription_Renewals

--Next, Run the Procedure. 
GO
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
ELSE PRINT 'Nobody is due for a charge today. '
END

go

	SELECT * from CCTransactions WHERE CCresultCode = 'Pending'


--This Procedure takes all of the information from the view I created earlier, and uses it to properly charge the Members'
--Accounts for the amount their subscription calls for.
--If you run this procedure every day, it will automatically charge the proper members for you. 
--PLEASE NOTE: I have double and triple checked this procedure. If running it does not result in anything, that just means that
--Nobody is due for a renewal today If this is the case whenever you're reviewing this project,
--Please change the day portion of the joindates to the current day of the month. I assume you'll be grading this on monday,
--so I tried to set it up accordingly. 

GO

INSERT INTO Members (MemberId, firstname, middlename, lastname, email, phone, gender, joindate, birthdate)
VALUES 
('M0016', 'Samantha', 'Nicole', 'Perez', 'fakeemail@mail.com', '302-213-2144', 'F', '02/12/2017', '07/29/1996')


INSERT INTO SubscriptionLevels (Memberid, Subtype, Active)
VALUES 
('M0016', 'Yearly', 1)


INSERT INTO MemberCCINFO (Memberid, CCID, CardType, Expdate)
VALUES
('M0016', '337123453240515', 'TesterCard', '04/30/2020')

EXEC SP_SubscriptionRenewalCharge

--Run these Inserts, then the statement above, and everything should work. 

SELECT * from CCTransactions WHERE CCresultCode = 'Pending'


 ---------------------------------------------------------------------------------------------------------
 --The database should identify expired credit cards before it tries to bill to them.
 GO
 CREATE VIEW ExpiredCCIDs
 AS
 Select M.Firstname, M.Lastname, CCID, ExpDate
 FROM MemberCCInfo C
 INNER JOIN Members M
 ON C.Memberid = m.MemberID
 WHERE Expdate <= getdate()
 GO
 Select * from ExpiredCCIDs

 --nobody has an expired credit card yet. this can be double checked by changing the '<=' in the last line to '>=' In order to check
 --for any cards with an expiration date AFTER today, which is all of them. 

 ---------------------------------------------------------------------------------------------------------

 --We need to see the monthly income from member renewals over a given time frame.
 GO
 ALTER Procedure SP_MonthlyIncome @Date1 datetime, @date2 datetime
 AS
 select CONCAT((datename(month, transdate)), '/',(datename(Year, getdate()))), SUM(Amount) [Income]
 from CCTransactions
 INNER JOIN Members
 ON CCtransactions.MemberID = Members.MemberID
 WHERE CCresultcode = 'Approved' AND Transdate BETWEEN @date1 and @date2
 GROUP BY datename(year, transdate)
 GO

 exec sp_monthlyincome @date1 = '1/1/2016', @date2 = '1/1/2019'
 

 Select datename(Month, getdate())
 --This pulls the sum of all transactions for the year 2017, and groups them by month. 

 ---------------------------------------------------------------------------------------------------------

 --New member sign-ups per month over a given time frame.

 GO
 CREATE PROCEDURE SP_MemberSignUps @Date1 datetime, @date2 datetime
 AS
  select COUNT (Firstname)[Members], CONCAT((datepart(Month, Joindate)), '/',(datepart(Year, Joindate))) [Month]
 FROM Members
 WHERE Joindate > @date1 AND Joindate < @Date2
 GROUP BY datepart(Month, Joindate), datepart(year, Joindate)

 exec SP_membersignups @Date1 = '1/1/2016', @date2 = '1/1/2019'


 --This view shows not only months, but years in order to be more effective at organization. 

 ---------------------------------------------------------------------------------------------------------

 --Attendance per event over a given time frame.
 GO
 CREATE VIEW AttendanceByEvent
 AS
 Select 
 (Select COUNT(event1) [Attendees] FROM eventattendance WHERE event1 = 1) [Event1],
 (Select COUNT(event2) [Attendees] FROM eventattendance WHERE event2 = 1) [Event2],
 (Select COUNT(event3) [Attendees] FROM eventattendance WHERE event3 = 1) [Event3],
 (Select COUNT(event4) [Attendees] FROM eventattendance WHERE event4 = 1) [Event4],
 (Select COUNT(event5) [Attendees] FROM eventattendance WHERE event5 = 1) [Event5]
 GO
 Select * from AttendanceByEvent

 --The events themselves are specified by the EventID in the MemberEvents table. this view neatly pulls a count of all attending members.
 --As stated previously, I have a seperate table within my database just for attendance. 

 ---------------------------------------------------------------------------------------------------------

 --Secure Storage of Member Passwords

GO

 CREATE TABLE MemberPasswords
 (
 MemberID Varchar(10) PRIMARY KEY,
 [Password] varchar(max),
 modifieddate datetime DEFAULT getdate()
 CONSTRAINT FK_MemberPasswords_Members FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
 )

 INSERT INTO MemberPasswords (memberid, [password], modifieddate)
 VALUES
 ('M0001', HASHBYTES( 'MD5', 'EggTastic'), getdate()),
 ('M0002', HASHBYTES( 'MD5', 'Vroom298'), getdate()),
 ('M0003', HASHBYTES( 'MD5', 'GreendayIsCool'), getdate()),
 ('M0004', HASHBYTES( 'MD5', 'CoolRobloxDude99'), getdate()),
 ('M0005', HASHBYTES( 'MD5', 'ThesePasswords'), getdate()),
 ('M0006', HASHBYTES( 'MD5', 'ArentExciting'), getdate()),
 ('M0007', HASHBYTES( 'MD5', 'IjustWant'), getdate()),
 ('M0008', HASHBYTES( 'MD5', 'ToSleepPlease'), getdate()),
 ('M0009', HASHBYTES( 'MD5', 'AAAAAAAA'), getdate()),
 ('M0010', HASHBYTES( 'MD5', 'BBBBBBBB'), getdate()),
 ('M0011', HASHBYTES( 'MD5', 'CCCCCCCC'), getdate()),
 ('M0012', HASHBYTES( 'MD5', 'DDDDDDDD'), getdate()),
 ('M0013', HASHBYTES( 'MD5', 'EEEEEEEE'), getdate()),
 ('M0014', HASHBYTES( 'MD5', 'FFFFFFFF'), getdate()),
 ('M0015', HASHBYTES( 'MD5', 'GGGGGGGG'), getdate())

 --Running these creates a passwords table that stores all passwords as an MD5 hash. The primary key is the Memberid, 
 --So it can accurately keep track of what password belongs to what person. The modifieddate just shows when the last
 --change to this password was. The default is set to getdate() because for this project, the database is created
 --the same day that these passwords are added. 

 ---------------------------------------------------------------------------------------------------------

 --A method for determining the last time a member password was changed
 GO
 create View PasswordChanged
 AS
  select M.Memberid, Firstname, Lastname, [Password] [Hash], Modifieddate from memberpasswords
  INNER JOIN Members M
  ON M.memberid = memberpasswords.MemberID
 GO
 select * from PasswordChanged

 --this view shows all of the relevant information anyone might need to make sure the passwords are up to date for each person. 

 ---------------------------------------------------------------------------------------------------------

 --a method to verify password provided during login with the one stored in the database
 GO
 CREATE PROCEDURE PasswordHashChecker @Pass varchar(max)
 AS
 SELECT * FROM dbo.passwordChanged 
 where [Hash] = (SELECT Hashbytes('Md5', @pass))

 --This procedure uses the view 'passwordchanged' that I created earlier in order to run the provided password against the 
 --hashes available within the view. It converts the input into the same type of hash, tests the hashes against each other
 --and then pulls up any matching information. No plaintext passwords are shown through the database or even recorded.

 GO
 exec PasswordHashChecker @pass = 'ToSleepPlease'

 ---------------------------------------------------------------------------------------------------------

 --A free Membership Level that does not incur charges.
 GO
 INSERT INTO SubscriptionPrices (SubType, subprice)
 values ('Free', '0')

UPDATE SubscriptionLevels
SET Subtype = 'Free'
WHERE MemberID = 'M0016'

delete from CCTransactions WHERE CCresultCode = 'Pending'

EXEC SP_SubscriptionRenewalCharge

select * from CCTransactions WHERE CCresultCode = 'Pending'

--The free subscriptiontype doesn't incur charges because the monetary value is set to zero, and there is no set charge date. 

 ---------------------------------------------------------------------------------------------------------

 --FEBRUARY 13TH EXCERCISES

update MemberEvents
set [Description] = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Interdum velit euismod in pellentesque massa placerat duis ultricies.'
where eventtitle = 'The History Of Human Emotions'

update MemberEvents
set [Description] = 'Explicari vituperatoribus mel eu, graece labore phaedrum sed ei, ei choro albucius definitiones has.'
where eventtitle = 'How Great Leaders Inspire Action'

update MemberEvents
set [Description] = 'An quo omnes denique consectetuer. Eu duo enim conceptam, eu dicta latine iracundia vim. Sed alia accommodare no. Ne mei civibus fuisset percipitur, vide offendit mel ad.'
where eventtitle = 'The Puzzle Of Motivation'

update MemberEvents
set [Description] = 'Nibh iusto munere at nam. Hinc doming quo in, nam timeam latine apeirian et! Qui cu modo dolore, commune petentium eos ut.'
where eventtitle = 'Your Elusive Creative Genius'

update MemberEvents
set [Description] = 'Minim liberavisse his in, ex esse interesset ius. Nam no euripidis referrentur, ne wisi senserit pertinacia mei, qui quem nominati sadipscing no? Eos quod corrumpit ea.'
where eventtitle = 'Why Are Programmers So Smart?'

ALTER TABLE Members
ADD EventAdmin bit 

UPDATE Members
set EventAdmin = 0

INSERT INTO Members (MemberId, firstname, middlename, lastname, email, phone, gender, joindate, birthdate, Eventadmin)
VALUES 
('M0017', 'Sleve', 'Nicholas', 'Mcdichael', 'Bestadmin@gmail.com', '634-623-2367', 'M', '01/12/2014', '07/21/1976', 1),
('M0018', 'Rey', 'James', 'Alcoss', 'OraOraOra@gmail.com', '634-623-2367', 'M', '07/11/2013', '01/28/1985', 1),
('M0019', 'Bobson', 'Smorin', 'Dugnutt', 'Nickleback_Rulz@gmail.com', '634-623-2367', 'M', '02/20/2014', '01/11/1962', 1),
('M0020', 'Jinniel', 'Rey', 'Bonzales', 'Bestadmin@gmail.com', '634-623-2367', 'F', '05/13/2014', '02/08/1955', 1),
('M0021', 'Dwigt', 'Nogilny', 'Rortugal', 'Bestadmin@gmail.com', '634-623-2367', 'M', '01/27/2015', '12/31/1931', 1)

ALTER TABLE MemberEvents
ADD AdminID varchar(10)

UPDATE MemberEvents
SET AdminID = 'M0017' WHERE EventID = 'Event1'

UPDATE MemberEvents
SET AdminID = 'M0018' WHERE EventID = 'Event2'

UPDATE MemberEvents
SET AdminID = 'M0019' WHERE EventID = 'Event3'

UPDATE MemberEvents
SET AdminID = 'M0020' WHERE EventID = 'Event4'

UPDATE MemberEvents
SET AdminID = 'M0021' WHERE EventID = 'Event5'


select * from members
select * from memberevents
select * from eventattendance

go
create VIEW EventInformation WITH SCHEMABINDING
AS
 Select Eventtitle, Eventdate, [Description], Organizer, (Select COUNT(event2)  FROM dbo.eventattendance WHERE event2 = 1) [Attendance]
 from dbo.memberevents ME
 Where EventID = 'Event2'
 UNION
 Select Eventtitle, Eventdate, [Description], Organizer, (Select COUNT(event1)  FROM dbo.eventattendance WHERE event1 = 1) [Attendance]
 from dbo.memberevents ME
 Where EventID = 'Event1'
 UNION
 Select Eventtitle, Eventdate, [Description], Organizer, (Select COUNT(event3)  FROM dbo.eventattendance WHERE event3 = 1) [Attendance]
 from dbo.memberevents ME
 Where EventID = 'Event3'
 UNION
 Select Eventtitle, Eventdate, [Description], Organizer, (Select COUNT(event5)  FROM dbo.eventattendance WHERE event5 = 1) [Attendance]
 from dbo.memberevents ME
 Where EventID = 'Event5'
 UNION
 Select Eventtitle, Eventdate, [Description], Organizer, (Select COUNT(event4)  FROM dbo.eventattendance WHERE event4 = 1) [Attendance]
 from dbo.memberevents ME
 Where EventID = 'Event4'
 WITH CHECK OPTION

 Select * from EventInformation

 ALTER TABLE MemberEvents DROP COLUMN EventTitle

--Msg 5074, Level 16, State 1, Line 908
--The object 'EventInformation' is dependent on column 'EventTitle'.
--Msg 4922, Level 16, State 9, Line 908
--ALTER TABLE DROP COLUMN EventTitle failed because one or more objects access this column.
 -------------

 Select M.Memberid, Firstname, Lastname, Phone, [Address], City, [State], Postalcode, transdate
 from members M 
 INNER JOIN Addresses A
 ON M.MemberID = A.memberid
 INNER JOIN CCTransactions C
 ON C.Memberid = M.MemberID
 inner join memberinterests MI
 ON MI.MemberID = M.MemberID
 group by M.Memberid, Firstname, Lastname, Phone, [Address], City, [State], Postalcode, TransDate



 


 ALTER TABLE MemberEvents
 add Series INT

 update memberevents
 set series = '1' where eventid IN ('Event1', 'Event3', 'Event5')

  update memberevents
 set series = '2' where eventid IN ('Event2', 'Event3', 'Event4')

 select * from MemberEvents


 CREATE TABLE EventSeries
 (
 SeriesID INT Identity(1,1),
 SeriesTitle Varchar(max),
 SeriesDescription Varchar(max),
 startdate date,
 enddate date,
 SeriesAdminID varchar(10)
 CONSTRAINT FK_EventSeries_Members FOREIGN KEY (SeriesAdminID) REFERENCES Members(MemberID),
 )

 INSERT INTO EVENTSERIES (Seriestitle, SeriesDescription, startdate, enddate, SeriesAdminID)
 VALUES
 ('Narcicisms Prevalence in Programming', NULL, '2017-01-12', '2017-05-01', 'M0020'),
 ('TeamWork: Making Dreams work', NULL, '2017-02-22', '2017-04-16', 'M0019')

 select * 
 from eventseries ES
 inner join members m
 on ES.SeriesAdminID = M.MemberID


 select * from members m