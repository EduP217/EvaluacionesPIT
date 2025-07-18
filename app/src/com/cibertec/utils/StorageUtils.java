package com.cibertec.utils;

import java.nio.file.Path;
import java.nio.file.Paths;

public class StorageUtils {

	public static String getFileExtension(String filename) {
	    Path path = Paths.get(filename);
	    String name = path.getFileName().toString();
	    int dotIndex = name.lastIndexOf('.');
	    return (dotIndex == -1) ? "" : name.substring(dotIndex + 1);
	}
}
