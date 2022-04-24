### 0419 Collection Framework

--------





### 1. List

#### (1) ArrayList

```java
public class ListTest {
	public static void main(String[] args) {
		ArrayList<String> list = new ArrayList<>();
		list.add("Lee");
		list.add("Kim");
		list.add("Park");
		list.add(0, "끼어들기");
		
		
		//해당 객체의 equals 메소드의 결과에 따라서 같은지 아닌지 구분.
		list.remove("Hong");
		
		System.out.println(list);
	}
}
```



#### (2) LinkedList

```java
public class ListTest {
	public static void main(String[] args) {
		LinkedList<String> list = new LinkedList<>();
		list.add("Lee");
		list.add("Kim");
		list.add("Park");
		list.add(0, "끼어들기");
		
		
		//해당 객체의 equals 메소드의 결과에 따라서 같은지 아닌지 구분.
		list.remove("Hong");
		
		System.out.println(list);
	}
}
```



```java
import java.util.ArrayList;
import java.util.List;

public class ListTest {
	public static void main(String[] args) {
		List<String> list = new ArrayList<>();
		
		list.add("Lee");
		list.add("Hong");
		list.add("Hong");
		list.add(0, "Hong");
		
		
		//홍 을 다 지우고 싶은데, 다 못지움.
		// remove가 일어나면서 앞으로 밀착되어, size가 달라지기 때문.
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).equals("Hong"))
				list.remove(i);
		}
		
		// 뒤에서부터 하면 괜찮음. 권장하지는 않음.
		for (int i = list.size() - 1; i >= 0; i--) {
			if (list.get(i).equals("Hong"))
				list.remove(i);
		}
		
		// 반복문에서 삭제할 인덱스만 기억해놨다가, 반복문 종료 후 한번에 삭제
		
		System.out.println(list);
	}
}

```





### 2. Set

- 중복된 값을 삽입할 수 없다. 
- set은 특정한 순서를 가지고 있지 않다.
- **Hashset**, Linkedset, Treeset

```java
import java.util.HashSet;
import java.util.Set;

public class SetTest {
	public static void main(String[] args) {
		Set<String> set = new HashSet<>();
		set.add("Hong");
		set.add("Hong");
		set.add("Hong");
		set.add("Hong");
		set.add("Hong");
		System.out.println(set);
	}
}
```





### 3. Map

```java
import java.util.HashMap;
import java.util.Map;

public class MapTest {
	public static void main(String[] args) {
		Map<String, String> map = new HashMap<>();
		map.put("jisu", "010-3326-6150");
		map.put("Kim", "010-3326-6150");
		map.put("Kim", "010-3326-4544");
		
		
		// list가 index로 데이터를 식별한다면, 
		// map은 key로 데이터를 식별한다.
		// 같은 key는 여러 개 있을 수 없으며, 키 값이 같다면 뒤에 들어온 값이 남는다.
		// value는 같을 수 있음.
		System.out.println(map);
		System.out.println(map.get("jisu"));
	}
}
```





### 4. 정렬

- 요소를 특정 기준에 대한 내림차순 또는 오름차순으로 배치하는 것.
- 순서를 가지는 Collection들만 정렬 가능.
  - List 계열
  - Set에서는 SortedSet의 자식 객체
  - Map에서는 Key 기준



```java
import java.util.Arrays;

class People implements Comparable {

    private String name;
    private int age;
    
    public People(String name, int age){
        this.name = name;
        this.age= age;
    }

    public String print(){
        return name+"("+age+")";
    }

    @Override
    public int compareTo(People people) {
         // TODO Auto-generated method stub
         if (this.age < people.age) {
             return -1;
         } else if (this.age == people.age) {
             return 0;
         } else {
             return 1;
         }
     }
}

public class Sort{
     public static void main(String[] args)  {
         People[] arr = { new People("상현", 20)
            , new People("철수", 14)
            , new People("경완", 31)
            , new People("대호", 40)
            , new People("지운", 24) 
        };
		
        Arrays.sort(arr); //오름차순 정렬
		
        for (People i : arr) { //오름차순 출력
            System.out.print("["+i.print()+"]");
        }
		
        Arrays.sort(arr,Collections.reverseOrder()); //내림차순 정렬
        System.out.println();
		
        for (People i : arr) { //내림차순 출력
            System.out.print("["+i.print()+"]");
        }
    }
}
```

