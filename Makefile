CC = gcc
CFLAGS = -Wall -Wextra -Werror -O2 -I./libkirk

TARGET1 = libkirk/libkirk.a
TARGET2 = pkgrip

LIB_SRCS = libkirk/kirk_engine.c libkirk/aes.c libkirk/sha1.c libkirk/amctrl.c libkirk/bn.c libkirk/ec.c
PKGRIP_SRCS = pkgrip.c

LIB_OBJS = $(LIB_SRCS:.c=.o)
PKGRIP_OBJS = $(PKGRIP_SRCS:.c=.o)

.PHONY: all clean

all: $(TARGET1) $(TARGET2)

$(TARGET1): $(LIB_OBJS)
	@mkdir -p libkirk
	$(AR) rcs $@ $^

$(TARGET2): $(PKGRIP_OBJS) $(TARGET1)
	$(CC) $(CFLAGS) -o $@ $(PKGRIP_OBJS) -L./libkirk -lkirk -lz

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf *.o libkirk/*.o $(TARGET1) $(TARGET2)

# Automatically generate dependencies (for header files)
%.d: %.c
	@set -e; rm -f $@; \
	$(CC) -MM $(CFLAGS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$

-include $(LIB_SRCS:.c=.d) $(PKGRIP_SRCS:.c=.d)
