-- DiseaseType: Table and Content
CREATE TABLE DiseaseType ( id SERIAL PRIMARY KEY, description VARCHAR(140) NOT NULL);

    INSERT INTO DiseaseType(description) VALUES('physhological disease');
    INSERT INTO DiseaseType(description) VALUES('genetic hereditary disease');
    INSERT INTO DiseaseType(description) VALUES('non-genetic hereditary diseae');
    INSERT INTO DiseaseType(description) VALUES('infectious disease');
    INSERT INTO DiseaseType(description) VALUES('defiency disaese');
    INSERT INTO DiseaseType(description) VALUES('communicable disease');
    INSERT INTO DiseaseType(description) VALUES('non-communicable disaese');
    INSERT INTO DiseaseType(description) VALUES('epidemiological disaese');
    INSERT INTO DiseaseType(description) VALUES('cerebroscavular disaese');
    INSERT INTO DiseaseType(description) VALUES('coronary artery diseae');
    INSERT INTO DiseaseType(description) VALUES('virology');

-- Country: Table and Content
CREATE TABLE Country ( cname VARCHAR (50) PRIMARY KEY NOT NULL, population BIGINT  NOT NULL);

    INSERT INTO Country VALUES('Japan', 125700000);
    INSERT INTO Country VALUES('Kazakhstan', 19000000);
    INSERT INTO Country VALUES('Russia', 143400000);
    INSERT INTO Country VALUES('Germany', 831300000);
    INSERT INTO Country VALUES('India',1393000000 );
    INSERT INTO Country VALUES('China', 1412000000);
    INSERT INTO Country VALUES('USA', 331900000);
    INSERT INTO Country VALUES('Australia', 25740000);
    INSERT INTO Country VALUES('Canada',38250000);
    INSERT INTO Country VAlUES('England', 55980000);
    INSERT INTO Country VALUES('France', 67500000);
    INSERT INTO Country VALUES('Switzerland', 8698000);

-- Disease: Table and Content
CREATE TABLE Disease ( disease_code VARCHAR (50) PRIMARY KEY, pathogen VARCHAR (20) NOT NULL, description VARCHAR(140) NOT NULL, id INTEGER NOT NULL REFERENCES DiseaseType(id) ON DELETE CASCADE ON UPDATE CASCADE);
    INSERT INTO Disease VALUES('J10', 'Viruses', 'Flu', 4);
    INSERT INTO Disease VALUES('B15','Viruses','Hepatits A',4);
    INSERT INTO Disease VALUES('B17.9','Viruses','Hepatits B',4);
    INSERT INTO Disease VALUES('Z11.1','bacteria','Tuberculosis',4);
    INSERT INTO Disease VALUES('B53','Parasites','Malaria',3);
    INSERT INTO Disease VALUES('B37.9','Fungi','Thrush',5);
    INSERT INTO Disease VALUES('U07.1','Viruses','covid-19',8);
    INSERT INTO Disease VALUES('G03.9','bacteria','Meningitis',4);
    INSERT INTO Disease VALUES('C80.1','bacteria','Cancer', 2);
    INSERT INTO Disease VALUES('B82.9','Parasites','Intestinal Parasites', 9);

-- Discover: Table and Content
CREATE TABLE Discover (cname VARCHAR (50) NOT NULL REFERENCES  Country(cname) ON DELETE CASCADE ON UPDATE CASCADE, disease_code VARCHAR(50) NOT NULL REFERENCES Disease(disease_code) ON DELETE CASCADE ON UPDATE CASCADE, first_enc_date DATE NOT NULL);

    INSERT INTO Discover VALUES('China','U07.1','01.01.2020');
    INSERT INTO Discover VALUES('USA', 'J10', '11.03.1918');
    INSERT INTO Discover VALUES('Australia', 'B17.9', '01.01.1965');
    INSERT INTO Discover VALUES('France', 'Z11.1','01.01.1865');
    INSERT INTO Discover VALUES('India', 'B53', '08.20.1897');
    INSERT INTO Discover VALUES('France', 'B37.9', '01.01.1838');
    INSERT INTO Discover VALUES('China','B15','01.01.1979');
    INSERT INTO DISCOVER  VALUES('Switzerland','G03.9', '01.01.1805');
    INSERT INTO DISCOVER  VALUES('England','C80.1', '01.01.1775');
    INSERT INTO DISCOVER  VALUES('Germany','B82.9', '01.01.1859');

