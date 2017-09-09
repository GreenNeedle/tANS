#!/usr/bin/python

import sys


def write_timescale(file_name, ns, ps):
    target_file = open(file_name, "w+")
    target_file.write("`timescale " + str(ns) + "ns / " + str(ps) + "ps\n")
    target_file.close()


def write_module(file_target, module_name, input_name, input_length, output_name, output_lenght):
    file_target.write("module " + module_name + "(\n" + \
                      "    input [" + str(input_length - 1) + ":0] "+ input_name + ",\n" \
                      "    output [" + str(output_lenght - 1) + ":0] " + output_name + "\n" \
                      "    );\n")
    file_target.write("\n")


def create_nb_ROM():
    module_name = "nb_rom"
    file_ext = ".v"
    file_target = module_name + file_ext

    nb_ROM = open(file_target, "a+")

    write_timescale(file_target, 1, 1)
    nb_ROM.write("\n\n")

    write_module(nb_ROM, module_name, "symbol", 8, "nb", 8);

    nb_ROM.write("    reg [7:0] nb_reg;\n")
    nb_ROM.write("\n")

    nb_ROM.write("    always @ (symbol) begin\n" + \
                 "        case(symbol):\n")

    with open("nb.txt", "r") as nb_table:
        for line_number, nb_val in enumerate(nb_table, 1):
            symbol = line_number - 1 + ord('0')
            nb_ROM.write("            {0:08b}".format(symbol) + " : begin\n" + \
                         "                nb_reg = " + nb_val.strip() + ";\n")

    nb_ROM.write("        endcase\n" + \
                 "    end\n")
    nb_ROM.write("\n")

    nb_ROM.write("    assign nb = nb_reg;\n")
    nb_ROM.write("\n")

    nb_ROM.write("endmodule\n")

    nb_ROM.close()


def create_start_ROM():
    pass


def create_encoding_ROM():
    pass


def create_decoding_ROM():
    pass


def main(argv):
    print("Hello!")
    create_nb_ROM()
    print("Bye!")


if __name__ == "__main__":
    main(sys.argv)
