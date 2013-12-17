CC ?= cc
CFLAGS := -Wall -Wextra -pedantic -D_XOPEN_SOURCE=700

all: fdtests

fdtests: fdaccess
	@echo -e "Running tests...\n"
	@echo "Redirect standard in from file:"
	-./fdaccess <fox.txt
	@echo 
	@echo "Redirect standard in from pipe:"
	-cat fox.txt | ./fdaccess

fdaccess: fdaccess.o

.PHONY: clean
clean:
	rm -f *.o fdaccess
