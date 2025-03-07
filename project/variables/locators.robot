*** Variables ***
${Web_Homepage_Logo}                    xpath=//img[@title='logo']


${Web_Login_Button}                     xpath=//a[@href='/laptopshop/login']
${Web_Login_Title}                      xpath=//h2[text()='LaptopShop - Đăng nhập']
${Web_Login_Input_Email}                xpath=//input[@name='email']
${Web_Login_Input_Password}             xpath=//input[@name='password']
${Web_Login_Button_Submit}              xpath=//input[@id='submit']
${Web_Admin_LaptopShop}                 xpath=//a[text()='Laptop Shop - Trang Quản Trị']
${Web_Login_ErrorMessage}               xpath=//p[text()='Tên đăng nhập hoặc mật khẩu không đúng.']


${Web_Signin_Button}                    xpath=//a[@href='/laptopshop/register']
${Web_Sigin_Title}                      xpath=//h2[text()='LaptopShop - Đăng ký tài khoản']
${Web_Signin_Email_Input}               xpath=//input[@id='email']
${Web_Signin_Password_Input}            xpath=//input[@id='password']
${Web_Signin_ConfrimPassword_Input}     xpath=//input[@id='confirmPassword']
${Web_Signin_Name_Input}                xpath=//input[@id='hoTen']
${Web_Signin_PhoneNumber_Input}         xpath=//input[@id='soDienThoai']
${Web_Signin_Address_Input}             xpath=//input[@id='diaChi']
${Web_Signin_Submit_Button}             xpath=//input[@id='submit']

${Web_Homepage_Custumer}                xpath=//div[@class='header-top-nav ']
${Web_Homepage_Title}                   xpath=//h4[text()='DANH SÁCH LAPTOP MỚI NHẤT']
${Web_Homepage_Product_Name}            xpath=//h3[text()='Haier S1 HR-13MZ/Pentium N4200']
${Web_AddToCart_Button}                 xpath=//a[@href='/laptopshop/cart']
${Web_AddToCart_Title}                  xpath=//h2[text()='  QUẢN LÝ GIỎ HÀNG']
${Web_Zoom75%}                          xpath=document.body.style.zoom='70%'
${Web_Homepage_Category_Menu}           xpath=//h4[text()='Danh mục']
${Web_Homepage_Category_Select}         xpath=//a[@href='/laptopshop/store?brand=Laptop']
${Web_Homepage_Price_Fomat}             xpath=//h3[text()='7.490.000 VND']


