CREATE DATABASE `emre_kaya`;
use `emre_kaya`;
CREATE TABLE students (
  student_id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  class VARCHAR(255) NOT NULL
);
CREATE TABLE teachers (
  teacher_id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  subject VARCHAR(255) NOT NULL
);
CREATE TABLE courses (
  course_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  teacher_id INT NOT NULL,
  FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);
CREATE TABLE evaluations (
  evaluation_id INT PRIMARY KEY AUTO_INCREMENT,
  student_id INT NOT NULL,
  course_id INT NOT NULL,
  rating INT NOT NULL,
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
CREATE TABLE surveys (
  survey_id INT PRIMARY KEY AUTO_INCREMENT,
  student_id INT NOT NULL,
  course_id INT NOT NULL,
  feedback TEXT,
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
INSERT INTO students (first_name, last_name, class) VALUES ('Emre', 'Kaya', 'Bilgisayar Programciligi 2');
DELIMITER //
CREATE PROCEDURE AddStudentWithTransaction(IN p_first_name VARCHAR(255), IN p_last_name VARCHAR(255), IN p_class VARCHAR(255))
BEGIN
  START TRANSACTION;
  INSERT INTO students (first_name, last_name, class) VALUES (p_first_name, p_last_name, p_class);
  COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE AddStudent(IN p_first_name VARCHAR(255), IN p_last_name VARCHAR(255), IN p_class VARCHAR(255))
BEGIN
  INSERT INTO students (first_name, last_name, class) VALUES (p_first_name, p_last_name, p_class);
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE AddTeacher(IN p_first_name VARCHAR(255), IN p_last_name VARCHAR(255), IN p_subject VARCHAR(255))
BEGIN
  INSERT INTO teachers (first_name, last_name, subject) VALUES (p_first_name, p_last_name, p_subject);
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE AddCourse(IN p_name VARCHAR(255), IN p_teacher_id INT)
BEGIN
  INSERT INTO courses (name, teacher_id) VALUES (p_name, p_teacher_id);
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE AddEvaluation(IN p_student_id INT, IN p_course_id INT, IN p_rating INT)
BEGIN
  INSERT INTO evaluations (student_id, course_id, rating) VALUES (p_student_id, p_course_id, p_rating);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE AddSurvey(IN p_student_id INT, IN p_course_id INT, IN p_feedback TEXT)
BEGIN
  INSERT INTO surveys (student_id, course_id, feedback) VALUES (p_student_id, p_course_id, p_feedback);
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE GetStudentCourseAverage(IN p_student_id INT, IN p_course_id INT, OUT p_avg INT)
BEGIN
  SELECT AVG(rating) INTO p_avg
  FROM evaluations
  WHERE student_id = p_student_id AND course_id = p_course_id;
END //
DELIMITER ;

INSERT INTO `emre_kaya`.`teachers` (`first_name`, `last_name`, `subject`) VALUES ('Fatih', 'Dinc', 'Veri tabani');
INSERT INTO `emre_kaya`.`teachers` (`first_name`, `last_name`, `subject`) VALUES ('Fatih', 'Dinc', 'Python');
INSERT INTO `emre_kaya`.`teachers` (`first_name`, `last_name`, `subject`) VALUES ('Bayram', 'Akgul', 'Gorsel Programlama');
INSERT INTO `emre_kaya`.`teachers` (`first_name`, `last_name`, `subject`) VALUES ('Serkan', 'Aksu', 'Internet Programciligi');
INSERT INTO `emre_kaya`.`teachers` (`first_name`, `last_name`, `subject`) VALUES ('Serkan', 'Aksu', 'Isletim Sistemleri');
INSERT INTO `emre_kaya`.`surveys` (`survey_id`,`student_id`, `course_id`, `feedback`) VALUES ('1','1', '5', 'Proje ve yazili sinav ile dersten memnunum');
INSERT INTO `emre_kaya`.`surveys` (`survey_id`, `student_id`, `course_id`, `feedback`) VALUES ('2', '1', '5', 'Büte kaldim');
INSERT INTO `emre_kaya`.`surveys` (`survey_id`, `student_id`, `course_id`, `feedback`) VALUES ('3', '1', '5', 'Bütten kaç alsam geçerim');
INSERT INTO `emre_kaya`.`surveys` (`survey_id`, `student_id`, `course_id`, `feedback`) VALUES ('4', '1', '5', 'Veritabani çok egleneceli bir ders');
INSERT INTO `emre_kaya`.`surveys` (`survey_id`, `student_id`, `course_id`, `feedback`) VALUES ('5', '1', '5', 'Ogretim görevlisinden memnunum fakat ders çok zor');
INSERT INTO `emre_kaya`.`students` (`first_name`, `last_name`, `class`) VALUES ('Emre', 'Kaya ', 'Bilgisayar Programciligi 2');
INSERT INTO `emre_kaya`.`students` (`first_name`, `last_name`, `class`) VALUES ('Yeliz', 'Gülbek ', 'Bilgisayar Programciligi 2');
INSERT INTO `emre_kaya`.`students` (`first_name`, `last_name`, `class`) VALUES ('Semihanur', 'Yilmaz ', 'Bilgisayar Programciligi 2');
INSERT INTO `emre_kaya`.`students` (`first_name`, `last_name`, `class`) VALUES ('Aleyna', 'Sahin ', 'Bilgisayar Programciligi 2');
INSERT INTO `emre_kaya`.`students` (`first_name`, `last_name`, `class`) VALUES ('Sadettin', 'Demir ', 'Saglik Hizmetleri 2');

INSERT INTO `emre_kaya`.`evaluations` (`student_id`, `course_id`, `rating`) VALUES ('1', '1', '5');
INSERT INTO `emre_kaya`.`evaluations` (`student_id`, `course_id`, `rating`) VALUES ('1', '2', '5');
INSERT INTO `emre_kaya`.`evaluations` (`student_id`, `course_id`, `rating`) VALUES ('1', '3', '5');
INSERT INTO `emre_kaya`.`evaluations` (`student_id`, `course_id`, `rating`) VALUES ('1', '4', '5');
INSERT INTO `emre_kaya`.`evaluations` (`student_id`, `course_id`, `rating`) VALUES ('1', '5', '5');
INSERT INTO `emre_kaya`.`courses` (`name`, `teacher_id`) VALUES ('Isletim Sistemleri', '33');
INSERT INTO `emre_kaya`.`courses` (`name`, `teacher_id`) VALUES ('Internet Programciligi', '32');
INSERT INTO `emre_kaya`.`courses` (`name`, `teacher_id`) VALUES ('Gorsel Programlama', '31');
INSERT INTO `emre_kaya`.`courses` (`name`, `teacher_id`) VALUES ('Python Programlama', '30');
INSERT INTO `emre_kaya`.`courses` (`name`, `teacher_id`) VALUES ('Veri Tabani', '29');
