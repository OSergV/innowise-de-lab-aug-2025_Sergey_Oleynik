# 1.1 Операции со строкой

string = "Python Programming"

print(f"Строка: {string}")
print(f"Длина строки: {len(string)}")
print(f"Символ по индексу 7: {string[7]}")

last_three_symbols = ""
for i in range(-3, 0, 1):
    last_three_symbols += string[i]
print(f"Последние три символа: {last_three_symbols}")

substring = "gram"
if string.find(substring) == -1:
    print(f"Подстрока \"{substring}\" не найдена!")
else:
    print(f"Подстрока \"{substring}\" найдена!")
