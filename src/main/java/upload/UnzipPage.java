package upload;

import java.io.File;

import net.lingala.zip4j.core.ZipFile;
import net.lingala.zip4j.exception.ZipException;

public class UnzipPage {
	private File file;
	public String newFileName;
    public void unzip(String zipFilePath, String destDir) {

    	try {
    		ZipFile zf= new ZipFile(zipFilePath);
    		file = zf.getFile();
    		newFileName= file.getName().replaceFirst("[.][^.]+$", "");
    		zf.extractAll(destDir+newFileName);
    	
    		
    	} catch (ZipException e) {
    	    e.printStackTrace();
    	}
        
    }
}