--Users: Table and Content
CREATE TABLE Users (email  VARCHAR (60) PRIMARY KEY NOT NULL, name VARCHAR(30) NOT NULL, surname VARCHAR(40) NOT NULL, salary INT NOT NULL, phone VARCHAR(20) UNIQUE NOT NULL, cname VARCHAR(50) NOT NULL REFERENCES Country(cname) ON DELETE CASCADE ON UPDATE CASCADE);  
    INSERT INTO Users VALUES('jonkean@gmail.com', 'Jon', 'Kean', 50000, '111111', 'England');
    INSERT INTO Users VALUES('harrykane@gmail.com', 'Harry', 'Kane', 70000, '222222', 'England');
    INSERT INTO Users VALUES('leroysane@gmail.com', 'Leroy', 'Sane', 55000, '333333', 'Germany');
    INSERT INTO Users VALUES('paulpogba@gmail.com', 'Paul', 'Pogba', 65000, '444444', 'France');
    INSERT INTO Users VALUES('takumiminamino@gmail.com', 'Takumi', 'Minamino', 100000, '555555', 'Japan');
    INSERT INTO Users VALUES('hinatayoshida@gmail.com', 'Hinata', 'Yoshida', 110000, '666666', 'Japan');
    INSERT INTO Users VALUES('mikelhoward@gmail.com', 'Mikel', 'Howard', 45000, '777777', 'USA');
    INSERT INTO Users VALUES('alfonsodavis@gmail.com', 'Alfonso', 'Davis', 80000, '888888', 'Canada');
    INSERT INTO Users VALUES('islambekkuat@gmail.com', 'Islambek', 'Kuat', 20000, '999999', 'Kazakhstan');
    INSERT INTO Users VALUES('jackiechan@gmail.com', 'Jackie', 'Chan', 30000, '121212', 'China');
    INSERT INTO Users VALUES('ngolokante@icloud.com', 'Ngolo', 'Kante', 120000, '131313', 'France');
    INSERT INTO Users VALUES('maysonmaunt@icloud.com', 'Mayson', 'Maunt', 45000, '141414', 'England');
    INSERT INTO Users VALUES('thomasmuller@icloud.com', 'Thomas', 'Muller', 82500, '151515', 'Germany');
    INSERT INTO Users VALUES('kageyamaoikawa@mail.com', 'Kageyama', 'Oikawa', 95000, '161616', 'Japan');
    INSERT INTO Users VALUES('kristianpulisic@mail.com', 'Kristian', 'Pulisic', 35000, '171717', 'USA');
    INSERT INTO Users VALUES('sergegnabry@mail.com', 'Serge', 'Gnabry', 52000, '181818', 'Germany');
    INSERT INTO Users VALUES('alibekkerey@mail.com', 'Alibek', 'Kerey', 15000, '191919', 'Kazakhstan');
    INSERT INTO Users VALUES('gulzhannurzhan@mail.com', 'Gulzhan', 'Nurzhan', 25000, '202020', 'Kazakhstan');
    INSERT INTO Users VALUES('bekzhanbekarys@mail.com', 'Bekzhan', 'Bekarys', 17500, '212121', 'Kazakhstan');

--PublicServant: Table and Content
CREATE TABLE PublicServant(email VARCHAR(60) PRIMARY KEY NOT NULL REFERENCES Users(email) ON DELETE CASCADE ON UPDATE CASCADE, department VARCHAR(50) NOT NULL);

    INSERT INTO PublicServant Values('harrykane@gmail.com', 'HealthCare');
    INSERT INTO PublicServant Values('leroysane@gmail.com', 'Police');
    INSERT INTO PublicServant Values('alfonsodavis@gmail.com', 'FireFighters');
    INSERT INTO PublicServant Values('mikelhoward@gmail.com', 'HealthCare');
    INSERT INTO PublicServant Values('jackiechan@gmail.com', 'FireFighters');                                                                                                                                            INSERT INTO PublicServant Values('jonkean@gmail.com', 'Police');                                                                                                                                                                                                      INSERT INTO PublicServant Values('hinatayoshida@gmail.com', 'Police');
    INSERT INTO PublicServant Values('islambekkuat@gmail.com', 'Post Office');                                                                                                                                                                                                       INSERT INTO PublicServant Values('paulpogba@gmail.com', 'FireFighters');
    INSERT INTO PublicServant VALUES('takumiminamino@gmail.com', 'FireFighters');
    INSERT INTO PublicServant VALUES('ngolokante@icloud.com', 'HealthCare');
    INSERT INTO PublicServant VALUES('maysonmaunt@icloud.com', 'HealthCare');
    INSERT INTO PublicServant VALUES('thomasmuller@icloud.com', 'HealthCare');
    INSERT INTO PublicServant VALUES('kageyamaoikawa@mail.com', 'HealthCare');
    INSERT INTO PublicServant VALUES('kristianpulisic@mail.com', 'HealthCare');
    INSERT INTO PublicServant VALUES('sergegnabry@mail.com', 'HealthCare');
    INSERT INTO PublicServant VALUES('alibekkerey@mail.com', 'HealthCare');
    INSERT INTO PublicServant VALUES('gulzhannurzhan@mail.com', 'HealthCare');
    INSERT INTO PublicServant VALUES('bekzhanbekarys@mail.com', 'HealthCare');

