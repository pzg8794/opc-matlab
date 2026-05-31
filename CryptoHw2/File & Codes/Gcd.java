import java.math.BigInteger;
import java.util.LinkedList;


public class Gcd {

	private Integer gcd;
	private static float p;
	private static float q;
	private static LinkedList<Character> letters;
	private static LinkedList<Integer> output;

	public Gcd(Integer a, Integer b){
		setGcd(gcd(a, b));
	}

	public static void main(String[] args){

		int n= 8881;
		int e = 13;
		int[] m = {4461, 794, 2015, 2015, 3603};

		int phi = phi(n);
		
		fillLetters();
		
		System.out.println("For n = " + n + "" +
				"\nMeassure of Integers that Share the Factor of 1: " + phi);

		System.out.println("N = PQ = "+ pq(n, phi));
		int p = (int)getP();
		int q = (int)getQ();
		int d = findD(phi, e);

		System.out.println("P = "+ p);
		System.out.println("Q = "+ q);
		System.out.println("d = "+ d);
		
		int i = -1;
		System.out.println("Encrypted Message is: ");
		while( ++i != m.length)
			System.out.println("C =: "+m[i]);

		encrypt(e, n);
		i = -1;
		while( ++i !=  output.size())
			System.out.println("Letter = " + letters.get(i) + " M = "+ (i+1) + " C = " + output.get(i));
	}


	private static LinkedList<Character>fillLetters() {
		letters = new LinkedList<Character>();
		for( int i=0; i< 26; i++){
			
			switch(i){
			case 0:
				letters.add('A');break;
			case 1:
				letters.add('B');break;
			case 2:
				letters.add('C');break;
			case 3:
				letters.add('D');break;
			case 4:
				letters.add('E');break;
			case 5:
				letters.add('F');break;
			case 6:
				letters.add('G');break;
			case 7:
				letters.add('H');break;
			case 8:
				letters.add('I');break;
			case 9:
				letters.add('J');break;
			case 10:
				letters.add('K');break;
			case 11:
				letters.add('L');break;
			case 12:
				letters.add('M');break;
			case 13:
				letters.add('N');break;
			case 14:
				letters.add('O');break;
			case 15:
				letters.add('P');break;
			case 16:
				letters.add('Q');break;
			case 17:
				letters.add('R');break;
			case 18:
				letters.add('S');break;
			case 19:
				letters.add('T');break;
			case 20:
				letters.add('U');break;
			case 21:
				letters.add('V');break;
			case 22:
				letters.add('W');break;
			case 23:
				letters.add('X');break;
			case 24:
				letters.add('Y');break;
			case 25:
				letters.add('Z');break;
			default:
					break;
			}
		}
		return letters;	
	}


	public static int encrypt(int e, int n){

		// 13 binary = 1101
		Integer c = 0;
		
		output = new LinkedList<Integer>();
		output.add(1);
		for( int i=2; i<27; i++){
		
			int temp = 0;
			temp = (int) Math.pow(i, 2)%n;
			//	System.out.println(temp1);

			temp = temp*i;
			temp = (int) Math.pow(temp, 2)%n;
			//	System.out.println(temp2);
			
			temp = (int) Math.pow(temp, 2)%n;
			//	System.out.println(temp3);
			
			temp = temp*i;
//			System.out.println(temp%n);
			
			output.add(temp%n);
		}
		return c;
	}


	public static int phi(int n){
		int phi = 0;
		int a = 1;
		while( a != n){

			int tmp = gcd(a, n);

			if( tmp == 1)
				phi++;

			a++;
		}
		return phi;
	}

	public static int inverse(int alp){
		int x=0;
		alp %= 26;
		while(true){

			if((alp*x)%26 == 1%26){
				return x;
			}
			x++;
		}
	}

	public static int findD(int phN, int e){
		int d = 0;
		// d = 5349

		while( d*e%phN != (1%phN)){
			d++;
		}

		return d;
	}
	public static Integer mod(Integer a, Integer b){
		Integer temp = 0;

		temp = a/b;
		temp *= b;
		temp = a - temp;

		return temp;
	}

	private static  float getP() {
		return p;
	}

	private static float getQ() {
		return q;
	}

	public static int pq(Integer n, Integer phn){

		int temp = ( n - phn + 1);
		//	System.out.println(temp);	
		//	temp = (int) Math.pow((Math.pow(n - phn + 1, 2) - 4*n), 0.5);
		//	System.out.println(temp);

		int p1= (int)((temp + Math.pow((Math.pow((n - phn + 1), 2) 
				- 4*n), 0.5))/2);
		p = p1;

		int q1= (int)((temp - Math.pow((Math.pow((n - phn + 1), 2)
				- 4*n), 0.5))/2);
		q = q1;

		return p1*q1;
	}


	public static int gcd(int a, int b){

		//	System.out.println(" number is : " + a);
		while( a != b){

			if( a > b)
				a -= b;
			else
				b -= a;

		}
		return a;

	}

	public Integer getGcd() {
		return gcd;
	}

	public void setGcd(Integer gcd) {
		this.gcd = gcd;
	}
}
