package uuu.ogkm.test;


import java.util.logging.Logger;
import java.util.logging.Level;

import uuu.ogkm.exception.OGKMException;
import uuu.ogkm.service.ProductService;

public class TextProductServicegetbySRG2 {

	public static void main(String[] args) {
		ProductService psSRG = new ProductService();
		try {
			System.out.println(psSRG.getselectProductsBySingerRelated("ADO","1"));
		} catch (OGKMException e) {
			Logger.getLogger("測試產品查詢").log(
					Level.SEVERE, e.getMessage(),e);
			
			
		}

	}

}
