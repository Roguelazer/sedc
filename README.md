sedc - an optimizing sed compiler
=================================
I don't know if you realize this, but **sed** is capable of much more than
just pipelines containing only `s///` operations. I suspect that it might
be possible to make it Turing-complete (even though it's just single-pass).

I've been enjoying using some of its more esoteric features, and one day I
realized that the X86 instruction `XLAT` is a reasonable simulacrum of the
`y///` operator. Thus this project was born. I've never written a compiler
in Haskell before, so I decided to do this project in Haskell rather than
my more comfortable SML or Ocaml.

Much of the structure of this project is based on my 
[Compilers class](https://www.cs.hmc.edu/twiki/bin/view/CS132Spring2009) with
the always-awesome [Professor Stone](http://www.cs.hmc.edu/~stone/). I obviously
won't be taking any code whole-hog from there, especially since it's in a different
language and was sourcing a much more complicated language. But the ideas come from
that class.

License
-------
This work is available under the ISC (OpenBSD) license. The full contents of this
license are checked in as `license.txt`.

Project status
--------------
I just started this project, so it hasn't come very far. The parser is going to be
tricky, since regular expressions are pretty complicated in and of itself. After that,
there'll be writing an efficient regexp engine (it'd be cheating to use somebody else's).

Oh, and all of the other steps of the compilation process.


Cheers,

James Brown <roguelazer@roguelazer.com>
