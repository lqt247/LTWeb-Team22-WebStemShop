<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--JSTL--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head>
    <title>Cửa hàng</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/shop.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>
    <%--header--%>
<%--    <jsp:include page="/WEB-INF/components/header.jsp" />--%>

    <%--main--%>
    <main>
        <div class="back">
            <a href="${pageContext.request.contextPath}/index.jsp">Trang Chủ</a>
            <span>/</span>
            <a href="#">Cửa Hàng</a>
        </div>

        <div class="products">

            <div class="product">
                <!--       Danh Mục         -->
                <div class="product__category product__categorys ">
                    <h2>Danh Mục</h2>
                    <ul>
                        <li>
                            <input type="checkbox" class="checkbox-category" value="lego">
                            <span>LEGO</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checkbox-category" value="robot">
                            <span>Robot</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checkbox-category" value="sang-tao">
                            <span>Đồ chơi sáng tạo</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checkbox-category" value="xe-tap-di">
                            <span>Xe tập đi</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checkbox-category" value="dat-nan">
                            <span>Đất nặn</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checkbox-category" value="dung-cu-hoc-tap">
                            <span>Dụng cụ học tập</span>
                        </li>
                    </ul>
                </div>

                <!--       Khoảng Giá         -->
                <div class="product__category product__price">
                    <h2>Giá</h2>
                    <ul>
                        <li>
                            <input type="checkbox" class="checkbox-price" value="duoi200">
                            <span>Dưới 200.000 Đ</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checkbox-price" value="200-1tr">
                            <span>200.000 Đ - 1.000.000 Đ</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checkbox-price" value="1tr-2tr">
                            <span>1.000.000 Đ - 2.000.000 Đ</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checkbox-price" value="2tr-4tr">
                            <span>2.000.000 Đ - 4.000.000 Đ</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checkbox-price" value="tren4tr">
                            <span>Trên 4.000.000 Đ</span>
                        </li>

                    </ul>
                </div>

                <!--       Độ tuổi         -->
                <div class="product__category product__age">
                    <h2>Tuổi</h2>
                    <ul>
                        <li>
                            <input type="checkbox" class="checkbox-age" value="1-3">
                            <span>1-3 tuổi</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checkbox-age" value="3-6">
                            <span>3-6 tuổi</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checkbox-age" value="6-12">
                            <span>6-12 tuổi</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checkbox-age" value="tren12">
                            <span>12 tuổi trở lên</span>
                        </li>
                    </ul>
                </div>

                <!--       Giới tính         -->
                <div class="product__category product__sex">
                    <h2>Giớ tính</h2>
                    <ul>
                        <li>
                            <input type="checkbox" value="nam" class="checkbox-sex">
                            <span>Nam</span>
                        </li>
                        <li>
                            <input type="checkbox" value="nu" class="checkbox-sex">
                            <span>Nữ</span>
                        </li>
                    </ul>
                </div>

                <!--       Thương hiêu         -->
                <div class="product__category product__trademark">
                    <h2>Thương Hiệu</h2>
                    <ul>
                        <li>
                            <input type="checkbox" value="VTECH" class="checkbox-brand">
                            <span>VTECH</span>
                        </li>
                        <li>
                            <input type="checkbox" value="SWEET HEART" class="checkbox-brand"> <span>SWEET HEART </span>
                        </li>
                        <li>
                            <input type="checkbox" value="PLAYDOH" class="checkbox-brand">
                            <span>PLAYDOH</span>
                        </li>
                        <li>
                            <input type="checkbox" value="SPHERO" class="checkbox-brand">
                            <span>SPHERO</span>
                        </li>
                        <li>
                            <input type="checkbox" value="JAPACE" class="checkbox-brand">
                            <span>JAPACE</span>
                        </li>
                        <li>
                            <input type="checkbox" value="STEAM" class="checkbox-brand">
                            <span>STEAM</span>
                        </li>
                        <li>
                            <input type="checkbox" value="LEGO MINECRAFT" class="checkbox-brand"> <span>LEGO MINECRAFT</span>
                        </li>
                        <li>
                            <input type="checkbox" value="Brain Teaser" class="checkbox-brand"> <span>Brain Teaser</span>
                        </li>
                        <li>
                            <input type="checkbox" value="May Art & Craft" class="checkbox-brand"> <span>May Art & Craft</span>
                        </li>
                        <li>
                            <input type="checkbox" value="Brain Teaser" class="checkbox-brand"> <span>Brain Teaser</span>
                        </li>
                    </ul>
                </div>
            </div>

            <!--      List Sản Phẩm      -->
            <div class="list-product">
                <div class="list-product__head">
                    <div class="list-product__head__type">
                        <span>Kiểu xem: </span>
                        <ul>
                            <li id="head__type1"><i class="fa-solid fa-bars"></i></li>
                            <li id="head__type2"><i class="fa-solid fa-grip-lines-vertical"></i></li>
                            <li id="head__type3"><i class="fa-solid fa-bars fa-rotate-90"></i></li>
                        </ul>


                    </div>

                    <div class="list-product__head__search">
                        <span>Tìm kiếm: </span>
                        <input type="text" placeholder="Nhập tên sản phẩm" id="search-product">
                    </div>

                    <div class="list-product__head__arrange">
                        <span>Sắp xếp theo: </span>
                        <select name="" id="">
                            <option selected value="">Mặc định</option>
                            <option value="">Sản phẩm huyến mãi</option>
                            <option value="">Bán chạy</option>
                            <option value="">Sắp xếp theo A-Z</option>
                            <option value="">Sắp xếp theo Z-A</option>
                            <option value="">Giá giảm dần</option>
                            <option value="">Giá tăng dần</option>
                        </select>
                    </div>
                </div>

                <div class="list-product__body">
                    <div class="list-product__body__card" id="list-product__body__card">
                        <h1>Demo</h1>
                        <c:forEach var="p" items="${products}">
                            <div class="list-product__body__card__container"
                                 data-category="${p.categoryId}"
                                 data-brand="${p.brandId}">

                                <img src="${pageContext.request.contextPath}/assets/images/shop/xe-tap-di-da-nang.jpg"
                                     alt="${p.productName}">

                                <div class="list-product__body__card__content">
                                    <p class="brand">${p.brandId}</p>

                                    <div class="list-product__body__card__content__title">
                                        <h5 class="name-product">${p.productName}</h5>
                                    </div>

                                    <h4 class="product-price">
                                            ${p.price} Đ
                                    </h4>

                                    <div class="list-product__body__card__addCard">
                                        <a href="${pageContext.request.contextPath}/add-to-cart?id=${p.id}">
                                            <button class="add-to-cart">Thêm vào giỏ hàng</button>
                                        </a>
                                        <i class="fa-solid fa-heart"></i>
                                    </div>

                                    <div class="list-product__body__card__evaluate">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="list-product__body__pagination">
                        <i class="fa-solid fa-play fa-rotate-180"></i>
                        <ul>
                            <li>1</li>
                            <li>2</li>
                            <li>3</li>
                            <li>4</li>
                            <li>5</li>
                            <li>...</li>
                        </ul>
                        <i class="fa-solid fa-play"></i>
                    </div>
                </div>
            </div>

        </div>

        <div class="back-to-top">
            <img src="${pageContext.request.contextPath}/assets/images/shop/back-to-top.png" alt="back-to-top">
        </div>
    </main>


    <%--footer--%>
<%--    <jsp:include page="/WEB-INF/components/footer.jsp" />--%>

<%--    <script src="${pageContext.request.contextPath}/assets/js/components.js"></script>--%>
<%--    <script type="module" src="${pageContext.request.contextPath}/assets/js/pages/shop.js"></script>--%>
<%--    <script src="${pageContext.request.contextPath}/assets/js/pages/product-detail.js"></script>--%>
</body>
</html>
