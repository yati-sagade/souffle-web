# Introduction to Datalog

Datalog is a (declarative) logic-based query language, allowing the user to perform recursive queries. It adopts syntax in the style of Prolog. In its pure form, it is based on a decidable fragment of first-order logic (FIL). Here, the universe – the colleciton of elements by which computation can be performed within – is finite, and functors are not permitted. Applications of Datalog include program analysis, security, graph databases, and declarative networking.

# Soufflé: The Language

The syntax of Soufflé is inspired by implementations of Datalog, namely [bddbddb](http://bddbddb.sourceforge.net/) and [muZ in Z3](https://github.com/Z3Prover/z3/wiki). There is no unified standard for the specification of Datalog syntax. Thus, each implementation of Datalog may differ. A principle goal of the Soufflé project is speed, tailoring program execution to multi-core servers with large amounts of memory. With this in mind, Soufflé provides software engineering features (components, for example) for large-scale logic-oriented programming. For practical usage, Soufflé extends Datalog to make it Turing-equivalent through arithmetic functors. This results in the ability of the programmer to write programs that may never terminate. An example of non-termination is a program where the fact `A(0).` and rule `A(i + 1) :- A(i).` exist without additional constraints. This causes Soufflé to attempt to output an infinite number of relations `A(n)` where `n >= 0`. This is in some way analogous to an infinite while loop in an imperative programming language like C. However, the increased expressiveness afforded by arithmetic functors is very convenient for programming.