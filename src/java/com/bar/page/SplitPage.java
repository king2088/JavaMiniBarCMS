/*
 * @author Mr.tao
 * create 2016.7.4
 */

package com.bar.page;

import java.sql.*;
import java.util.*;

public class SplitPage
{
    //定义结果集对象
    private ResultSet rs=null;
    private ResultSetMetaData rsmd=null;
    //总记录数目
    private int rowCount;
    //所分的逻辑页数
    private int pageCount;
    //每页显示的记录数目
    private int pageSize;

    //初始化,获取数据表中的信息
    public void initialize(ResultSet rs,int pageSize)
    {
            this.pageSize=pageSize;
            try
            {
                    this.rs=rs;
                    this.rsmd=this.rs.getMetaData();
                    if (this.rs!=null)
                    {
                            this.rs.last();
                            this.rowCount = this.rs.getRow();
                            this.rs.first();
                            this.pageCount = (this.rowCount - 1) / this.pageSize + 1;
                    }
                    else
                    {
                            this.rowCount=0;
                    }
            }
            catch(SQLException e)
            {
                    System.out.println(e.toString());
            }
    }

    //将显示结果存到Vector集合类中
    public Vector getPage(int ipage)
    {
            Vector vData=new Vector();
            int n=ipage;
            int m=0;
            m=(n-1)*this.pageSize+1;
            try
            {
                    if (this.rs!=null)
                    {
                            if (n!=1)
                            {
                                    this.rs.absolute(m);
                            }
                            for(int i=0;i<this.pageSize;i++)
                            {
                                    String[] sData=new String[10];
                                    for(int j=0;j<this.rsmd.getColumnCount();j++)
                                    {
                                            sData[j]=this.rs.getString(j+1);
                                    }
                                    if (sData==null)
                                    {
                                            break;
                                    }
                                    vData.addElement(sData);
                                    this.rs.next();
                            }
                    }
            }
            catch(SQLException e)
            {
                    System.out.println(e.toString());
            }
            return vData;
    }

    //获得页面总数
    public int getPageCount()
    {
            return this.pageCount;
    }

    //获取数据表中记录总数
    public int getRowCount()
    {
            return this.rowCount;
    }
}
