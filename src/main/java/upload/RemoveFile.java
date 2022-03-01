package upload;

import java.io.File;
import java.io.IOException;
import java.nio.file.DirectoryNotEmptyException;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Path;

public class RemoveFile {
	public boolean remove (String path) throws IOException
    {	File file = new File(path);
	 boolean removed= false;
	 if(file.exists()) {
	    if (file.delete()) {
	      removed = true;
	    } else {
	    	removed = false;
	    	String message = file.exists() ? "is in use by another app" : "does not exist";
            throw new IOException("Cannot delete file, because file " + message + ".");
	    } 
	 }else {
		 removed = true;
	 }
	 return removed;
    }
	public void deleteDir(File file) {
	    File[] contents = file.listFiles();
	    if (contents != null) {
	        for (File f : contents) {
	            if (! Files.isSymbolicLink(f.toPath())) {
	                deleteDir(f);
	            }
	        }
	    }
	    file.delete();
	}
	
}
