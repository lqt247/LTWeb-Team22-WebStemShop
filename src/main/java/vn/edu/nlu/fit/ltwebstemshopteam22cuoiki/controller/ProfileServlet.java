package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.dao.UserDAO;
import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.User;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Date;

@WebServlet("/profile")
@MultipartConfig
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            request.getRequestDispatcher("/view/user/sign-in.jsp").forward(request, response);
            return;
        }

        request.setAttribute("user", user);
        request.getRequestDispatcher("/view/user/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/dang-nhap");
            return;
        }

        request.setCharacterEncoding("UTF-8");

        user.setFullName(request.getParameter("fullName"));
        user.setPhoneNumber(request.getParameter("phoneNumber"));
        user.setGender(request.getParameter("gender"));
        user.setAddress(request.getParameter("address"));
        // set birthday = null nếu nó rỗng tránh lỗi 500
        String birthdayStr = request.getParameter("birthday");
        user.setBirthday((birthdayStr == null || birthdayStr.isEmpty()) ? null : Date.valueOf(birthdayStr));
        // dùng multipart để getPart lấy file ảnh
        Part avatarPart = request.getPart("avatar");

        if (avatarPart != null && avatarPart.getSize() > 0) {

            String fileName = Paths.get(avatarPart.getSubmittedFileName()).getFileName().toString();
            String newFileName = "user_" + user.getId() + "_" + fileName;
            String uploadPath = "E:/CuoiKyWeb/Avatars";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            avatarPart.write(uploadPath + File.separator + newFileName);

            user.setAvatar(newFileName); // lưu tên file vào DB
        }


        UserDAO dao = new UserDAO();
        boolean updated = dao.updateProfile(user);

        if (updated) {
            session.setAttribute("user", user);
            request.setAttribute("message", "Cập nhật hồ sơ thành công");
        } else {
            request.setAttribute("error", "Cập nhật hồ sơ thất bại");
        }


        request.getRequestDispatcher("/view/user/profile.jsp").forward(request, response);
    }
}