--Doctor: Table and Content
CREATE TABLE Doctor(email VARCHAR(60) PRIMARY KEY NOT NULL REFERENCES Users(email) ON DELETE CASCADE ON UPDATE CASCADE, degree VARCHAR(20) NOT NULL);

    INSERT INTO Doctor VALUES('kristianpulisic@mail.com', 'MBBS');
    INSERT INTO Doctor VALUES('kageyamaoikawa@mail.com', 'MD');
    INSERT INTO Doctor VALUES('thomasmuller@icloud.com', 'MBBS');
    INSERT INTO Doctor VALUES('maysonmaunt@icloud.com', 'MS');
    INSERT INTO Doctor VALUES('ngolokante@icloud.com', 'MS');
    INSERT INTO Doctor VALUES('mikelhoward@gmail.com', 'MBBS');
    INSERT INTO Doctor VALUES('harrykane@gmail.com', 'MD');
    INSERT INTO Doctor VALUES('bekzhanbekarys@mail.com', 'MS');
    INSERT INTO Doctor VALUES('gulzhannurzhan@mail.com', 'MBBS');
    INSERT INTO Doctor VALUES('alibekkerey@mail.com', 'MD');
    INSERT INTO Doctor VALUES('sergegnabry@mail.com', 'MBBS');

--Specialize: Table and Content
CREATE TABLE Specialize(id INT NOT NULL REFERENCES DiseaseType(id) ON DELETE CASCADE ON UPDATE CASCADE, email VARCHAR(60) NOT NULL REFERENCES Doctor(email) ON DELETE CASCADE ON UPDATE CASCADE);

    INSERT INTO Specialize VALUES(4, 'sergegnabry@mail.com');
    INSERT INTO Specialize VALUES(6, 'sergegnabry@mail.com');
    INSERT INTO Specialize VALUES(8, 'sergegnabry@mail.com');
    INSERT INTO Specialize VALUES(6, 'gulzhannurzhan@mail.com');
    INSERT INTO Specialize VALUES(1, 'alibekkerey@mail.com');
    INSERT INTO Specialize VALUES(5, 'alibekkerey@mail.com');
    INSERT INTO Specialize VALUES(1, 'harrykane@gmail.com');
    INSERT INTO Specialize VALUES(5, 'harrykane@gmail.com');
    INSERT INTO Specialize VALUES(11, 'harrykane@gmail.com');
    INSERT INTO Specialize VALUES(2, 'maysonmaunt@icloud.com');
    INSERT INTO Specialize VALUES(3, 'maysonmaunt@icloud.com');
    INSERT INTO Specialize VALUES(11, 'maysonmaunt@icloud.com');
    INSERT INTO Specialize VALUES(2, 'ngolokante@icloud.com');
    INSERT INTO Specialize VALUES(3, 'ngolokante@icloud.com');
    INSERT INTO Specialize VALUES(10, 'ngolokante@icloud.com');
    INSERT INTO Specialize VALUES(7, 'thomasmuller@icloud.com');
    INSERT INTO Specialize VALUES(9, 'kristianpulisic@mail.com');
    INSERT INTO Specialize VALUES(4, 'kageyamaoikawa@mail.com');
    INSERT INTO Specialize VALUES(11, 'kristianpulisic@mail.com');

--Record: Table and Content

