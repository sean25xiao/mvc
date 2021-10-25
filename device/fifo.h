#ifndef _FIFO_H_
#define _FIFO_H_
#include <iostream>
#include <string>
#include <vector>

//TODO: Make this class as template
class c_fifo {
private:
  std::string name;
  std::vector<int> fifo_data;  // wait? should it be fixed in size?
  int max_capacity;
  int counter;
  bool rd_en;
  bool wr_en;   // FIFO Write Enable

public:
  c_fifo();               // Default Constructor
  c_fifo(int len);
  c_fifo(std::string input_name, int len);

  void enable_read()   { rd_en = true;  };
  void enable_write()  { wr_en = true;  };
  void disable_read()  { rd_en = false; };
  void disable_write() { wr_en = false; };
  bool check_rd_en()   { return rd_en;  };
  bool check_wr_en()   { return wr_en;  };

  bool push_back(int input_data);   // Implement in fifo.cc
  int  pop_front();                 // Implement in fifo.cc

  bool is_empty() { return (counter == 0); };
  bool is_full()  { return (counter == max_capacity); };
};

#endif