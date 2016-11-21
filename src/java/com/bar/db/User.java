/*
 * @author Mr.tao
 * create 2016.7.4
 */

package com.bar.db;

import java.sql.*;

public class User extends ExecuteDB
{
	//定义类成员变量
	private long userid;
	private String uname;
	private String name;
	private String pwd;
        private String spwd;
	private String sex;
	private String email;
	private String address;
	private String tel;
	private String birth;
	private String post;
	private String safequestion;
	private String safeanswer;
	private String role;
	private float money;
	private String strSql;

    //构造函数，对成员变量进行初始化赋值
	public User()
	{
		super();
		this.userid=0;
		this.uname="";
		this.name="";
		this.pwd="";
                this.spwd="";
		this.sex="";
		this.email="";
		this.address="";
		this.tel="";
		this.birth="";
		this.post="";
		this.safequestion="";
		this.safeanswer="";
		this.role = "1";
		this.money=0;
		this.strSql="";
	}

	//添加新用户，往users数据表中添加一条新记录
	public boolean add()
	{

		this.strSql="insert into users ";
		this.strSql=this.strSql + "(uname,name,pwd,spwd,sex,email,address,tel,birth,post,safequestion,safeanswer,role,money) ";
		this.strSql=this.strSql + "values('" + this.uname + "','" + this.name + "','" + this.pwd + "','" + this.spwd + "','" + this.sex + "','" + this.email + "','" + this.address + "','" + this.tel + "','" + this.birth + "','" + this.post + "','" + this.safequestion + "','" + this.safeanswer + "','" + this.role + "','" + this.money + "')";
		boolean isAdd = super.exeSql(this.strSql);
                return isAdd;
	}

        public boolean delete(String sUserID)
        {
            this.strSql = "delete from users where userid in (";
            this.strSql = this.strSql + sUserID +")";

            boolean isDelete = super.exeSql(this.strSql);
            return isDelete;
        }

	//修改UserID对应的用户的信息
	public boolean modify_info()
	{
		this.strSql="update users set";
		this.strSql=this.strSql + " name=" + "'" + this.name + "',";
		this.strSql=this.strSql + " sex=" + "'" + this.sex + "',";
		this.strSql=this.strSql + " email=" + "'" + this.email + "',";
		this.strSql=this.strSql + " address=" + "'" + this.address + "',";
		this.strSql=this.strSql + " tel=" + "'" + this.tel + "',";
		this.strSql=this.strSql + " birth=" + "'" + this.birth + "',";
		this.strSql=this.strSql + " post=" + "'" + this.post + "',";
		this.strSql=this.strSql + " safequestion=" + "'" + this.safequestion + "',";
		this.strSql=this.strSql + " safeanswer=" + "'" + this.safeanswer + "',";
		this.strSql=this.strSql + " money=" + "'" + this.money + "'";
		this.strSql=this.strSql + " where userid='" + this.userid + "'";
		boolean isUpdate = super.exeSql(this.strSql);

		return isUpdate;
	}

	//修改UserID对应的用户的密码
 	public boolean modify_UserPassword()
 	{
		this.strSql="update users set ";
		this.strSql=this.strSql + "pwd=" + "'" + this.pwd + "',";
                this.strSql=this.strSql + "spwd=" + "'" + this.spwd + "'";
		this.strSql=this.strSql + " where userid='" + this.userid + "'";
		boolean isUpdatekey = super.exeSql(this.strSql);

		return isUpdatekey;
	}

        //修改UserID对应的用户的信息
	public boolean money()
	{
		this.strSql="update users set";
		this.strSql=this.strSql + " money=" + "'" + this.money + "'";
		this.strSql=this.strSql + " where userid='" + this.userid + "'";
		boolean isUpdate = super.exeSql(this.strSql);

		return isUpdate;
	}

 	//获得UserID对应的用户的信息，将这些信息赋值给相应的类变量
	public boolean init()
	{
		this.strSql="select * from `users` where userid=";
		this.strSql=this.strSql + "'" + this.userid + "'";

		try
		{
			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next())
			{
				this.userid=rs.getLong("userid");
				this.uname=rs.getString("uname");
				this.name=rs.getString("name");
				this.pwd=rs.getString("pwd");
                                this.spwd=rs.getString("spwd");
				this.sex=rs.getString("sex");
				this.email=rs.getString("email");
				this.address=rs.getString("address");
				this.tel=rs.getString("tel");
				this.birth=rs.getString("birth");
				this.post=rs.getString("post");
				this.safequestion=rs.getString("safequestion");
				this.safeanswer=rs.getString("safeanswer");
				this.money=rs.getFloat("money");
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

	//验证用户名和密码是否正确
	public boolean valid()
	{
		this.strSql="select userid,uname,role from `users` ";
		this.strSql=this.strSql + " where uname='" + this.uname + "'";
		this.strSql=this.strSql + "  and pwd='"+ this.pwd + "'";
		System.out.println(this.strSql);

		try
		{
			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next())
			{
				this.userid=rs.getLong("userid");
				this.uname=rs.getString("uname");
				this.role = rs.getString("role");
				return true;
			}
			else
			{
				return false;
			}
		}
		catch(Exception ex)
		{
			return false;
		}
	}
        
        //ajax登录验证用户名是否存在
        //验证用户名和密码是否正确
	public boolean valid_ajax()
	{
		this.strSql="select uname from `users` ";
		this.strSql=this.strSql + " where uname='" + this.uname + "'";
		System.out.println(this.strSql);

		try
		{
			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next())
			{
				this.uname=rs.getString("uname");
				return true;
			}
			else
			{
				return false;
			}
		}
		catch(Exception ex)
		{
			return false;
		}
	}

