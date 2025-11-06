import { listProduct } from './data.js';

// Lấy ID sản phẩm từ URL
function getProductIdFromUrl() {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get('id');
}

// Tìm sản phẩm theo ID
function findProductById(id) {
    return listProduct.find(product => product.idProduct === id);
}

// Render chi tiết sản phẩm
function renderProductDetail(product) {
    const productDetailHtml = `
        <div class="product-images">
            <img src="${product.img}" alt="${product.title}" class="main-image">
            <div class="thumbnail-images">
                <img src="${product.img}" alt="${product.title}">
                <!-- Thêm ảnh thumbnail khác nếu có -->
            </div>
        </div>
        <div class="product-info">
            <p class="product-trademarke">${product.trademarke}</p>
            <h1>${product.title}</h1>
            <div class="product-price">${product.price}</div>
            <div class="product-description">
                <p>Mô tả chi tiết sản phẩm sẽ được hiển thị ở đây...</p>
            </div>
            <div class="product-actions">
                <div class="quantity-selector">
                    <button onclick="decreaseQuantity()">-</button>
                    <input type="number" id="quantity" value="1" min="1">
                    <button onclick="increaseQuantity()">+</button>
                </div>
                <button class="add-to-cart">
                    Thêm vào giỏ hàng <i class="fa-solid fa-cart-plus"></i>
                </button>
                <button class="wishlist-btn">
                    <i class="fa-regular fa-heart"></i>
                </button>
            </div>
            <div class="product-meta">
                <p><strong>Thương hiệu:</strong> ${product.trademarke}</p>
                <p><strong>ID Sản phẩm:</strong> ${product.idProduct}</p>
                <!-- Thêm thông tin khác nếu cần -->
            </div>
        </div>
    `;
    
    document.getElementById('product-detail').innerHTML = productDetailHtml;
}


// Xử lý số lượng sản phẩm
window.decreaseQuantity = function() {
    const input = document.getElementById('quantity');
    if (input.value > 1) {
        input.value = parseInt(input.value) - 1;
    }
}

window.increaseQuantity = function() {
    const input = document.getElementById('quantity');
    input.value = parseInt(input.value) + 1;
}

// Khởi tạo trang
document.addEventListener('DOMContentLoaded', () => {
    const productId = getProductIdFromUrl();
    if (productId) {
        const product = findProductById(productId);
        if (product) {
            renderProductDetail(product);
            renderRelatedProducts(productId);
        } else {
            document.getElementById('product-detail').innerHTML = '<p>Không tìm thấy sản phẩm</p>';
        }
    }
});