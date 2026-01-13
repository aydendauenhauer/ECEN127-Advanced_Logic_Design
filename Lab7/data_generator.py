import math

FILE_NAME = "rom.hex"
with open(FILE_NAME, "w") as f:
    for i in range(128):
        phase = (2.0 * math.pi * i / 128.0)
        sample = (math.sin(phase) + 1.0) * 0.5 * 0.99999 * 256
        result = (int(sample) & 255)
        f.write(f"{result:02X}\n")
