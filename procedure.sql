DELIMITER $$
create procedure AddTeacher(
teacher_id bool,
first_name varchar(64),
last_name varchar(64),
konusu varchar(250)
)
BEGIN
	INSERT INTO teachers
    values (null,first_name,last_name,konusu);
END $$
DELIMITER ;


DELIMITER $$
create procedure AddTeacherHepsi()
BEGIN
SELECT
teacher_id as id, 
first_name as adı,
last_name as soyadı,
konusu as dersi

FROM teachers;
   
END $$
DELIMITER ;
    


DELIMITER $$
create procedure AddTeacherBul(
filtre varchar(32)
)
BEGIN
SELECT
teacher_id as id, 
first_name as adı,
last_name as soyadı,
konusu as dersi

FROM teachers
WHERE
teacher_id LIKE concat('%',filtre,'%')OR
first_name LIKE concat('%',filtre,'%')OR
last_name LIKE concat('%',filtre,'%')OR
konusu LIKE concat('%',filtre,'%');
END $$
DELIMITER ;


DELIMITER $$
create procedure AddTeacherGuncelle2(
teacher_id varchar(64),
first_name varchar(255),
last_name varchar(255),
konusu varchar(255)
)
BEGIN
update teachers
Set

first_name = ad,
last_name =soyad,
konusu = ders

where
teacher_id  =id;
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE AddTeacherSil(
teacher_id varchar(64)
)
BEGIN
DELETE FROM teachers
WHERE teacher_id = teacher_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE AddTeacherSild(
id varchar(64)
)
BEGIN
DELETE FROM teachers
WHERE teacher_id = id;
END $$
DELIMITER ;





DELIMITER $$
CREATE PROCEDURE AddTeacherSil3(
teacher_id varchar(64)
)
BEGIN
DELETE FROM teachers
WHERE teacher_id = @teacher_id;
END $$
DELIMITER ;



DELIMITER $$
create procedure AddTeacherGuncelleson123(
teacher_id varchar(64),
first_name varchar(255),
last_name varchar(255),
konusu varchar(255)
)
BEGIN
update teachers
Set

first_name = first_name,
last_name =last_name,
konusu = konusu

where
teacher_id  = teacher_id;
END $$
DELIMITER ;



        
    