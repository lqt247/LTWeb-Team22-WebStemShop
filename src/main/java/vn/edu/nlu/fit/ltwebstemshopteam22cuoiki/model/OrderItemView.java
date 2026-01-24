package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model;

public class OrderItemView {
    private int orderId;
    private String productName;
    private String image;
    private int quantity;
    private double price;

    public OrderItemView(int orderId, String productName, String image, int quantity, double price) {
        this.orderId = orderId;
        this.productName = productName;
        this.image = image;
        this.quantity = quantity;
        this.price = price;
    }

    public int getOrderId() { return orderId; }
    public String getProductName() { return productName; }
    public String getImage() { return image; }
    public int getQuantity() { return quantity; }
    public double getPrice() { return price; }
}