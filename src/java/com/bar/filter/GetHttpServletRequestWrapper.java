package com.bar.filter;

/**
 *
 * @author Mr.Tao
 * @date 2016-9-2 12:17:54
 * @version V2.0
 * @desc 将字符编码转换的工作添加到getParameter()方法中
 */
import java.io.UnsupportedEncodingException;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletRequestWrapper;  
  
public class GetHttpServletRequestWrapper extends HttpServletRequestWrapper {  
  
    private String charset = "GB2312";  
  
    public GetHttpServletRequestWrapper(HttpServletRequest request) {  
        super(request);  
    }  
  
    /** 
     * 获得被装饰对象的引用和采用的字符编码 
     * @param request 
     * @param charset 
     */  
    public GetHttpServletRequestWrapper(HttpServletRequest request,String charset) {  
        super(request);  
        this.charset = charset;  
    }  
  
    /** 
     * 实际上就是调用被包装的请求对象的getParameter方法获得参数，然后再进行编码转换 
     * @param name
     * @return name
     */  
    @Override
    public String getParameter(String name) {  
        String value = super.getParameter(name);  
        value = value == null ? null : convert(value);  
        return value;  
    }  
  
    public String convert(String target) {  
        System.out.println("编码转换之前：" + target);
        try {  
            return new String(target.trim().getBytes("ISO-8859-1"), charset);  
        } catch (UnsupportedEncodingException e) {
            return target;
        }
    }
}
