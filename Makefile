CXX=g++
CXXFLAGS=-Werror -std=c++17
CXXPREP=-c

TOP_DIR=./.
DEVICE_DIR=./device
OBJ_DIR=./obj
TEST_DIR=./tests

INCLUDES+=-Idevice

DEVICE_LIST+=hello_printer

#TEST_LIST+=hello_printer_test
TEST_LIST=$(addsuffix _test, $(DEVICE_LIST))

DEVICE_STATIC_LIST_PREFIX=$(addprefix $(OBJ_DIR)/, $(DEVICE_LIST))  
DEVICE_STATIC_LIST=$(addsuffix .o, $(DEVICE_STATIC_LIST_PREFIX))    # Used in Static Pattern Rule


all: build_msg $(OBJ_DIR)/$(TEST_LIST)

$(OBJ_DIR)/$(TEST_LIST): $(OBJ_DIR)/$(DEVICE_LIST).o $(OBJ_DIR)/$(TEST_LIST).o
	$(CXX) $(CXXFLAGS) $^ -o $@

$(OBJ_DIR)/$(TEST_LIST).o: $(TEST_DIR)/$(TEST_LIST).cc    
	$(CXX) $(CXXPREP) $(CXXFLAGS) $(INCLUDES) $^ -o $@

# Static Pattern Rule, which only applys to DEVICE_LIST
$(DEVICE_STATIC_LIST) : $(OBJ_DIR)/%.o : $(DEVICE_DIR)/%.cc
	$(CXX) $(CXXPREP) $(CXXFLAGS) $< -o $@

.PHONY:build_msg
build_msg:
	@printf "\nBuilding mvc\n"   # TODO - Add more build message, ex. each device has its own message

.PHONY: clean
clean:
	rm -rf *.o *.out obj/* mvc
