#!/usr/local/bin/python3
import json
import os
import sys

def load_shortcuts():
    json_path = os.path.expanduser("~/mac_shortcuts.json")
    if not os.path.exists(json_path):
        print("{} | No shortcuts JSON file found. Please ensure it is saved at ~/mac_shortcuts.json".format("Error"))
        return

    with open(json_path, "r") as file:
        shortcuts = json.load(file)
    return shortcuts

def search_shortcuts(query, shortcuts):
    results = []
    for category, items in shortcuts.items():
        for key, description in items.items():
            if query.lower() in key.lower() or query.lower() in description.lower():
                results.append({"title": key, "subtitle": description, "arg": key})
    return results

def main():
    query = sys.argv[1] if len(sys.argv) > 1 else ""
    shortcuts = load_shortcuts()
    if not shortcuts:
        return

    results = search_shortcuts(query, shortcuts)
    output = {"items": results if results else [{"title": "No results found", "subtitle": "Try another query"}]}
    print(json.dumps(output))

if __name__ == "__main__":
    main()
