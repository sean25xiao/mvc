#ifndef _FIFO_H_
#define _FIFO_H_
#include <iostream>
#include <string>

//TODO: Make this class as template
class c_fifo {
private:
  std::vector<int> fifo_data;  // wait? should it be fixed in size?
  int max_capacity;
  bool rd_en;
  bool wr_en;   // FIFO Write Enable
public:
  c_fifo();     // Default Constructor

  void enable_read()   {rd_en = true};
  void enable_write()  {wr_en = true};
  void disable_read()  {rd_en = false};
  void disable_write() {wr_en = false};

  bool push_back(int input_data);
  int pop_front();

  bool is_empty();
  bool is_full();
}

#endif