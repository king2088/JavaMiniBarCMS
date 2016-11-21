/*
 * @author Mr.tao
 * create 2016.7.4
 */
package com.bar.db;


import java.sql.*;

//这个类继承自ConnectDB类
public class ExecuteDB extends ConnectDB
{
	//数据库连接对象
	private final Connection DbCon;
	private Statement stmt;
	private ResultSet rs;
        //error 描述 错误信息
        private String ErrMes;

	//初始化操作
	public ExecuteDB()
	{
		DbCon = super.getConn();
		stmt = null;
		rs = null;
		this.ErrMes = super.getErrMes();
	}

	 //执行sql 执行语句，主要是执行插入和删除的SQL语句
	public boolean exeSql(String strSql)
	{
		boolean isSuc = false;
		try
		{
   			stmt=DbCon.createStatement();
			stmt.executeUpdate(strSql);
			stmt.close();
			isSuc = true;
		}
		catch(Exception e)
		{
			this.ErrMes = this.ErrMes + "<br>" +e.toString();
		}
		return isSuc;
	}

	//执行sql查询语句
    public ResultSet exeQuery(String strSql)
	{
		try
		{
   			stmt=DbCon.createStatement();
			rs =stmt.executeQuery(strSql);
		}
		catch(Exception e)
		{
            this.ErrMes = this.ErrMes + "<br>" +e.toString();
			rs = null;
		}
		return rs;
	}

    //取得错误信息
        @Override
    public String getErrMes()
    {
        return ErrMes;
    }

}
