<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <title>Đăng nhập</title>
    <meta charset="UTF-8">
    <!--LINK CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/sign-in_sign-up.css">
    <!-- Font Awesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>
<!--HEADER-->
<%@ include file="/components/header.jsp" %>

<main class="auth">
    <section class="auth__container">
        <h1 class="auth__title">Đăng  nhập!</h1>

        <form class="auth__form" id="signInForm" method="post" action="/dang-nhap">
            <div class="auth__group">
                <label for="username" class="auth__label">Username</label>
                <input type="text" id="username" name="username" class="auth__input" placeholder="Nhập username">
            </div>

            <div class="auth__group">
                <label for="password" class="auth__label">Mật khẩu</label>
                <input type="password" id="password" name="password" class="auth__input" placeholder="Nhập mật khẩu">
            </div>

            <button type="submit" class="auth__button">Đăng nhập</button>

            <div class="auth__link">
                <a href="forgot-password.html" class="auth__link--highlight">Quên mật khẩu?</a>
                <a href="sign-up.html" class="auth__link--highlight">Đăng ký</a>
            </div>
        </form>
    </section>
</main>

<!--footer-->
<%@ include file="/components/footer.jsp" %>

<script src="${pageContext.request.contextPath}/assets/js/components.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>
