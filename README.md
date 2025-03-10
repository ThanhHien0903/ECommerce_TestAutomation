# Kiểm thử website bán hàng sử dụng công cụ Selenium

## Hướng dẫn cài đặt

- Cài đặt Python: https://www.python.org/
- Kiểm tra xem đã cài thành công chưa:
  `python --version`

- Cài đặt PIP: Mở cửa sổ dòng lệnh và gõ dòng lệnh sau:
  ```
  pip --version.
  ```
- Cài đặt Robot Framework
  Mở cửa sổ dòng lệnh và gõ lệnh sau:

  ```
  pip install robotframework
  ```

  Kiểm tra cài đặt Robot Framework:

  ```
  robot --version
  ```

- Cài đặt thư viện SeleniumLibrary
  Mở cửa sổ dòng lệnh và gõ lệnh sau:
  ```
  pip install robotframework-seleniumlibrary
  ```

## Mục tiêu

#### Kiểm thử chức năng (Functional Testing)

- Đăng ký
- Đăng nhập
- Đăng xuất
- Quản lý sản phẩm, nhãn hiệu, danh mục: Kiểm tra các chức năng thêm, sửa, xóa
- Thêm sản phẩm vào giỏ hàng
- Thanh toán (Checkout)
- Tìm kiếm sản phẩm

#### Kiểm thử giao diện người dùng (UI Testing)

- Hiển thị trên các trình duyệt phổ biến: Chrome, Edge.
- Bố cục và hiển thị các thành phần giao diện:
- Đảm bảo nút "Thanh toán", "Xác nhận đơn hàng" được hiển thị đầy đủ, không bị ẩn hoặc trùng lặp trên các kích thước màn hình khác nhau.
