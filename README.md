# APEX Calculus, PreTeXt edition

This repository contains the source code for the APEX Calculus textbook.

APEX Calculus was originally [written in LaTeX](https://github.com/APEXCalculus/APEXCalculusV4); this version of the book uses [https://pretextbook.org](PreTeXt).

To build the book, use of the [PreTeXt CLI](https://github.com/PreTeXtBook/pretext-cli) is recommended.

Preparation for generating APEX Calculus from source:

Software requirements:
- a recent LaTeX distribution
- [Sage](https://www.sagemath.org/)
- Python (version 3.10 or later)
- the PreTeXt CLI (do `pip install pretextbook`)
- [pdf2svg](https://github.com/jalios/pdf2svg-windows)
- ImageMagick and pageres (installed as `pageres-cli` using node.js and npm) are recommended but not neeeded at this time

Note that Asymptote compilation is done remotely, so Asymptote does not need to be installed locally.

Configuration:

- In the `project.ptx` file, change the URL for the WeBWorK server to your local server
- In `publication/publication.ptx`, change the `baseurl` to the URL where your copy will be hosted

To build HTML, run `pretext build html -d -w` for your first run.
The `-d` option generates all the images in the book; `-w` generates the WeBWorK exercises.
If you haven't made any changes to these, you can use `pretext build html` on subsequent builds.

To build PDF, run `pretext build latex`, or `pretext build latex -d -w`
if you need to build images or WeBWorK exercises.

If you want a black and white version for print-on-demand,
replace the `project.ptx` file with the `project-options/project-print.ptx` file.

**Do not build PDF directly.** APEX Calculus places figures in the margins in PDF.
Unfortunately, we do not currently have a mechanism for setting the vertical placement
of margin figures in the PreTeXt source, so these have to be adjusted by hand.
Look in the LaTeX source for occurrences of `\listmarginbox`, `\parmarginbox` and `\tcbmarginbox`.
Each such environment ends with either `{0pt}` or `{-1cm}`.

These values can be adjusted to ensure that items in the margins do not overlap.
It is unfortunately a rather tedious process at the moment.

To omit videos in any version of the book, delete `video` from the line
`<versions include="color video"/>` (or `<versions include="print video"/>`)
in the publication file.

At this time, EPUB generation is not fully supported.
