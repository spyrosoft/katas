#!/usr/bin/zsh

sbcl --script 1.lisp

while read user_input
do
	sbcl --script 1.lisp
done
