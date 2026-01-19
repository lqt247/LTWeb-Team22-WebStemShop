package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model;

public class Product {
    private int id;
    private int categoriesID;
    private int brandID;
    private String productName;
    private String description;
    private double price;
    private int quantity;
    private String imageUrl;
    private String brandName;

    public Product(int id, int categoriesID, int brandID, String productName, String description, double price, int quantity, String imageUrl, String  brandName) {
        this.id = id;
        this.categoriesID = categoriesID;
        this.brandID = brandID;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.imageUrl = imageUrl;
        this.brandName = brandName;
    }

    public Product() {
    }

    public int getId() {
        return id;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategoriesID() {
        return categoriesID;
    }

    public void setCategoriesID(int categoriesID) {
        this.categoriesID = categoriesID;
    }

    public int getBrandID() {
        return brandID;
    }

    public void setBrandID(int brandID) {
        this.brandID = brandID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }
}
