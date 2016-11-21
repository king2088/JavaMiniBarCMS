package com.bar.safe;

import java.io.File;
import java.io.IOException;

/**
 *
 * @author Mr.Tao
 * @date 2016-8-30 22:33:25
 * @version V2.0
 * @desc THIS IS TEST ! 获得WEB-INF目录测试实例
 */
public class TestDir {
    public static void main(String[] args) throws IOException{
        //File dir = new File("xxx.properties");
        String path1 = Thread.currentThread().getContextClassLoader().getResource("").toString();
        path1=path1.replace('/', '\\'); // 将/换成\  
        path1=path1.replace("file:", ""); //去掉file:  
        path1=path1.replace("classes\\", ""); //去掉class\  
        path1=path1.substring(1); //去掉第一个\,如 \D:\JavaWeb...  
        //path1+="DB.properties";
        //dir.createNewFile();
        //String path = dir.getCanonicalPath();//设定为当前文件夹
        //System.out.println("File Path"+path);
        //System.out.println("user.dir:"+System.getProperty("user.dir"));
        //System.out.println("user.home:"+System.getProperty("user.home"));
        
        System.out.println("Thread:"+path1);
}
}