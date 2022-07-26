--Questão 1

SELECT users.id AS id, users.name AS name, cities.name AS city FROM users
JOIN cities
ON users."cityId"=cities.id
WHERE cities."name"= 'Rio de Janeiro';

--Questão 2

SELECT testimonials.id AS id,
u1.name AS writer,
u2.name AS recipient,
message
FROM testimonials
JOIN users u1
ON testimonials."writerId"=u1.id
JOIN users u2
ON  testimonials."recipientId"=u2.id;

--Questão 3

SELECT users.id AS id,
users.name AS name,
courses.name AS course,
schools.name AS school,
"endDate"
FROM educations
JOIN users
ON users.id= educations."userId"
JOIN courses
ON courses.id= educations."courseId"
JOIN schools
ON schools.id= educations."schoolId"
WHERE users.id = 30
AND educations.status='finished'; 

--Questão 4

SELECT users.id AS id,
users.name AS name,
roles.name AS role,
companies.name AS company,
"startDate"
FROM experiences
JOIN users
ON users.id= experiences."userId"
JOIN roles
ON roles.id= experiences."roleId"
JOIN companies
ON companies.id= experiences."companyId"
WHERE users.id = 50
AND experiences."endDate" IS null;

-- Desafio Bônus

SELECT schools.id AS id,
schools.name AS school,
courses.name AS course,
companies.name AS company,
roles.name AS role
FROM educations
JOIN courses
ON courses.id= educations."courseId"
JOIN schools
ON schools.id= educations."schoolId"
JOIN users
ON users.id= educations."userId"
JOIN applicants
ON applicants."userId"= users.id
JOIN jobs
ON jobs.id= applicants."jobId" 
JOIN companies
ON jobs."companyId"= companies.id
JOIN roles
ON roles.id= jobs."roleId"
WHERE companies.id = 10
AND jobs.active= true
AND roles.name = 'Software Engineer';