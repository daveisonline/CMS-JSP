package cSVeditor;

import java.io.File;
import java.io.IOException;
import cSVeditor.CSVReader;
import cSVeditor.CSVWriter;

public class CSVLineRemover {
	public String [][] arrInput;
	public String [][] arrOut;
	public int lineNum=0;
	
	public void removeLine( int ltr) throws IOException {
		arrOut= new String[20][3];
		arrInput =new String[20][3];
		CSVReader cr= new CSVReader();
		cr.readerCSV();
		arrInput=cr.arr;
		int j=0;
		for(int i = 0;i<cr.lineNum;i++) {
			
			if(i!= ltr) {
			
				arrOut[j]=arrInput[i];
				j++;
			}
		}
		CSVWriter cw = new CSVWriter();
		cw.write(arrOut);
	}

}
