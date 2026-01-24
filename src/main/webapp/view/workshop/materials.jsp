<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <title>Dự Án Workshop</title>
    <meta charset="UTF-8">
    <!--LINK CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/materials.css">
    <!-- Font Awesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>
<!--HEADER-->
<%@ include file="/WEB-INF/components/header.jsp" %>
<!-- breadcrumb -->
<div class="back">
    <a href="${pageContext.request.contextPath}/">Trang Chủ</a>
    <span>/</span>
    <a href="#">Dự án Workshop</a>
</div>
<main class="materials container">

    <!-- SIDEBAR -->
    <aside class="materials__sidebar">

        <!-- DANH MỤC -->
        <div class="sidebar__section">
            <h3 class="sidebar__title">Danh mục Dự Án</h3>
            <ul class="sidebar__list">
                <li><a href="#" class="active">Tất cả</a></li>
                <li><a href="#">Arduino</a></li>
                <li><a href="#">Module</a></li>
                <li><a href="#">Rio</a></li>
                <li><a href="#">XBot</a></li>
                <li><a href="#">YoLo:Bit</a></li>
            </ul>
        </div>

        <!-- WORKSHOP HOT GẦN ĐÂY -->
        <div class="sidebar__section">
            <h3 class="sidebar__title">Workshop hot gần đây</h3>

            <div class="recent">
                <img src="">
                <div class="recent__info">
                    <p></p>
                    <span class="views"></span>
                </div>
            </div>

            <div class="recent">
                <img src="">
                <div class="recent__info">
                    <p></p>
                    <span class="views"></span>
                </div>
            </div>

            <div class="recent">
                <img src="">
                <div class="recent__info">
                    <p></p>
                    <span class="views"></span>
                </div>
            </div>

            <div class="recent">
                <img src="">
                <div class="recent__info">
                    <p></p>
                    <span class="views"></span>
                </div>
            </div>

            <div class="recent">
                <img src="">
                <div class="recent__info">
                    <p></p>
                    <span class="views"></span>
                </div>
            </div>

            <div class="recent">
                <img src="">
                <div class="recent__info">
                    <p></p>
                    <span class="views"></span>
                </div>
            </div>

        </div>


    </aside>

    <!-- CONTENT MAIN -->
    <section class="materials__content">

        <h1 class="materials__heading">Dự Án Stem Workshop</h1>

        <div class="materials__grid">

            <!-- 9 tài liệu mẫu -->
            <!-- ITEM -->
            <a href="${pageContext.request.contextPath}/materials-detail?id=p3" class="material__item" data-id="p1" data-category="arduino" >
                <img src="../../assets/images/workshop/materials/p1.png">
                <h3>Chế Độ Deep Sleep trên ESCP32 và Wake Up Sources </h3>
                <div class="item__stats"><span><i class="fa-regular fa-eye"></i> <span class="views">0</span></span></div>
            </a>

            <a href="${pageContext.request.contextPath}/materials-detail?id=p3" class="material__item" data-id="p2" data-category="module" >
                <img src="https://ohstem.vn/wp-content/uploads/2024/02/huong-dan-lap-trinh-nhieu-man-hinh-i2c-voi-yolo-uno-ohstem-avt.png">
                <h3>Hướng Dẫn Sử dụng nhiều màn hình I2C với Yolo UNO</h3>
                <div class="item__stats"><span><i class="fa-regular fa-eye"></i> <span class="views">0</span></span></div>
            </a>

            <a href="${pageContext.request.contextPath}/materials-detail?id=p3" class="material__item" data-id="p3" data-category="xbot">
                <img src="https://ohstem.vn/wp-content/uploads/2021/09/Robot-ne-vat-can.jpg">
                <h3>Làm robot tránh vật cản</h3>
                <div class="item__stats"><span><i class="fa-regular fa-eye"></i> <span class="views">0</span></span></div>
            </a>

            <a href="${pageContext.request.contextPath}/materials-detail?id=p3" class="material__item" data-id="p4" data-category="arduino">
                <img src="https://ohstem.vn/wp-content/uploads/2021/02/B46.png">
                <h3>ESP32 Giao Tiếp I2C Sử Dụng Arduino IDE</h3>
                <div class="item__stats"><span><i class="fa-regular fa-eye"></i> <span class="views">0</span></span></div>
            </a>

            <a href="${pageContext.request.contextPath}/materials-detail?id=p3" class="material__item" data-id="p5" data-category="xbot">
                <img src="https://ohstem.vn/wp-content/uploads/2021/09/lap-trinh-LED-doi-mau.jpg">
                <h3>Lập trình LED đổi màu</h3>
                <div class="item__stats"><span><i class="fa-regular fa-eye"></i> <span class="views">0</span></span></div>
            </a>

            <a href="${pageContext.request.contextPath}/materials-detail?id=p3" class="material__item" data-id="p6" data-category="yolobit">
                <img src="https://ohstem.vn/wp-content/uploads/2023/10/piano-dien-1.jpg">
                <h3>Đàn piano điện</h3>
                <div class="item__stats"><span><i class="fa-regular fa-eye"></i> <span class="views">0</span></span></div>
            </a>

            <a href="${pageContext.request.contextPath}/materials-detail?id=p3" class="material__item" data-id="p7" data-category="module">
                <img src="https://ohstem.vn/wp-content/uploads/2022/11/lap-trinh-encoder-de-dieu-khien-quat.jpg">
                <h3>Lập trình Encoder để điều khiển quạt với Yolo:Bit</h3>
                <div class="item__stats"><span><i class="fa-regular fa-eye"></i> <span class="views">0</span></span></div>
            </a>

            <a href="${pageContext.request.contextPath}/materials-detail?id=p3" class="material__item" data-id="p8" data-category="rio">
                <img src="https://ohstem.vn/wp-content/uploads/2024/10/ban-song-o-dau-5.png">
                <h3>Bạn sống ở đâu?</h3>
                <div class="item__stats"><span><i class="fa-regular fa-eye"></i> <span class="views">0</span></span></div>
            </a>

            <a href="${pageContext.request.contextPath}/materials-detail?id=p3" class="material__item" data-id="p9" data-category="rio">
                <img src="https://ohstem.vn/wp-content/uploads/2024/10/Rio-di-tim-thu-lac-6.png">
                <h3>Rio đi tìm thú lạc</h3>
                <div class="item__stats"><span><i class="fa-regular fa-eye"></i> <span class="views">0</span></span></div>
            </a>


        </div>

        <!-- PAGINATION -->
        <div class="pagination">
            <a href="#" class="active">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#"><i class="fa-solid fa-angle-right"></i></a>
        </div>

    </section>
</main>

<!--footer-->
<%@ include file="/WEB-INF/components/footer.jsp" %>

<script src="${pageContext.request.contextPath}/assets/js/pages/materials.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/components.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>
