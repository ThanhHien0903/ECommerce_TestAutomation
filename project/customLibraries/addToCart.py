from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class addToCart:

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword("Add Items To Cart And Checkout")
    def add_items_to_cart_and_checkout(self, productsList):
        i = 1
        productsTitles = self.selLib.get_webelements("xpath=//h3[@style='font-weight: bold;']")

        for productsTitle in productsTitles:
            if productsTitle.text in productsList:
                self.selLib.click_button("xpath:(//button[@class='btn btn-warning'])[" + str(i) + "]")
                # Xử lý alert bằng SeleniumLibrary
                self.selLib.handle_alert()
            i += 1

        self.selLib.click_link("xpath=//a[@href='/laptopshop/cart']")
