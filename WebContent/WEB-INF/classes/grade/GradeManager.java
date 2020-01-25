package grade;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class GradeManager {

	public String[][] dat=new String[100][5];
	public int row;
	public double[] avg=new double[3];
	
	public GradeManager()
	{
		readCSV();
		getAverage();
	}
	
	private void getAverage()
	{
		int[] sum=new int[3];
		sum[0]=sum[1]=sum[2]=0;
		for(int i=1; i<row; i++)
		{
			for(int j=0; j<3; j++)
				sum[j]+=Integer.parseInt(dat[i][j+2]);
		}
		for(int i=0; i<3; i++)
			avg[i]=sum[i]/(row-1);
	}

	private int getRow(String name)
	{
		for(int i=0; i<row; i++)
		{
			if(dat[i][0].equals(name))
				return i;
		}
		return -1;
	}
	
	public boolean updateUser(Grade user)
	{
		int num=getRow(user.getName());
		
		if(num!=-1)
		{
			dat[num][2]=String.valueOf(user.getLab1());
			dat[num][3]=String.valueOf(user.getLab2());
			dat[num][4]=String.valueOf(user.getMid());
			
			writeCSV();
		}
		
		return false;
	}
	
	private void writeCSV()
	{
		int i=0;
		
		try {
			BufferedWriter fw= new BufferedWriter(new FileWriter("\\data\\home\\201414290\\webapps\\grade\\user.csv"));
			for(i=0; i<row; i++)
			{
				for(int j=0; j<5; j++)
				{
					fw.write(dat[i][j]+",");
				}
				fw.newLine();
			}
			
			fw.flush();
			fw.close();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public boolean userCheck(Grade user)
	{
		int num=getRow(user.getName());
		
		if(num!=-1)
		{
			if(dat[num][1].equals(user.getPassword()))
			{
				user.setLab1(Integer.parseInt(dat[num][2]));
				user.setLab2(Integer.parseInt(dat[num][3]));
				user.setMid(Integer.parseInt(dat[num][4]));
				return true;
			}
		}
		
		return false;
	}
	
	public void readCSV()
	{
		try {
			File csv=new File("\\data\\home\\201414290\\webapps\\grade\\user.csv");
			BufferedReader br=new BufferedReader(new FileReader(csv));
			String line="";
			int i;
			row=0;
			
			while ((line = br.readLine()) != null) {
                
                String[] token = line.split(",", -1);
                for(i=0;i<5;i++) {
                	dat[row][i] = token[i];
                }
                row++;
            }
            br.close();
 
        } 
        catch (FileNotFoundException e) {
            e.printStackTrace();
        } 
        catch (IOException e) {
            e.printStackTrace();
        }
	}
}
