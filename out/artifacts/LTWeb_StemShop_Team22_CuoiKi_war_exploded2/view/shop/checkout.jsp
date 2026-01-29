<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>

<%-- 2. CODE BẢO VỆ: Nếu truy cập trực tiếp file JSP hoặc thiếu dữ liệu tiền -> Đẩy về Servlet --%>
<c:if test="${empty requestScope.total}">
    <c:redirect url="/checkout"/>
</c:if>

<html>
<head>
    <title>Thanh toán</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/checkout.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body>
    <main>
        <jsp:include page="/WEB-INF/components/header.jsp" />;
        <!-- breadcrumb -->
        <div class="back">
            <a href="${pageContext.request.contextPath}/">Trang Chủ</a>
            <span>/</span>
            <a href="${pageContext.request.contextPath}/shop">Cửa Hàng</a>
            <span>/</span>
            <a href="${pageContext.request.contextPath}/cart">Giỏ hàng</a>
            <span>/</span>
            <a href="#">Thanh toán</a>
        </div>

        <div class="checkout-container">
            <h1 style="margin: 40px 0">Thanh toán đơn hàng</h1>

            <!-- form gửi về servlet -->
            <form class="checkout-container__main"
                  action="${pageContext.request.contextPath}/checkout"
                  method="post">

                <!-- THÔNG TIN KHÁCH HÀNG -->
                <div class="checkout-container__main__infor-customer">

                    <div class="checkout-container__main__infor-customer__title margin-top-bottom">
                        <h2>Thông tin khách hàng</h2>
                        <p style="color: #877575">Vui lòng điền thông tin để hoàn tất đơn hàng</p>
                    </div>

                    <div class="checkout-container__main__infor-customer__name-phone margin-top-bottom">
                        <div class="infor-customer__name">
                            <label>Họ và tên*</label>
                            <input type="text" name="fullname" required
                                   value="${user.fullName}" class="style-input" placeholder="Nguyễn Văn A">
                        </div>
                        <div class="infor-customer__phone">
                            <label>Số điện thoại*</label>
                            <input type="text" name="phonenumber" required
                                   value="${user.phone}" class="style-input" placeholder="0123456789">
                        </div>
                    </div>

                    <div class="checkout-container__main__infor-customer__email margin-top-bottom">
                        <label>Email*</label>
                        <input type="email" name="email" required
                               value="${user.email}" class="style-input" placeholder="demo123@gmail.com">
                    </div>

                    <div class="checkout-container__main__infor-customer__address margin-top-bottom">
                        <label>Địa chỉ*</label>
                        <input type="text" name="address" required class="style-input" placeholder="Số nhà, tên đường">
                    </div>

                    <div class="checkout-container__main__infor-customer__city margin-top-bottom">
                        <label>Thành phố*</label>
                        <input type="text" name="city" required class="style-input" placeholder="TP. Hồ Chí Minh">
                    </div>

                    <div class="checkout-container__main__infor-customer__note margin-top-bottom">
                        <label>Ghi chú đơn hàng</label>
                        <textarea name="note" class="style-input" placeholder="Ghi chú về dơn hàng của bạn"></textarea>
                    </div>
                </div>

                <!-- THANH TOÁN -->
                <div class="checkout-container__main__pay" style="height: auto">

                    <div class="order-items-review" style="margin-bottom: 20px; border-bottom: 1px dashed #ccc; padding-bottom: 10px;">
                        <h3>Đơn hàng của bạn (${cart.items.size()} sản phẩm)</h3>
                        <div style="max-height: 300px; overflow-y: auto; margin-top: 10px;">
                            <c:forEach var="item" items="${cart.items}">
                                <div style="display: flex; gap: 10px; margin-bottom: 15px;">
                                    <div style="width: 60px; height: 60px;">
                                        <img src="${pageContext.request.contextPath}/${item.product.imageUrl}"
                                             style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px;">
                                    </div>
                                    <div style="flex: 1;">
                                        <p style="margin: 0; font-weight: bold; font-size: 14px;">${item.product.productName}</p>
                                        <p style="margin: 5px 0 0; font-size: 13px; color: #666;">
                                            x${item.quantity}
                                            <span style="float: right; color: #E91E63;">
                                <fmt:formatNumber value="${item.totalPrice}" type="currency" currencySymbol="₫"/>
                            </span>
                                        </p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="total-order">
                        <h2>Tổng đơn hàng</h2>
                        <div class="tamp-pay">
                            <p>Tạm tính</p>
                            <span>
                                <fmt:formatNumber value="${subTotal}" type="currency" currencySymbol="₫"/>
                            </span>
                        </div>
                        <div class="ship">
                            <p>Phí vận chuyển</p>
                            <span>
                                <fmt:formatNumber value="${shipFee}" type="currency" currencySymbol="₫"/>
                            </span>
                        </div>
                    </div>

                    <div class="voucher">
                        <h3><i class="fa-solid fa-ticket"></i> Mã giảm giá</h3>
                        <div class="voucher__add">
                            <input type="text" name="voucherCode" placeholder="Nhập mã giảm giá">
                            <button type="submit" name="action" value="applyVoucher">Áp dụng</button>
                        </div>
                    </div>

                    <div class="payment-method">
                        <h3>Phương thức thanh toán</h3>

                        <div class="payment-method__select__option">
                            <input type="radio" name="paymentMethod" value="COD" checked>
                            <div class="content">
                                <h3>Tiền mặt</h3>
                                <p>Thanh toán khi nhận được hàng</p>
                            </div>
                        </div>

                        <div class="payment-method__select__option">
                            <input type="radio" name="paymentMethod" value="BANKING">
                            <div class="content">
                                <h3>Chuyển khoản</h3>
                                <p>Thanh toán qua ngân hàng</p>
                            </div>
                        </div>
                    </div>

                    <div class="order">
                        <div class="total">
                            <h2>Tổng cộng</h2>
                            <span>
                                <fmt:formatNumber value="${total}" type="currency" currencySymbol="₫"/>
                            </span>
                        </div>

                        <button type="submit" name="action" value="order">
                            Đặt hàng ngay
                        </button>
                        <p>Bằng việc đặt hàng, bạn đòng ý với</p>
                        <a href="${pageContext.request.contextPath}/view/main/terms.jsp" target="_blank">Điều khoản và Chính sách của 3T STEMSHOP</a>
                    </div>

                </div>
            </form>
        </div>
    </main>

    <jsp:include page="/WEB-INF/components/footer.jsp" />;

<script src="${pageContext.request.contextPath}/assets/js/components.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/pages/checkout.js"></script>
</body>
</html>
