//import { listProduct } from "./data.js";


// -------------------------kiểu xem (view type) ----------------------
const type1 = document.getElementById('head__type1');
const type2 = document.getElementById('head__type2');
const type3 = document.getElementById('head__type3');

const bodyCard = document.querySelector('.list-product__body__card');

const classType1 = 'list-product__body__card';
const classType2 = 'list-product__body__card__type2';
const classType3 = 'list-product__body__card__type3';

type1.addEventListener('click', () => {
    type1.style.backgroundColor = '#FF6C80';
    type2.style.backgroundColor = '#E9E8E7';
    type3.style.backgroundColor = '#E9E8E7';

    if (bodyCard.className === classType2) {
        bodyCard.classList.replace(classType2, classType1)
    } else if (bodyCard.className === classType3) {
        bodyCard.classList.replace(classType3, classType1)
    }
});
type2.addEventListener('click', () => {
    type2.style.backgroundColor = '#FF6C80';
    type1.style.backgroundColor = '#E9E8E7';
    type3.style.backgroundColor = '#E9E8E7';

    if (bodyCard.className === classType1) {
        bodyCard.classList.replace(classType1, classType2)
    } else if (bodyCard.className === classType3) {
        bodyCard.classList.replace(classType3, classType2)
    }
});
type3.addEventListener('click', () => {
    type3.style.backgroundColor = '#FF6C80';
    type1.style.backgroundColor = '#E9E8E7';
    type2.style.backgroundColor = '#E9E8E7';

    if (bodyCard.className === classType1) {
        bodyCard.classList.replace(classType1, classType3)
    } else if (bodyCard.className === classType2) {
        bodyCard.classList.replace(classType2, classType3)
    }
});


// ------------------chuyển trang productdetail----------------------
document.addEventListener("DOMContentLoaded", () => {
    // 1. TÌM TẤT CẢ CÁC THẺ SẢN PHẨM
    const productCards = document.querySelectorAll('.list-product__body__card__container');

    // 2. DUYỆT QUA TỪNG THẺ VÀ GẮN SỰ KIỆN CLICK
    productCards.forEach(card => {
        card.addEventListener('click', function () {
            // Lấy đường dẫn từ thuộc tính data-url mà bạn đã viết trong HTML
            const url = this.getAttribute('data-url');

            // Nếu có đường dẫn thì chuyển trang
            if (url) {
                window.location.href = url;
            } else {
                // Thông báo nếu sản phẩm chưa có trang demo (tùy chọn)
                alert("Sản phẩm này đang cập nhật nội dung!");
            }
        });
    });
});


// ------------chức năng tìm kiếm sp-------------
//lấy ra tất cả các sp
const products = document.querySelectorAll('.list-product__body__card__container')
//lấy ra tên của tất cả các sp
const productName = document.querySelectorAll('.name-product');
//element input
const searchInput = document.getElementById('search-product');

searchInput.addEventListener('input', (e) => {
    const keyword = e.target.value.toLowerCase(); //lấy ra dữ liệu nhập trog input
    productName.forEach((nameElement, index) => {
        const name = nameElement.textContent.toLowerCase(); // Lấy tên sp

        if (name.includes(keyword)) {
            products[index].style.display = "block"; // Hiện sp phù hợp
        } else {
            products[index].style.display = "none";  // Ẩn sp không khớp
        }
    });
})

// -------------------------CHỨC NĂNG LỌC TỔNG HỢP (5 BỘ LỌC)-------------------
const cards = document.querySelectorAll(
    ".list-product__body__card__container"
);

// ================= CATEGORY FILTER =================
document.querySelectorAll(".checkbox-category").forEach(cb => {
    cb.addEventListener("change", filterProducts);
});

// ================= PRICE FILTER =================
document.querySelectorAll(".checkbox-price").forEach(cb => {
    cb.addEventListener("change", filterProducts);
});

// ================= SEARCH =================
document.getElementById("search-product").addEventListener("input", filterProducts);

function filterProducts() {
    const checkedCategories = Array.from(
        document.querySelectorAll(".checkbox-category:checked")
    ).map(cb => cb.value);

    const checkedPrices = Array.from(
        document.querySelectorAll(".checkbox-price:checked")
    ).map(cb => cb.value);

    const keyword = document
        .getElementById("search-product")
        .value.toLowerCase();

    cards.forEach(card => {
        let show = true;

        const category = card.dataset.category;
        const price = Number(card.dataset.price);
        const name = card.dataset.name;

        // ===== CATEGORY =====
        if (checkedCategories.length > 0) {
            show = checkedCategories.includes(category);
        }

        // ===== PRICE =====
        if (show && checkedPrices.length > 0) {
            show = false;
            checkedPrices.forEach(p => {
                if (p === "duoi200" && price < 200000) show = true;
                if (p === "200-1tr" && price >= 200000 && price <= 1000000) show = true;
                if (p === "1tr-2tr" && price > 1000000 && price <= 2000000) show = true;
                if (p === "2tr-4tr" && price > 2000000 && price <= 4000000) show = true;
                if (p === "tren4tr" && price > 4000000) show = true;
            });
        }

        // ===== SEARCH =====
        if (show && keyword) {
            show = name.includes(keyword);
        }

        card.style.display = show ? "block" : "none";
    });
}

// -------------back to top-----------------
const backToTopBtn = document.querySelector('.back-to-top');

//lắng nghe sựu kiện cuộn chuột và gọi function để xử lý sự kiện đó
window.onscroll = function () {
    scrollFunction();
}

function scrollFunction() {
    if(document.documentElement.scrollTop > 300){
        backToTopBtn.style.display = "block";
    } else {
        backToTopBtn.style.display = "none";
    }
}

backToTopBtn.addEventListener('click', () =>{
    window.scrollTo({
        top: 0,
        behavior: "smooth"
    });
});