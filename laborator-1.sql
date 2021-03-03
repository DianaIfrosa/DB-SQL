

--3) Sã se listeze structura tabelelor din schema HR (EMPLOYEES, DEPARTMENTS, JOBS, JOB_HISTORY, LOCATIONS, COUNTRIES, REGIONS), observând tipurile de date ale coloanelor. 

desc employees;
desc departments;
desc jobs;
desc job_history;
desc locations;
desc countries;
desc regions;

--4) Sã se listeze conþinutul tabelelor din schema consideratã, afiºând valorile tuturor câmpurilor. 

select * from employees;

--5) Sã se afiºeze codul angajatului, numele, codul job-ului, data angajarii. Ce fel de operaþie este aceasta (selecþie sau proiecþie)? 

select employee_id, last_name, job_id, hire_date
from employees; -- PROIECTIE

--6)Modifica?i cererea anterioarã astfel încât, la rulare, capetele coloanelor sã aibã numele cod, nume, cod job, data angajarii. 

select employee_id "cod", last_name "nume", job_id "cod job", hire_date "data angajarii" 
from employees; --proiectie

--7) Sã se listeze, cu ºi fãrã duplicate, codurile job-urilor din tabelul EMPLOYEES. 

select job_id
from employees;
select distinct job_id
from employees;

--8) Sã se afiºeze numele concatenat cu job_id-ul, separate prin virgula ?i spatiu. Eticheta?i coloana “Angajat si titlu”. 

select last_name || ', ' || job_id "Angajat si titlu"
from employees;

--9) Crea?i o cerere prin care sã se afi?eze toate datele din tabelul EMPLOYEES pe o singurã coloanã. Separaþi fiecare coloanã printr-o virgulã. Etichetati coloana ”Informatii complete”. 

select last_name || ', ' || job_id || ', ' || hire_date || ', ' || salary "Informatii complete"
from employees;

--10) Sã se listeze numele si salariul angajaþilor care câºtigã mai mult de 2850. 

select last_name, salary 
from employees
where salary>2850;

--11) Sã se creeze o cerere pentru a afiºa numele angajatului ºi codul departamentului pentru angajatul având codul 104. 

select last_name, department_id
from employees
where employee_id=104;

--12) Sã se afiºeze numele ºi salariul angajaþilor al cãror salariu nu se aflã în intervalul [1500, 2850]. 

select last_name, salary  
from employees
where salary not between 1500 and 2850;


--13) Sã se afiºeze numele, job-ul ºi data la care au început lucrul salariaþii angajaþi între 20 Februarie 1987 ºi 1 Mai 1989. Rezultatul va fi ordonat crescãtor dupã data de început. 

select sysdate from dual;

select last_name, job_id, hire_date 
from employees 
where hire_date between '20-02-1987' and '1-02-1989'
order by hire_date;

--14) Sã se afiºeze numele salariaþilor ºi codul departamentelor pentru toti angajaþii din departamentele 10, 30 ?i 50 în ordine alfabeticã a numelor. 

select last_name, department_id
from employees
where department_id=10 or  department_id=30 or department_id=50 
order by last_name;

--sau
select last_name, department_id
from employees
where department_id in (10,30,50)
order by last_name;

--15) Sã se listeze numele ºi salariile angaja?ilor care câºtigã mai mult decât 1500 ºi lucreazã în departamentul 10, 30 sau 50. Se vor eticheta coloanele drept Angajat si Salariu lunar. 

select last_name "Angajat", salary "Salariu lunar"
from employees 
where salary>1500 and department_id in (10,30,50);

--16) Care este data curentã? Afiºaþi diferite formate ale acesteia. 

select sysdate
from dual;

select sysdate 
from employees;

select to_char(sysdate, 'dd-mon-year hh24:mi:ss')
from dual;

--17) Sã se afi?eze numele ºi data angajãrii pentru fiecare salariat care a fost angajat în 1987. Se cer 2 soluþii: una în care se lucreazã cu formatul implicit al datei ºi alta prin care se formateazã data. 

select last_name, hire_date
from employees
where to_char(hire_date, 'yyyy')='1987';

select last_name, hire_date
from employees
where hire_date like ('%1987%');

--18) Sã se afi?eze numele, prenumele ?i data angajãrii persoanelor care au început activitatea într-o zi a lunii egalã cu cea a datei curente. 

select last_name, first_name, hire_date 
from employees 
where to_char(hire_date, 'dd')= to_char(sysdate, 'dd');

--19) Sã se afiºeze numele ºi job-ul pentru toþi angajaþii care nu au manager. 

select last_name, job_id
from employees
where manager_id is null;

--20) Sã se afi?eze numele, salariul ?i comisionul pentru toti salaria?ii care câ?tigã comision (se presupune cã aceasta înseamnã prezen?a unei valori nenule în coloana respectivã). Sã se sorteze datele în ordine descrescãtoare a salariilor ?i comisioanelor. 

select last_name, salary, commission_pct
from employees 
where commission_pct is not null
order by  salary desc,  commission_pct desc ;

--21) Eliminaþi clauza WHERE din cererea anterioarã. Unde sunt plasate valorile NULL în ordinea descrescãtoare? 

select last_name, salary, commission_pct
from employees 
order by  salary desc,  commission_pct desc;



--22) Sã se listeze numele tuturor angaja?ilor care au a treia literã din nume ‘A’. 

select last_name
from employees 
where last_name like '__a%';

--23) Sã se listeze numele tuturor angajatilor care au 2 litere ‘L’ in nume ºi lucreazã în departamentul 30 sau managerul lor este 102. 


select last_name
from employees
where (upper(last_name) like ('%L%L%') and department_id=30)  or manager_id=102;

--24) Sã se afiseze numele, job-ul si salariul pentru toti salariatii al caror job conþine ºirul “CLERK” sau “REP” ?i salariul nu este egal cu 1000, 2000 sau 3000. (operatorul NOT IN) 

select last_name, job_id, salary
from employees 
where (job_id like '%CLERK%' or   job_id like '%REP%') and salary not in (1000,2000,3000);


--25) Sã se afi?eze numele departamentelor care nu au manager. 

select distinct department_name
from departments
where manager_id is null;














