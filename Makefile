ENCTARGETS := nb.txt start.txt encoding.txt
DECTARGETS := decoding.txt

TARGETS += $(ENCTARGETS) $(DECTARGETS)

CFLAGS += -std=c99

# include standard math library
LFLAGS += -lm


.PHONY: clean com

clean:
	rm -f main
	rm -f $(TARGETS)

com: main.c
	gcc -o main $(CFLAGS) $< $(LFLAGS)

run:
	./main