CREATE TABLE Record(email VARCHAR(60) NOT NULL REFERENCES PublicServant(email) ON DELETE CASCADE ON UPDATE CASCADE, cname VARCHAR(50) NOT NULL REFERENCES Country(cname) ON DELETE CASCADE ON UPDATE CASCADE, disease_code VARCHAR(50) NOT NULL REFERENCES Disease(disease_code) ON DELETE CASCADE ON UPDATE CASCADE, total_deaths INT NOT NULL, total_patients INT NOT NULL);
    INSERT INTO Record VALUES('maysonmaunt@icloud.com', 'England', 'U07.1', 250000, 400000);  
    INSERT INTO Record VALUES('maysonmaunt@icloud.com', 'England', 'U07.1', 300000, 500000); 
    INSERT INTO Record VALUES('harrykane@gmail.com', 'England', 'U07.1', 1000, 10000);
    INSERT INTO Record VALUES('harrykane@gmail.com', 'England', 'U07.1', 3000, 20000);
    INSERT INTO Record VALUES('harrykane@gmail.com', 'England', 'U07.1', 7500, 40000);
    INSERT INTO Record VALUES('maysonmaunt@icloud.com', 'France', 'U07.1', 20000, 100000);
    INSERT INTO Record VALUES('paulpogba@gmail.com', 'France', 'U07.1', 1000, 2500);
    INSERT INTO Record VALUES('thomasmuller@icloud.com', 'Germany', 'U07.1', 3000, 10000);
    INSERT INTO Record VALUES('kageyamaoikawa@mail.com', 'Japan','U07.1', 1000, 5000);
    INSERT INTO Record VALUES('kageyamaoikawa@mail.com', 'Japan','U07.1', 1000, 5000);
    INSERT INTO Record VALUES('hinatayoshida@gmail.com', 'Japan','U07.1', 2000, 8000);
    INSERT INTO Record VALUES('hinatayoshida@gmail.com', 'Japan','U07.1', 5000, 25000);
    INSERT INTO Record VALUES('kageyamaoikawa@mail.com', 'Japan','U07.1', 10000, 141000);
    INSERT INTO Record VALUES('kristianpulisic@mail.com', 'USA', 'U07.1', 100000, 1250000);
    INSERT INTO Record VALUES('mikelhoward@gmail.com', 'USA', 'U07.1', 210000, 1250000);
    INSERT INTO Record VALUES('mikelhoward@gmail.com', 'USA', 'Z11.1', 12500, 350000);
    INSERT INTO Record VALUES('thomasmuller@icloud.com', 'Germany', 'J10', 10000, 200000);


-- --Query1++

--     SELECT Disease.disease_code, Disease.description from Disease JOIN Discover ON Discover.disease_code = Disease.disease_code WHERE Disease.pathogen = 'bacteria' AND Discover.first_enc_date < '1990-01-01';

-- --Query2

SELECT DISTINCT ON (Users.name, Users.surname) Users.name, Users.surname, Doctor.degree  
FROM Specialize 
JOIN Doctor ON Doctor.email = Specialize.email 
JOIN Users ON Users.email = Doctor.email 
WHERE Specialize.email NOT IN (
SELECT Specialize.email 
FROM Specialize 
JOIN DiseaseType ON DiseaseType.id = Specialize.id 
WHERE DiseaseType.description = 'infectious disease');

-- --Query3++

SELECT DISTINCT ON (Users.name, Users.surname) Users.name, Users.surname, Doctor.degree FROM Specialize JOIN DiseaseType ON DiseaseType.id = Specialize.id JOIN Doctor ON Specialize.email = Doctor.email JOIN Users ON Users.email = Doctor.email GROUP BY Users.name, Users.surname, Doctor.degree  HAVING COUNT(DISTINCT(Specialize.id)) > 2;

-- --Query4++

--     SELECT Users.cname, AVG(Users.salary) FROM Users JOIN Specialize ON Users.email = Specialize.email JOIN DiseaseType on Specialize.id = DiseaseType.id WHERE DiseaseType.description = 'virology' GROUP BY Users.cname;

-- --Query5++

--     SELECT PublicServant.department, COUNT(DISTINCT PublicServant.email) FROM PublicServant JOIN Record ON Record.email = PublicServant.email JOIN Disease ON Disease.disease_code = Record.disease_code WHERE (Disease.description = 'covid-19') GROUP BY PublicServant.department HAVING COUNT(DISTINCT(Record.cname)) > 1;

-- --Query6++

--     UPDATE Users SET salary = 2 * salary WHERE Users.email = ANY(SELECT Record.email FROM Record JOIN Disease ON Disease.disease_code = Record.disease_code WHERE Disease.description = 'covid-19' GROUP BY Record.email HAVING COUNT(*) > 2);

-- --Query7++

--     DELETE FROM Users WHERE name LIKE '%bek%' OR name LIKE '%Bek%' OR name LIKE '%Gul%' OR name LIKE '%gul%';

-- --Query8++

--     CREATE INDEX idx_pathogen ON Disease(pathogen);

-- --Query9++

--     SELECT PublicServant.email, Users.name, PublicServant.department FROM PublicServant JOIN Record ON Record.email = PublicServant.email JOIN Users ON Users.email = Record.email WHERE 100000 < total_patients AND total_patients < 999999 GROUP BY PublicServant.email, Users.name;

-- --Query10++

--     SELECT Record.cname, SUM(Record.total_patients) From Record GROUP BY Record.cname ORDER BY SUM(Record.total_patients) DESC LIMIT 5;

-- --Query11++



