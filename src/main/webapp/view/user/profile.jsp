<%--
  Created by IntelliJ IDEA.
  User: Truong
  Date: 1/21/2026
  Time: 7:58 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>3.T STEMSHOP - Học Tập STEM Sáng Tạo</title>


    <!--LINK CSS-->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/profile.css">


    <!-- Font Awesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>

<body>
<!--HEADER-->
<%@ include file="/WEB-INF/components/header.jsp" %>


<main class="profile">

    <!-- Thông tin cá nhân -->
    <section class="profile__card">
        <div class="profile__avatar">
            <img src="${pageContext.request.contextPath}/assets/images/user/${sessionScope.user != null ? sessionScope.user.avatar : 'anhbeminhanh.jpg'}"
                 alt="Ảnh đại diện của bé" />
        </div>

        <div class="profile__info">
            <h2 class="profile__name">
                <i class="fa-solid fa-user"></i>
                ${sessionScope.user != null ? sessionScope.user.fullName : 'Bé Minh Anh'}
            </h2>
            <p>
                <i class="fa-solid fa-envelope"></i>
                ${sessionScope.user != null ? sessionScope.user.email : 'minh.anh@example.com'}
            </p>
            <p>
                <i class="fa-solid fa-cake-candles"></i>
                Ngày sinh: ${sessionScope.user != null ? sessionScope.user.birthDate : '12/08/2017'}
            </p>
            <p>
                <i class="fa-solid fa-location-dot"></i>
                ${sessionScope.user != null ? sessionScope.user.address : 'TP. Hồ Chí Minh'}
            </p>

            <p>
                <i class="fa-solid fa-user-shield"></i>
                Phụ huynh: ${sessionScope.user != null ? sessionScope.user.parentName : 'Nguyễn Văn A'}
            </p>
            <p>
                <i class="fa-solid fa-phone"></i>
                SĐT phụ huynh: ${sessionScope.user != null ? sessionScope.user.parentPhone : '0901 234 567'}
            </p>
        </div>
    </section>

    <!-- Đơn hàng -->
    <section class="profile__orders">
        <h3><i class="fa-solid fa-box"></i> Đơn hàng gần đây</h3>
        <c:choose>
            <c:when test="${empty orders}">
                <div class="empty-state">
                    <p>Bạn chưa có đơn hàng nào</p>
                    <a href="${pageContext.request.contextPath}/shop" class="btn btn-primary">Mua sắm ngay</a>
                </div>
            </c:when>
            <c:otherwise>
                <table class="orders__table">
                    <thead>
                    <tr>
                        <th>Tên sản phẩm</th>
                        <th>Ngày đặt</th>
                        <th>Trạng thái</th>
                        <th>Giá</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td>${order.productName}</td>
                            <td>
                                <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy"/>
                            </td>
                            <td>
                                    <span class="status ${order.status == 'Đã giao' ? 'delivered' : (order.status == 'Đang giao' ? 'shipping' : 'cancelled')}">
                                            ${order.status}
                                    </span>
                            </td>
                            <td>
                                <fmt:formatNumber value="${order.totalPrice}" type="number" groupingUsed="true"/>đ
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </section>

    <!-- Sự kiện -->
    <section class="profile__events">
        <h3><i class="fa-solid fa-calendar-check"></i> Sự kiện đã tham gia</h3>
        <c:choose>
            <c:when test="${empty events}">
                <div class="empty-state">
                    <p>Bạn chưa tham gia sự kiện nào</p>
                    <a href="${pageContext.request.contextPath}/events" class="btn btn-primary">Xem sự kiện</a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="events__list">
                    <c:forEach var="event" items="${events}">
                        <article class="event__item">
                            <img src="${pageContext.request.contextPath}/assets/images/events/${event.imageUrl}"
                                 alt="${event.eventName}" />
                            <div class="event__info">
                                <h4>${event.eventName}</h4>
                                <p>
                                    <i class="fa-solid fa-calendar-day"></i>
                                    <fmt:formatDate value="${event.eventDate}" pattern="dd/MM/yyyy"/>
                                </p>
                                <p>
                                    <i class="fa-solid fa-location-dot"></i>
                                        ${event.location}
                                </p>
                            </div>
                        </article>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </section>
</main>


<!--FOOTER-->
<%@ include file="/WEB-INF/components/footer.jsp" %>



</body>

</html>