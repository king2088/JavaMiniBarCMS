/*
 * @author Mr.tao
 * create 2016.7.4
 */

package com.bar.db;

import java.sql.*;

public class Type extends ExecuteDB
{
	//定义类成员变量
	private long typeid;
	private String typename;
	private String strSql;

    //构造函数，对成员变量进行初始化赋值
	public Type()
	{
		this.typeid=0;
		this.typename="";
		this.strSql="";
	}

	//添加新讨论区，往type数据表中添加一条新记录
	public boolean add()
	{

		this.strSql="insert into type ";
		this.strSql=this.strSql + "(typename) ";
		this.strSql=this.strSql + "values('" + this.typename + "')";
		boolean isAdd = super.exeSql(this.strSql);

		return isAdd;
	}

	//修改typeid对应的讨论区的信息
	public boolean modify()
	{
		this.strSql="update type set";
		this.strSql=this.strSql + " typename=" + "'" + this.typename + "'";
		this.strSql=this.strSql + " where typeid='" + this.typeid + "'";
		boolean isUpdate = super.exeSql(this.strSql);

		return isUpdate;
	}


 	//获得typeid对应的讨论区的信息，将这些信息赋值给相应的类变量
	public boolean init()
	{
		this.strSql="select * from `type` where typeid=";
		this.strSql=this.strSql + "'" + this.typeid + "'";
		try
		{
			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next())
			{
				this.typeid=rs.getLong("typeid");
				this.typename=rs.getString("typename");
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

 	//判断讨论区名是否存在
	public boolean exist()
	{
		this.strSql="select * from `type` ";
		this.strSql=this.strSql + " where typename='" + this.typename + "'";
		System.out.println(strSql);
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

	//获得所有讨论区信息，返回一个ResultSet对象
	public ResultSet show_all()
	{
		this.strSql="select * from `type` order by typeid asc";
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

	//设置类成员变量typeid的值
	public void setTypeid(long typeid)
	{
		this.typeid = typeid;
	}

	//获取类成员变量typeid的值
	public long getTypeid()
	{
		return this.typeid;
	}

	//设置类成员变量typename的值
 	public void setTypename(String typename)
	{
		this.typename = typename;
	}

	//获取类成员变量typename的值
	public String getTypename()
	{
		return this.typename;
	}
}


