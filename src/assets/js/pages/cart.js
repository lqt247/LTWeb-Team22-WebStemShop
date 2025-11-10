document.addEventListener("DOMContentLoaded", () => {

    const deleteButtons = document.querySelectorAll('.delete-btn');

    // add sự kiện click cho từng nút
    deleteButtons.forEach(button => {
        button.addEventListener('click', function () {
            const productContainer = this.closest('.cart-containers-');

            if (productContainer) {
                productContainer.remove();

                // Gọi hàm cập nhật lại tổng tiền(làm sau khi có backend)
                // updateCartTotal();
            }
        });
    });
});