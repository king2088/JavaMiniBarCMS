<%@ page contentType="image/jpeg" import="java.awt.*,java.awt.image.*,java.util.*,javax.imageio.*" %>
<%!
	Color getRandColor(int fc,int bc)
	{
        Random random = new Random();
        if(fc>255) fc=255;
        if(bc>255) bc=255;
        int r=fc+random.nextInt(bc-fc);
        int g=fc+random.nextInt(bc-fc);
        int b=fc+random.nextInt(bc-fc);
        return new Color(r,g,b);
	}
	response.setHeader("Pragma","No-cache");
	response.setHeader("Cache-Control","no-cache");
	response.setDateHeader("Expires", 0);

	int iwidth=60;
	int iheight=20;
	BufferedImage image = new BufferedImage(iwidth,iheight,BufferedImage.TYPE_INT_RGB);

	Graphics g = image.getGraphics();

	Random random = new Random();

	g.setColor(getRandColor(200,250));
	g.fillRect(0, 0, iwidth, iheight);

	g.setFont(new Font("Times New Roman",Font.PLAIN,18));

	g.setColor(getRandColor(160,200));
	for (int i=0;i<155;i++)
	{
		int ix = random.nextInt(iwidth);
		int iy = random.nextInt(iheight);
		int ixl = random.nextInt(12);
		int iyl = random.nextInt(12);
		g.drawLine(ix,iy,ix+ixl,iy+iyl);
	}

	String sRand="";
	for (int i=0;i<4;i++)
	{
		String rand=String.valueOf(random.nextInt(10));
		sRand+=rand;
		
		g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));
		g.drawString(rand,13*i+6,16);
	}

	session.setAttribute("Rand",sRand);

	g.dispose();
	
	ImageIO.write(image, "JPEG", response.getOutputStream());
%>
