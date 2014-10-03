# LFE

LFE, Lisp Flavoured Erlang, is a lisp syntax front-end to the Erlang
compiler. Code produced with it is compatible with "normal" Erlang
code. An LFE evaluator and shell is also included.

## Unhyphenized-LFE Experiment

The 'unhyphenized' branch contains LFE version which on-the-fly tranforms hyphenized symbols (i.e. `foo-bar`)
into underscored symbols (i.e. `foo_bar`). Hyphenized module names (i.e. `foo-mod`) are also transformed during compilation (i.e. `foo_mod`). This is simple and somewhat radical method to make LFE compiled code be more Erlang-coder friendly AND prevents from disgusting mixing underscored symbols (which comes from Erlang world) with hyphenized symbols (which are standard in lisper's world). Imagine, that Erlang-coder is forced to use something like the following:

```erlang

	'a-lfe-module':'lispish-function'(A, B, C)
```

because some ErLisper happily coded this:

```lisp

	(defmodule a-lfe-module (export all))

	(defun lispish-function (a b c) ...)
```

or I'd be forced to write this:

```lisp

	(defmodule my-srv
       (export ((init 1)
                (handle_call 3) ...))

	(defun handle_call (a b c) ...)
```

It's disgusting! I want to write this!:

```lisp

	(defmodule my-srv
       (export ((init 1)
                (handle-call 3) ...))

	(defun handle-call (a b c) ...)
```

Oh, yeah. That's better ;)

## Installation

LFE can be installed in different ways depending on how it is intended
to be used:

* use [lfetool](https://github.com/qoocku/lfetool) from `hyphenized` branch to create projects (which will
  automatically have LFE as a dependency when it creates skeleton libraries,
  OTP apps, etc.; or
* use LFE directly in a working dir, e.g.:

```shell
    $ git clone https://github.com/qoocku/lfe.git -b unhyphenized
    $ cd lfe
    $ make compile
```

The second alternative compiles all the files. After this has been
done programs for starting the REPL and compiling LFE files can be
installed with:

```shell
    $ git clone https://github.com/qoocku/lfe.git -b unhyphenized
    $ cd lfe
    $ export ERL_LIBS=`erl -noshell -eval \
        'io:format("~s~n", [code:lib_dir()])' -s init stop`
    $ make compile
    $ make install
```

By default this will create the programs ``lfe``, ``lfec`` and
``lfescript`` in the same directory as the ``erl`` program. This can
changed by defining the make variable ``DESTBINDIR`` to point to the
desired directory. So:

```shell
    $ make install DESTBINDIR=/Users/rv/bin
```

will put the programs in ``/Users/rv/bin``.

## REPL

If you have used ``lfetool`` to set up your project, you can simply do this to
start a REPL:

```shell
    $ make shell
    Erlang 17 (erts-6.0) [source] [64-bit] [smp:8:8] ...

    LFE Shell 6.0 (abort with ^G)
    >
```

Note that this will recompile all the deps (often useful for projects with
changing dependencies). If you would prefer to only recompile code for the
project itself, you can use ``make shell-no-deps`` instead.

If you're running LFE from a git clone working dir, you can start the REPL
like so:

```shell
    $ lfe
    Erlang 17 (erts-6.0) [source] [64-bit] [smp:8:8] ...

    LFE Shell V6.0 (abort with ^G)
    >
```

and run an LFE shell script in the same style as shell scripts with:

```shell
    $ lfe script-name script-arg-1 ...
```

## Usage

The [docs site](http://lfe.github.io/docs.html) has several places to explore
that will show you how to start using LFE. However, here's a quick taste:

* start up an LFE REPL as demonstrated above
* then, do something like this:
```cl
    > (* 2 (+ 1 2 3 4 5 6))
    42
    > (: lists foldl (lambda (n acc) (+ n acc)) 0 (: lists seq 1 6))
    42
```

## Documentation

* [Quick Start](http://lfe.github.io/quick-start/1.html)
* [User Guide](http://lfe.github.io/user-guide/intro/1.html)


### Classic Docs

* "classic" [user guide](doc/user_guide.txt)
* [version history](doc/version_history.md)

Files with more technical details:

* [lfescript.txt](doc/lfescript.txt)
* [lfe_shell.txt](doc/lfe_shell.txt)
* [lfe_macro.txt](doc/lfe_macro.txt)
* [lfe_lib.txt](doc/lfe_lib.txt)
* [lfe_io.txt](doc/lfe_io.txt)
* [lfe_gen.txt](doc/lfe_gen.txt)
* [lfe_comp.txt](doc/lfe_comp.txt)
* [lfe_bits.txt](doc/lfe_bits.txt)
