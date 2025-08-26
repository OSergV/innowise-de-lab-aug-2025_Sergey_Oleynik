# 1. Напишите программу, которая сначала спрашивает у пользователя его имя,
#    а затем выводит персональное приветствие, используя это имя.
from math import remainder

name = input("Как тебя зовут? ")
print(f"Привет, {name}! Приятно познакомиться!")


# 2. Напишите программу, которая запрашивает у пользователя длину и ширину прямоугольника.
#    После получения данных программа должна вычислить и вывести на экран площадь этого прямоугольника.

length = input("Введите длину прямоугольника: ")
width = input("Введите ширину прямоугольника: ")
print(f"Площадь прямоугольника: {int(length) * int(width)}")


# 3. Напишите программу, которая запрашивает у пользователя температуру в градусах Цельсия,
#    переводит её в градусы Фаренгейта и выводит результат на экран.

temp_c = input("Введите температуру в градусах цельсия: ")
temp_f = float(temp_c) * 9 / 5 + 32
print(f"{temp_c}°C это {temp_f}°F")


# 4. Напишите программу, которая «загадывает» случайное целое число в диапазоне от 1 до 5.
#    Пользователь пытается его отгадать. Программа должна сравнить число пользователя с загаданным
#    и вывести одно из трех сообщений:
#       - «Ты угадал!», если числа совпали.
#       - «Слишком много!», если число пользователя больше загаданного.
#       - «Слишком мало!», если число пользователя меньше загаданного.

from random import randint
random_number = randint(1, 5)

print("Я загадал случайное число от 1 до 5. Попробуй угадать!")
input_number = int(input("Введите число: "))

if input_number >= 1 and input_number <= 5:
    if input_number == random_number:
        print("Ты угадал!")
    elif input_number > random_number:
        print("Слишком много!")
    else:
        print("Слишком мало!")
else:
    print("Твоё число не попадает в заданный диапазон")

print(f"Случайное число: {random_number}")


# 5. Напишите программу, которая запрашивает у пользователя целое число и определяет,
#    является ли оно чётным или нечётным.

int_number = int(input("Введите целое число: "))
remainder_div = int_number % 2

if remainder_div == 0:
    print(f"Число {int_number} - чётное")
else:
    print(f"Число {int_number} - нечётное")


# 6. Напишите программу, которая работает как простой калькулятор. Программа должна
#    запросить у пользователя два числа и символ операции (+, -, *, /), а затем
#    выполнить расчёт и вывести результат.

first_number = input("Введите первое число: ")
second_number = input("Введите второе число: ")
operator = input("Выберите оператор (+, -, *, /): ")

if ("." in first_number) or ("." in second_number):     # если хотя бы одно число дробное
    first_number = float(first_number)
    second_number = float(second_number)
else:
    first_number = int(first_number)
    second_number = int(second_number)

if operator == "+":
    result = first_number + second_number
elif operator == "-":
    result = first_number - second_number
elif operator == "*":
    result = first_number * second_number
else:
    result = first_number / second_number

print(f"Результат: {first_number} {operator} {second_number} = {result}")
