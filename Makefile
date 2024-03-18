.PHONY: all
all: compile

.PHONY: clean
clean:
	rm -rf libmymath.a math_lib.o
	rm -rf main main.o

.PHONY: compile
compile: main.o libmymath.a
	gcc main.o -o main -static -L. -lmymath

main.o:
	gcc -c main.c

libmymath.a: math_lib.o
	ar -rcs libmymath.a math_lib.o

math_lib.o:
	gcc -c math_lib/src/math_lib.c
