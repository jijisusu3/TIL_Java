USE scott;

SELECT empno, ename, job, emp.deptno
FROM emp, dept
WHERE emp.deptno = dept.deptno;