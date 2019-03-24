	.file	"TP4.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Boucle: %f\n"
.LC2:
	.string	"time: %f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
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
	movl	$80000, %edi
	movsd	%xmm0, 8(%rsp)
	call	malloc@PLT
	movl	$80000, %edi
	movq	%rax, %rbp
	call	malloc@PLT
	movl	$80000, %edi
	movq	%rax, %rbx
	call	malloc@PLT
	xorl	%edx, %edx
	movss	.LC0(%rip), %xmm1
	.p2align 4,,10
	.p2align 3
.L2:
	movss	(%rbx,%rdx), %xmm0
	mulss	%xmm1, %xmm0
	addss	0(%rbp,%rdx), %xmm0
	movss	%xmm0, (%rax,%rdx)
	addq	$4, %rdx
	cmpq	$80000, %rdx
	jne	.L2
	pxor	%xmm0, %xmm0
	leaq	.LC1(%rip), %rdi
	cvtss2sd	20(%rax), %xmm0
	movl	$1, %eax
	call	printf@PLT
	call	omp_get_wtime@PLT
	subsd	8(%rsp), %xmm0
	leaq	.LC2(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	addq	$24, %rsp
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
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
