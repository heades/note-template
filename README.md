A Note Template using Ott and LaTeX
---

The point of this template is to write a note using Ott and LaTeX
quickly when I have ideas.  This is really easy to get compiling,
because it compiles as is! However, if you are like me, and like to
name things, then change the following.

First, in [Makefile](Makefile) change the following lines:

```
# Name of the note:
Name := note
# Name of the language (ott spec name):
OTTPrefix := spec
```

The first names the LaTex files, and the second names the language and
prefixes all Ott commands with `$(OTTPrefix)`.  I usually set the
latter to my language name.

Then in [note.tex](note.tex) update the lines

```
%% Change "spec" to language prefix.
\input{spec-inc}

\begin{document}
%% Change "spec" to language prefix.
\specall
\end{document}
```

with your new `$(OTTPrefix)`.

That's it, you can now build the note with custom names.