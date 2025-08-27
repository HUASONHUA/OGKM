package uuu.ogkm.test;

import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.ogkm.entity.Customer;
import uuu.ogkm.exception.DataInvalidException;
import uuu.ogkm.exception.LoginFailException;
import uuu.ogkm.exception.OGKMException;
import uuu.ogkm.service.CustomerService;
public class TestCustomerServiceLogin {

	public static void main(String[] args) {
		CustomerService cs=new CustomerService();
		Customer c;
		try {
			c = cs.login("a123456789", "123456");
			System.out.println(c);
		} catch (LoginFailException e) {
			System.out.println(e.getMessage());//for USER
		}catch (OGKMException e) {
			Logger.getLogger("測試登入").log(
			Level.SEVERE, e.getMessage(),e);
			System.out.println(e.getMessage());//for USER
		}catch (Exception e) {
			Logger.getLogger("測試登入發生非預期錯誤").log(
					Level.SEVERE, e.getMessage(),e);
			System.out.println("登入錯誤"+e.getMessage());
		}	
		System.out.println("END");
	}

}