   	//判断用户名是否存在
	public boolean exist()
	{
		this.strSql="select * from `users` ";
		this.strSql=this.strSql + " where uname='" + this.uname + "'";

		try
		{
                    ResultSet rs;
                    rs = super.exeQuery(this.strSql);
                    return rs.next();
		}
		catch(Exception e)
		{
                    System.out.println(e.toString());
                    return false;
		}
	}
        
        //判断用户名是否存在
	public boolean post_email()
	{
		this.strSql="select * from `users` ";
		this.strSql=this.strSql + " where uname='" + this.uname + "'";

		try
		{
			ResultSet rs;
                    rs = super.exeQuery(this.strSql);
			if (rs.next())
			{
                            this.email=rs.getString("email");
                            this.spwd=rs.getString("spwd");
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



               	public ResultSet show_our_users()
	{
		this.strSql="select userid,sex,uname,name,address,email,tel,money from `users` where role= 3 order by userid asc";
		ResultSet rs;
                rs = null;
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
                public ResultSet show_member_users()
	{
		this.strSql="select userid,sex,uname,name,address,email,tel,money from `users` where role= 1 order by userid asc";
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


	//设置类成员变量uname的值
 	public void setUname(String uname)
	{
		this.uname = uname;
	}

	//获取类成员变量uname的值
	public String getUname()
	{
		return this.uname;
	}


	//设置类成员变量name的值
 	public void setName(String name)
	{
		this.name = name;
	}

	//获取类成员变量name的值
	public String getName()
	{
		return this.name;
	}


	//设置类成员变量pwd的值
 	public void setPwd(String pwd)
	{
		this.pwd = pwd;
	}

	//获取类成员变量pwd的值
	public String getPwd()
	{
		return this.pwd;
	}
        //设置类成员变量pwd的值
 	public void setSpwd(String spwd)
	{
		this.spwd = spwd;
	}

	//获取类成员变量pwd的值
	public String getSpwd()
	{
		return this.spwd;
	}



	//设置类成员变量sex的值
 	public void setSex(String sex)
	{
		this.sex = sex;
	}

	//获取类成员变量sex的值
	public String getSex()
	{
		return this.sex;
	}

	//设置类成员变量Email的值
	public void setEmail(String email)
	{
		this.email = email;
	}

	//获取类成员变量Email的值
	public String getEmail()
	{
		return this.email;
	}

	//设置类成员变量address的值
 	public void setAddress(String address)
	{
		this.address = address;
	}

	//获取类成员变量address的值
	public String getAddress()
	{
		return this.address;
	}


	//设置类成员变量tel的值
 	public void setTel(String tel)
	{
		this.tel = tel;
	}

	//获取类成员变量tel的值
	public String getTel()
	{
		return this.tel;
	}

	//设置类成员变量birth的值
 	public void setBirth(String birth)
	{
		this.birth = birth;
	}

	//获取类成员变量birth的值
	public String getBirth()
	{
		return this.birth;
	}

	//设置类成员变量post的值
 	public void setPost(String post)
	{
		this.post = post;
	}

	//获取类成员变量post的值
	public String getPost()
	{
		return this.post;
	}


	//设置类成员变量safequestion的值
 	public void setSafequestion(String safequestion)
	{
		this.safequestion = safequestion;
	}

	//获取类成员变量safequestion的值
	public String getSafequestion()
	{
		return this.safequestion;
	}



	//设置类成员变量safeanswer的值
 	public void setSafeanswer(String safeanswer)
	{
		this.safeanswer = safeanswer;
	}

	//获取类成员变量safeanswer的值
	public String getSafeanswer()
	{
		return this.safeanswer;
	}


		//设置类成员变量money的值
 	public void setMoney(float money)
	{
		this.money = money;
	}

	//获取类成员变量money的值
	public float getMoney()
	{
		return this.money;
	}


	//设置类成员变量Role的值
 	public void setRole(String role)
	{
		this.role = role;
	}

	//获取类成员变量Role的值
	public String getRole()
	{
		return this.role;
	}
}