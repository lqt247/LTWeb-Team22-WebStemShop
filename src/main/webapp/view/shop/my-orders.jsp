<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>

<html>
<head>
    <title>Đơn hàng của tôi</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>

<h2 style="text-align:center;margin:30px 0">Đơn hàng của tôi</h2>

<c:if test="${empty orders}">
    <p style="text-align:center">Bạn chưa mua sản phẩm nào.</p>
</c:if>

<c:forEach var="item" items="${orders}">
    <div style="max-width:800px;margin:20px auto;padding:15px;border:1px solid #ddd">
        <p><strong>Đơn hàng #${item.orderId}</strong></p>

        <div style="display:flex;gap:15px">
            <img src="${pageContext.request.contextPath}/${item.image}"
                 width="80">

            <div>
                <p>${item.productName}</p>
                <p>Số lượng: ${item.quantity}</p>
                <p>Giá:
                    <fmt:formatNumber value="${item.price}"
                                      type="currency"
                                      currencySymbol="₫"/>
                </p>
            </div>
        </div>
    </div>
</c:forEach>

</body>
</html>