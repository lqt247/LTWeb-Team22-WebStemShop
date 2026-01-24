    package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.controller;

    import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.dao.UserDAO;
    import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.model.User;
    import jakarta.servlet.*;
    import jakarta.servlet.http.*;
    import jakarta.servlet.annotation.*;
    import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.util.EmailUtil;
    import vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.util.PasswordUtil;


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
                request.getRequestDispatcher("/view/user/sign-up.jsp").forward(request, response);
                return;
            }

            // kiểm tra dữ liệu password
            if (!PasswordUtil.isValidPassword(password)) {
                request.setAttribute("error",
                        "Mật khẩu phải ≥ 8 ký tự, có chữ hoa, chữ thường, số và ký tự đặc biệt");
                request.getRequestDispatcher("/view/user/sign-up.jsp").forward(request, response);
                return;
            }

            // check trùng username
            if (dao.isUsernameExists(username)) {
                request.setAttribute("error", "Tên đăng nhập đã tồn tại");
                request.getRequestDispatcher("/view/user/sign-up.jsp").forward(request, response);
                return;
            }
            // hash password
            String hashedPassword = PasswordUtil.md5(password);

            // tạo user
            User user = new User();
            user.setUserName(username);
            user.setEmail(email);
            user.setPassword(hashedPassword);
            user.setFullName(username);

            String token = java.util.UUID.randomUUID().toString();

            boolean success = dao.registerWithVerify(user, token);

            // gửi verify cho email
            if (success) {
                String verifyLink = request.getScheme() + "://" +
                        request.getServerName() + ":" +
                        request.getServerPort() +
                        request.getContextPath() +
                        "/xac-thuc?token=" + token;

                EmailUtil.sendVerifyEmail(email, verifyLink);

                request.setAttribute("success", "Đăng ký thành công! Vui lòng kiểm tra email để xác thực.");
                request.getRequestDispatcher("/view/user/sign-in.jsp").forward(request, response);
            }   else {
                request.setAttribute("error", "Đăng ký thất bại");
                request.getRequestDispatcher("/view/user/sign-up.jsp").forward(request, response);
            }

            }
        }
