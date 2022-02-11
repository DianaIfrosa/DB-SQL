--3) Să se listeze structura tabelelor din schema HR (EMPLOYEES, DEPARTMENTS, JOBS, JOB_HISTORY, LOCATIONS, COUNTRIES, REGIONS), observând tipurile de date ale coloanelor. 

desc employees;
desc departments;
desc jobs;
desc job_history;
desc locations;
desc countries;
desc regions;

--4) Să se listeze conţinutul tabelelor din schema considerată, afişând valorile tuturor câmpurilor. 

select * from employees;

--5) Să se afişeze codul angajatului, numele, codul job-ului, data angajarii. Ce fel de operaţie este aceasta (selecţie sau proiecţie)? 

select employee_id, last_name, job_id, hire_date
from employees; -- PROIECTIE

--6)Modificați cererea anterioară astfel încât, la rulare, capetele coloanelor să aibă numele cod, nume, cod job, data angajarii. 

select employee_id "cod", last_name "nume", job_id "cod job", hire_date "data angajarii" 
from employees; --proiectie

--7) Să se listeze, cu şi fără duplicate, codurile job-urilor din tabelul EMPLOYEES. 

select job_id
from employees;
select distinct job_id
from employees;

--8) Să se afişeze numele concatenat cu job_id-ul, separate prin virgula și spatiu. Etichetați coloana “Angajat si titlu”. 

select last_name || ', ' || job_id "Angajat si titlu"
from employees;

--9) Creați o cerere prin care să se afișeze toate datele din tabelul EMPLOYEES pe o singură coloană. Separaţi fiecare coloană printr-o virgulă. Etichetați coloana ”Informatii complete”. 

select last_name || ', ' || job_id || ', ' || hire_date || ', ' || salary "Informatii complete"
from employees;

--10) Să se listeze numele si salariul angajaţilor care câştigă mai mult de 2850. 

select last_name, salary 
from employees
where salary>2850;

--11) Să se creeze o cerere pentru a afişa numele angajatului şi codul departamentului pentru angajatul având codul 104. 

select last_name, department_id
from employees
where employee_id=104;

--12) Să se afişeze numele şi salariul angajaţilor al căror salariu nu se află în intervalul [1500, 2850]. 

select last_name, salary  
from employees
where salary not between 1500 and 2850;

--13) Să se afişeze numele, job-ul şi data la care au început lucrul salariaţii angajaţi între 20 Februarie 1987 şi 1 Mai 1989. Rezultatul va fi ordonat crescător după data de început. 

select sysdate from dual;

select last_name, job_id, hire_date 
from employees 
where hire_date between '20-02-1987' and '1-02-1989'
order by hire_date;

--14) Să se afişeze numele salariaţilor şi codul departamentelor pentru toti angajaţii din departamentele 10, 30 îi 50 în ordine alfabetică a numelor. 

select last_name, department_id
from employees
where department_id=10 or  department_id=30 or department_id=50 
order by last_name;

--sau
select last_name, department_id
from employees
where department_id in (10,30,50)
order by last_name;

--15) Să se listeze numele şi salariile angajaților care câştigă mai mult decât 1500 şi lucrează în departamentul 10, 30 sau 50. Se vor eticheta coloanele drept Angajat si Salariu lunar. 

select last_name "Angajat", salary "Salariu lunar"
from employees 
where salary>1500 and department_id in (10,30,50);

--16) Care este data curentă? Afişaţi diferite formate ale acesteia. 

select sysdate
from dual;

select sysdate 
from employees;

select to_char(sysdate, 'dd-mon-year hh24:mi:ss')
from dual;

--17) Să se afișeze numele şi data angajării pentru fiecare salariat care a fost angajat în 1987. Se cer 2 soluţii: una în care se lucrează cu formatul implicit al datei şi alta prin care se formatează data. 

select last_name, hire_date
from employees
where to_char(hire_date, 'yyyy')='1987';

select last_name, hire_date
from employees
where hire_date like ('%1987%');

--18) Să se afișeze numele, prenumele și data angajării persoanelor care au început activitatea într-o zi a lunii egală cu cea a datei curente. 

select last_name, first_name, hire_date 
from employees 
where to_char(hire_date, 'dd')= to_char(sysdate, 'dd');

--19) Să se afişeze numele şi job-ul pentru toţi angajaţii care nu au manager. 

select last_name, job_id
from employees
where manager_id is null;

--20) Să se afișeze numele, salariul și comisionul pentru toti salariații care câștigă comision (se presupune că aceasta înseamnă prezența unei valori nenule în coloana respectivă). Să se sorteze datele în ordine descrescătoare a salariilor și comisioanelor. 

select last_name, salary, commission_pct
from employees 
where commission_pct is not null
order by  salary desc,  commission_pct desc ;

--21) Eliminaţi clauza WHERE din cererea anterioară. Unde sunt plasate valorile NULL în ordinea descrescătoare? 

select last_name, salary, commission_pct
from employees 
order by  salary desc,  commission_pct desc;

--22) Să se listeze numele tuturor angajaților care au a treia literă din nume ‘A’. 

select last_name
from employees 
where last_name like '__a%';

--23) Să se listeze numele tuturor angajaților care au 2 litere ‘L’ in nume şi lucrează în departamentul 30 sau managerul lor este 102. 

select last_name
from employees
where (upper(last_name) like ('%L%L%') and department_id=30)  or manager_id=102;

--24) Să se afiseze numele, job-ul si salariul pentru toti salariatii al caror job conţine şirul “CLERK” sau “REP” și salariul nu este egal cu 1000, 2000 sau 3000. (operatorul NOT IN) 

select last_name, job_id, salary
from employees 
where (job_id like '%CLERK%' or   job_id like '%REP%') and salary not in (1000,2000,3000);

--25) Să se afișeze numele departamentelor care nu au manager. 

select distinct department_name
from departments
where manager_id is null;
