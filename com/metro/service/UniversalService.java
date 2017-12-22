package com.metro.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;

/**  
 * @author Deng Ran
 * @since 2017/12/06
 * @version 1.1
 */
public class UniversalService {
	// conver String to java.sql.Date
    public static java.sql.Date convertStringToDate(String dateString) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");  
		java.sql.Date sqlDate = null;
		
		try {
			java.util.Date utilDate = simpleDateFormat.parse(dateString);  
			sqlDate = new java.sql.Date(utilDate.getTime());
		} catch (ParseException exception) {
			System.out.println("fail to parse string to date");
		}
		
		return sqlDate;
	}
    
	// conver String to java.sql.Date, still some problem in it
    public static java.sql.Timestamp convertStringToTimestamp(String timeString) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");  
		java.sql.Timestamp timestamp = null;
		
		try {
			java.util.Date utilDate = simpleDateFormat.parse(timeString);  
			timestamp = new java.sql.Timestamp(utilDate.getTime());
		} catch (ParseException exception) {
			System.out.println("fail to parse string to date");
		}
		
		return timestamp;
	}
    
    // get boolean from byte array
    public static boolean getBool(byte[] data, int byteOffset, int bitOffset) {
		if (data.length <= byteOffset) {
			return false;
		} else if (bitOffset >= 8) {
			return false;
		}
		
		if ((data[byteOffset] & (0x01 << bitOffset)) == 0) {
			return false;
		} else {
			return true;
		}
	}
	
    // get unsigned char from byte array
    public static int getU8(byte[] data, int byteOffset) {
		if (data.length <= byteOffset) {
			return 0;
		}
		
		return 0xFF & data[byteOffset];
	}
	
	// get unsigned short int from byte array
    public static int getU16(byte[] data, int byteOffset) {
		return getU8(data, byteOffset) * 256 + getU8(data, byteOffset + 1);
	}
	
	// get special int which occupies 3 byte from byte array
    public static long getU24(byte[] data, int byteOffset) {
		return getU16(data, byteOffset) * 256L + getU8(data, byteOffset + 2);
	}
	
	// get unsigned int from byte array
    public static long getU32(byte[] data, int byteOffset) {
		return  getU24(data, byteOffset) * 256L + getU8(data, byteOffset + 3);
	}
	
	// get absolute int from byte array
    public static int getInt(byte[] data, int byteOffset) {
		try {
			return 0x00000000 | data[byteOffset] 
					| (data[byteOffset + 1] << 8)
					| (data[byteOffset + 2] << 16)
					| (data[byteOffset + 3] << 24);
		} catch (IndexOutOfBoundsException indexOutOfBoundsException) {
			System.out.println("out of index, please check it");
			return 0;
		} catch (Exception exception) {
			System.err.println(exception.getMessage());
			return 0;
		}	
	}
	
	// set boolean in byte array
    public static void setBool(byte[] data, int byteOffset, int bitOffset, boolean value) {
		if (data.length <= byteOffset) {
			return;
		} else if (bitOffset >= 8) {
			return;
		}
		
		if (value) {
			data[byteOffset] |= (0x01 << bitOffset);
		} else {
			data[byteOffset] &= ~(0x01 << bitOffset);
		}
	}
	
	// set unsigned char in byte array
    public static void setU8(byte[] data, int byteOffset, int value) {
		if (data.length <= byteOffset) {
			return;
		}
		
		data[byteOffset] = (byte)(value & 0xFF);
	}
	
	// set unsigned short int in byte array
    public static void setU16(byte[] data, int byteOffset, int value) {
		setU8(data, byteOffset, (byte)((value >> 8) & 0xFF));
		setU8(data, byteOffset + 1, (byte)(value & 0xFF));
	}
	
	// set special int which ocuppies 3 byte in byte array
    public static void setU24(byte[] data, int byteOffset, long value) {
		setU8(data, byteOffset, (byte)((value >> 16) & 0xFF));
		setU8(data, byteOffset + 1, (byte)((value >> 8) & 0xFF));
		setU8(data, byteOffset + 2, (byte)(value & 0xFF));
	}
	
	// set int in byte array
    public static void setU32(byte[] data, int byteOffset, long value) {
		setU8(data, byteOffset, (byte)((value >> 24) & 0xFF));
		setU8(data, byteOffset + 1, (byte)((value >> 16) & 0xFF));
		setU8(data, byteOffset + 2, (byte)((value >> 8) & 0xFF));
		setU8(data, byteOffset + 3, (byte)(value & 0xFF));
	}
}
