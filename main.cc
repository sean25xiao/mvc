#include <iostream>
#include <string>

#include "device/hello_printer.h"

int main() {
    c_hello_printer hp("Hello_Printer_1");

    std::cout << hp.get_name() << std::endl;

    return 0;
}