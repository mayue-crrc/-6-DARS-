package com.metro.udp;

// @author: Deng Ran
// @description: used to get or set data from the byte array
public class DataAccess {
	static boolean getBool(byte[] data, int byteOffset, int bitOffset) {
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
	
	static int getU8(byte[] data, int byteOffset) {
		if (data.length <= byteOffset) {
			return 0;
		}
		
		return 0xFF & data[byteOffset];
	}
	
	static int getU16(byte[] data, int byteOffset) {
		return getU8(data, byteOffset) * 256 + getU8(data, byteOffset + 1);
	}
	
	static int getU24(byte[] data, int byteOffset) {
		return getU16(data, byteOffset) * 256 + getU8(data, byteOffset + 2);
	}
	
	static long getU32(byte[] data, int byteOffset) {
		return  getU24(data, byteOffset) * 256L + getU8(data, byteOffset + 3);
	}
	
	static void setBool(byte[] data, int byteOffset, int bitOffset, boolean value) {
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
	
	static void setU8(byte[] data, int byteOffset, int value) {
		if (data.length <= byteOffset) {
			return;
		}
		
		data[byteOffset] = (byte)(value & 0xFF);
	}
	
	static void setU16(byte[] data, int byteOffset, int value) {
		setU8(data, byteOffset, (byte)((value >> 8) & 0xFF));
		setU8(data, byteOffset + 1, (byte)(value & 0xFF));
	}
	
	static void setU24(byte[] data, int byteOffset, int value) {
		setU8(data, byteOffset, (byte)((value >> 16) & 0xFF));
		setU8(data, byteOffset + 1, (byte)((value >> 8) & 0xFF));
		setU8(data, byteOffset + 2, (byte)(value & 0xFF));
	}
	
	static void setU32(byte[] data, int byteOffset, long value) {
		setU8(data, byteOffset, (byte)((value >> 24) & 0xFF));
		setU8(data, byteOffset + 1, (byte)((value >> 16) & 0xFF));
		setU8(data, byteOffset + 2, (byte)((value >> 8) & 0xFF));
		setU8(data, byteOffset + 3, (byte)(value & 0xFF));
	}
}
