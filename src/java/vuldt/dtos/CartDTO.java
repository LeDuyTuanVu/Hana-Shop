/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuldt.dtos;

import java.util.ArrayList;

/**
 *
 * @author Le Duy Tuan Vu
 */
public class CartDTO {

    ArrayList<ProductDTO> cart;

    public CartDTO() {

    }

    public CartDTO(ArrayList<ProductDTO> cart) {
        this.cart = cart;
    }

    public ArrayList<ProductDTO> getCart() {
        return cart;
    }

    public void setCart(ArrayList<ProductDTO> cart) {
        this.cart = cart;
    }

    public boolean checkExist(ProductDTO product) {
        for (ProductDTO pro : cart) {
            if (pro.productID.equals(product.productID)) {
                return false;
            }
        }
        return true;
    }

    public boolean addProduct(ProductDTO product) {
        if (cart == null) {
            cart = new ArrayList<>();
        }
        if (checkExist(product)) {
            product.setQuantity(1);
            cart.add(product);
            return true;
        } else {
            for (ProductDTO pro : cart) {
                if (pro.productID.equals(product.productID)) {
                    pro.setQuantity(pro.getQuantity() + 1);
                    return true;
                }
            }
        }
        return false;
    }

    public float getTotal() {
        float total = 0;
        if (cart == null) {
            return 0;
        } else {
            for (ProductDTO pro : cart) {
                total = total + (pro.price * pro.quantity);
            }
            return total;
        }
    }

    public boolean deleteProduct(String productID) {
        if (cart == null) {
            return false;
        } else {
            for (int i = 0; i < cart.size(); i++) {
                if (productID.equals(cart.get(i).productID)) {
                    cart.remove(cart.get(i));
                    return true;
                }
            }
        }
        return false;
    }

    public void changeList(ArrayList<ProductDTO> list) {
        cart = new ArrayList<>();
        cart = list;
    }

    public int getQuantityByID(String productID) {
        int quantity = 0;
        if (cart == null) {
            return quantity;
        } else {
            for (int i = 0; i < cart.size(); i++) {
                if (productID.equals(cart.get(i).productID)) {
                    quantity = cart.get(i).quantity;
                }
            }
        }
        return quantity;
    }
}
