SRC := c_src/example_nif.cpp
TARGET := $(MIX_BUILD_DIR)/example_nif.so

CPPFLAGS := -std=c++17 -fvisibility=hidden -fPIC -I$(ERL_INCLUDE_DIR) -I$(FINE_INCLUDE_DIR)

ifeq ($(shell uname -s),Darwin)
    LDFLAGS := -dynamiclib -undefined dynamic_lookup
else
    LDFLAGS := -shared
endif

all: $(TARGET)

$(TARGET): $(SRC)
	$(CXX) $(CPPFLAGS) $(LDFLAGS) -o $@ $^
