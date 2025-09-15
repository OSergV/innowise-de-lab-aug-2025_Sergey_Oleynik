# 3. Напишите простую игру. Программа "загадывает" число от 1 до 10.
#    Пользователь должен угадать это число. Цикл while должен продолжаться до тех пор,
#    пока пользователь не введет правильный ответ.

from random import randint
secret_number = randint(1, 10)

input_number = 0

while input_number != secret_number:
    input_number = int(input("Введите число от 1 до 10: "))

    if input_number >= 1 and input_number <= 10:
        if input_number != secret_number:
            print("Неверно, попробуйте еще раз.")
    else:
        print("Ваше число не попадает в заданный диапазон!")

print()
print("Поздравляю! Вы угадали число!")
print(f"Секретное число: {secret_number}")
