/*
 * @author Mr.tao
 * create 2016.7.4
 */
package com.bar.db;

import java.sql.*;

public class Article extends ExecuteDB
{
	//定义类成员变量
	private long articleid;
	private String title;
	private String content;
	private long userid;
	private int readcount;
	private int recount;
        private long typeid;
        private String createtime;
	private String strSql;

    //构造函数，对成员变量进行初始化赋值
	public Article()
	{
		this.articleid=0;
		this.title="";
		this.content="";
		this.readcount=0;
                this.recount=0;
		this.userid=0;
                this.typeid=0;
                this.createtime="";
		this.strSql="";
	}

	//添加新文章，往articles数据表中添加一条新记录
	public boolean add()
	{
		this.strSql="insert into articles ";
		this.strSql=this.strSql + "(";
		this.strSql=this.strSql + "title,content,userid,readcount,recount,typeid)";
		this.strSql=this.strSql + "values('" + this.title + "','" + this.content + "','" + this.userid + "','" + this.readcount + "','" + this.recount + "','" + this.typeid + "')";
		boolean isAdd = super.exeSql(this.strSql);

		return isAdd;
	}

  	//删除articleid对应的文章的信息
		public boolean delete(String sActicleid)
	{
		this.strSql="delete from articles";
		this.strSql=this.strSql + "  where articleid in ("+ sActicleid +")";

		boolean isDelete = super.exeSql(this.strSql);
		return isDelete;
	}

	//验证articleid和userid是否匹配
	public boolean valid()
	{
		this.strSql="select articleid from `articles` ";
		this.strSql=this.strSql + " where articleid='" + this.articleid + "'";
		this.strSql=this.strSql + "  and userid='"+ this.userid + "'";
		System.out.println(this.strSql);

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
		catch(Exception ex)
		{
                    System.out.println(ex.toString());
			return false;
		}
	}



  	//获取articleid对应的文章的信息，将这些信息赋值给相应的类变量
	public boolean  init()
	{
    	this.strSql="select * from `articles` where articleid=";
        this.strSql=this.strSql + "'" + this.articleid + "'";
        try
		{
   			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next())
			{
                articleid=rs.getLong("articleid");
                title=rs.getString("title");
                content=rs.getString("content");
                readcount=rs.getInt("readcount");
                userid=rs.getLong("userid");
                recount=rs.getInt("recount");
                typeid = rs.getLong("typeid");
                createtime = rs.getString("createtime");
                return true;
			}
			else
			{
				return false;
			}
		}
		catch(Exception ex)
		{
                    System.out.println(ex.toString());
			return false;
		}
	}

	//获得typeid相同的一组文章的信息，返回一个ResultSet类型对象
	public ResultSet show_son_articles()
	{
		this.strSql="select * from `articles`";
                this.strSql=this.strSql + " where typeid = '"+ this.typeid +"'";
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

        public ResultSet show_type_articles()
	{	
		this.strSql="select articleid,title,userid,readcount,recount,createtime from `articles`";
        this.strSql=this.strSql + " where typeid = '" + this.typeid + "'";
        this.strSql=this.strSql + " order by createtime desc";
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
        //获取前4个公告文章
        public ResultSet show_news_articles()
	{
		this.strSql="select articleid,title from `articles` ";
                this.strSql=this.strSql + " where typeid = '" + this.typeid + "'";
                this.strSql=this.strSql + " order by createtime desc limit 0,5";
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
         //获取当前文章
         public ResultSet show_anews_articles()
	{
		this.strSql="select articleid,title from `articles` ";
                this.strSql=this.strSql + " where typeid = '" + this.typeid + "'";
                this.strSql=this.strSql + " order by createtime desc limit 0,5";
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
	
         //获取8个热点文章
        public ResultSet show_hot_articles()
	{
		this.strSql="select articleid,title from `articles` ";
                this.strSql=this.strSql + " order by readcount desc limit 0,8";
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
        public ResultSet show_all_articles()
	{
		this.strSql="select articleid,title,userid,readcount,recount,createtime from `articles` ";
                this.strSql=this.strSql + " order by createtime desc";
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

	//获得typeid对应的文章的数量
	public int articles_count()
	{	
		this.strSql="select articleid,title,userid,readcount,recount,createtime from `articles`";
        this.strSql=this.strSql + " where typeid = '" + this.typeid + "'";
        ResultSet rs = null; 
		try
		{
			rs = super.exeQuery(this.strSql);
			rs.last();
			return rs.getRow();	
		}
		catch(Exception e)
		{
			System.out.println(e.toString()); 
			return 0;
		}  
	}

        public boolean modify()
	{
		this.strSql="update articles set";
		this.strSql=this.strSql + " title = '"+this.title+"',";
                this.strSql=this.strSql + "content = '"+this.content+"'";
		this.strSql=this.strSql + " where articleid='" + this.articleid + "'";
		boolean isModify = super.exeSql(this.strSql);

		return isModify;
	}



	//更改articles数据表中articleid所对应的readcount的值
	public boolean modify_readcount()
	{
		this.strSql="update articles set";
		this.strSql=this.strSql + " readcount = '"+this.readcount+"'";
		this.strSql=this.strSql + " where articleid='" + this.articleid + "'";
		boolean isModify = super.exeSql(this.strSql);

		return isModify;
	}

	//更改articles数据表中articleid所对应的ReCount的值
	public boolean modify_ReCount()
	{
		this.strSql="update articles set";
		this.strSql=this.strSql + " recount = '"+this.recount+"'";
		this.strSql=this.strSql + " where articleid='" + this.articleid + "'";
		boolean isModify = super.exeSql(this.strSql);

		return isModify;
	}




  	//设置类成员变量articleid的值
	public void setArticleid(long articleid)
	{
		this.articleid = articleid;
	}

	//获取类成员变量articleid的值
	public long getArticleid()
	{
		return this.articleid;
	}

	//设置类成员变量title的值
 	public void setTitle(String title)
	{
		this.title = title;
	}

	//获取类成员变量title的值
	public String getTitle()
	{
		return this.title;
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


	//设置类成员变量readcount的值
	public void setReadcount(int readcount)
	{
		this.readcount = readcount;
	}

	//获取类成员变量readcount的值
	public int getReadcount()
	{
		return this.readcount;
	}

	//设置类成员变量ReCount的值
 	public void setRecount(int recount)
	{
		this.recount = recount;
	}

	//获取类成员变量ReCount的值
	public int getRecount()
	{
		return this.recount;
	}

        //设置类成员变量typeid的值
 	public void setTypeid(Long typeid)
	{
		this.typeid = typeid;
	}

	//获取类成员变量picname的值
	public Long getTypeid()
	{
		return this.typeid;
	}
        //设置类成员变量content的值
 	public void setCreatetime(String createtime)
	{
		this.createtime = createtime;
	}

	//获取类成员变量content的值
	public String getCreatetime()
	{
		return this.createtime;
	}
}