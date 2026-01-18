<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Cửa hàng</title>

    <!-- CSS dùng file của bạn -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/shop.css">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>

<body>

<!-- HEADER -->
<jsp:include page="/WEB-INF/components/header.jsp"/>

<main>

    <!-- breadcrumb -->
    <div class="back">
        <a href="${pageContext.request.contextPath}/index.jsp">Trang Chủ</a>
        <span>/</span>
        <a href="#">Cửa Hàng</a>
    </div>

    <div class="products">

        <!-- ========== SIDEBAR LEFT ========== -->
        <div class="product">

            <div class="product__category product__categorys">
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

            <div class="product__category product__age">
                <h2>Độ tuổi</h2>
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

        </div>

        <!-- ========== PRODUCT LIST RIGHT ========== -->
        <div class="list-product">

            <!-- head -->
<%--            <div class="list-product__head">--%>
<%--                <div class="list-product__head__type">--%>
<%--                    <span>Kiểu xem:</span>--%>
<%--                    <ul>--%>
<%--                        <li class="active"><i class="fa-solid fa-bars"></i></li>--%>
<%--                        <li><i class="fa-solid fa-grip"></i></li>--%>
<%--                    </ul>--%>
<%--                </div>--%>

<%--                <div class="list-product__head__search">--%>
<%--                    <span>Tìm kiếm:</span>--%>
<%--                    <input type="text" placeholder="Nhập tên sản phẩm">--%>
<%--                </div>--%>
<%--            </div>--%>
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

            <!-- body -->
            <div class="list-product__body">

                <!-- DEBUG (có thể xóa sau) -->
                <p style="color:red;">
                    Tổng sản phẩm: ${products.size()}
                </p>

                <div class="list-product__body__card">

                    <c:forEach var="p" items="${products}">
                        <div class="list-product__body__card__container"
                             data-category="${p.categoriesID}"
                             data-brand="${p.brandID}"
                             data-price="${p.price}"
                             data-name="${fn:toLowerCase(p.productName)}">

                            <img src="${pageContext.request.contextPath}/${p.imageUrl}"
                                 alt="${p.productName}">

                            <div class="list-product__body__card__content">
                                <p class="brand">Brand ID: ${p.brandID}</p>
                                <h5>${p.productName}</h5>
                                <h4>${p.price} Đ</h4>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

        </div>
    </div>

</main>

<!-- FOOTER -->
<jsp:include page="/WEB-INF/components/footer.jsp"/>

<!-- JS dùng file của bạn -->
<script src="${pageContext.request.contextPath}/assets/js/pages/shop.js"></script>

</body>
</html>
