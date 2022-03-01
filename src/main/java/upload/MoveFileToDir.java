package upload;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class MoveFileToDir {

    private File file;	
public boolean moveFile(String sourcePath, String targetPath) {

    boolean fileMoved = true;
    try {
    	file= new File(sourcePath);
		boolean success = file.renameTo(new File(targetPath));
        //Files.move(Paths.get(sourcePath), Paths.get(targetPath), StandardCopyOption.REPLACE_EXISTING);

    } catch (Exception e) {

        fileMoved = false;
        e.printStackTrace();
    }

    return fileMoved;
}
private boolean moveFileToDirectory(File sourceFile, String targetPath) {
    File tDir = new File(targetPath);
    if (tDir.exists()) {
        String newFilePath = targetPath+File.separator+sourceFile.getName();
        File movedFile = new File(newFilePath);
        if (movedFile.exists())
            movedFile.delete();
        return sourceFile.renameTo(new File(newFilePath));
    } else {
    	return false;
    }       
}

}
