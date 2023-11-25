package commons;

import java.security.MessageDigest;

import java.security.MessageDigest;

public class EncryptionUtils {

	// SHA-256 해시 알고리즘
	public static String getSHA256(String input) {
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			digest.reset();
			digest.update(input.getBytes("UTF-8"));
			return String.format("%064x", new java.math.BigInteger(1, digest.digest()));
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	// SHA-512 해시 알고리즘
	public static String getSHA512(String input) {
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-512");
			digest.reset();
			digest.update(input.getBytes("UTF-8"));
			return String.format("%0128x", new java.math.BigInteger(1, digest.digest()));
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
