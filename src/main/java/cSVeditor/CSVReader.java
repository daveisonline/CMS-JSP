package cSVeditor;


import java.io.*;
import java.util.Scanner;

public class CSVReader{
	public String [][] arr;
	public int lineNum;
	
	
    public void readerCSV() throws IOException {
        String line = "";
        final String delimiter = ",";
        try
        {
            String filePath = "menuCSV.csv";
            FileReader fileReader = new FileReader(filePath);
            BufferedReader reader = new BufferedReader(fileReader);
            int i=0;
            arr = new String[reader.readLine().length()][3];
            while ((line = reader.readLine()) != null)   //loops through every line until null found
            {
            	if(line.split(delimiter)!= null) {
            		String token[] = line.split(delimiter); // separate every token by comma
            		for(int j=0; j<3;j++) {
            			arr[i][j]= token[j];
            		}
                	
                // System.out.println(token[0] + " | "+ token[1]+ " | "+ token[2]+ " | "+ token[3]);
                   //this.data+=token[0] + " | "+ token[1]+ " | "+ token[2]+ "<br>";
                   i++;
            	}else {
            		System.out.println("arra null");
            	}
            	
            }
            
            reader.close();
            lineNum =i;
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
    }
    
    
	public void createFile() {
		String mass="";
		    try {
		      File myObj = new File("menuCSV.csv");
		      if (myObj.createNewFile()) {
		       // System.out.println("File created: " + myObj.getName());
		    	  mass += "File created: " + myObj.getName();
		      } else {
		        //System.out.println("File already exists.");
		    	  mass +="File already exists";
		      }
		    } catch (IOException e) {
		      //System.out.println("An error occurred.");
		    	mass +="An error occurred.";
		      e.printStackTrace();
		    }
		    System.out.println(mass);
	}
    
}
