#!/usr/bin/python

import sys


def write_timescale(target_file, ns, ps):
    target_file.write("`timescale " + str(ns) + "ns / " + str(ps) + "ps\n")
    target_file.write("\n\n")


def declare_module(target_file, module_name, input_name, input_length, output_name, output_lenght):
    target_file.write("module " + module_name + "(\n" + \
                      "    input [" + str(input_length - 1) + ":0] "+ input_name + ",\n" \
                      "    output [" + str(output_lenght - 1) + ":0] " + output_name + "\n" \
                      "    );\n")
    target_file.write("\n")


def end_module(target_file):
    target_file.write("endmodule\n")


def begin_always_case(target_file, input_name):
    target_file.write("    always @ (" + input_name + ") begin\n" + \
                      "        case (" + input_name + ")\n")


def write_always_case_end(target_file):
    target_file.write("        endcase\n" + \
                      "    end\n")
    target_file.write("\n")


def declare_temp_reg(target_file, output_name, output_length):
    target_file.write("    reg [" + str(output_length - 1) + ":0] " + output_name + "_reg;\n")
    target_file.write("\n")


def write_assign(target_file, output_name):
    target_file.write("    assign " + output_name + " = " + output_name + "_reg;\n")
    target_file.write("\n")


def declare_values(target_file, table_name, addr_length, output_name, output_length, ord_symbol):
    with open(table_name + ".txt", "r") as table:
        for line_number, val in enumerate(table, 1):
            # temporary, for the whole alphabet symbol == address
            if (ord_symbol):
                address = line_number - 1 + ord('0')
            else:
                address = line_number - 1
            target_file.write("            " + str(addr_length) + "'b" + ("{0:0" + str(addr_length) + "b}").format(address) + " : begin\n" + \
                              "                " + output_name + "_reg = " + str(output_length) + "'b" + val.strip() + ";\n" + \
                              "            end\n")

def declare_default_val(target_file, output_name, output_length):
    target_file.write("            default : begin\n" + \
                      "                " + output_name + "_reg = " + str(output_length) + "'b" + ("{0:0" + str(output_length) + "b}").format(0) + ";\n" + \
                      "            end\n")


def create_ROM(dir_path, module_name, file_ext, input_name, input_length, output_name, output_length, table_name, ord_symbol, default):
    file_target = dir_path + module_name + file_ext

    rom_file = open(file_target, "w+")

    write_timescale(rom_file, 1, 1)

    declare_module(rom_file, module_name, input_name, input_length, output_name, output_length);

    declare_temp_reg(rom_file, output_name, output_length)

    begin_always_case(rom_file, input_name)

    declare_values(rom_file, table_name, input_length, output_name, output_length, ord_symbol)

    # If the number of values doesn't satisfy all the possible addresses, the default value is needed to synthesise the module.
    # It isn't used in an algorithm.
    if (default):
        declare_default_val(rom_file, output_name, output_length)

    write_always_case_end(rom_file)

    write_assign(rom_file, output_name)

    end_module(rom_file)

    rom_file.close()


def main(argv):
    print("Creating ROM modules...")
    dir_path = sys.argv[1] + "/"
    verilog_ext = ".v"
    create_ROM(dir_path, "nb_rom", verilog_ext, "symbol", 8, "nb", 8, "nb", True, True)
    create_ROM(dir_path, "start_rom", verilog_ext, "symbol", 8, "start", 8, "start", True, True)
    create_ROM(dir_path, "encoding_rom", verilog_ext, "address", 4, "state", 5, "encoding", False, False)
    print("Done!")


if __name__ == "__main__":
    main(sys.argv)
