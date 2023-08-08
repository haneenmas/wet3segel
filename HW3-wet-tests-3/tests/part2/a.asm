.global _start, buff, _hw3_unicorn

.section .data
buff: .zero 8
msg: .ascii "hello\n"
endmsg:

.section .rodata
this_is_ro: .ascii "rorororo\n"

.section .bss
.lcomm noinit, 20

.section .text
_start:
  movq $1, %rax
  movq $1, %rdi
  movq $msg, %rsi
  movq $endmsg-msg, %rdx
  syscall

_hw3_unicorn:
  movq $60, %rax
  movq $10, %rdi
  syscall
