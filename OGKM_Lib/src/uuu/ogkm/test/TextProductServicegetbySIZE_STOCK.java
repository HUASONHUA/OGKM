package uuu.ogkm.test;


import java.util.logging.Logger;
import java.util.logging.Level;

import uuu.ogkm.entity.Product;
import uuu.ogkm.entity.TypeColor;
import uuu.ogkm.exception.OGKMException;
import uuu.ogkm.service.ProductService;

public class TextProductServicegetbySIZE_STOCK {

	public static void main(String[] args) {
		ProductService ps = new ProductService();
		
		try {
		Product p=ps.getSelectProductsById("24");
		TypeColor c=p.getTypecolor("");
			System.out.println(ps.getProductStock(p,c,"L"));
		} catch (OGKMException e) {
			Logger.getLogger("測試產品查詢").log(
					Level.SEVERE, e.getMessage(),e);
			
			
		}

	}

}
