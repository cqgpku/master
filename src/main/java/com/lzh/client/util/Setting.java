package com.lzh.client.util;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.commons.io.IOUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Setting {
	
    private static final Log log = LogFactory.getLog(Setting.class);
    public static Properties SETTINGS;

    static {
      //  init();
    }

    private static void init() {
        String cachefile = Constants.wfpath + "setting.properties";
        SETTINGS = new Properties();
        InputStream stream = null;
        try {
            stream = new BufferedInputStream(new FileInputStream(cachefile));
            SETTINGS.load(stream);
        } catch (IOException e) {
            log.error("初始化配置失败！", e);
        } finally {
            IOUtils.closeQuietly(stream);
        }
    }

    public static String getSetting(String key) {
        return SETTINGS.getProperty(key);
    }
}
