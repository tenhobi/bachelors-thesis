# Code listing

Using `minted` package.

## Settings

In `main.tex`:

```tex
\usepackage{minted}
\counterwithin{listing}{chapter}
\renewcommand{\listingscaption}{Výpis kódu}
\renewcommand{\listoflistingscaption}{Seznam výpisů kódu}
```

and in template file inside `\AfterEndPreamble`:

```tex
\cleardoublepage
\listoflistings
```

## Block

```tex
\begin{listing}
  \caption{Hello world v C++}
  \label{fig:hellocpp}
  \begin{minted}{c++}
  #inlude<iostream>
  using namespace std;

  int main() {
      cout << "Hello, world!" << endl;
      return 0;
  }
  \end{minted}
\end{listing}
```

## Inline

```tex
My text, blah blah, \mintinline{c++}|"Hello, world!"|, blah blah.
```
