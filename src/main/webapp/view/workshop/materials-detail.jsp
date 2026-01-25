<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
  <title>Chi tiết Dự Án</title>
  <meta charset="UTF-8">
  <!--LINK CSS-->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/materials-detail.css">
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
  <a href="#">Chi tiết dự án</a>
</div>
<main class="detail container">

  <!-- ====== NỘI DUNG CHÍNH ===== -->
  <article class="detail__content">

    <h1 class="detail__title">Dự Án: Robot Tránh Vật Cản</h1>

    <div class="detail__meta">
      <span><i class="fa-regular fa-eye"></i> 2.1k lượt xem</span>
      <span><i class="fa-regular fa-calendar"></i> Cập nhật: 10/01/2025</span>
    </div>



    <div class="toc">
      <h3>Mục lục</h3>
      <ul>
        <li><a href="#muc-tieu">Mục Tiêu</a></li>
        <li><a href="#chuan-bi">Chuẩn Bị</a></li>
        <li><a href="#ket-luan">Lời kết</a></li>
      </ul>
    </div>

    <!-- ======= GIỚI THIỆU ====== -->
    <section class="detail__section">
      <h2 >Giới thiệu dự án</h2>
      <p>
        Robot tránh vật cản là một trong những dự án STEM cực kỳ phổ biến dành cho học sinh
        từ cấp 2 – cấp 3. Dự án giúp học sinh hiểu về cảm biến siêu âm, lập trình Arduino,
        điều khiển động cơ và tư duy logic trong robot di chuyển tự động.
      </p>
    </section>

    <!-- ====== MỤC TIÊU ===== -->
    <section class="detail__section">
      <h2 id="muc-tieu">Mục Tiêu Dự Án</h2>
      <ul>
        <li>Biết cách sử dụng cảm biến siêu âm HC-SR04</li>
        <li>Lập trình Arduino đọc dữ liệu khoảng cách</li>
        <li>Điều khiển động cơ DC hoặc động cơ bánh răng</li>
        <li>Xây dựng robot tự tránh vật cản thông minh</li>
      </ul>
    </section>

    <!-- ======= LINH KIỆN ====== -->
    <section class="detail__section">
      <h2 id="chuan-bi">Chuẩn Bị Linh Kiện</h2>
      <ul>
        <li>1x Arduino Uno R3</li>
        <li>1x Cảm biến siêu âm HC-SR04</li>
        <li>2x Động cơ DC + Board L298N</li>
        <li>Pin 18650 + Holder</li>
        <li>Khung xe 2 bánh</li>
        <li>Dây cắm & Jumper</li>
      </ul>
    </section>

    <!-- ====== CODE ARDUINO ====== -->
    <section class="detail__section">
      <h2>Code Arduino mẫu</h2>

      <pre class="code-block">
#define trig 9
#define echo 10
long duration;
int distance;

void setup(){
  pinMode(trig, OUTPUT);
  pinMode(echo, INPUT);
  Serial.begin(9600);
}

void loop(){
  digitalWrite(trig, LOW);
  delayMicroseconds(2);
  digitalWrite(trig, HIGH);
  delayMicroseconds(10);
  digitalWrite(trig, LOW);

  duration = pulseIn(echo, HIGH);
  distance = duration * 0.034 / 2;

  Serial.println(distance);
  delay(200);
}
</pre>
    </section>

    <!-- ====== KẾT LUẬN ===== -->
    <section class="detail__section">
      <h2 id="ket-luan"> Lời kết</h2>
      <p>
        Đây là dự án phù hợp cho học sinh mới bắt đầu làm quen với robot.
        Chỉ cần vài linh kiện cơ bản là bạn có thể tự chế tạo một robot di chuyển thông minh.
        Nếu muốn nâng cấp, bạn có thể thêm cảm biến hồng ngoại, Bluetooth hoặc module WiFi.
      </p>
    </section>

  </article>


  <!-- ====== BÀI VIẾT LIÊN QUAN (TỰ ĐỘNG) ====== -->
  <aside class="related">
    <h2>Bài viết liên quan</h2>
    <div id="relatedList" class="related__list"></div>
  </aside>

</main>

<!--footer-->
<%@ include file="/WEB-INF/components/footer.jsp" %>

<script src="${pageContext.request.contextPath}/assets/js/pages/materials-detail.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/components.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>
