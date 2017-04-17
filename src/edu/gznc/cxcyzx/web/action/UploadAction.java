package edu.gznc.cxcyzx.web.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


@Controller
@Scope("prototype")
public class UploadAction extends ActionSupport {
	//上传文件
	private File upload;
	//上传文件名
	private String uploadFileName;
	//上传文件内容类型
	private String uploadContentType;
	//文件保存路径
	private String savePath;
	
	public String fileUpload() throws IOException{
		File filePath = new File(getSavePath());
		//判断是否存在这个路径，如果没有则创建
		if(!filePath.exists()){
			filePath.mkdirs();
		}
		//定义路径名称
		String fileName = getSavePath() + File.separatorChar + getUploadFileName();
		//获得应用的跟路径 /WorkRoom
		String appURL = File.separatorChar + ServletActionContext.getRequest().getContextPath().substring(1) + savePath + File.separatorChar + getUploadFileName();
		System.out.println(appURL);
		System.out.println(getSavePath());
		System.out.println(fileName);
		//定义输出流对象fos
		FileOutputStream fos = new FileOutputStream(fileName);
		//定义输入流对象fis
		FileInputStream fis = new FileInputStream(getUpload());
		byte[] b = new byte[1024*1024];
		int len = 0;
		while((len = fis.read(b)) > 0){
			fos.write(b,0,len);
		}
		fis.close();
		fos.close();
		ServletActionContext.getResponse().getWriter().print(appURL);
		return NONE;
	}

	
	public String getSavePath() {
		return ServletActionContext.getRequest().getRealPath(savePath);
	}

	public void setSavePath(String savePath) {
		this.savePath = File.separatorChar + savePath;
	}


	public File getUpload() {
		return upload;
	}


	public void setUpload(File upload) {
		this.upload = upload;
	}


	public String getUploadFileName() {
		return uploadFileName;
	}


	public void setUploadFileName(String uploadFileName) {
		String filename = uploadFileName.substring(0, uploadFileName.lastIndexOf("."));
		String typeName = uploadFileName.substring(uploadFileName.indexOf("."));
		filename = String.valueOf(System.currentTimeMillis());
		this.uploadFileName = filename + typeName;
	}


	public String getUploadContentType() {
		return uploadContentType;
	}


	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

}
