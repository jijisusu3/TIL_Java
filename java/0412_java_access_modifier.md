### 0412 access modifier / 패키지

----



#### 접근제어와 getter,  setter

**1. setter를 통해 값을 검증할 수 있다. **

**2. getter만 작성하면, 읽기 전용이 된다. setter만 작성하면 쓰기 전용이 됨**

- 접근 권한 세분화 가능

```java
// .패키지.패키지1

package 패키지;

// 스캐너 클래스를 자동완성으로 작성하면 해당 클래스가 import된다.
import java.util.Scanner; // 풀패키지명으로 임포트
import java.util.*; // java.util안에 있는 모든 클래스가 import됨 

public class 패키지1 {
	public static void main(String[] args) {
		Scanner s;
		Arrays a;
		
		//import를 안하고 쓰거나, 동일한 이름의 클래스가 내가 사용하는 범주와 겹친다면
		// 풀패키지명으로 쓰면 된다.
	}
	
}

```



```java
// .패키지.Car
package 패키지;

public class Car{
	String color;
	private int speed; // 속도는 최소 0이고, 최대 250을 넘을 수 없다.
	void speedUp() {
		if(speed + 10 < 250)
			speed += 10;
	}
	public int getSpeed() {  //getter : 접근자 -> private인 speed변수에 밖에서 접근 못하니 대신 가져다줌
		return speed;
	}
	private void setSpeed(int speed) { // setter : 설정자 -> 변수의 값을 검증할 수 있음
		if (speed >= 0 && speed < 250)
			this.speed = speed;

	}
}
```



```java
// .패키지.CarTest

package 패키지;

 
public class CarTest {
	public static void main(String[] args) {
		
		Car c = new Car();
		c.speedUp();
		// c.speed = 300; // ??!!!? 이렇게 넣어버리면 어떻게 함?
		//private로 선언하면 외부에서 접근이 불가능해짐
		System.out.println("자동차의 속도는?" + c.getSpeed() );  
		
		c.setSpeed(100);
		
	}
}
```



