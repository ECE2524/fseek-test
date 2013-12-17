CC ?= cc
CC_FLAGS := -Wall -Wextra -pedantic -D_XOPEN_SOURCE_700

all: fdtests

fdtests: fdaccess
	@echo "Redirect standard in from file:"
	-./fdaccess <fox.txt
	@echo 
	@echo "Redirect standard in from pipe:"
	-cat fox.txt | ./fdaccess

fdaccess: fdaccess.o

.PHONY: clean
clean:
	rm -f *.o fdaccess
