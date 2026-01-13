import sys

with open('c_output_part4.csv', 'r') as c_file, open('verilog_output_part4.csv', 'r') as v_file:
    c_lines = c_file.readlines()
    v_lines = v_file.readlines()

all_match = True
for i, (c_line, v_line) in enumerate(zip(c_lines, v_lines)):
    if c_line.strip() != v_line.strip():
        all_match = False
        break

if all_match:
    print("PASS")
else:
    print("FAIL")

