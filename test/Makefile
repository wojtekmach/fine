PRIV_DIR = $(MIX_APP_PATH)/priv
NIF_PATH = $(PRIV_DIR)/libfine_test.so

C_SRC = $(shell pwd)/c_src/fine_test
CPPFLAGS = -shared -fPIC -std=c++17 -Wall -Wextra
CPPFLAGS += -I$(ERTS_INCLUDE_DIR) -I$(FINE_INCLUDE_DIR)
# We want to eliminate all warnings, so the end user doesn't see any
CPPFLAGS += -Werror

ifdef DEBUG
	CPPFLAGS += -g
else
	CPPFLAGS += -O3
endif

UNAME_S := $(shell uname -s)
ifndef TARGET_ABI
ifeq ($(UNAME_S),Darwin)
	TARGET_ABI = darwin
endif
endif

ifeq ($(TARGET_ABI),darwin)
	CPPFLAGS += -undefined dynamic_lookup -flat_namespace
endif

SOURCES = $(wildcard $(C_SRC)/*.cpp)
FINE_HEADERS = $(wildcard $(FINE_INCLUDE_DIR)/*.hpp)

build: $(NIF_PATH)
	@ echo > /dev/null # Dummy command to avoid the default output "Nothing to be done"

$(NIF_PATH): $(SOURCES) $(FINE_HEADERS)
	@ mkdir -p $(PRIV_DIR)
	$(CXX) $(CPPFLAGS) $(SOURCES) -o $(NIF_PATH)
