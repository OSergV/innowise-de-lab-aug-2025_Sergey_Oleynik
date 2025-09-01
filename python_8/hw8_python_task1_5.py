# 1.5 Дан список чисел nums и целевое число target.
#     Найти индексы двух чисел, сумма которых равна target.

nums = [2, 7, 11, 15]
target = 9

# nums = [3, 2, 4]
# target = 6

print(f"Список чисел: {nums}")
print(f"target = {target}")

indexes_found = False                           # Флаг нахождения пары индексов
for index_first_elem in range(len(nums)):                               # Берем по порядку число из списка
    for index_second_elem in range(index_first_elem + 1, len(nums)):    # и слаживаем его со всеми следующими числами
        if nums[index_first_elem] + nums[index_second_elem] == target:      # Если пара чисел = target
            print(f"Сумма элементов с индексами {index_first_elem} и {index_second_elem} равна target = {target}")
            indexes_found = True
            break                   # Выход из внутреннего цикла
    if indexes_found == True:
        break                       # Выход из внешнего цикла
else:
    print(f"В списке нет чисел, сумма которых равна target = {target}")
