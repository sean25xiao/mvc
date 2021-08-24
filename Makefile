CXX=g++
CXXFLAGS=-Werror -std=c++17
CXXPREP=-c

TOP_DIR=./.
DEVICE_DIR=./device
OBJ_DIR=./obj

DEPS=$(DEVICE_DIR)/hello_printer.h
SRCS=$(DEVICE_DIR)/hello_printer.cc  # TODO - Add DEVICE_DIR to a path so that we can remove this
DEVICE_OBJS=$(OBJ_DIR)/hello_printer.o
MAIN_OBJ=$(OBJ_DIR)/main.o
TARGET=mvc

all: build_msg $(TARGET)

$(TARGET): $(DEVICE_OBJS) $(MAIN_OBJ)
	$(CXX) $(CXXFLAGS) $^ -o $@

$(MAIN_OBJ): main.cc     # TODO - Make main.cc a variable
	$(CXX) $(CXXPREP) $(CXXFLAGS) $^ -o $@

$(DEVICE_OBJS): $(SRCS)
	$(CXX) $(CXXPREP) $(CXXFLAGS) $^ -o $@

.PHONY:build_msg
build_msg:
	@printf "\nBuilding mvc\n"   # TODO - Add more build message, ex. each device has its own message

.PHONY: clean
clean:
	rm -rf *.o *.out obj/* mvc
