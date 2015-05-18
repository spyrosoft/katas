#!/usr/bin/zsh

sbcl --script 2.lisp

while read user_input
do
	sbcl --script 2.lisp
done
