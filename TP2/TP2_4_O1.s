	.file	"TP4.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Boucle: %f\n"
.LC2:
	.string	"time: %f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB21:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	call	omp_get_wtime@PLT
	movsd	%xmm0, 8(%rsp)
	movl	$80000, %edi
	call	malloc@PLT
	movq	%rax, %rbp
	movl	$80000, %edi
	call	malloc@PLT
	movq	%rax, %rbx
	movl	$80000, %edi
	call	malloc@PLT
	movl	$0, %edx
	movss	.LC0(%rip), %xmm1
.L2:
	movaps	%xmm1, %xmm0
	mulss	(%rbx,%rdx), %xmm0
	addss	0(%rbp,%rdx), %xmm0
	movss	%xmm0, (%rax,%rdx)
	addq	$4, %rdx
	cmpq	$80000, %rdx
	jne	.L2
	cvtss2sd	20(%rax), %xmm0
	leaq	.LC1(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	call	omp_get_wtime@PLT
	subsd	8(%rsp), %xmm0
	leaq	.LC2(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE21:
	.size	main, .-main
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1084856730
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
