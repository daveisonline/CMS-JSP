package upload;

import java.io.File;

public class MakeDir {
	
	public boolean mkdir(String path){
		File theDir = new File(path);
		if (!theDir.exists()){
		    if(theDir.mkdirs()) {
		    	return true;
		    }else {
		    	return false;
		    }
		}
		return true;
	}
	
}
