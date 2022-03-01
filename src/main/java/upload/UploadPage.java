package upload;

import java.io.*;
import java.util.*;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;
import javax.servlet.http.HttpServletRequest;

public class UploadPage {
		public String filePath ;//application.getRealPath("/res/pages/");
	   // Verify the content type
		public String contentType ; //request.getContentType();
		public HttpServletRequest request;
		private File file ;
		private String fieldName = "";
		public String fileName="";
		private int maxFileSize = 5000 * 1024;
		private int maxMemSize = 5000 * 1024;
		
        public String value ;// fi.getString();
        boolean isInMemory;// = fi.isInMemory();
        long sizeInBytes ;//fi.getSize();
		
		public void uploadFile() {
			
			if((contentType.indexOf("multipart/form-data") >= 0)) {
				DiskFileItemFactory factory = new DiskFileItemFactory();
			      // maximum size that will be stored in memory
			      factory.setSizeThreshold(maxMemSize);
			      // Location to save data that is larger than maxMemSize.
			      factory.setRepository(new File("/tmp"));

			      // Create a new file upload handler
			      ServletFileUpload upload = new ServletFileUpload(factory);
			      
			      // maximum file size to be uploaded.
			      upload.setSizeMax( maxFileSize );
			      
			      try { 
			         // Parse the request to get file items.
			         List fileItems = upload.parseRequest(request);
			         if(fileItems.isEmpty()) {
			        	 System.out.println("is Empty");
			         } else {
			         // Process the uploaded file items
			         Iterator i = fileItems.iterator();
			         while ( i.hasNext () ) {
			        	 
			            FileItem fi = (FileItem)i.next();
			            if ( !fi.isFormField () ) {
			               // Get the uploaded file parameters
			               fieldName = fi.getFieldName();
			               fileName = fi.getName();
			               value = fi.getString();
			               isInMemory = fi.isInMemory();
			               sizeInBytes = fi.getSize();
			            
			               // Write the file
			               if( fileName.lastIndexOf("\\") >= 0 ) {
			                  file = new File( filePath + fileName.substring( fileName.lastIndexOf("\\"))) ;
			               } else {
			                  file = new File( filePath + fileName.substring( fileName.lastIndexOf("\\")+1)) ;
			               }
			               fi.write( file ) ;
			            }
			           
			         }
			         }
			      } catch(Exception ex) {
			         System.out.println(ex);
			      }
			}else {
				System.out.println("upload war nicht möglich. request fails");
			}
			
		}
		public String getInfo() {
			 String stat = (isInMemory== true) ? "erfolgreich" : "kein Erfolg :(";
			return "Statut: "+stat+",  File size: "+sizeInBytes/1000+ "kB";
		}

		public UploadPage(String filePath, String contentType, HttpServletRequest request) {
			this.filePath = filePath;
			this.contentType = contentType;
			this.request = request;
		}
		public boolean removeFile() {
			 File file = new File(filePath+"logo.png");
			 boolean removed= false;
			 if(file.exists()) {
			    if (file.delete()) { 
			      System.out.println("Deleted the file: " + file.getName());
			      removed = true;
			    } else {
			    	removed = false;
			      System.out.println("Failed to delete the file.");
			    } 
			 }else {
				 removed = true;
			 }
			 return removed;
		}
}
