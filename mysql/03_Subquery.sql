USE scott;

SELECT deptno
FROM emp
WHERE deptno = 20;


SELECT 
    dname
FROM
    dept
WHERE
    deptno = 
    (SELECT 
            deptno
        FROM
            emp
        WHERE
            empno = 1);
            
            
-- 매니저의 이름이 king인 사원의 사번, 이름, 부서번호, 업무 조회

SELECT 
    empno, ename, deptno, job
FROM
    emp
WHERE
    mgr = (SELECT 
            empno
        FROM
            emp
        WHERE
            ename = 'KING');

-- 20번 사원보다 급여를 많이 받는 사원의 이름, 급여를 조회
SELECT 
    ename, sal
FROM
    emp
WHERE
    sal > (SELECT sal
        FROM emp
        WHERE empno = 3);


-- 3. 20번 부서의 평균 급여보다 급여가 많은 사원의 사번, 이름, 업무, 급여 조회

SELECT 
    empno, ename, job, sal
FROM
    emp
WHERE
    sal > (SELECT 
            AVG(sal)
        FROM
            emp
        WHERE
            deptno = 20);

-- 20 부서의 평균 급여
SELECT AVG(sal)
FROM emp
WHERE deptno = 20;

-- 4. 업무가 'MILLER'와 같고, 사번이 2인 직원보다 급여가 많은 사원의 사번, 이름, 업무를 조회

SELECT empno, ename, job
FROM emp
WHERE job = (SELECT job
			 FROM emp
			 WHERE ename = 'MILLER')
AND sal > (SELECT sal 
		   FROM emp
		   WHERE empno = 2);
           

-- 다중행 IN , ANY, ALL

-- 1. 업무가 'MANAGER'인 직원들 급여 중 최소값보다 이상보다 많은 급여를 받는 사원의 이름, 급여, 업무

SELECT ename, sal, job
FROM emp
WHERE sal > ANY (SELECT sal
				FROM emp
				WHERE job = 'MANAGER');
                
-- 2. 업무가 'MANAGER'인 직원들 급여 중 최대값보다 작은 급여를 받는 사원의 이름, 급여, 업무

SELECT ename, sal, job
FROM emp
WHERE sal < ANY (SELECT sal
				FROM empCOMM
				WHERE job = 'MANAGER');

-- 3. 업무가 'MANAGER'인 모든 직원들 급여와 비교하여 더 많이 급여를 받는 사람의 이름, 급여, 업무 조회
SELECT ename, sal, job
FROM emp
WHERE sal > ALL(SELECT sal
               FROM emp
               WHERE job = 'MANAGER');
               
-- 4. 업무가 'MANAGER'인 모든 직원들 급여와 비교하여 더 적은 급여를 받는 사람의 이름, 급여, 업무 조회
SELECT ename, sal, job
FROM emp
WHERE sal < ALL(SELECT sal
               FROM emp
               WHERE job = 'MANAGER');
