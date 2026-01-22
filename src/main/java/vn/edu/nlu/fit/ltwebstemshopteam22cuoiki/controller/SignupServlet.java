    package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.controller;

    import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.dao.UserDAO;
    import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.User;
    import jakarta.servlet.*;
    import jakarta.servlet.http.*;
    import jakarta.servlet.annotation.*;

    import java.io.IOException;

    @WebServlet("/dang-ky")
    public class SignupServlet extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

            request.setCharacterEncoding("UTF-8");

            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            UserDAO dao = new UserDAO();

            //check mật khẩu
            if (!password.equals(confirmPassword)) {
                request.setAttribute("error", "Mật khẩu xác nhận không khớp");
                request.getRequestDispatcher("view/user/sign-up.jsp").forward(request, response);
                return;
            }

            // check trùng username
            if (dao.isUsernameExists(username)) {
                request.setAttribute("error", "Tên đăng nhập đã tồn tại");
                request.getRequestDispatcher("view/user/sign-up.jsp").forward(request, response);
                return;
            }

            // tạo user
            User user = new User();
            user.setUserName(username);
            user.setEmail(email);
            user.setPassword(password);
            user.setFullName(username);

            boolean success = dao.register(user);

            if (success) {
                response.sendRedirect( "view/user/sign-in.jsp");
            } else {
                request.setAttribute("error", "Đăng ký thất bại");
                request.getRequestDispatcher("  view/user/sign-up.jsp").forward(request, response);
            }
        }
    }