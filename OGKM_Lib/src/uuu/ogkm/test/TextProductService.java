package uuu.ogkm.test;


import java.util.logging.Logger;
import java.util.logging.Level;

import uuu.ogkm.exception.OGKMException;
import uuu.ogkm.service.ProductService;

public class TextProductService {

	public static void main(String[] args) {
		ProductService ps = new ProductService();
		try {
			System.out.println(ps.getAllProducts());
		} catch (OGKMException e) {
			Logger.getLogger("測試產品查詢").log(
					Level.SEVERE, e.getMessage(),e);
			
			
		}

	}

}
