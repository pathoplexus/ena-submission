# This is a script to extract all the keys from a JSON file
# and write them to suppressed/ppx-accessions-suppression-list.txt file, one key per line.
# Usage: python add_to_suppressed.py input.json
import json
import sys

OUTPUT_FILE = "suppressed/ppx-accessions-suppression-list.txt"

input_file = sys.argv[1]

with open(input_file, "r") as f:
    data = json.load(f)

keys = data.keys()

with open(OUTPUT_FILE, "a") as out:
    for key in keys:
        out.write(key + "\n")
