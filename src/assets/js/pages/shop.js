//import { listProduct } from "./data.js";

// const pageSize = 10; // Số sản phẩm muốn hiển thị trên 1 trang
// let currentPage = 1; // Trang hiện tại
// const totalPages = Math.ceil(listProduct.length / pageSize); // Tổng số trang cần có

// // --- LẤY CÁC PHẦN TỬ HTML ---
// const productCardContainer = document.getElementById("list-product__body__card");
// const paginationContainer = document.querySelector(".list-product__body__pagination");
// const prevButton = paginationContainer.querySelector('.fa-rotate-180');
// const nextButton = paginationContainer.querySelector('.fa-play');
// const pageNumbersList = paginationContainer.querySelector('ul');

// // Make viewDetail a global function
// window.viewDetail = function(id) {
//     window.location.href = `product-detail.html?id=${id}`;
// };
// // RENDER SẢN PHẨM ---
// function renderProducts(page) {
//     currentPage = page; // Cập nhật trạng thái trang hiện tại

//     // 1. Tính toán vị trí bắt đầu và kết thúc của mảng con
//     const startIndex = (currentPage - 1) * pageSize;
//     const endIndex = currentPage * pageSize;

//     // 2. Cắt mảng để lấy sản phẩm của trang hiện tại
//     const productsForPage = listProduct.slice(startIndex, endIndex);

//     // 3. Tạo chuỗi HTML và chèn vào DOM
//     const listCardHTML = productsForPage.map((item) =>
//         ` 
//         <div class="list-product__body__card__container" data-id="${item.idProduct}">
//             <img src="${item.img}" alt="${item.title}">
//             <div class="list-product__body__card__content">    
//                 <p>${item.trademarke}</p>
//                 <div class="list-product__body__card__content__title">
//                     <h5>${item.title}</h5>
//                 </div>
//                 <h4>${item.price}</h4>
//                 <div class="list-product__body__card__addCard">
//                     <button>Thêm vào giỏ hàng</button>
//                     <i class="fa-regular fa-heart"></i>
//                 </div>
//                 <div class="list-product__body__card__evaluate">
//                     <i class="fa-solid fa-star"></i>
//                     <i class="fa-solid fa-star"></i>
//                     <i class="fa-solid fa-star"></i>
//                     <i class="fa-solid fa-star"></i>
//                     <i class="fa-solid fa-star"></i>
//                 </div>
//             </div>
//         </div>
//         `
//     ).join("");

//     productCardContainer.innerHTML = listCardHTML;
    
//     // Add click event listeners
//     document.querySelectorAll('.list-product__body__card__container').forEach(card => {
//         card.addEventListener('click', function() {
//             const id = this.getAttribute('data-id');
//             viewDetail(id);
//         });
//     });
// }

// // --- RENDER THANH PHÂN TRANG ---
// function renderPagination() {
//     pageNumbersList.innerHTML = ''; // Xóa các nút trang cũ

//     // Hiển thị tối đa 5 nút trang (hoặc tùy bạn)
//     const maxVisiblePages = 5;
//     let startPage = Math.max(1, currentPage - Math.floor(maxVisiblePages / 2));
//     let endPage = Math.min(totalPages, startPage + maxVisiblePages - 1);

//     // Điều chỉnh lại startPage nếu cần
//     if (endPage - startPage + 1 < maxVisiblePages) {
//         startPage = Math.max(1, endPage - maxVisiblePages + 1);
//     }

//     // 1. Thêm nút ... ở đầu nếu cần
//     if (startPage > 1) {
//         pageNumbersList.innerHTML += '<li>...</li>';
//     }

//     // 2. Thêm các nút số trang
//     for (let i = startPage; i <= endPage; i++) {
//         const li = document.createElement('li');
//         li.textContent = i;
//         li.classList.add('page-item');

//         // Đánh dấu trang hiện tại
//         if (i === currentPage) {
//             li.style.backgroundColor = '#FF6C80';
//             li.style.color = 'white';
//         }

//         // Thêm sự kiện click
//         li.addEventListener('click', () => {
//             renderProducts(i);
//             renderPagination(); // Render lại thanh phân trang sau khi chuyển trang
//         });
//         pageNumbersList.appendChild(li);
//     }

//     // 3. Thêm nút ... ở cuối nếu cần
//     if (endPage < totalPages) {
//         pageNumbersList.innerHTML += '<li>...</li>';
//     }

//     // 4. Xử lý trạng thái nút PREV/NEXT
//     prevButton.style.opacity = currentPage === 1 ? '0.5' : '1';
//     prevButton.style.pointerEvents = currentPage === 1 ? 'none' : 'auto';

//     nextButton.style.opacity = currentPage === totalPages ? '0.5' : '1';
//     nextButton.style.pointerEvents = currentPage === totalPages ? 'none' : 'auto';
// }


// // --- CHUYỂN TRANG (PREV/NEXT) ---
// prevButton.addEventListener('click', () => {
//     if (currentPage > 1) {
//         renderProducts(currentPage - 1);
//         renderPagination();
//     }
// });

// nextButton.addEventListener('click', () => {
//     if (currentPage < totalPages) {
//         renderProducts(currentPage + 1);
//         renderPagination();
//     }
// });


// // --- KHỞI CHẠY LẦN ĐẦU KHI TRANG LOAD XONG ---
// document.addEventListener("DOMContentLoaded", () => {
//     // Chỉ gọi hàm này sau khi các thành phần DOM đã được load
//     renderProducts(currentPage);
//     renderPagination();
// });

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

    if(bodyCard.className === classType2 ) {
        bodyCard.classList.replace(classType2, classType1)
    }else if (bodyCard.className === classType3){
        bodyCard.classList.replace(classType3, classType1)
    }
});
type2.addEventListener('click', () => {
    type2.style.backgroundColor = '#FF6C80';
    type1.style.backgroundColor = '#E9E8E7';
    type3.style.backgroundColor = '#E9E8E7';

    if(bodyCard.className === classType1 ) {
        bodyCard.classList.replace(classType1, classType2)
    }else if (bodyCard.className === classType3){
        bodyCard.classList.replace(classType3, classType2)
    }
});
type3.addEventListener('click', () => {
    type3.style.backgroundColor = '#FF6C80';
    type1.style.backgroundColor = '#E9E8E7';
    type2.style.backgroundColor = '#E9E8E7';

    if(bodyCard.className === classType1 ) {
        bodyCard.classList.replace(classType1, classType3)
    }else if (bodyCard.className === classType2){
        bodyCard.classList.replace(classType2, classType3)
    }
});

//--------------------Catalog----------------------
const iconPlusDoChoiLapRap = document.getElementById('iconPlusDoChoiLapRap');
const listCatalog = document.getElementById('listDoChoiLapRap');
//show
iconPlusDoChoiLapRap.addEventListener('click', () => {
    if(iconPlusDoChoiLapRap.className === 'fa-plus'){
        iconPlusDoChoiLapRap.classList.replace('fa-plus', 'fa-minus')
        listCatalog.style.display = 'block';
    }

})

// ------------------chuyển trang productdetail----------------------
document.addEventListener("DOMContentLoaded", () => {
    // 1. TÌM TẤT CẢ CÁC THẺ SẢN PHẨM
    const productCards = document.querySelectorAll('.list-product__body__card__container');

    // 2. DUYỆT QUA TỪNG THẺ VÀ GẮN SỰ KIỆN CLICK
    productCards.forEach(card => {
        card.addEventListener('click', function() {
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
