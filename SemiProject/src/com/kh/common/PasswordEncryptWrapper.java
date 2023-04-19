/*
 * package com.kh.common;
 * 
 * import java.nio.charset.Charset; import java.security.MessageDigest; import
 * java.security.NoSuchAlgorithmException; import java.util.Base64;
 * 
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletRequestWrapper;
 * 
 * public class PasswordEncryptWrapper extends HttpServletRequestWrapper {
 * 
 * public PasswordEncryptWrapper(HttpServletRequest request) { super(request); }
 * 
 * @Override public String getParameter(String name) {
 * 
 * String value = "";
 * 
 * if(name.equals("userPwd")) {
 * 
 * System.out.println("암호화 전 pwd : " + super.getParameter(name)); value =
 * getSHA512(super.getParameter(name));
 * System.out.println("암호화 후 pwd : "+value);
 * 
 * }else { value = super.getParameter(name); } return value;
 * 
 * }
 * 
 * public String getSHA512(String val) { String encPwd = ""; MessageDigest md =
 * null;
 * 
 * try { md = MessageDigest.getInstance("SHA-512"); } catch
 * (NoSuchAlgorithmException e) { e.printStackTrace(); }
 * 
 * byte[] bytes = val.getBytes(Charset.forName("UTF-8")); md.update(bytes);
 * 
 * encPwd = Base64.getEncoder().encodeToString(md.digest());
 * 
 * return encPwd; }
 * 
 * }
 */