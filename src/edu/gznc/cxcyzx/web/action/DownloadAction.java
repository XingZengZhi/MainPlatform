package edu.gznc.cxcyzx.web.action;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class DownloadAction extends ActionSupport {
	//下载路径
	private String inputPath;
	//下载的文件名
	private String filename;

	public void setInputPath(String inputPath) {
		this.inputPath = inputPath;
	}
	
	public String getInputPath(){
		return inputPath;
	}
	
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	public InputStream getInputStream() throws IOException{
		//获得真实的下载路径
		String path = ServletActionContext.getServletContext().getRealPath(File.separatorChar + "upload");
		//获得下载文件的全路径
		String filepath = path + File.separatorChar + filename;
		File file = new File(filepath);
		return FileUtils.openInputStream(file);
		//return ServletActionContext.getServletContext().getResourceAsStream(inputPath);
	}
	
	public String getDownloadFileName(){
		String newFileName = "";
		try {
			//解决文件名是中文的问题
			newFileName = URLEncoder.encode(filename, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return newFileName;
	}
	
	public String download(){
		return "success";
	}

}
