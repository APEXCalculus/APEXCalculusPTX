# APEX Calculus, PreTeXt edition

This repository contains the source code for the APEX Calculus textbook.

APEX Calculus was originally [written in LaTeX](https://github.com/APEXCalculus/APEXCalculusV4); this version of the book uses [https://pretextbook.org](PreTeXt).

To build the book, use of the [PreTeXt CLI](https://github.com/PreTeXtBook/pretext-cli) is recommended.

Note however that due to some custom styling choices, building directly to PDF without first editing the intermediary LaTeX file is not recommended,
as some hand editing is required for proper alignment of margin figures.
(See also the `latex-youtube.txt` file for some recommended adjustments to the way YouTube links are handled in the PDF.)

Settings can be changed in the `project.ptx` file and the `publication/publication.ptx` file.
Note that there are separate files for print-on-demand versions of the PDF.
These should replace the existing files before building LaTeX output.
