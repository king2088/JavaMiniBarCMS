package com.bar.mail;
import javax.mail.*;
/**
 *
 * @author Mr.Tao
 * @date 2016-8-4 14:30:16
 * @version V2.0
 * @desc
 */
public class MyAuthenticator extends Authenticator{     
    String userName=null;     
    String password=null; 
          
    public MyAuthenticator(){     
    }     
    public MyAuthenticator(String username, String password) {      
        this.userName = username;      
        this.password = password;      
    }
    @Override
    protected PasswordAuthentication getPasswordAuthentication(){     
        return new PasswordAuthentication(userName, password);
    }     
}     
