CFLAGS += -std=c99

# include standard math library
LFLAGS += -lm


.PHONY: clean com

clean:
	rm -f main

com: main.c
	gcc -o main $(CFLAGS) $< $(LFLAGS)
