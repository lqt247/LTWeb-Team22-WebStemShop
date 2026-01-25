<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm Sản Phẩm - Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        .form-container {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            max-width: 800px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #333;
        }
        .form-group input,
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
        }
        .form-actions {
            display: flex;
            gap: 10px;
            margin-top: 30px;
        }
        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            text-decoration: none;
            display: inline-block;
        }
        .btn-primary {
            background: #ff69a8;
            color: white;
        }
        .btn-secondary {
            background: #6c757d;
            color: white;
        }
    </style>
</head>
<body>
<div class="admin-container">
    <!-- Sidebar -->
    <aside class="admin-sidebar">
        <div class="admin-sidebar__logo">
            <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="STEM Logo">
        </div>

        <hr class="admin-sidebar__divider">

        <ul class="admin-menu">
            <li class="admin-menu__item" onclick="window.location.href='${pageContext.request.contextPath}/admin/dashboard'">
                <i class="fa-solid fa-chart-line"></i> Dashboard
            </li>
            <li class="admin-menu__item" onclick="window.location.href='${pageContext.request.contextPath}/admin/admin-user'">
                <i class="fa-solid fa-users"></i> Quản lý Người Dùng
            </li>
            <li class="admin-menu__item active" onclick="window.location.href='${pageContext.request.contextPath}/admin/admin-products'">
                <i class="fa-solid fa-box"></i> Quản lý Sản Phẩm
            </li>
            <li class="admin-menu__item" onclick="window.location.href='${pageContext.request.contextPath}/admin/orders'">
                <i class="fa-solid fa-shopping-cart"></i> Quản lý Đơn Hàng
            </li>
            <li class="admin-menu__item" onclick="window.location.href='${pageContext.request.contextPath}/'">
                <i class="fa-solid fa-home"></i> Về trang chủ
            </li>
            <li class="admin-menu__item" onclick="window.location.href='${pageContext.request.contextPath}/logout'">
                <i class="fa-solid fa-sign-out-alt"></i> Đăng xuất
            </li>
        </ul>
    </aside>

    <!-- Main Content -->
    <main class="admin-main">
        <header class="admin-topbar">
            <h1>Thêm Sản Phẩm Mới</h1>
        </header>

        <div class="form-container">
            <form method="post" enctype="multipart/form-data">

                <div class="form-group">
                    <label>Tên sản phẩm: <span style="color: red;">*</span></label>
                    <input type="text" name="productName" required>
                </div>

                <div class="form-group">
                    <label>Mô tả:</label>
                    <textarea name="description" rows="4"></textarea>
                </div>

                <div class="form-group">
                    <label>Giá: <span style="color: red;">*</span></label>
                    <input type="number" name="price" step="0.01" required>
                </div>

                <div class="form-group">
                    <label>Số lượng: <span style="color: red;">*</span></label>
                    <input type="number" name="quantity" required>
                </div>

                <div class="form-group">
                    <label>Danh mục: <span style="color: red;">*</span></label>
                    <select name="categoryID" required>
                        <option value="">-- Chọn danh mục --</option>
                        <c:forEach var="category" items="${categories}">
                            <option value="${category.id}">${category.categoryName}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label>Thương hiệu: <span style="color: red;">*</span></label>
                    <select name="brandID" required>
                        <option value="">-- Chọn thương hiệu --</option>
                        <c:forEach var="brand" items="${brands}">
                            <option value="${brand.id}">${brand.brandName}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label>Ảnh sản phẩm:</label>
                    <input type="file" name="productImage" accept="image/*">
                    <small style="color: #666; display: block; margin-top: 5px;">
                        Chấp nhận: JPG, PNG, GIF (Tối đa 10MB)
                    </small>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Thêm sản phẩm
                    </button>
                    <a href="${pageContext.request.contextPath}/admin/admin-products" class="btn btn-secondary">
                        <i class="fas fa-times"></i> Hủy
                    </a>
                </div>
            </form>
        </div>
    </main>
</div>
</body>
</html>