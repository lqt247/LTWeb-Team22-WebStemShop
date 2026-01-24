<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--thêm taglib này để viết JSTL--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!--HEADER-->
<header class="header">

    <!-- PHẦN TRÊN -->
    <div class="header__first">
        <div class="container">
            <div class="header__top-left">
                <a href="https://maps.app.goo.gl/nj1KfxS8ajpDxTni6" target="_blank">
                    <span><i class="fa-solid fa-location-dot"></i> Trường Đại Học Nông Lâm TPHCM</span>
                </a>
                <a href=""><span><i class="fa-solid fa-envelope"></i> shopstemteam22@gmail.com</span></a>
            </div>
            <div class="header__top-right">
                <div class="header__phone-top">
                    <a href=""><span><i class="fa-solid fa-phone"></i> +84 123456789</span></a>
                </div>
                <div class="header_icon-top">
                    <a href="" class="header__icon-right"><i class="fa-brands fa-facebook-f"></i></a>
                    <a href="" class="header__icon-right"><i class="fa-brands fa-instagram"></i></a>
                    <a href="" class="header__icon-right"><i class="fa-brands fa-amazon"></i></a>
                    <a href="" class="header__icon-right"><i class="fa-brands fa-twitter"></i></a>
                </div>
            </div>
        </div>
    </div>

    <!-- PHẦN DƯỚI: NAV -->
    <div class="header__end">
        <div class="container">
            <div class="header__end-left">

                <!-- LOGO -->
                <div class="header__logo">
                    <a href="${pageContext.request.contextPath}/index.jsp">
                        <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="logo">
                    </a>
                </div>

                <!-- NAV -->
                <div class="header__nav">
                    <nav class="nav-content">
                        <ul class="nav__list">

                            <li class="nav__item">
                                <a href="${pageContext.request.contextPath}/index.jsp">Trang chủ</a>
                            </li>

                            <!-- Giới thiệu -->
                            <li class="nav__item dropdown">
                                <a href="${pageContext.request.contextPath}/view/main/about.jsp">
                                    Giới thiệu <i class="fa-solid fa-chevron-down"></i>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="${pageContext.request.contextPath}/view/about_info/about-stem.jsp">Về STEMSHOP</a></li>
                                    <li><a href="${pageContext.request.contextPath}/view/about_info//mission.jsp">Sứ mệnh & Tầm nhìn</a></li>
                                    <li><a href="${pageContext.request.contextPath}/view/about_info/guide.jsp">Tài liệu hướng dẫn</a></li>
                                </ul>
                            </li>

                            <!-- SHOP -->
                            <li class="nav__item dropdown">
                                <a href="${pageContext.request.contextPath}/shop">
                                    Cửa hàng <i class="fa-solid fa-chevron-down"></i>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="${pageContext.request.contextPath}/view/shop/cart.jsp">Giỏ hàng</a></li>
                                    <li><a href="${pageContext.request.contextPath}/view/shop/wishlist.jsp">Yêu thích</a></li>
                                    <li><a href="${pageContext.request.contextPath}/view/shop/checkout.jsp">Thanh toán</a></li>
                                </ul>
                            </li>

                            <!-- BLOG -->
                            <li class="nav__item dropdown">
                                <a href="${pageContext.request.contextPath}/view/content/blog.jsp">
                                    Bài viết <i class="fa-solid fa-chevron-down"></i>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="${pageContext.request.contextPath}/view/content/blog-category.jsp">Danh mục bài viết</a></li>
                                </ul>
                            </li>

                            <!-- DỰ ÁN WORKSHOP -->
                            <li class="nav__item ">
                                <a href="${pageContext.request.contextPath}/view/workshop/materials.jsp">Dự Án WorkShops</a>
                            </li>

                            <li class="nav__item">
                                <a href="${pageContext.request.contextPath}/view/main/contact.jsp">Liên hệ</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>

            <!-- USER + CART -->
            <div class="header__end-right">
                <div class="header__shop">
                    <a href="${pageContext.request.contextPath}/view/shop/wishlist.jsp"><i class="fa-solid fa-heart"></i></a>
                    <a href="${pageContext.request.contextPath}/view/shop/cart.jsp"><i class="fa-solid fa-cart-shopping"></i></a>
                </div>

                <div class="header__user">
                    <c:choose>
                        <%-- CHƯA LOGIN --%>
                        <c:when test="${empty sessionScope.user}">
                            <a href="${pageContext.request.contextPath}/view/user/sign-in.jsp">Đăng nhập</a>
                            <a href="${pageContext.request.contextPath}/view/user/sign-up.jsp">Đăng ký</a>
                        </c:when>
                        <%-- ĐÃ LOGIN --%>
                        <c:otherwise>
                            <div class="header__user header__user-logged">

                                    <%-- AVATAR ICON --%>
                                <i class="fa-solid fa-circle-user user-avatar-icon"></i>

                                    <%-- TÊN --%>
                                <span class="user-short-name">${sessionScope.user.fullName}</span>

                                    <%-- DROPDOWN --%>
                                <div class="user-dropdown">
                                    <ul class="dropdown-menu-user">

                                        <li>
                                            <a href="${pageContext.request.contextPath}/profile">
                                                <i class="fa-solid fa-user"></i> Hồ sơ
                                            </a>
                                        </li>

                                        <li>
                                            <a href="${pageContext.request.contextPath}/my-orders">
                                                <i class="fa-solid fa-box"></i> Đơn hàng
                                            </a>
                                        </li>


                                        <c:if test="${sessionScope.user.role == 'ADMIN'}">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/admin">
                                                    <i class="fa-solid fa-gear"></i> Quản lý
                                                </a>
                                            </li>
                                        </c:if>

                                        <li class="logout">
                                            <a href="${pageContext.request.contextPath}/logout">
                                                <i class="fa-solid fa-right-from-bracket"></i> Đăng xuất
                                            </a>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </c:otherwise>

                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</header>
