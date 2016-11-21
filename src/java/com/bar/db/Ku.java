/*
 * @author Mr.tao
 * create 2016.7.4
 */
package com.bar.db;
import java.sql.*;

public class Ku extends ExecuteDB {
    	//定义类成员变量
	private long kuid;
	private String goodname;
	private int num;
	private String strSql;

    //构造函数，对成员变量进行初始化赋值
	public Ku()
	{
		this.kuid=0;
		this.goodname="";
		this.num=0;
		this.strSql="";
	}
        //添加库存信息，往KU数据表中添加一条新记录
	public boolean add()
	{
		this.strSql="insert into ku ";
		this.strSql=this.strSql + "(goodname,num)";
		this.strSql=this.strSql + "values('" + this.goodname + "','" + this.num + "')";
		boolean isAdd = super.exeSql(this.strSql);

		return isAdd;
	}
        //获取wordsid对应的留言信息，将这些信息赋值给相应的类变量
	public boolean init()
	{
    	this.strSql="select * from `ku` where kuid=";
        this.strSql=this.strSql + "'" + this.kuid + "'";
		try
		{
   			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next())
			{
                kuid=rs.getLong("kuid");
                goodname=rs.getString("goodname");
                num=rs.getInt("num");
                return true;
			}
			else
				return false;
		}
		catch(Exception e)
		{
			return false;
		}
	}
        public ResultSet show_ku()
{
	this.strSql = "select kuid,goodname,num from ku ";
	ResultSet rs = null;
	try
	{
		rs = super.exeQuery(this.strSql);
	}
	catch(Exception ex)
	{
		System.out.println(ex.toString());
	}
	return rs;
}
        public boolean updata()
	{
		this.strSql="update ku set";
		this.strSql=this.strSql + " num=" + "'" + this.num + "',";
                this.strSql=this.strSql + "goodname=" +"'" + this.goodname +"'";
		this.strSql=this.strSql + " where kuid='" + this.kuid + "'";
		boolean isUpdate = super.exeSql(this.strSql);

		return isUpdate;
	}
        
	 public boolean delete(String sKuid)
        {
            this.strSql = "delete from ku where kuid in (";
            this.strSql = this.strSql + sKuid +")";

            boolean isDelete = super.exeSql(this.strSql);
            return isDelete;
        }
         
         //判断用户名是否存在
	public boolean exist()
	{
		this.strSql="select * from `ku` ";
		this.strSql=this.strSql + " where goodname='" + this.goodname + "'";

		try
		{
			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next())
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
			return false;
		}
	}




	public void setKuid(long kuid)
	{
		this.kuid = kuid;
	}

	
	public long getKuid()
	{
		return this.kuid;
	}

        
 	public void setGoodname(String goodname)
	{
		this.goodname = goodname;
	}

	
	public String getGoodname()
	{
		return this.goodname;
	}
	
 	public void setNum(int num)
	{
		this.num = num;
	}

	
	public int getNum()
	{
		return this.num;
	}
}
