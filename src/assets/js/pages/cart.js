document.addEventListener("DOMContentLoaded", () => {

    // 1. HÀM HỖ TRỢ: ĐỊNH DẠNG TIỀN (Ví dụ: 1779000 -> 1.779.000 Đ)
    function formatMoney(amount) {
        return amount.toLocaleString('vi-VN') + ' Đ';
    }

    // 2. TÌM TẤT CẢ CÁC DÒNG SẢN PHẨM
    const productRows = document.querySelectorAll('.cart-containers-');

    // 3. DUYỆT QUA TỪNG DÒNG VÀ GẮN SỰ KIỆN CHO CÁC NÚT BÊN TRONG NÓ
    productRows.forEach(row => {
        // Tìm các phần tử CHỈ BÊN TRONG dòng hiện tại (row)
        const decreaseBtn = row.querySelector('.decrease-btn');
        const increaseBtn = row.querySelector('.increase-btn'); // Sửa lại class HTML của bạn cho đúng nhé, nút + phải là .increase-btn
        const quantityElem = row.querySelector('.quantity-value');
        const priceElem = row.querySelector('.product-line-price');
        const deleteBtn = row.querySelector('.delete-btn');

        // Lấy giá gốc từ data-unit-price (đã cài sẵn trong HTML)
        const unitPrice = parseInt(priceElem.getAttribute('data-unit-price'));

        // --- XỬ LÝ NÚT GIẢM (-) ---
        if (decreaseBtn) { // Kiểm tra tồn tại để tránh lỗi
            decreaseBtn.addEventListener('click', () => {
                let currentQty = parseInt(quantityElem.textContent);
                if (currentQty > 1) {
                    currentQty--; // Giảm số lượng
                    quantityElem.textContent = currentQty; // Cập nhật số lượng hiển thị
                    // Cập nhật giá tiền mới = số lượng mới * giá gốc
                    priceElem.textContent = formatMoney(currentQty * unitPrice);
                }
            });
        }

        // --- XỬ LÝ NÚT TĂNG (+) ---
        // Bạn cần sửa lại HTML: thêm class 'increase-btn' cho thẻ <i> icon dấu cộng
        if (increaseBtn) {
             increaseBtn.addEventListener('click', () => {
                let currentQty = parseInt(quantityElem.textContent);
                currentQty++; // Tăng số lượng
                quantityElem.textContent = currentQty;
                priceElem.textContent = formatMoney(currentQty * unitPrice);
            });
        }

        // --- XỬ LÝ NÚT XÓA (Thùng rác) ---
        if (deleteBtn) {
            deleteBtn.addEventListener('click', () => {
                 // 'row' chính là dòng sản phẩm hiện tại đang được duyệt
                 row.remove();
                 // Sau này sẽ thêm hàm cập nhật tổng tiền ở đây
            });
        }
    });

});