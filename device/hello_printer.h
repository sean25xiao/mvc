#ifndef _HELLO_PRINTER_H_
#define _HELLO_PRINTER_H_
#include <iostream>
#include <string>

class c_hello_printer {
private:
    std::string name;
public:
    c_hello_printer();    // Default Constructor
    c_hello_printer(std::string name);
    std::string get_name() {return name;};
    bool set_name(std::string name);
};
#endif