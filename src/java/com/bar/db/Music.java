/*
 * @author Mr.tao
 * create 2016.7.4
 */

package com.bar.db;
import java.sql.*;

public class Music extends ExecuteDB{
        private long musicid;
	private String musicname;
	private String musicurl;
	private long userid;
	private String strSql;

public Music(){

    this.musicid = 0;
    this.musicname="";
    this.musicurl="";
    this.userid=0;
    this.strSql="";
}
public boolean add(){
    this.strSql="insert into music";
		this.strSql=this.strSql + " (musicname,musicurl,userid) ";
		this.strSql=this.strSql + "values('" + this.musicname + "','" + this.musicurl + "','" + this.userid + "')";

    boolean isAdd = super.exeSql(this.strSql);
    return isAdd;
}
public boolean delete(String smusicid)
	{
		this.strSql="delete from music";
		this.strSql=this.strSql + "  where musicid in ("+smusicid+")";

		boolean isDelete = super.exeSql(this.strSql);
		return isDelete;
	}
public boolean  init()
	{
		this.strSql="select * from music";
		this.strSql=this.strSql + " where musicid='" + this.musicid + "'";

		try
		{
			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next())
			{
				this.musicid=rs.getLong("musicid");
				this.musicname=rs.getString("musicname");
				this.musicurl=rs.getString("musicurl");
				this.userid=rs.getLong("userid");
				
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
	public ResultSet show_music()
	{
		this.strSql="select * from `music` order by musicid asc";
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
//设置类成员变量emailid的值
	public void setMusicid(long musicid)
	{
		this.musicid = musicid;
	}

	//获取类成员变量emailid的值
	public long getMusicid()
	{
		return this.musicid;
	}

	//设置类成员变量subject的值
 	public void setMusicname(String musicname)
	{
		this.musicname = musicname;
	}

	//获取类成员变量subject的值
	public String getMusicname()
	{
		return this.musicname;
	}

	//设置类成员变量content的值
 	public void setMusicurl(String musicurl)
	{
		this.musicurl = musicurl;
	}

	//获取类成员变量content的值
	public String getMusicurl()
	{
		return this.musicurl;
	}

 	//设置类成员变量sender的值
 	public void setUserid(long userid)
	{
		this.userid = userid;
	}

	//获取类成员变量sender的值
	public long getUserid()
	{
		return this.userid;
	}
}
