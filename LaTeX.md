# Comments #
One line:
```
# One comment.
```

Multiline:
```
\usepackage{verbatim}
```

in the preamble. Then:
```
\begin{comment}
Multi
line
comment.
\end{comment}
```

# Formatting #

## Quote paragraphs ##
```
\begin{quotation}
\emph{Reality is whatever refuses to go away when I stop believing in it.}\\
\textbf{Philip K. Dick}
\end{quotation}
```

# Maths #

## Delimeters ##
| Parentheses | `( )` | `\left ( \right )` |
|:------------|:------|:-------------------|
| Brackets | `[ ]` | `\left [ \right ]` |
| Braces | `{ }` | `\left \{ \right \}` |

## Subscripts, superscripts,... ##
| Subscript | | `A_n`, `A_{n}`|
|:----------|:|:--------------|
| Superscript |  | `A^n` |
| Hat, wide hat | Â | `\hat A`, `\widehat A` |
| Bar, overline |  | `\bar A`, `\overline A` |
| Vector |  | `\vec A`, `\overrightarrow{A B}` |

# Links #

In the preamble:

```
\usepackage{hyperref}
```

Then:
```
\href{http://cvblob.googlecode.com}{cvblob.googlecode.com}
```

# New styles #

## Abstract like style ##

```
\newenvironment{Resumen}
{
  \begin{center}\textbf{Resumen}\end{center}
  \begin{quote}
  \emph
  \bgroup
}
{
  \egroup
  \end{quote}
}
```

# References #
  * [The TexBook](http://docs.online.bg/PROGRAMMING/tex/the-texbook.ps)
  * [Math Markup](http://en.wikipedia.org/wiki/Math_markup)
  * [LaTeX:Symbols](http://www.artofproblemsolving.com/Wiki/index.php/LaTeX:Symbols)
  * [Tables](http://en.wikibooks.org/wiki/LaTeX/Tables)