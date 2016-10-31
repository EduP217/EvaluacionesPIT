package utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class Constantes {

	public static final int ORIGEN_DATOS=1;
	
	public static byte[] getBytesFromFile(File file) throws IOException {
		if (file != null) {
			InputStream is = new FileInputStream(file);

			byte[] bytes = new byte[(int) file.length()];

			int offset = 0;
			int numRead = 0;
			while (offset < bytes.length
					&& (numRead = is.read(bytes, offset, bytes.length - offset)) >= 0) {
				offset += numRead;
			}

			is.close();
			return bytes;
		} else {
			return null;
		}
	}

	public static File getFileFromBytes(byte[] fileBytes, String archivoDestino) {
		File f2 = null;
		try {
			f2 = new File(archivoDestino);
			OutputStream out = new FileOutputStream(f2);
			out.write(fileBytes);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f2;

	}


}
