-- 1. Créez la base de données SomeCompany à l’aide d’une requête, ajoutez une condition sur l'existence de SomeCompany.

DROP DATABASE SomeCompany;
CREATE DATABASE IF NOT EXISTS SomeCompany;
SHOW databases;
USE SomeCompany;

-- 2. Créez la table Employees.

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    birthdate DATE,
    position VARCHAR(255),
    department_id INT
);


-- 3. Créez la table Departments.

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255),
    department_head INT,
    location VARCHAR(255),
    FOREIGN KEY (department_head) REFERENCES Employees(employee_id)
);


-- 4. Insérez 6 à 9 nouveaux employés dans la table Employees

INSERT INTO Employees (employee_id, first_name, last_name, birthdate, position, department_id)
VALUES
    (1, 'John', 'Doe', '1990-05-15', 'Software Engineer', 1),
    (2, 'Jane', 'Smith', '1985-08-20', 'Project Manager', 2),
    (3, 'Mike', 'Johnson', '1992-03-10', 'Data Analyst', 1),
    (4, 'Emily', 'Brown', '1988-12-03', 'Data Scientist', 1),
    (5, 'Alex', 'Williams', '1995-06-28', 'Software Developer', 1),
    (6, 'Sarah', 'Miller', '1987-09-18', 'HR Specialist', 3),
    (7, 'Ethan', 'Clark', '1991-02-14', 'Database Administrator', 1),
    (8, 'Olivia', 'Garcia', '1984-07-22', 'Marketing Manager', 2),
    (9, 'Emilia', 'Clark', '1986-01-12', 'HR Manager', 3);



INSERT INTO Departments (department_id, department_name, department_head, location)
VALUES
    (1, 'IT', 1, 'Headquarters'),
    (2, 'Project Management', 2, 'Branch Office West'),
    (3, 'Human Resources', 6, 'Branch Office East');


ALTER TABLE Employees
ADD CONSTRAINT FK_Department_Employee
FOREIGN KEY (department_id) REFERENCES Departments(department_id);


-- 5. Récupérez le nom et le poste de tous les employés.
SELECT last_name, position FROM Employees;


-- 6. Mettez à jour le poste d’un employé dans la table Employees
UPDATE Employees SET position = 'Web Developer' WHERE employee_id = 1;


-- 7. Supprimez un employé de la table Employees.
DELETE FROM Employees WHERE employee_id = 9;


-- 8. Affichez le nom, le département et le bureau de chaque employé.
SELECT e.last_name, d.department_name, d.location FROM Employees e JOIN Departments d ON (e.department_id = d.department_id);


-- 9. Affichez, à l’aide d’un filtre, les membres de l’équipe IT, puis le management, puis les ressources humaines.
SELECT e.last_name, d.department_name FROM Employees e JOIN Departments d ON (e.department_id = d.department_id) WHERE d.department_name = 'IT';
SELECT e.last_name, d.department_name FROM Employees e JOIN Departments d ON (e.department_id = d.department_id) WHERE d.department_name = 'Project Management';
SELECT e.last_name, d.department_name FROM Employees e JOIN Departments d ON (e.department_id = d.department_id) WHERE d.department_name = 'Human Resources';


-- 10. Affichez les départements de SomeCompany dans l’ordre alphabétique, avec les managers respectifs de chaque département.
SELECT d.department_name, e.first_name, e.last_name FROM Employees e JOIN Departments d ON (e.employee_id = d.department_head) ORDER BY d.department_name ASC;

-- 11. Ajoutez un nouveau département à la table Department (Marketing peut-être?), ajoutez ou mettez à jour les employés de ce nouveau département.

INSERT INTO Departments (department_id, department_name, department_head, location) VALUES (4, 'Marketing', 7, 'Branch Office South');
INSERT INTO Employees (employee_id, first_name, last_name, birthdate, position, department_id) VALUES (10, 'Julian', 'Johnson', '1999-04-04', 'Graphic Designer', 4);
UPDATE Employees SET department_id = 4 WHERE employee_id = 8;


-- 12. Créez une nouvelle table Project : project_id (INT, PK), project_name (VARCHAR), start_date (DATE), end_date (DATE), departement_id (INT, FK). Ajoutez des observations à cette nouvelle table, analysez la productivité des départements en IT et du nouveau département créé précédemment.


CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(255),
    start_date DATE,
    end_date DATE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);



INSERT INTO Projects (project_id, project_name, start_date, end_date, department_id) 
VALUES 
(1, 'Chatbot', '2021-05-11', '2024-12-31', 1),
(2, 'TeamSynergy', '2019-08-01', '2022-12-31', 2),
(3, 'RecruitRadar', '2021-01-22', '2024-12-31', 3),
(4, 'MarketMinds: Mastering Minds in Marketing', '2021-01-04', '2024-12-31', 4),
(5, 'MarketMomentum', '2021-01-03', '2024-12-27', 4),
(6, 'MarketMarvel: Marveling at Marketing Success', '2021-01-16', '2023-12-31', 4),
(7, 'QuickCode', '2021-11-07', '2023-08-24', 1),
(8, 'AgileLite', '2019-11-08', '2023-12-31', 1),
(9, 'RecruitRise', '2022-09-15', '2023-12-24', 3),
(10, 'TalentCraftsman', '2018-12-18', '2023-12-31', 3),
(11, 'DigitalDynamo', '2017-11-07', '2023-12-31', 4),
(12, 'Data Analysis', '2019-04-28', '2023-12-25', 1),
(13, 'TaskNavigator', '2019-05-15', '2021-12-31', 2),
(14, 'ProjectPilot', '2020-06-22', '2024-10-03', 2),
(15, 'EasySync', '2019-07-18', '2024-11-04', 1),
(16, 'HRInnovate', '2021-08-14', '2023-12-31', 3),
(17, 'Virtual Reality', '2023-01-12', '2024-12-30', 1),
(18, 'DigitalDynasty 1', '2023-12-01', '2024-12-31', 4),
(19, 'DigitalDynasty 2', '2021-10-10', '2022-12-31', 4),
(20, 'Ripples in the Market', '2021-11-04', '2024-12-31', 4),
(21, 'TaskTracker', '2021-11-01', '2023-12-31', 2),
(22, 'iTech', '2021-11-01', '2022-12-31', 1),
(23, 'CodeLite', '2022-04-11', '2022-12-20', 1);

SELECT
    d.department_name,
    COUNT(p.project_id) AS number_of_projects,
    SUM(DATEDIFF(p.end_date, p.start_date) + 1) AS total_project_duration_days
FROM
    Departments d
JOIN
    Projects p ON (d.department_id = p.department_id)
WHERE
    d.department_name IN ('IT', 'Marketing')
GROUP BY
    d.department_name;

