.model small
.stack 100h
.data

	header1 db ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$"
	header2 db "         TEXT CRYPTO SYSTEM              $"
	header3 db "      Encrypt | Decrypt | Secure         $"
	header4 db "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<$"

	

	choice1 db "1. Encryption $"
	choice2 db "2. Decryption $"
	choice3 db "3. Exit $"

	subchoice1 db "1. XOR $"
	subchoice2 db "2. Ceaser Cipher  $"
	subchoice3 db "3. Rotate Cipher $"
	subchoice4 db "4. Exit $"

	msg1 db "Select your choice: $"
	msg2 db "Enter string: $"
	msg3 db "Use last encrypted string? ('y' for yes, otherwise any) : $"
	msg4 db "Output: $"
	msg5 db "Invalid choice! Please select again $"
	
	str1 db 20 dup('$') 
	
	input1 db ?
	input2 db ?
	input3 db ?
	

.code 
main proc

	mov ax, @data
	mov ds, ax
	
	call display_header

main_loop:
	
	call next_line

	call next_line
	mov ah, 09
	lea dx, choice1
	int 21h
	
	call next_line
	mov ah, 09
	lea dx, choice2
	int 21h

	call next_line
	mov ah, 09
	lea dx, choice3
	int 21h
	
	call next_line
	call prompt1

	mov ah, 01h
	int 21h

	mov input1, al

	call next_line

	cmp input1, '1'
	JE encrypt_proc
	
	cmp input1, '2'
	JE decrypt_proc

	cmp input1, '3'
	JE exit

	call next_line	
	
	call prompt4
	jMP main_loop

encrypt_proc: 	
	call encrypt
	JMP main_loop

decrypt_proc:
	call decrypt
	JMP main_loop

exit:	
	mov ah, 04ch
	int 21h
main endp 




input proc	; take input from user

	mov si, 0
label1:
	mov ah, 01h	; take input 
	int 21h
	
	cmp al, 13
	JE end_input
	
	mov str1[si], al
	inc si
	cmp si, 20
	JL label1
end_input:	
	mov str1[si], '$'
	ret
input endp




encrypt proc


loop1:	
	call next_line
	mov ah, 09
	lea dx, subchoice1
	int 21h	

	call next_line
	mov ah, 09
	lea dx, subchoice2
	int 21h
	
	call next_line
	mov ah, 09
	lea dx, subchoice3
	int 21h

	call next_line
	mov ah, 09
	lea dx, subchoice4
	int 21h
	
	call next_line
	mov ah, 09
	lea dx, msg1
	int 21h
	
	mov ah, 01
	int 21h
	
	mov input2, al
	
	call next_line

	cmp input2, '1'
	JE xor_text_enc
	
	cmp input2, '2'
	JE ceaser_enc

	cmp input2, '3'
	JE rotate_enc
	
	cmp input2,'4'
	ret
	
	call prompt4
	JMP loop1
	
xor_text_enc:
	
	call prompt2
	call input
	
    lea si, str1

xor_loop_enc:

    mov al, [si]
    cmp al, '$'
    je done_xor_enc

    xor al, 05h

    mov [si], al
    inc si
    jmp xor_loop_enc

done_xor_enc:

	call next_line
	mov ah, 09
	lea dx, msg4
	int 21h
	
    mov ah, 09h
    lea dx, str1
    int 21h
	call next_line
	
	JMP done_encrypt

ceaser_enc: 	
	
	call prompt2
	call input

	lea si, str1

cipher_enc:

    mov al, [si]
    cmp al, '$'
    je done_ceaser_enc

    add al, 3

    cmp al, 'z'
    jle store_enc

    sub al, 26

store_enc:
    mov [si], al
    inc si
    jmp cipher_enc

done_ceaser_enc:

	call next_line
	mov ah, 09
	lea dx, msg4
	int 21h
	
	mov ah, 09
	lea dx, str1
	int 21h
	call next_line
	
	JMP done_encrypt
	
	
rotate_enc:
	
	call prompt2
	call input
	
	lea si, str1

rotate_loop_enc:

    mov al, [si]
    cmp al, '$'
    je done_rotate_enc

    rol al, 1
	
    mov [si], al
    inc si
    jmp rotate_loop_enc

