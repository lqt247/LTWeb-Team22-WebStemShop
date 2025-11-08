import { listProduct } from './data.js';


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