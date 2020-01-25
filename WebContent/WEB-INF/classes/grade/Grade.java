package grade;

public class Grade{
	private String Name, password;
	private int lab1, lab2, mid;
	
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getLab1() {
		return lab1;
	}
	public void setLab1(int lab1) {
		this.lab1 = lab1;
	}
	public void setLab1(String lab1)
	{
		this.lab1=Integer.parseInt(lab1);
	}
	public int getLab2() {
		return lab2;
	}
	public void setLab2(int lab2) {
		this.lab2 = lab2;
	}
	public void setLab2(String lab2)
	{
		this.lab2=Integer.parseInt(lab2);
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public void setMid(String mid)
	{
		this.mid=Integer.parseInt(mid);
	}
	
}