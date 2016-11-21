/*
 * @author Mr.tao
 * create 2016.7.4
 */

package com.bar.db;

import java.sql.*;

public class Words extends ExecuteDB
{
	//定义类成员变量
	private long wordsid;
	private String content;
	private long userid;
	private long goodinfoid;
	private String strSql;

    //构造函数，对成员变量进行初始化赋值
	public Words()
	{
		this.wordsid=0;
		this.content="";
		this.goodinfoid=0;
		this.userid=0;
		this.strSql="";
	}

	//添加新留言，往words数据表中添加一条新记录
	public boolean add()
	{
		this.strSql="insert into words ";
		this.strSql=this.strSql + "(content,userid,goodinfoid)";
		this.strSql=this.strSql + "values('" + this.content + "','" + this.userid + "','" + this.goodinfoid + "')";
		boolean isAdd = super.exeSql(this.strSql);

		return isAdd;
	}

  	//获取wordsid对应的留言信息，将这些信息赋值给相应的类变量
	public boolean init()
	{
    	this.strSql="select * from `words` where wordsid=";
        this.strSql=this.strSql + "'" + this.wordsid + "'";
		try
		{
   			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next())
			{
                wordsid=rs.getLong("wordsid");
                content=rs.getString("content");
                goodinfoid=rs.getLong("goodinfoid");
                userid=rs.getLong("userid");
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

	//获得goodinfoid对应的一组留言信息，返回一个ResultSet类型对象
	public ResultSet show_words()
	{
		this.strSql="select * from `words`";
        this.strSql=this.strSql + " where goodinfoid = '" + this.goodinfoid + "'";
		ResultSet rs = null;
		try
		{
			rs = super.exeQuery(this.strSql);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return rs;
	}

	//设置类成员变量wordsid的值
	public void setWordsid(long wordsid)
	{
		this.wordsid = wordsid;
	}

	//获取类成员变量wordsid的值
	public long getWordsid()
	{
		return this.wordsid;
	}

	//设置类成员变量content的值
 	public void setContent(String content)
	{
		this.content = content;
	}

	//获取类成员变量content的值
	public String getContent()
	{
		return this.content;
	}

	//设置类成员变量userid的值
	public void setUserid(long userid)
	{
		this.userid = userid;
	}

	//获取类成员变量userid的值
	public long getUserid()
	{
		return this.userid;
	}

	//设置类成员变量goodinfoid的值
 	public void setGoodinfoid(long goodinfoid)
	{
		this.goodinfoid = goodinfoid;
	}

	//获取类成员变量goodinfoid的值
	public long getGoodinfoid()
	{
		return this.goodinfoid;
	}
}


