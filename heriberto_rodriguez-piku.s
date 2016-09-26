   @ Programmer: Heriberto Rodriguez
   @       Date: 9/26/2016
   @      Class: CPE 315

   .syntax unified
   @ ------------------------
   .global main
main:
   @ Stack the return address (lr) in addition to dummy register (ip) to
   @ keep the stack 8-byte aligned.
   push  {ip, lr}

   @ Load the arguments and perform the calls.
   ldr   r0, =line1
   bl    printf
   ldr   r0, =line2
   bl    printf
   ldr   r0, =line3
   bl    printf

   @ Exit from 'main'. This is like 'return 0' in C.
   mov   r0, #0   @ Return 0.
   @ Pop the dummy ip to reserve our alignment fix, and pop the original lr
   @ value directly into pc - the Program Counter - to return.
   pop   {ip, pc}

   @ ------------------------
   @ Data for the printfs. The GNU assembler's ".asciz" directive
   @ automatically adds a NULL character termination.
line1:
   .asciz   "oh raspberry pi\n"
line2:
   .asciz   "I am afriad to use you\n"
line3:
   .asciz   "don't be difficult\n"
