FILE_NAME = "data.mem"
with open(FILE_NAME, "w") as f:
    for j in range(1024):
        value = (99 * j) % 1000
        f.write(f"{value:03X}\n")