package com.ogkm.controller;

import com.ogkm.entity.Outlet;
import com.ogkm.service.ProductService;
import com.ogkm.entity.Product;
import com.ogkm.entity.TypeColor;
import com.ogkm.entity.Size;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/addProduct")
public class AddProductServlet extends HttpServlet {
  private ProductService productService = new ProductService();

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    String singer = request.getParameter("singer");
    String mainCategory = request.getParameter("mainCategory");
    String description = request.getParameter("description");
    int discount = Integer.parseInt(request.getParameter("discount"));
    try {
      if ("music".equals(mainCategory)) {
        // 🎵 音樂商品
        String category = request.getParameter("category");
        double unitPrice = Double.parseDouble(request.getParameter("unitPrice"));
        String photoUrl = request.getParameter("photoUrl");
        String musicUrl = request.getParameter("musicUrl");
        String auditionUrl = request.getParameter("auditionUrl");

        Product product;
        if (discount > 0) { // 有折扣才建 Outlet
          Outlet outlet = new Outlet();
          outlet.setDiscount(discount);
          product = outlet;
        } else {
          product = new Product();
        }
        product.setName(name);
        product.setSinger(singer);
        product.setCategory(category);
        product.setUnitPrice(unitPrice);
        product.setPhotoUrl(photoUrl);
        product.setDescription(description);
        product.setStock(1); // 固定 1
        product.setMusicUrl(musicUrl);
        product.setAuditionUrl(auditionUrl);

        productService.addProduct(product);

      } else if ("merch".equals(mainCategory)) {
        // 🛍️ 周邊商品 (一個產品 + 多個種類 + 多個尺寸)
        Product product = new Product();
        product.setName(name);
        product.setSinger(singer);
        product.setCategory("merch");
        product.setDescription(description);

        int productId = productService.addProduct(product); // 回傳自增 ID

        // 多種類
        String[] typeColorNames = request.getParameterValues("typeColorName");
        String[] PhotoUrls = request.getParameterValues("colorPhotoUrl");
        String[] iconUrls = request.getParameterValues("iconUrl");
        String[] typeStocks = request.getParameterValues("typeStock");

        if (typeColorNames != null) {
          for (int i = 0; i < typeColorNames.length; i++) {
            TypeColor merchTypeColor = new TypeColor();
            merchTypeColor.setTypecolorname(typeColorNames[i]);
            merchTypeColor.setPhotourl(PhotoUrls[i]);
            merchTypeColor.setIconUrl(iconUrls[i]);

            // 計算種類庫存
            int typeStock = 0;
            if(typeStocks != null && typeStocks.length > i &&
                typeStocks[i] != null && !typeStocks[i].isEmpty()) {
              typeStock = Integer.parseInt(typeStocks[i]);
              merchTypeColor.setStock(typeStock);
            }

            productService.addMerchDetail(productId,merchTypeColor);

            // 多尺寸 (全部尺寸一起傳過來，需要依照順序 mapping)
            String[] sizes = request.getParameterValues("size_" + i);
            String[] stocks = request.getParameterValues("stock_" + i);
            String[] prices = request.getParameterValues("merchUnitPrice_" + i);
            String[] ordinals = request.getParameterValues("ordinal_" + i);

            if (sizes != null) {
              for (int j = 0; j < sizes.length; j++) {
                if (sizes[j] == null || sizes[j].trim().isEmpty()) continue;

                Size merchSize = new Size();
                merchSize.setName(sizes[j]);
                merchSize.setStock(Integer.parseInt(stocks[j]));
                merchSize.setUnitprice(Double.parseDouble(prices[j]));
                merchSize.setOrdinal(Integer.parseInt(ordinals[j]));

                productService.addMerchSize(productId,merchTypeColor.getTypecolorname(),merchSize);
              }
            }
          }
        }
      }

      response.sendRedirect("store.jsp");

    } catch (Exception e) {
      e.printStackTrace();
      response.sendRedirect("addProduct.jsp?error=" + e.getMessage());
    }
  }
}

