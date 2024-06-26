.data
celsius_prompt: .asciiz "Цельсийн температур оруулна уу: \n" # Celsius-д температур оруулахыг асууна.
fahrenheit_prompt: .asciiz "Фаренгейт температур оруулна уу: \n" # Fahrenheit-д температур оруулахыг асууна.
result_message: .asciiz "Yp дун: \n" # Yp дунгээ хадгалах мессеж.
newline: .asciiz "\n" # Шинэ мер оруулах мессеж.

.text
main:
# Цельсийн температур оруулах
    li $v0, 4 # $v0 регистр дээр 4-г онооно.
    la $a0, celsius_prompt # celsius_prompt хувьсагчийн хаягийг ачааллана.
    syscall # Системд уйлдлийг хийне.
# Цельсийн температур оруулах
    li $v0, 5 # $v0 регистр дээр 5-г онооно.
    syscall # Системд уйлдлийг хийно.
    move $t0, $v0 # Celsius-ийн утгыг $t0 регистрт хадгална.
# Цельсийг Фаренгейт руу хервуулэх
    li $t1, 32 # 32 toor $t1 регистрт хадгална.
    mul $t0, $t0, 9 # Celsius * 9
    div $t0, $t0, 5 # (Celsius * 9) / 5
    add $t0, $t0, $t1 # (Celsius * 9) / 5 + 32
# Yp дун харуулах
    li $v0, 4 # $v0 регистр дээр 4-г онооно.
    la $a0, result_message # result_message хувьсагчийн хаягийг ачааллана.
    syscall # Системд уйлдлийг хийнэ.
    li $v0, 1 # $v0 регистр дээр 1-г онооно.
    move $a0, $t0 # $t0 регистрийн утгыг $а0 регистрт хуулна.
    syscall # Системд уйлдлийг хийнэ.
# Шинэ мер
    li $v0, 4 # $v0 регистр дээр 4-г онооно.
    la $a0, newline # newline хувьсагчийн хаягийг ачааллана.
    syscall # Системд уйлдлийг хийнэ.
# Фаренгейт температур оруулах
    li $v0, 4 # $v0 регистр дээр 4-г онооно.
    la $a0, fahrenheit_prompt # fahrenheit_prompt хувьсагчийн хаягийг ачааллана.
    syscall # Системд уйлдлийг хийно.
# Фаренгейт температур оруулах
    li $v0, 5 # $v0 регистр дээр 5-г онооно.
    syscall # Системд уйлдлийг хийнэ.
    move $t0, $v0 # Fahrenheit-ийн утгыг $t0 регистрт хадгална.
# Фаренгейтг Цельсий руу хервуулэх
    sub $t0, $t0, $t1 # Fahrenheit - 32
    mul $t0, $t0, 5 # (Fahrenheit - 32) * 5
    div $t0, $t0, 9 # ((Fahrenheit - 32) * 5) / 9
# Yp дун харуулах
    li $v0, 4 # $v0 регистр дээр 4-г онооно.
    la $a0, result_message # result_message хувьсагчийн хаягийг ачааллана.
    syscall # Системд уйлдлийг хийнэ.
    li $vo, 10 # $v0 регистр дээр 10-г онооно.
    syscall # Системд уйлдлийг хийнэ.
