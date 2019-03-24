	.file	"TP4.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"Boucle: %f\n"
.LC3:
	.string	"time: %f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB21:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	call	omp_get_wtime@PLT
	movl	$80000, %edi
	movsd	%xmm0, 8(%rsp)
	call	malloc@PLT
	movl	$80000, %edi
	movq	%rax, %rbx
	call	malloc@PLT
	movl	$80000, %edi
	movq	%rax, %rbp
	call	malloc@PLT
	movq	%rbx, %rdx
	shrq	$2, %rdx
	negq	%rdx
	andl	$3, %edx
	je	.L8
	movss	.LC0(%rip), %xmm0
	cmpl	$1, %edx
	movss	0(%rbp), %xmm1
	mulss	%xmm0, %xmm1
	addss	(%rbx), %xmm1
	movss	%xmm1, (%rax)
	je	.L9
	movss	4(%rbp), %xmm1
	cmpl	$3, %edx
	mulss	%xmm0, %xmm1
	addss	4(%rbx), %xmm1
	movss	%xmm1, 4(%rax)
	jne	.L10
	mulss	8(%rbp), %xmm0
	movl	$19997, %r11d
	movl	$3, %r10d
	addss	8(%rbx), %xmm0
	movss	%xmm0, 8(%rax)
.L3:
	movl	$20000, %r12d
	movl	%edx, %esi
	movl	$19996, %r13d
	subl	%edx, %r12d
	movl	$4999, %edi
.L2:
	salq	$2, %rsi
	movaps	.LC1(%rip), %xmm1
	leaq	(%rbx,%rsi), %r9
	leaq	0(%rbp,%rsi), %r8
	xorl	%edx, %edx
	addq	%rax, %rsi
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L4:
	movups	(%r8,%rdx), %xmm0
	addl	$1, %ecx
	mulps	%xmm1, %xmm0
	addps	(%r9,%rdx), %xmm0
	movups	%xmm0, (%rsi,%rdx)
	addq	$16, %rdx
	cmpl	%edi, %ecx
	jb	.L4
	addl	%r13d, %r10d
	subl	%r13d, %r11d
	cmpl	%r13d, %r12d
	je	.L6
	movslq	%r10d, %rdx
	movss	.LC0(%rip), %xmm0
	movss	0(%rbp,%rdx,4), %xmm1
	cmpl	$1, %r11d
	mulss	%xmm0, %xmm1
	addss	(%rbx,%rdx,4), %xmm1
	movss	%xmm1, (%rax,%rdx,4)
	leal	1(%r10), %edx
	je	.L6
	movslq	%edx, %rdx
	addl	$2, %r10d
	cmpl	$2, %r11d
	movss	0(%rbp,%rdx,4), %xmm1
	mulss	%xmm0, %xmm1
	addss	(%rbx,%rdx,4), %xmm1
	movss	%xmm1, (%rax,%rdx,4)
	je	.L6
	movslq	%r10d, %rdx
	mulss	0(%rbp,%rdx,4), %xmm0
	addss	(%rbx,%rdx,4), %xmm0
	movss	%xmm0, (%rax,%rdx,4)
.L6:
	pxor	%xmm0, %xmm0
	leaq	.LC2(%rip), %rdi
	cvtss2sd	20(%rax), %xmm0
	movl	$1, %eax
	call	printf@PLT
	call	omp_get_wtime@PLT
	subsd	8(%rsp), %xmm0
	leaq	.LC3(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L8:
	.cfi_restore_state
	movl	$20000, %r13d
	movl	$5000, %edi
	movl	$20000, %r12d
	xorl	%esi, %esi
	movl	$20000, %r11d
	xorl	%r10d, %r10d
	jmp	.L2
.L10:
	movl	$19998, %r11d
	movl	$2, %r10d
	jmp	.L3
.L9:
	movl	$19999, %r11d
	movl	$1, %r10d
	jmp	.L3
	.cfi_endproc
.LFE21:
	.size	main, .-main
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1084856730
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	1084856730
	.long	1084856730
	.long	1084856730
	.long	1084856730
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
