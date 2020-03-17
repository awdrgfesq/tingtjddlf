package ssm.mi.member.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public abstract class BabySession {

	/**
	* �������̵� ������ ������ �����̸��� ����.
	* 
	*/
	private static final String MEMBERID  = "MEMBERID";
	private static final String MEMBERNO  = "MEMBERNO";
	private static final String AUTHORIRY = "AUTHORIRY";
	/***
	* kill Session, ���ǿ� ��� ������ ��� �����.
	* 
	* @param     hReq       servlet request.
	* @return    servlet request�� null�̸� false�� �����ϰ�, 
	*            �ƴϸ� ���ǿ� ��� ������ ��� ����� true�� ����.
	* @exception Exception.
	*/
	public static boolean killSession(final HttpServletRequest hReq) 
		throws Exception
	{
		if (hReq == null) return false;
		
		try
		{
			HttpSession hSession = hReq.getSession(true);
			hSession.invalidate();
		}
		catch(Exception e)
		{
			throw e;
		}
		
		return true;
	}
	
	/***
	* �������̵� ������ ���ǿ� ��´�.
	* 
	* @param     hReq       servlet request.
	* @param     userID     �������̵�.
	* @return    servlet request�� null�̰ų�, �������̵��� ���� ������ 
	*            false�� �����ϰ�, �ƴϸ� �������̵� ������ ���ǿ� ��� true�� ����.
	* @exception Exception.
	*/
	public static boolean setSession(final HttpServletRequest hReq,
							         final String memberID,final String memberNO, final String authority) 
		throws Exception
	{
		if (hReq == null) return false;
		if (memberID  == null || memberID.trim().length() == 0) return false;
		if (memberNO  == null || memberNO.trim().length() == 0) return false;
		if (authority == null || authority.trim().length() == 0) return false;
		HttpSession hSession = hReq.getSession(true);
		
		try
		{	
			hSession.setAttribute(MEMBERID, memberID);
			hSession.setAttribute(MEMBERNO, memberNO);
			hSession.setAttribute(AUTHORIRY, authority);
			hSession.setMaxInactiveInterval(60*60*10);
		}
		catch(Exception e)
		{
			throw e;
		}
		
		return true;
	}
	
	/***
	* �������̵� ������ ���ǿ��� �����´�.
	* 
	* @param     hReq       servlet request.
	* @return    servlet request�� null�̸� �� ���ڿ�("")�� �����ϰ�, 
	*            �ƴϸ� ������ ������ �ִ� �������̵� ����.
	* @exception Exception.
	*/
	public static String getSessionID(final HttpServletRequest hReq) 
		throws Exception
	{
		if (hReq == null) return "";
		String strSessionID;
		
		HttpSession hSession = hReq.getSession(false);
		
		try
		{	
			strSessionID = (String)hSession.getAttribute(MEMBERID);			
		}
		catch(Exception e)
		{
			throw e;
		}
		
		return strSessionID;
	}
	public static String getSessionNO(final HttpServletRequest hReq) 
			throws Exception
		{
			if (hReq == null) return "";
			String strSessionNO;
			
			HttpSession hSession = hReq.getSession(false);
			
			try
			{	
				strSessionNO = (String)hSession.getAttribute(MEMBERNO);			
			}
			catch(Exception e)
			{
				e.printStackTrace();
				throw e;
			}
			
			return strSessionNO;
		}
	public static String getSessionAU(final HttpServletRequest hReq) 
			throws Exception
		{
			if (hReq == null) return "";
			String strSessionAU;
			
			HttpSession hSession = hReq.getSession(false);
			
			try
			{	
				strSessionAU = (String)hSession.getAttribute(AUTHORIRY);			
			}
			catch(Exception e)
			{
				throw e;
			}
			
			return strSessionAU;
		}
}
