<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head>
    <title>Chi tiết sản phẩm</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/product-detail.css">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>

<body>
<style>
    .rating{
        display: flex;
        flex-direction: column;
        width: 30%;
    }
    .rating i {
        font-size: 2rem;
        color: #ec8b0b;
    }
    .rating label input{
        font-size: 2rem;
    }
    .form-reviews{
        display: flex;
    }
    .review__rate{
        width: 50%;
    }
    .review__comment{
        flex:1;
    }
    .review__comment textarea{
        width: 100%;
        height: 35%;
    }
</style>

<!-- HEADER -->
<jsp:include page="/WEB-INF/components/header.jsp"/>

<main>

    <!-- breadcrumb -->
    <div class="back">
        <a href="${pageContext.request.contextPath}/index.jsp">Trang chủ</a>
        <span>/</span>
        <a href="${pageContext.request.contextPath}/shop">Cửa hàng</a>
        <span>/</span>
        <a href="#">Chi tiết sản phẩm</a>
    </div>

    <!-- ================= PRODUCT DETAIL ================= -->
    <div class="product-detail">

        <!-- LEFT: IMAGES -->
        <div class="product-images">
            <!-- MAIN IMAGE -->
            <c:if test="${not empty images}">
                <img class="main-image"
                     src="${pageContext.request.contextPath}/${images[0].imageUrl}"
                     alt="${product.productName}">
            </c:if>

            <!-- THUMBNAILS -->
            <div class="thumbnail-images">
                <c:forEach var="img" items="${images}">
                    <img src="${pageContext.request.contextPath}/${img.imageUrl}"
                         alt="${product.productName}">
                </c:forEach>
            </div>

        </div>

        <!-- RIGHT: INFO -->
        <div class="product-info">
            <h1>${product.productName}</h1>

            <div class="product-price">
                ${product.price} Đ
            </div>

            <div class="product-description">
                <ul>
                    <li><i class="fa-solid fa-check-double"></i> Hàng chính hãng</li>
                    <li><i class="fa-solid fa-check-double"></i> Miễn phí giao hàng đơn trên 500K</li>
                    <li><i class="fa-solid fa-check-double"></i> Giao hàng hỏa tốc 4 tiếng</li>
                    <li><i class="fa-solid fa-check-double"></i> Hỗ trợ trả góp đơn hàng từ 3 triệu. <a
                            href="${pageContext.request.contextPath}/view/shop/chinh-sach-tra-gop.jsp" target="_blank">Xem chi tiết</a></li>
                </ul>
            </div>

            <div class="product-actions">
                <a href="${pageContext.request.contextPath}/add-to-cart?id=${product.id}">
                    <button class="add-to-cart">
                        Thêm vào giỏ hàng <i class="fa-solid fa-cart-plus"></i>
                    </button>
                </a>

                <button class="wishlist-btn">
                    <i class="fa-solid fa-heart" style="color:#FF6C80"></i>
                </button>
            </div>

            <div class="product-meta">
                <p><strong>Thương hiệu:</strong> ${product.brandName}</p>
                <p><strong>ID sản phẩm:</strong> ${product.id}</p>
            </div>
        </div>
    </div>

    <!-- ================= DESCRIPTION ================= -->
    <div class="productDecription">
        <div class="tabContent">
            <h2>Mô tả sản phẩm</h2>
            <p>
                ${product.description}
            </p>
        </div>
    </div>

    <!-- ================= TRUST BADGE ================= -->
    <div class="trust-badge__container">
        <ul>
            <li>
                <img src="${pageContext.request.contextPath}/assets/images/product-detail/chinh-hang.png">
                <p>Sản phẩm chính hãng 100%</p>
            </li>
            <li>
                <img src="${pageContext.request.contextPath}/assets/images/product-detail/an-toan.png">
                <p>Nhựa an toàn cho trẻ em</p>
            </li>
            <li>
                <img src="${pageContext.request.contextPath}/assets/images/product-detail/giao-hang.png">
                <p>Miễn phí giao hàng từ 500K</p>
            </li>
            <li>
                <img src="${pageContext.request.contextPath}/assets/images/product-detail/hoa-toc.png">
                <p>Giao hàng hỏa tốc 4 tiếng</p>
            </li>
        </ul>
    </div>

    <!-- ================= REVIEW (STATIC) ================= -->
    <div class="evaluate-product">
        <h2>Đánh giá sản phẩm</h2>
        <div class="evaluate-product__containers">
            <form action="${pageContext.request.contextPath}/review" method="post">
                <input type="hidden" name="productId" value="${product.id}">
                <div  class="form-reviews">
                    <div class="review__rate">
                        <h3>Đánh giá trung bình: ${avgRating} / 5</h3> <br>
                        <div class="rating">
                            <label>
                                <input type="radio" name="rating" value="5" required>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                            </label>

                            <label>
                                <input type="radio" name="rating" value="4">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                            </label>

                            <label>
                                <input type="radio" name="rating" value="3">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                            </label>

                            <label>
                                <input type="radio" name="rating" value="2">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                            </label>

                            <label>
                                <input type="radio" name="rating" value="1">
                                <i class="fa-solid fa-star"></i>
                            </label>
                        </div>
                    </div>

                    <div class="review__comment">
                        <h3>Bình luận sản phẩm:</h3><br>
                        <div class="evaluate-product__comment">
                            <p>Chưa có bình luận nào, hãy chia sẻ đánh giá của bạn.</p>
                            <textarea name="comment" placeholder="Nhận xét của bạn"></textarea><br>
                            <button>Viết đánh giá</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

</main>

<!-- FOOTER -->
<jsp:include page="/WEB-INF/components/footer.jsp"/>
<%--hàm đổi ản khi click vào thumbnail--%>
<script>
    const mainImage = document.querySelector('.main-image');
    const thumbnails = document.querySelectorAll('.thumbnail-images img');

    thumbnails.forEach(img => {
        img.addEventListener('click', () => {
            mainImage.src = img.src;
        });
    });
</script>
</body>
</html>