${Web_Checkout_Button}                  xpath=//a[@href='/laptopshop/checkout']
${Web_Checkout_Infor_Title}             xpath=//b[text()='Thông tin khách hàng']
${Web_Checkout_Name_Input}              xpath=//input[@name='hoTenNguoiNhan']
${Web_Checkout_PhoneNumber_Input}       xpath=//input[@name='sdtNhanHang']
${Web_Checkout_Address_Input}           xpath=//textarea[@name='diaChiNhan']
${Web_Checkout_Submit_Button}           xpath=//button[text()='Gửi đơn hàng']
${Web_Cart_Quantity}                    xpath=(//input[@type='number'])[1]
${Web_Cart_Button}                      xpath=//a[@href='/laptopshop/cart']
${Web_Cart_Menu}                        xpath=//div[@class='content-grids']
#Search Funtion
${Web_SEARCH_BOX}                   xpath=//input[@name='name']
${Web_SEARCH_BUTTON}                xpath=//input[@value='Search']
#${Web_SEARCH_RESULT}                xpath=//h4[text()='Kết quả tìm kiếm']
#${Web_NO_RESULTS_MESSAGE}           xpath=//h4[text()='Không tìm thấy kết quả nào']
#Upload
${Web_AdminHomepage_Sanpham}        xpath=//a[@href='/laptopshop/admin/san-pham']
${Web_AddProduct_Title}             xpath=//h3[text()='Quản lý Sản Phẩm']
${Web_AddProduct_Dropdown}          xpath=//select[@id='danhMucDropdown']
${Web_AddProduct_Popup}             xpath=(//h5[text()='Thêm mới sản phẩm danh mục Laptop'])[1]
${Web_AddProduct_Name_Input}        xpath=(//input[@name='tenSanPham'])[1]
${Web_AddProduct_Price_Input}       xpath=(//input[@name='donGia'])[1]
${Web_AddProduct_HSX_Dropdown}      xpath=//select[@id='nhaSXId']
${Web_AddProduct_Laptop_Option}     xpath=//option[text()='Laptop']
${Web_AddProduct_HDH_Input}         xpath=//input[@name='heDieuHanh']
${Web_AddProduct_Ram_Input}         xpath=//input[@name='ram']
${Web_AddProduct_Screen_Input}      xpath=//input[@name='manHinh']
${Web_AddProduct_CPU_Input}         xpath=//input[@name='cpu']
${Web_AddProduct_Design_Input}      xpath=//input[@name='thietKe']
${Web_AddProduct_Infor_Input}       xpath=(//textarea[@name='thongTinChung'])[1]
${Web_AddProduct_Pin_Input}         xpath=//input[@name='dungLuongPin']
${Web_AddProduct_BaoHanh_Input}     xpath=(//input[@name='thongTinBaoHanh'])[1]
${Web_AddProduct_Quality_Input}     xpath=(//input[@name='donViKho'])[1]
${Web_AddProduct_IMG_Upload}        xpath=(//input[@id='inputEmail4'])[1]
${Web_AddProduct_Submit_Button}     xpath=//input[@id='btnSubmit']





#Quản lý danh mục
${Web_Category_Slect}                   xpath=//a[@href='/laptopshop/admin/danh-muc']
${Web_Category_Title}                   xpath=//h3[text()='Quản lý Danh Mục']
${Web_Category_Add_Button}              xpath=//button[@class='btn btn-success btnThemDanhMuc']
${Web_Category_Add_Table}               xpath=//h5[@id='exampleModalLabel']
${Web_Category_NameCategory_Input}      xpath=//input[@id='tenDanhMuc']
${Web_Category_Save_Button}             xpath=//input[@id='btnSubmit']
${Web_Category_CategoryTable}           xpath=//table[@class='table table-hover danhMucTable']
${Web_Category_PageNumber}              xpath=//a[text()='2']
${Web_Category_Huy_Button}              xpath=//button[@class='btn btn-secondary']
${Web_Category_Update_Button}           xpath=(//button[@class='btn btn-primary btnCapNhatDanhMuc'])[4]
${Web_Category_Delete_Button}           xpath=(//button[@class='btn btn-danger btnXoaDanhMuc'])[4]


#Quan ly nhan hieu
${Web_Brand_Select}                     xpath=//a[@href='/laptopshop/admin/nhan-hieu']
${Web_Brand_Title}                      xpath=//h3[text()='Quản lý Nhãn hiệu']
${Web_Brand_Add_Button}                 xpath=//button[@class='btn btn-success btnThemNhanHieu']
${Web_Brand_Add_Popup}                  xpath=//h5[@id='exampleModalLabel']
${Web_Brand_NameBrand_Input}            xpath=//input[@id='tenHangSanXuat']
${Web_Brand_Save_Button}                xpath=//input[@id='btnSubmit']
${Web_Brand_CategoryTable}              xpath=//table[@class='table table-hover nhanHieuTable']
${Web_Brand_Update_Button}              xpath=(//button[@class='btn btn-primary btnCapNhatNhanHieu'])[4]
${Web_Brand_Update_Table}               xpath=//table[@class='table table-hover nhanHieuTable']
${Web_Brand_Delete_Button}              xpath=(//button[@class='btn btn-danger btnXoaNhanHieu'])[4]


#Quan ly tai khoan
${Web_Account_Select}                   xpath=//a[@href='/laptopshop/admin/tai-khoan']
${Web_Account_Title}                    xpath=//h3[text()='Quản lý Tài khoản']
${Web_Account_Add_Button}               xpath=//button[@class='btn btn-success btnThemTaiKhoan']
${Web_Account_Add_Popup}                xpath=//h5[@id='exampleModalLabel']
${Web_Account_Email_Input}              xpath=//input[@name='email']
${Web_Account_Password_Input}           xpath=//input[@name='password']
${Web_Account_ConfrimPassword_Input}    xpath=//input[@name='confirmPassword']
${Web_Account_Role_Radio}               xpath=//input[@value='ROLE_SHIPPER']        #đổi nếu muốn đổi sang Role Member
${Web_Account_Name_Input}               xpath=//input[@name='hoTen']
${Web_Account_Phone_Input}              xpath=//input[@name='sdt']
${Web_Account_Address_Input}            xpath=//input[@name='diaChi']
${Web_Account_AccountTable}             xpath=//table[@class='table table-hover taiKhoanTable']
${Web_Account_Fill_Dropdown}            xpath=//select[@id='vaiTro']
${Web_Account_Value_Dropdown}           xpath=//option[@value='ROLE_SHIPPER']        #đổi nếu muốn đổi sang Role Member
${Web_Account_Delete_Button}            xpath=(//button[@class='btn btn-danger btnXoa'])[2]
