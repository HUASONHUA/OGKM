package uuu.ogkm.test;


import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.ogkm.entity.TypeColor;
import uuu.ogkm.entity.Product;
import uuu.ogkm.exception.OGKMException;
import uuu.ogkm.service.ProductService;

public class TextProductServicegetbyId {

	public static void main(String[] args) {
		ProductService ps = new ProductService();
		try {
			Product p=(ps.getSelectProductsById("24"));
			System.out.println(p.hasSize());
			System.out.println(p);
			
			if(p.getTypecolorMapsize()>0) {
			Collection<TypeColor> collection =p.getTypecolorMapvalues();
			System.out.println(collection);
			for(TypeColor color:collection) {
				System.out.println(collection);
			}	
			
			}
			//最好ProductDAO以外的產品加入種類
//			TypeColor piano = new TypeColor();
//			piano.setMusictypel("piano");
//			p.add(piano);
//			System.out.println(p.getMusictypel());
			
		} catch (OGKMException e) {
			Logger.getLogger("測試產品查詢").log(
					Level.SEVERE, e.getMessage(),e);
			
			
		}

	}

}
