<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>

<html>
<head>
    <title>Đặt hàng thành công</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
    <style>
        .success-page { max-width: 800px; margin: 50px auto; text-align: center; padding: 20px; }
        .success-icon { font-size: 80px; color: #28a745; margin-bottom: 20px; }
        .order-id { font-size: 20px; font-weight: bold; color: #333; }

        /* Style cho phần Banking */
        .banking-info {
            margin-top: 30px;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 10px;
            border: 2px solid #E91E63;
        }
        .qr-code img { max-width: 300px; width: 100%; border: 1px solid #ddd; border-radius: 10px; }
        .bank-details p { margin: 5px 0; font-size: 16px; }
        .btn-home {
            display: inline-block; margin-top: 30px; padding: 12px 30px;
            background: #E91E63; color: white; text-decoration: none; border-radius: 5px; font-weight: bold;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/components/header.jsp" />

<main class="success-page">
    <c:set var="orderId" value="${param.orderId}" />
    <c:set var="method" value="${param.method}" />
    <c:set var="amount" value="${param.amount}" />

    <i class="fa-solid fa-circle-check success-icon"></i>
    <h1>ĐẶT HÀNG THÀNH CÔNG!</h1>
    <p class="order-id">Mã đơn hàng: #ORD-${orderId}</p>

    <c:if test="${method == 'COD'}">
        <div class="cod-message">
            <p>Cảm ơn bạn đã mua hàng. Shop sẽ liên hệ xác nhận và giao hàng sớm nhất.</p>
            <p>Vui lòng để ý điện thoại nhé!</p>
        </div>
    </c:if>

    <c:if test="${method == 'BANKING'}">
        <div class="banking-info">
            <h2 style="color: #E91E63;">THANH TOÁN CHUYỂN KHOẢN</h2>
            <p>Vui lòng quét mã QR bên dưới để hoàn tất thanh toán:</p>

            <div class="qr-code">
                <img src="https://img.vietqr.io/image/MB-0358903657-compact2.png?amount=${amount}&addInfo=THANH TOAN DON HANG ORD ${orderId}"
                     alt="QR Code">
            </div>

            <div class="bank-details">
                <p>Ngân hàng: <strong>MB BANK</strong></p>
                <p>Số tài khoản: <strong>0358903657</strong></p>
                <p>Chủ tài khoản: <strong>NGUYEN VAN A</strong></p>
                <p>Số tiền: <strong style="color: red; font-size: 18px;">
                    <fmt:formatNumber value="${amount}" type="currency" currencySymbol="₫"/>
                </strong></p>
                <p>Nội dung: <strong>THANH TOAN DON HANG ORD ${orderId}</strong></p>
            </div>

            <p style="margin-top: 15px; font-style: italic; color: #666;">
                *Sau khi chuyển khoản, hệ thống sẽ kiểm tra và cập nhật trạng thái đơn hàng của bạn.
            </p>
        </div>
    </c:if>

    <a href="${pageContext.request.contextPath}/shop" class="btn-home">Tiếp tục mua sắm</a>
</main>

<jsp:include page="/WEB-INF/components/footer.jsp" />
</body>
</html>