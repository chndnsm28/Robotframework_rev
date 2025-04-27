from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:
    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")


    @keyword
    def hello_world(self):
        print("Hello Tester")


