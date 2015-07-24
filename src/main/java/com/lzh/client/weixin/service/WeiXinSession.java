package com.lzh.client.weixin.service;

import java.util.Hashtable;

public class WeiXinSession {
	/// <summary>
    /// 缓存hashtable
    /// </summary>
    private static Hashtable<String,Object> mDic = new Hashtable<String,Object>();
    /// <summary>
    /// 添加
    /// </summary>
    /// <param name="key">key</param>
    /// <param name="value">value</param>
    public static void Add(String key, Object value)
    {
        mDic.put(key, value);
    }
    /// <summary>
    /// 移除
    /// </summary>
    /// <param name="key">key</param>
    public static void Remove(String key)
    {
        if (Contains(key))
        {
            mDic.remove(key);
        }
    }
    /// <summary>
    /// 设置值
    /// </summary>
    /// <param name="key"></param>
    /// <param name="value"></param>
    public static void Set(String key, Object value)
    {
    	mDic.put(key, value);
    }
    /// <summary>
    /// 获取值
    /// </summary>
    /// <param name="key"></param>
    /// <returns></returns>
    public static Object Get(String key)
    {
        return mDic.get(key);
    }
    /// <summary>
    /// 是否含有
    /// </summary>
    /// <param name="key">key</param>
    /// <returns>bool</returns>
    public static Boolean Contains(String key)
    {
        return mDic.containsKey(key);
    }
    /// <summary>
    /// 清空所有项
    /// </summary>
    public static void Clear()
    {
        mDic.clear();;
    }
}
