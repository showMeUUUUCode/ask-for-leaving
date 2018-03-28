package tools;

import pojo.UserInfo;

public class ThreadLocalTools {
	private static ThreadLocal<UserInfo> tl=new ThreadLocal<UserInfo>();
	
	public static UserInfo get(){
		return tl.get();
	}
	public static void set(UserInfo userInfo){
		tl.set(userInfo);
	}
	public static void remove(){
		tl.remove();
	}
}
