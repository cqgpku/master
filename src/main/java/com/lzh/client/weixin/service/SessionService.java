package com.lzh.client.weixin.service;

import com.lzh.client.weixin.service.WeiXinSession;
import com.lzh.client.weixin.service.WeiXinSessionItem;

public class SessionService {
	/*
	 * 创建一个新的用户session
	 * @param fromUserName  用户ID
	 * @param businessId 业务ID
	 * @param stepSum 业务总步骤
	 */
	public static void createUserSession(String fromUserName,String businessId,Integer stepSum){
		try{
			//先查看是否有用户session，有则先删除;
			SessionService.deleteUserSession(fromUserName);
			
			
			WeiXinSessionItem sessionItem = new WeiXinSessionItem();

            WeiXinSession.Set(fromUserName, sessionItem);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	/*
	 * 删除用户session
	 */
	public static void deleteUserSession(String fromUserName){
		WeiXinSessionItem sessionItem = (WeiXinSessionItem)WeiXinSession.Get(fromUserName);
        //如果会话存在，且当前操作为用户认证
        if (sessionItem != null)
        {
        	WeiXinSession.Remove(fromUserName);
        }
	}
	
	/*
	 * 修改用户session并存储对应步骤下的值
	 */
	public static void setUserSession(String fromUserName,String businessId,Integer curStep,String curValue){
		//检查是否存在session
		WeiXinSessionItem sessionItem = (WeiXinSessionItem)WeiXinSession.Get(fromUserName);
        //如果会话存在，且当前操作为用户认证
        if (sessionItem != null)
        {
        	//TODO
        }else{
        	
        }
	}
	
	
	
	/*
	 * 判断是否存在用户session
	 */
	public static Boolean hasSession(String fromUserName){
		//检查是否存在session
		WeiXinSessionItem sessionItem = (WeiXinSessionItem)WeiXinSession.Get(fromUserName);
        //如果会话存在，且当前操作为用户认证
        if (sessionItem != null)
        {
        	return true;
        }else{
        	return false;
        }
	}
	
	/*
	 * 在每一步回复后将回复内容存入session
	 */
	public static void savaDataToSession(String fromUserName,String msgContent){
		
	}
	
	
}
