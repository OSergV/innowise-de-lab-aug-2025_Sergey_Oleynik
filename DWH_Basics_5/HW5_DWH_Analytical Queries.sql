-- Примеры аналитических запросов, которые помогут ответить на ключевые вопросы 
-- бизнес-процесса "Система высшего образования"

-- 1. Список средних оценок студента (Student_SID = 10) по всем предметам
SELECT st.FirstName, st.LastName, sub.SubjectName, AVG(grd.Grade) AS GradeAvg
FROM Fact_Grades grd
JOIN Dim_Students st ON grd.Student_SID = st.Student_SID
JOIN Dim_Subjects sub ON grd.Subject_SID = sub.Subject_SID
WHERE st.Student_SID = 10
GROUP BY st.FirstName, st.LastName, sub.SubjectName
ORDER BY sub.SubjectName ;

-- 2. Количество студентов в группе (Group_SID = 12) со средней оценкой по каждому предмету ниже 5
SELECT COUNT(*) AS CountStudents_AvgGradeLowerFive
FROM (
	SELECT Student_SID
	FROM (
		SELECT grd.Student_SID, grd.Subject_SID, AVG(grd.Grade) AS GradeAvg		-- {
		FROM Fact_Grades grd													--  Средняя оценка
		JOIN Dim_Students st ON grd.Student_SID = st.Student_SID				--  каждого студента из группы (Group_SID = 12)
		WHERE st.Group_SID = 12													--  по каждому предмету
		GROUP BY grd.Student_SID, grd.Subject_SID 								-- }
		)
	GROUP BY Student_SID
HAVING MAX(GradeAvg) < 5									-- Находим студентов, у которых средняя оценка по всем предметам ниже 5
) ;								-- Подсчет количества студентов

-- 3. У скольких групп ведет занятия преподаватель (Teacher_SID = 7)
SELECT t.FirstName, t.LastName, COUNT(DISTINCT sch.Group_SID) AS GroupCount
FROM Fact_Schedule sch
JOIN Dim_Teachers t ON sch.Teacher_SID = t.Teacher_SID
WHERE sch.Teacher_SID = 7
GROUP BY t.FirstName, t.LastName ;

-- 4. Сколько занятий у группы (Group_SID = 12) по предмету (Subject_SID = 5) за семестр (с 01.09.2025 по 31.12.2025)
SELECT COUNT(*) AS LessonCount
FROM Fact_Schedule
WHERE Group_SID = 12 
	AND Subject_SID = 5
	AND DateLesson BETWEEN '01.09.2025' AND '31.12.2025' ;

-- 5. Выбрать три группы на факультете (Faculty_SID = 8) с самой высокой успеваемостью 
--	  (самой высокой средней оценкой всех студентов группы)
SELECT gr.GroupName, AVG(grd.Grade) AS AvgGradeGroup 
FROM Fact_Grades grd
JOIN Dim_Students st ON grd.Student_SID = st.Student_SID
JOIN Dim_Groups gr ON st.Group_SID = gr.Group_SID
JOIN Dim_Faculties f ON gr.Faculty_SID = f.Faculty_SID
WHERE f.Faculty_SID = 8
GROUP BY gr.GroupName
ORDER BY AvgGradeGroup DESC
LIMIT 3 ;
