

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>3.T STEMSHOP - Học Tập STEM Sáng Tạo</title>


    <!--LINK CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/blog.css">
    <!-- Font Awesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>

<body>
<!--HEADER-->
<%@ include file="/WEB-INF/components/header.jsp" %>
<div class="back">
    <a href="${pageContext.request.contextPath}/">Trang Chủ</a>
    <span>/</span>
    <a href="#">Bài viết</a>

</div>
<main class="blog-page container">


    <section class="blog">
        <!-- Sidebar -->
        <aside class="blog__sidebar">
            <!-- Danh mục -->
            <div class="sidebar__box">
                <h1 class="sidebar__title">Danh mục nổi bậc</h1>
                <ul class="sidebar__list">
                    <li><a href="blog-category.html?cat=home-learning">Học tại nhà</a></li>
                    <li><a href="blog-category.html?cat=stem-basic">STEM cơ bản</a></li>
                </ul>
            </div>

            <!-- Thẻ nổi bật -->
            <div class="sidebar__box">
                <h1 class="sidebar__title">Thẻ nổi bật</h1>
                <div class="sidebar__tags">
                    <a href="#" class="tag">STEM</a>
                    <a href="#" class="tag">Arduino</a>
                    <a href="#" class="tag">Science</a>
                    <a href="#" class="tag">DIY</a>
                </div>
            </div>

            <!-- Bài viết mới -->
            <div class="sidebar__box">
                <h1 class="sidebar__title">Bài viết mới</h1>
                <ul class="sidebar__recent">
                    <li><a href="${pageContext.request.contextPath}/view/content/blog-detail.jsp">5 Thí nghiệm vui tại nhà</a></li>
                    <li><a href="${pageContext.request.contextPath}/view/content/blog-detail.jsp">Khám phá lập trình robot mini</a></li>
                    <li><a href="${pageContext.request.contextPath}/view/content/blog-detail.jsp">STEM giúp trẻ sáng tạo hơn</a></li>
                </ul>
            </div>
        </aside>

        <!-- Danh sách bài viết -->
        <div class="blog__content">
            <!-- Card bài viết -->
            <div class="blog__post">
                <img src="../../assets/images/blog/STEM trong đời sống.jpg" alt="Khơi dậy niềm yêu thích STEM"
                     class="blog__post-image">
                <h3 class="blog__post-title">
                    <a href="${pageContext.request.contextPath}/view/content/blog-detail.jsp">Khơi dậy niềm yêu thích STEM cho trẻ nhỏ</a>
                </h3>
                <p class="blog__meta">
                    <i class="fa-regular fa-calendar"></i> 18/10/2025 •
                    <i class="fa-regular fa-newspaper"></i> Nguồn: STEM World
                </p>
                <p class="blog__post-desc">STEM giúp trẻ phát triển tư duy sáng tạo thông qua các hoạt động học tập
                    thực tế...</p>
                <a href="blog-detail.jsp" class="blog__btn">Đọc thêm</a>
            </div>

            <div class="blog__post">
                <img src="../../assets/images/blog/Lợi ích học STEM sớm cho trẻ em.jpg" alt="Workshop STEM"
                     class="blog__post-image">
                <h3 class="blog__post-title">
                    <a href="blog-detail.jsp">Workshop STEM - Học qua thực hành</a>
                </h3>
                <p class="blog__meta">
                    <i class="fa-regular fa-calendar"></i> 18/10/2025 •
                    <i class="fa-regular fa-newspaper"></i> Nguồn: STEM World
                </p>
                <p class="blog__post-desc">Tham gia workshop giúp trẻ được tiếp xúc trực tiếp với các bộ kit STEM và
                    thực hành khoa học...</p>
                <a href="blog-detail.jsp" class="blog__btn">Đọc thêm</a>
            </div>

            <div class="blog__post">
                <img src="../../assets/images/blog/STEM trong đời sống.jpg" alt="Top dự án STEM"
                     class="blog__post-image">
                <h3 class="blog__post-title">
                    <a href="blog-detail.jsp">Top 5 dự án STEM tại nhà</a>
                </h3>
                <p class="blog__meta">
                    <i class="fa-regular fa-calendar"></i> 18/10/2025 •
                    <i class="fa-regular fa-newspaper"></i> Nguồn: STEM World
                </p>
                <p class="blog__post-desc">5 hoạt động STEM vui nhộn bạn có thể làm cùng con ngay tại nhà, vừa học
                    vừa chơi...</p>
                <a href="blog-detail.jsp" class="blog__btn">Đọc thêm</a>
            </div>

            <div class="blog__post">
                <img src="../../assets/images/blog/Hướng dẫn chọn kit STEM phù hợp.jpg" alt="Arduino trong STEM"
                     class="blog__post-image">
                <h3 class="blog__post-title">
                    <a href="blog-detail.jsp">Ứng dụng Arduino trong STEM</a>
                </h3>
                <p class="blog__meta">
                    <i class="fa-regular fa-calendar"></i> 18/10/2025 •
                    <i class="fa-regular fa-newspaper"></i> Nguồn: STEM World
                <p class="blog__post-desc">Arduino là nền tảng tuyệt vời giúp trẻ học lập trình và điện tử cơ bản
                    qua các dự án STEM...</p>
                <a href="blog-detail.jsp" class="blog__btn">Đọc thêm</a>
            </div>

            <div class="blog__post">
                <img src="../../assets/images/blog/Hướng dẫn chọn kit STEM phù hợp.jpg"
                     alt="Tư duy phản biện trong STEM" class="blog__post-image">
                <h3 class="blog__post-title">
                    <a href="blog-detail.jsp">Tư duy phản biện trong học STEM</a>
                </h3>
                <p class="blog__meta">
                    <i class="fa-regular fa-calendar"></i> 18/10/2025 •
                    <i class="fa-regular fa-newspaper"></i> Nguồn: STEM World
                </p>
                <p class="blog__post-desc">STEM không chỉ là khoa học, mà còn giúp hình thành tư duy phản biện mạnh
                    mẽ...</p>
                <a href="blog-detail.jsp" class="blog__btn">Đọc thêm</a>
            </div>


            <div class="blog__post">
                <img src="../../assets/images/blog/Hướng dẫn chọn kit STEM phù hợp.jpg"
                     alt="Khám phá không gian STEM" class="blog__post-image">
                <h3 class="blog__post-title">
                    <a href="blog-detail.jsp">Khám phá không gian cùng STEM</a>
                </h3>
                <p class="blog__meta">
                    <i class="fa-regular fa-calendar"></i> 18/10/2025 •
                    <i class="fa-regular fa-newspaper"></i> Nguồn: STEM World
                </p>
                <p class="blog__post-desc">Các dự án khám phá không gian giúp trẻ hiểu về vũ trụ và khoa học tự
                    nhiên...</p>
                <a href="blog-detail.jsp6" class="blog__btn">Đọc thêm</a>
            </div>

            <!-- Phân trang -->
            <div class="blog__pagination">
                <span class="blog__page blog__page--active">1</span>
                <span class="blog__page">2</span>
                <span class="blog__page">3</span>
            </div>
        </div>


    </section>
</main>



<!--FOOTER-->
<%@ include file="/WEB-INF/components/footer.jsp" %>




</body>

</html>

