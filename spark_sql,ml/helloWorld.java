package hello_world;

public class hello_world{
	public static void main(String[] args) {
		int number = 100;
	}
	// 方法的递归调用 ；
	public static int sum(int number){
		if (number == 1){
			return 1 ;
		}else{
			return number + sum( number-1) ;
		}
	}
	// 方法按照需要传递参数的个数 ；
	public static int sum(int... args){
		for(int x = 0 ;x<args.length;x++){
			System.out.println(args[x]+"\t") ;
		}
	}
}
interface demo {
	public String name ;
	public void toDo() ;
	}
class bigData implements demo {
	public void toDo(){
		System.out.println("Life is short ,you need Spark !")
	}
}