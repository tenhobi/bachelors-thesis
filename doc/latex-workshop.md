# LaTeX Workshop

> [LaTeX Workshop][] is an extension for Visual Studio Code,
> aiming to provide core features for LaTeX typesetting with Visual Studio Code.

As prerequisites for proper functionality, you need to install dependencies,
which are listed in the [README](../README.md).

The `arara` is used to build the thesis, so it is advisable to edit it in VSCode extension's settings:

```yaml
    "latex-workshop.latex.watch.usePolling": true, // WSL2
    "latex-workshop.latex.autoBuild.run": "onFileChange",
    "latex-workshop.view.pdf.viewer": "tab",
    "latex-workshop.synctex.synctexjs.enabled": true,
    "latex-workshop.latex.tools": [
        {
            "name": "latexmk",
            "command": "latexmk",
            "args": [
                "-xelatex",
                "-synctex=1",
                "-interaction=nonstopmode",
                "-file-line-error",
                "-shell-escape",
                "%DOC%"
            ]
        },
        {
            "name": "bibtex",
            "command": "bibtex",
            "args": [
                "%DOC%"
            ],
            "env": {}
        },
        {
            "name": "arara",
            "command": "arara",
            "args": [
                "%DOCFILE%"
            ]
        }
    ],
    "latex-workshop.latex.recipes": [
        {
            "name": "arara",
            "tools": [
                "arara"
            ]
        },
        {
            "name": "latexmk 🔃",
            "tools": [
                "latexmk"
            ]
        },
        {
            "name": "latexmk (latexmkrc)",
            "tools": [
                "latexmk_rconly"
            ]
        },
        {
            "name": "latexmk (lualatex)",
            "tools": [
                "lualatexmk"
            ]
        },
        {
            "name": "pdflatex ➞ bibtex ➞ pdflatex × 2",
            "tools": [
                "pdflatex",
                "bibtex",
                "pdflatex",
                "pdflatex"
            ]
        }
    ],
```

[LaTeX Workshop]: https://github.com/James-Yu/LaTeX-Workshop
