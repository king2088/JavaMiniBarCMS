/*
 * @author Mr.tao
 * create 2016.7.4
 */

package com.bar.db;
import java.sql.*;

public class Goods extends ExecuteDB {
    //定义类成员变量
	private long goodsid;
	private int buynumber;
	private long userid;
	private float price;
	private long goodinfoid;
	private String strSql;
public Goods(){
        this.goodsid=0;
	this.buynumber=0;
	this.userid=0;
	this.price=0;
        this.goodinfoid=0;
        this.strSql="";
}
//向GOODS中添加一条新记录
	public boolean add()
	{
		this.strSql="insert into goods ";
		this.strSql=this.strSql + "(buynumber,userid,price,goodinfoid)";
		this.strSql=this.strSql + "values('" + this.buynumber + "','" + this.userid + "','" + this.price + "','" + this.goodinfoid + "')";
		boolean isAdd = super.exeSql(this.strSql);

		return isAdd;
	}
        //删除成员变量中GOODSID对应的商品信息
        public boolean delete()
        {
            this.strSql = "delete from goods where goodsid = ";
            this.strSql = this.strSql + this.goodsid;

            boolean isDelete = super.exeSql(this.strSql);
            return isDelete;
        }
        public boolean delete(String sgoodsid)
        {
            this.strSql = "delete from goods where goodsid in ( ";
            this.strSql = this.strSql + sgoodsid +")";

            boolean isDelete = super.exeSql(this.strSql);
            return isDelete;
        }
        //验证Goodsid和userid是否匹配
        public boolean valid()
        {
            this.strSql = "select * from `goods`";
            this.strSql = this.strSql + " where userid = ' " + this.userid + "'";
            this.strSql = this.strSql + " and goodsid = ' " + this.goodsid + "'";

            try
            {
                ResultSet rs = super.exeQuery(this.strSql);
                if(rs.next())
                    return true;
                else
                    return false;

            }
            catch(Exception e)
            {
                System.out.println(e.toString());
                return false;
            }
        }
        //获取所有订单信息，返回一个ResultSet类型对象
        public ResultSet show_all_goods()
        {
            this.strSql = "select goodsid,buynumber,userid,price,goodinfoid from goods";
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

        //获取成员变量Userid对应的订单信息，返回一个ResultSet类型对象
        public ResultSet show_my_goods()
        {
            this.strSql = "select * from goods where userid = '" + this.userid +"'";
            this.strSql = this.strSql + " order by createtime desc";
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



        //设置类成员变量GoodsID的值
	public void setGoodsid(long goodsid)
	{
		this.goodsid = goodsid;
	}

	//获取类成员变量GoodsID的值
	public long getGoodsid()
	{
		return this.goodsid;
	}


         //设置类成员变量buynumber的值
 	public void setbuynumber(int buynumber)
	{
		this.buynumber = buynumber;
	}

	//获取类成员变量buynumber的值
	public int getbuynumber()
	{
		return this.buynumber;
	}

	 //设置类成员变量GoodsID的值
 	public void setUserid(long userid)
	{
		this.userid = userid;
	}

	//获取类成员变量UserID的值
	public long getUserid()
	{
		return this.userid;
	}

                //设置类成员变量buynumber的值
 	public void setPrice(float price)
	{
		this.price = price;
	}

	//获取类成员变量buynumber的值
	public float getPrice()
	{
		return this.price;
	}

        //设置类成员变量WareID的值
 	public void setGoodinfoid(long goodinfoid)
	{
		this.goodinfoid = goodinfoid;
	}

	//获取类成员变量WareID的值
	public long getGoodinfoid()
	{
		return this.goodinfoid;
	}
	


}
