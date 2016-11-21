<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="com.jspsmart.upload.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<jsp:useBean scope="page" id="Goodinfo" class="com.bar.db.Goodinfo" />

	</head>
	<body bgcolor="#F4FFFE">
	<div align=center>
	<%
            request.setCharacterEncoding("gb2312");
		try
		{
                    //.getBytes()
			// 新建一个SmartUpload对象
			SmartUpload su = new SmartUpload();
			// 上传初始化
			su.initialize(pageContext);
			//设定上传限制
			//限制每个上传文件的最大长度。
			su.setMaxFileSize(1000000*8);
			//设定允许上传的文件（通过扩展名限制）
			su.setAllowedFilesList("jpg,gif,bmp,JPG,GIF,BMP,png,PNG");
			// 上传文件
			su.upload();		
			String sGoodinfoid=su.getRequest().getParameter("Goodinfoid");
			long lGoodinfoid = Long.parseLong(sGoodinfoid);
			Goodinfo.init();

			String sGoodinfoname=su.getRequest().getParameter("Goodinfoname");
			String sAddr=su.getRequest().getParameter("Addr");
			String sIntro=su.getRequest().getParameter("Intro");
			String sCompany=su.getRequest().getParameter("Company");
			String sPrice=su.getRequest().getParameter("Price");
			String sNum=su.getRequest().getParameter("Num");
			int Num = Integer.parseInt(sNum);
			float fPrice = Float.parseFloat(sPrice);
                        String sPicUrl="";
			//判断是否有附件上传
			com.jspsmart.upload.File file = su.getFiles().getFile(0);
			if (!file.isMissing())
			{
				String sPic=file.getFileName();	
				//将附件以 当前时间+附件扩展名 作为文件名保存		
				java.text.SimpleDateFormat dateFormatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
				String sNowTime = dateFormatter.format(new java.util.Date());
				sPicUrl = sNowTime+"."+ file.getFileExt();
				file.saveAs("./pic/"+sPicUrl);
			}else{
                            //为了防止没有上传图片而覆盖了之前的图片地址
                                sPicUrl=su.getRequest().getParameter("Picurl1");
                        }
			//将文章信息保存到数据库中
			Goodinfo.setGoodinfoid(lGoodinfoid);
			Goodinfo.setGoodinfoname(sGoodinfoname);
			Goodinfo.setCompany(sCompany);
			Goodinfo.setAddr(sAddr);
			Goodinfo.setNum(Num);
			Goodinfo.setPrice(fPrice);
			Goodinfo.setIntro(sIntro);
			Goodinfo.setPicurl(sPicUrl);
			if(Goodinfo.updata())
			{
				out.println("<p><font color=blue>商品信息修改成功</font></p>");
				out.println("<input type=button name=btn1 value=\"返回商品管理\" onClick='window.location=\"./goods_list.jsp\"'>");
			}
			else
			{
				out.println("<p><font color=red>商品信息修改失败，请重试</font></p>");
                                out.println(lGoodinfoid+","+sGoodinfoname+","+sCompany+","+sAddr+","+Num+","+fPrice+","+sIntro+","+sPicUrl);
				out.println("<input type=button name=btn2 value=\"返回\" onClick='window.history.go(-1)'>");
				return;
			}
		}
		catch(Exception e)
		{
			out.println("<p><font color=red>您上传的文件格式不对，或者上传文件太大！</font></p>"+e);
			out.println("<input type=button name=btn3 value=返回 onClick='window.history.go(-1)'>");
			return;
		}
	%>
	</div>
	</body>
</html>
