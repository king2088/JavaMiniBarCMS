/*
 * @author Mr.tao
 * create 2016.7.4
 */
package com.bar.safe;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class Mysql
{
    private static String str = null;
    private static String userName = null;
    private static String userPassword = null;
    private static String binpath = null;
    
  
  public static void backup() throws IOException
  {
        Properties props = new Properties();
        FileInputStream fis;
        String dir = Thread.currentThread().getContextClassLoader().getResource("").toString();//获得classes目录 file:/C:/Users/Administrator/Documents/NetBeansProjects/bar/build/web/WEB-INF/classes/
            dir=dir.replace('/', '\\');
            dir=dir.replace("file:", ""); //去掉file: 
            dir=dir.replace('/', '\\');
            dir = dir.replace("classes\\", ""); //去掉class\ 
            dir = dir.substring(1); //去掉第一个\,如 \D:\JavaWeb...  
            dir+="DB.properties";
    
    try
    {
        fis = new FileInputStream(dir);
        props.load(fis);
        
        userName = props.getProperty("Mysql_root");
        userPassword = props.getProperty("Mysql_password");
        binpath = props.getProperty("Mysql_Binpath");
        str = binpath +"mysqldump -u "+userName+" -p"+userPassword+" --opt   bar >  c:/bar.sql";
         Runtime rt = Runtime.getRuntime();
         rt.exec("cmd /c" + str);

         System.out.println("Successly");
    }
    catch (IOException e)
    {
        System.out.println("Something wrong!"+e);
    }
  }
  
  public static void load() throws IOException
  {
        Properties props = new Properties();
        FileInputStream fis;
       String dir = Thread.currentThread().getContextClassLoader().getResource("").toString();//获得classes目录 file:/C:/Users/Administrator/Documents/NetBeansProjects/bar/build/web/WEB-INF/classes/
            dir=dir.replace('/', '\\');
            dir=dir.replace("file:", ""); //去掉file: 
            dir=dir.replace('/', '\\');
            dir = dir.replace("classes\\", ""); //去掉class\ 
            dir = dir.substring(1); //去掉第一个\,如 \D:\JavaWeb...  
            dir+="DB.properties";
    
    try
    {
        fis = new FileInputStream(dir);
        props.load(fis);
        
        userName = props.getProperty("Mysql_root");
        userPassword = props.getProperty("Mysql_password");
        binpath = props.getProperty("Mysql_Binpath");
        str = binpath+"mysql -u "+userName+" -p"+userPassword+" bar  <  c:/bar.sql";
        Runtime rt = Runtime.getRuntime();
        rt.exec("cmd /c" + str);
        System.out.println("Restore successly!");
    }
    catch (IOException e)
    {
      System.out.println("Restore fail!"+e);
    }
  }
}
