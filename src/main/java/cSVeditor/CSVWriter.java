package cSVeditor;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;

public class CSVWriter {
	public String [][] arr;
	
	
	public String [][] arrInput;
	public String [][] arrOut;
	public int lineNum=0;
	
	public void removeLine( int ltr) throws IOException {
	}
	
	public void write(String[][] data) {
		try (PrintWriter writer = new PrintWriter(new File("menuCSV.csv"))) {
			
            StringBuilder sb = new StringBuilder();
            for(int i =0;i<data.length;i++){
            	sb.append(data[i][0]);
                sb.append(',');
                sb.append(data[i][1]);
                sb.append(',');
                sb.append(data[i][2]);
                sb.append('\n');
            }
			writer.write(sb.toString());
            writer.close();
            System.out.println("done!");

        } catch (FileNotFoundException e) {
            System.out.println(e.getMessage());
        }
	}
	
	
	
	public void writeLine(String link, String path1, String path2, int lta) throws IOException{
		arrOut= new String[20][3];
		arrInput =new String[20][3];
		CSVReader cr= new CSVReader();
		cr.readerCSV();
		arrInput=cr.arr;
		int j=0;
		for(int i = 0;i<cr.lineNum;i++) {
			
			if(i!= lta) {
			
				arrOut[i]=arrInput[j];
				j++;
			}else{
				arrOut[i][0]=link;
				arrOut[i][1]=path1;
				arrOut[i][2]=path2;
			}
		}
		CSVWriter cw = new CSVWriter();
		cw.write(arrOut);
		
		
	}
}
