PWD     := $(shell pwd)
GEN_DIR ?= $(PWD)


ENCTABS := nb.txt start.txt encoding.txt
DECTABS := decoding.txt

TABS += $(ENCTABS) $(DECTABS)


ENCROMS := nb_rom.v start_rom.v encoding_rom.v
DECROMS := decoding_rom.v

ROMS += $(ENCROMS) $(DECROMS)

CFLAGS += -std=c99

# include standard math library
LFLAGS += -lm


main.o: main.c
	gcc -o $@ $(CFLAGS) $< $(LFLAGS)


.PHONY: clean gen_tables gen_roms

clean:
	rm -f main.o
	rm -f $(TABS)
	cd $(GEN_DIR) && rm -f $(ENCROMS)

gen_tables: main.o
	./main.o

gen_roms: gen_tables
	./generate_ROMs.py $(GEN_DIR)