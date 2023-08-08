.section .data
b_data: .zero 8

.section .rodata
b_ro: .ascii "rorororo\n"

.section .bss
.lcomm b_bss, 20

.section .text
foo:
  movq $60, %rax
  movq $0, %rdi
  syscall
