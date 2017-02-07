CXXFLAGS= -I. 
CXXFLAGS+=-g
CXXFLAGS+=-O2 
CXXFLAGS+=-Wall \
		  -Wno-unused-parameter -Woverloaded-virtual -Wextra \
		  -Wpointer-arith -Wshadow

TESTS=sample
OBJS=conhash.o murmurhash3.o
LIB=libconhash.a

all: $(TESTS) $(LIB)

$(TESTS):
	g++ $(CXXFLAGS) -o $@ $(filter %.cc, $^)

$(LIB) : $(OBJS)
	rm -f $@
	ar cr $@ $(OBJS)
	rm -f $(OBJS)

tags :
	ctags -R *

sample: sample.cc conhash.cc murmurhash3.cc

.PHONY: clean
clean:
	rm -f $(TESTS) $(OBJS) $(LIB)
