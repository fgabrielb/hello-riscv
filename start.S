.section .text.init
.global _start

_start:

	la sp, stack_top
	call main

1: j 1b

.section .bss
.space 1024

stack_top:
