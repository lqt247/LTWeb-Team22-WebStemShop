// Hàm tải và chèn file HTML vào 1 phần tử
async function loadComponent(id, filePath) {
  const container = document.getElementById(id);
  if (container) {
    try {
      const response = await fetch(filePath);
      const html = await response.text();
      container.innerHTML = html;

      // Nếu là header thì sau khi load xong, mới gán class active
      if (id === "header") {
        highlightActiveLink();
      }
    } catch (error) {
      console.error("Không thể tải file:", filePath, error);
    }
  }
}

// Gọi hàm khi trang load xong
document.addEventListener("DOMContentLoaded", () => {
  loadComponent("header", "src/components/header.html");
  loadComponent("footer", "src/components/footer.html");
});

// ✅ Hàm đánh dấu link đang active
function highlightActiveLink() {
  const currentPath = window.location.pathname.split("/").pop() || "index.html"; 
  const navLinks = document.querySelectorAll(".nav__list a");

  navLinks.forEach(link => {
    const href = link.getAttribute("href");
    if (href.includes(currentPath)) {
      link.classList.add("active");
    }
  });
}
