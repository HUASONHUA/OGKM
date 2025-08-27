package uuu.ogkm.service;

import java.util.List;
import java.util.Set;

import uuu.ogkm.entity.Customer;
import uuu.ogkm.entity.Product;
import uuu.ogkm.entity.Size;
import uuu.ogkm.entity.TypeColor;
import uuu.ogkm.exception.DataInvalidException;
import uuu.ogkm.exception.OGKMException;

public class ProductService {
	private ProductsDAO dao =new ProductsDAO();
    public List<Product> getAllProducts() throws OGKMException {
    	return dao.selectAllProducts();
    }
    
    public List<Product> getAllNewProducts() throws OGKMException {
    	return dao.selectAllNewProducts();
    }
    
    public List<Product> getSelectProductsByName(String keyword) throws OGKMException {
    	return dao.SelectProductsByName(keyword);
    }
    
    public List<Product> getSelectProductsByCategory(String category) throws OGKMException{
		return dao.SelectProductsByCategory(category);
	}
    
    public Product getSelectProductsById(String id) throws OGKMException{
		return dao.SelectProductsById(id);
	}
    
    public List<Product> getselectMusicProductsCustomerById(Customer memberid) throws OGKMException{
		return dao.selectMusicProductsCustomerById(memberid.getId());
	}
    
    public List<Product> getselectProductsBySingerRelated(String singer, String id) throws OGKMException{
		return dao.selectProductsBySingerRelated(singer,id);
	}
    
//    public List<Product> getselectProductsBySongTop10() throws OGKMException{
    	 public List<Product> getselectProductsBySongTop10() throws OGKMException{
		return dao.selectProductsBySongTop10();
	}
//    public List<Product> getselectProductsBySingerTop10() throws OGKMException{
    	 public List<Product> getselectProductsBySingerTop10() throws OGKMException{
		return dao.selectProductsBySingerTop10();
	}
    
    
    
    public Set<Size> getProductSizeSet(String productId, String typecolorname)throws OGKMException{
		return dao.selectProductSizeSet(productId, typecolorname);
	}
	
	public Size getProductSize(String productId, String typecolorname, String sizeName)throws OGKMException{
		if(productId==null || typecolorname==null || sizeName==null) {
			throw new IllegalArgumentException("查詢指定(產品-顏色-尺寸)資料時資料不得為null");
		}
		Size size = dao.selectProductSizeSet(productId, typecolorname, sizeName);
		if (size!=null) {
			return size;
		}else {
			throw new DataInvalidException("查無指定的產品尺寸資料: " + productId+"-"+typecolorname+"-"+sizeName);
		}
	}
	
	public int getProductStock(Product p, TypeColor typecolor, String sizeName) throws OGKMException{
		String typecolorname = typecolor!=null?typecolor.getTypecolorname():"";		 
		if(sizeName==null)sizeName="";
		return dao.selectProductRealTimeStock(p.getId(), typecolorname, sizeName);
	}
    
}
