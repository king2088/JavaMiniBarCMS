/*
 * @author Mr.tao
 * create 2016.7.4
 */

package com.bar.db;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import java.sql.*;

public class ConnectDB
{
	//数据库用户名
	String userName="";
	//数据库密码
	String userPassword="";
	//数据库的URL，包括连接数据库所使用的编码格式
	String url="";
	//定义一个连接对象
	Connection dbConn;
	//错误信息串
	String errMes;

   	public ConnectDB()
   	{
   		//初始化操作
		errMes="";
   		dbConn=null;
   	}

	//连接数据库
   	public Connection getConn()
   	{
            Properties props = new Properties();
            FileInputStream fis;
            String dir = Thread.currentThread().getContextClassLoader().getResource("").toString();//获得classes目录 file:/C:/Users/Administrator/Documents/NetBeansProjects/bar/build/web/WEB-INF/classes/
            /*Windows下使用的获得WEB-INF目录*/
            dir=dir.replace('/', '\\');//windows下将目录中的"/"修改为"\\"
            dir=dir.replace("file:", ""); //去掉file:
            dir = dir.replace("classes\\", ""); //windows下去掉class\\（因为第一次替换就已经将"/"替换为"\\"所以这里必须要写class\\）
            dir = dir.substring(1); //去掉第一个\（windows），Linux下要注释掉
            dir+="DB.properties";
            
            /*Linux请注释掉上面的Windows*/
            /*
            dir=dir.replace("file:", ""); //去掉file:
            dir = dir.replace("classes/", ""); //linux下去掉class/
            dir+="DB.properties";
            */
	   	try
	   	{
                    
                    fis = new FileInputStream(dir);
			props.load(fis);
                        url = props.getProperty("Mysql_url")+"?useUnicode=true&characterEncoding=GB2312";
                        userName = props.getProperty("Mysql_root");
                        userPassword = props.getProperty("Mysql_password");
			//声明所用的类包
			Class.forName("com.mysql.jdbc.Driver");
			//获得数据库的连接对象
			dbConn= DriverManager.getConnection(url,userName,userPassword);
	   	}
	   	catch(IOException | ClassNotFoundException | SQLException e)
	   	{
	   		dbConn = null;
	   		errMes=e.toString();
	   	}
	   	return dbConn;
   }

   //获取错误信息
   public String getErrMes()
   {
   		return errMes;
   }
}
