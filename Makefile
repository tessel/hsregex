CC = gcc
AR = ar
# Either this one
#CFLAGS = -DREGEX_STANDALONE -fPIC -DREG_DEBUG -g
# Or this one
CFLAGS = -DREGEX_STANDALONE -fPIC -D_NDEBUG -O3
LDFLAGS = -c
SRCS = src/regcomp.c src/regexec.c src/regerror.c src/regfree.c src/regalone.c
OBJS = $(SRCS:.c=.o)
BINS = libhsrex.a libhswrex.a
all:
	make libhsrex.a
	rm -f $(OBJS)
	make "CFLAGS=$(CFLAGS) -DREGEX_WCHAR" libhswrex.a
$(BINS): $(OBJS)
	# $(CC) $(LDFLAGS) -o $@ $(OBJS)
	$(AR) rvs $@ $(OBJS)
clean:
	rm -f $(OBJS) $(BINS)
