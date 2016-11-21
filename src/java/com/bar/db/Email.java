/*
 * @author Mr.tao
 * create 2016.7.4
 */


package com.bar.db;

import java.sql.*;

public class Email extends ExecuteDB
{
	//定义类成员变量
	private long emailid;
	private String subject;
	private String content;
	private String sender;
	private String receiver;
	private int tag;
	private String strSql;

    //构造函数，对成员变量进行初始化赋值
	public Email()
	{
		super();
		this.emailid=0;
		this.subject="";
		this.content="";
		this.sender="";
		this.receiver="";
		this.tag=0;
		this.strSql="";
	}

	//在email数据表中添加一条新记录
	public boolean add()
	{
		this.strSql="insert into email";
		this.strSql=this.strSql + " (subject,content,sender,receiver,tag) ";
		this.strSql=this.strSql + "values('" + this.subject + "','" + this.content + "','" + this.sender + "','" + this.receiver + "','" + this.tag + "')";

		boolean isAdd = super.exeSql(this.strSql);
		return isAdd;
	}

	//删除属于某个集合中的邮件
	public boolean delete(String semailid)
	{
		this.strSql="delete from email";
		this.strSql=this.strSql + "  where emailid in ("+semailid+")";

		boolean isDelete = super.exeSql(this.strSql);
		return isDelete;
	}

  	//获取邮件详细信息，将这些信息赋值给相应的类变量
	public boolean  init()
	{
		this.strSql="select * from email";
		this.strSql=this.strSql + " where emailid='" + this.emailid + "'";

		try
		{
			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next())
			{
				this.emailid=rs.getLong("emailid");
				this.subject=rs.getString("subject");
				this.content=rs.getString("content");
				this.sender=rs.getString("sender");
				this.receiver=rs.getString("receiver");
				this.tag=rs.getInt("tag");
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

	//获得receiver对应的接收邮件信息，返回一个ResultSet类型对象
	public ResultSet rec_list()
	{
		this.strSql="select * from email where receiver=";
		this.strSql=this.strSql + "'" + this.receiver + "' order by CreateTime desc";
		try
		{
			ResultSet rs = super.exeQuery(this.strSql);
			if(rs == null)
			{
				System.out.println("test");
			}

			return rs;
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
			return null;
		}
	}

	//更改类成员变量tag的值
	public boolean update_tag()
	{
		this.strSql="update email set ";
		this.strSql=this.strSql + " tag=" + "'" + 1 + "'";
		this.strSql=this.strSql + " where emailid='" + this.emailid + "'";
		boolean updatetag = super.exeSql(strSql);
		return updatetag;
	}

   	//设置类成员变量emailid的值
	public void setEmailid(long emailid)
	{
		this.emailid = emailid;
	}

	//获取类成员变量emailid的值
	public long getEmailid()
	{
		return this.emailid;
	}

	//设置类成员变量subject的值
 	public void setSubject(String subject)
	{
		this.subject = subject;
	}

	//获取类成员变量subject的值
	public String getSubject()
	{
		return this.subject;
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

 	//设置类成员变量sender的值
 	public void setSender(String sender)
	{
		this.sender = sender;
	}

	//获取类成员变量sender的值
	public String getSender()
	{
		return this.sender;
	}

	//设置类成员变量receiver的值
 	public void setReceiver(String receiver)
	{
		this.receiver = receiver;
	}

	//获取类成员变量receiver的值
	public String getReceiver()
	{
		return this.receiver;
	}

 	//设置类成员变量tag的值
 	public void setTag(int tag)
	{
		this.tag = tag;
	}

	//获取类成员变量tag的值
	public int getTag()
	{
		return this.tag;
	}
}