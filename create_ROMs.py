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


def create_ROM(module_name, file_ext, input_name, input_length, output_name, output_length):
    file_target = module_name + file_ext

    rom_file = open(file_target, "a+")

    write_timescale(file_target, 1, 1)
    rom_file.write("\n\n")

    write_module(rom_file, module_name, input_name, input_length, output_name, output_length);

    rom_file.write("    reg [" + str(output_length - 1) + ":0] " + output_name + "_reg;\n")
    rom_file.write("\n")

    rom_file.write("    always @ (" + input_name + ") begin\n" + \
                 "        case(" + input_name + "):\n")

    with open(output_name + ".txt", "r") as table:
        for line_number, val in enumerate(table, 1):
            symbol = line_number - 1 + ord('0')
            rom_file.write("            {0:08b}".format(symbol) + " : begin\n" + \
                         "                " + output_name + "_reg = " + val.strip() + ";\n")

    rom_file.write("        endcase\n" + \
                 "    end\n")
    rom_file.write("\n")

    rom_file.write("    assign " + output_name + " = " + output_name + "_reg;\n")
    rom_file.write("\n")

    rom_file.write("endmodule\n")

    rom_file.close()


def main(argv):
    print("Hello!")
    create_ROM("nb_rom", ".v", "symbol", 8, "nb", 8)
    print("Bye!")


if __name__ == "__main__":
    main(sys.argv)
