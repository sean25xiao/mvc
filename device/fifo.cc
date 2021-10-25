#include <iostream>
#include <string>
#include "fifo.h"

c_fifo::c_fifo()
  : name{"FIFO-NULL"} 
{

}

c_fifo::c_fifo(int len)
  : name{"FIFO-NULL"}, max_capacity{len}
{

}

c_fifo::c_fifo(std::string input_name, int len)
  : name{input_name}, max_capacity{len}
{

}