done_rotate_enc:
	
	call next_line
	mov ah, 09
	lea dx, msg4
	int 21h
	
	mov ah, 09
	lea dx, str1
	int 21h
	call next_line
	
	JMP done_encrypt

done_encrypt:
ret
encrypt endp




decrypt proc
 
	loop2: 
	call next_line
	mov ah, 09
	lea dx, subchoice1
	int 21h	

	call next_line
	mov ah, 09
	lea dx, subchoice2
	int 21h
		
	call next_line
	mov ah, 09
	lea dx, subchoice3
	int 21h

	call next_line
	mov ah, 09
	lea dx, subchoice4
	int 21h
	
	call next_line
	call prompt1
	
	mov ah, 01
	int 21h
	
	mov input2, al
	
	call next_line

	cmp input2, '1'
	JE xor_text_dec
	
	cmp input2, '2'
	JE ceaser_dec

	cmp input2, '3'
	JE rotate_dec
	
	cmp input2,'4'
	ret
	
	call prompt4
	JMP loop2

xor_text_dec:
	
	call prompt3
	
	mov ah, 01h
	int 21h
	
	cmp al, 'y'
	JE saved_1



	
	call next_line
	mov ah, 09
	lea dx, msg2
	int 21h
	
	call input

saved_1: 	
    lea si, str1

xor_loop_dec:

    mov al, [si]
    cmp al, '$'
    je done_xor_dec

    xor al, 05h

    mov [si], al
    inc si
    jmp xor_loop_dec

done_xor_dec:
	call next_line
	mov ah, 09
	lea dx, msg4
	int 21h

    mov ah, 09h
    lea dx, str1
    int 21h
	call next_line
	JMP done_decrypt

ceaser_dec: 	
	
	call prompt3
	
	mov ah, 01
	int 21h
	
	cmp al, 'y'
	JE saved_2
	
	call next_line
	mov ah, 09
	lea dx, msg2
	int 21h
	
	call input

saved_2:
	lea si, str1

cipher_dec:

    mov al, [si]
    
    cmp al, '$'
    je done_ceaser_dec

    sub al, 3

    cmp al, 'a'
    jge store_dec

    add al, 26

store_dec:
    mov [si], al
    inc si
    jmp cipher_dec

done_ceaser_dec:
	call next_line
	
	mov ah, 09
	lea dx, msg4
	int 21h
	
	mov ah, 09
	lea dx, str1
	int 21h
	
	call next_line
	
	JMP done_decrypt	
	
rotate_dec:

	call prompt3
	
	mov ah, 01
	int 21h
	
	cmp al, 'y'
	JE saved_3
	
	call next_line
	mov ah, 09
	lea dx, msg2
	int 21h
	
	call input

saved_3:	
	lea si, str1

rotate_loop_dec:

    mov al, [si]
    cmp al, '$'
    je done_rotate_dec

    ror al, 1
	
    mov [si], al
    inc si
    jmp rotate_loop_dec

done_rotate_dec:
	
	call next_line
	mov ah, 09
	lea dx, msg4
	int 21h
	
	mov ah, 09
	lea dx, str1
	int 21h
	call next_line
	JMP done_decrypt

done_decrypt:
ret
decrypt endp

rotation proc
	
	jmp rotate_dec
	
rotation endp



next_line proc
    mov ah, 02h
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    ret
next_line endp

prompt1 proc
	mov ah, 09
	lea dx, msg1
	int 21h
    ret
prompt1 endp


prompt2 proc
	mov ah, 09
	lea dx, msg2
	int 21h
    ret
prompt2 endp
 
 
prompt3 proc
	mov ah, 09
	lea dx, msg3
	int 21h
    ret
prompt3 endp
	
prompt4 proc
	mov ah, 09
	lea dx, msg5
	int 21h
	
	call next_line
ret
prompt4 endp


exit_proc proc

	mov ah, 04ch
	int 21h
	
	ret
exit_proc endp

display_header proc

    call next_line
    
    mov ah, 09h
    lea dx, header1
    int 21h

	call next_line
	call next_line

    mov ah, 09h
    lea dx, header2
    int 21h

    call next_line

    mov ah, 09h
    lea dx, header3
    int 21h

    call next_line

    mov ah, 09h
    lea dx, header4
    int 21h

    call next_line
	call  next_line
	
    ret

display_header endp

end main