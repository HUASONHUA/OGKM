package uuu.ogkm.test;

import java.util.logging.*;

import uuu.ogkm.entity.Customer;
import uuu.ogkm.exception.DataInvalidException;
import uuu.ogkm.exception.LoginFailException;
import uuu.ogkm.exception.OGKMException;
import uuu.ogkm.service.CustomerService;

public class TestCSRegister {

	public static void main(String[] args) throws OGKMException {
	try {	
		Customer c= new Customer();
		c.setId("A181373454");
		c.setName("花八豪");
		c.setEmail("flowertest8@gmail.com");
		c.setPassword("112345");
		c.setBirthday("1111-11-11");
		c.setGender(Customer.MALE);
		c.setAddress("XXXXXXXX");
		c.setPhone("0987654321");
		c.setSubscribed(true);
		
		CustomerService cs=new CustomerService();
		
			cs.register(c);
		}catch (DataInvalidException e) {
			System.out.println(e.getMessage());//for USER
		} catch (OGKMException e) {
Logger.getLogger("測試註冊會員").log(Level.SEVERE,e.getMessage(),e);

		}catch (Exception e) {
			Logger.getLogger("註冊會員").log(
					Level.SEVERE,"註冊發生非預期錯誤"+ e.getMessage(),e);
			System.out.println("註冊錯誤"+e.getMessage());
		}	
	}

}
