package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {

    // dùng map để lưu các sp trong giỏ hàng. key = productId, value là 1 sp
    private Map<Integer, CartItem> items = new HashMap<>();

    //hàm thêm sp
    public void add(Product product) {
        //check xem nếu sp đó đã cso rồi thì chỉ cần tăng số lượng sp đó lên thôi (gọi hàm tăng sl đã viết)
        if (items.containsKey(product.getId())) {
            items.get(product.getId()).increase();
        } else {
            //nếu sp đó chưa có trong giỏ thì ta thêm nó vào map
            items.put(product.getId(), new CartItem(product));
        }
    }

    //hàm xóa sp ra khỏi giỏ hàng
    public void remove(int productId) {
        items.remove(productId);
    }

    //hàm tính tổng tiền của cả giỏ hàm (gồm tất cả các sp trong đó)
    public double getTotal() {
        return items.values()
                .stream()
                .mapToDouble(CartItem::getSubTotal)
                .sum();
    }

    //hàm lấy ra 1 sp
    public Map<Integer, CartItem> getItems() {
        return items;
    }
}