#include <iostream>
#include <string>
#include "hello_printer.h"

c_hello_printer::c_hello_printer()
    :name{"None"} {

};

c_hello_printer::c_hello_printer(std::string input_name)
    :name{input_name} {

};

bool c_hello_printer::set_name(std::string name) {
    this->name = name;
    if (this->name == "None")
        return false;

    return true;
}