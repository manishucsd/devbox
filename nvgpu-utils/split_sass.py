#!/usr/bin/env python3
import argparse, os, re, sys

MARK_RE = re.compile(r'^\s*//-+\s*\.text\.[^\s-]+.*$')  # matches the .text.<symbol> divider

def main():
    ap = argparse.ArgumentParser(description="Split SASS text by .text.* markers into ID-named files")
    ap.add_argument("infile", help="SASS text file (from cuobjdump/nvdisasm)")
    ap.add_argument("-o", "--outdir", default="sass_sections", help="Output directory")
    ap.add_argument("--keep-preamble", action="store_true",
                    help="Write lines before the first .text.* section to 000.sass")
    args = ap.parse_args()

    os.makedirs(args.outdir, exist_ok=True)

    sec_idx = 0
    out = None
    preamble = []

    def open_new():
        nonlocal sec_idx, out
        sec_idx += 1
        if out and not out.closed:
            out.close()
        path = os.path.join(args.outdir, f"{sec_idx:03d}.sass")
        out = open(path, "w", encoding="utf-8")

    with open(args.infile, "r", encoding="utf-8", errors="replace") as f:
        for line in f:
            if MARK_RE.match(line):
                open_new()
                out.write(line)
                continue
            if sec_idx == 0:
                preamble.append(line)
            else:
                out.write(line)

    if out and not out.closed:
        out.close()

    if preamble and args.keep_preamble:
        with open(os.path.join(args.outdir, "000.sass"), "w", encoding="utf-8") as p:
            p.writelines(preamble)

if __name__ == "__main__":
    sys.exit(main())
