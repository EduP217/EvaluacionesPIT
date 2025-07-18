package com.cibertec.beans;

import java.io.File;
import java.util.Arrays;

public class FileBean {

	private File file;
	private byte[] fileBytes;
	private String fileContentType;
	private String fileFileName;
	
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public byte[] getFileBytes() {
		return fileBytes;
	}
	public void setFileBytes(byte[] fileBytes) {
		this.fileBytes = fileBytes;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	
	@Override
	public String toString() {
		return "FileBean [file=" + file + ", fileContentType=" + fileContentType + ", fileFileName=" + fileFileName + "]";
	}
	
}
