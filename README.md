# APEX Calculus, PreTeXt edition

This repository contains the source code for the APEX Calculus textbook.

APEX Calculus was originally [written in LaTeX](https://github.com/APEXCalculus/APEXCalculusV4); this version of the book uses [https://pretextbook.org](PreTeXt).

To build the book, use of the [PreTeXt CLI](https://github.com/PreTeXtBook/pretext-cli) is recommended.

Preparation for generating APEX Calculus from source:

Software requirements:
- a recent LaTeX distribution
- [Sage](https://www.sagemath.org/)
- Python (version 3.8 or later)
- the PreTeXt CLI (do `pip install pretextbook`)
- [pdf2svg](https://github.com/jalios/pdf2svg-windows)
- ImageMagick

Note that Asymptote compilation is done remotely by default, so Asymptote does not need to be installed locally.

Configuration:

- In `publication/publication.ptx`, change the `baseurl` to the URL where your copy will be hosted, and set the `webwork` server to your local server.
- If you wish to set a custom stylesheet, place it in the `style` folder, and add `<xsl>style/custom-style.xsl</xsl>` tags to the appropriate targets in the `project.ptx` file, where you should of course replace `custom-style.xsl` with whatever you named your style file.
- You can also use `<xsl>...</xsl>` tags in `project.ptx` to point to a newer version of one of the PreTeXt XSL files than the one that ships with the CLI. (This is not officially supported, so use with caution.)

To build HTML, run `pretext build html`

To build a version without videos, run `pretext build html-novideo`

To build PDF, run `pretext build latex`.

The following variations are also available:
- `pretext build latex-novideo`: omit QR code links to videos
- `pretext build latex-print`: black and white, for print on demand
- `pretext build latex-print-novideo`: black and white, with no video links
- `pretext build latex-color-print`: in color, but two-sided layout for printing
- `pretext build latex-color-print-novideo`: as above, but without QR codes for videos

**Do not build PDF directly.** APEX Calculus places figures in the margins in PDF.
Unfortunately, we do not currently have a mechanism for setting the vertical placement
of margin figures in the PreTeXt source, so these have to be adjusted by hand.
Look in the LaTeX source for occurrences of `\listmarginbox`, `\parmarginbox` and `\tcbmarginbox`.
Each such environment ends with either `{0cm}` or `{-1cm}`.

These values can be adjusted to ensure that items in the margins do not overlap.
It is unfortunately a rather tedious process at the moment.

At this time, EPUB generation is not fully supported.
