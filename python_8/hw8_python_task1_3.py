# 1.3 Методы списка

fruits = ["apple", "banana"]
print(f"{"Исходный список:":<33} {fruits}")

fruits.append("orange")     # Добавляем "orange" в конец списка
print(f"{"Список с добавленным элементом:":<33} {fruits}")

fruits.insert(1, "grape")       # Вставляем "grape" по индексу 1
print(f"{"Список с вставленным элементом:":<33} {fruits}")

index = fruits.index("banana")          # Определяем индекс "banana"
fruits.pop(index)                       # Удаляем "banana"
print(f"{"Список с удаленным элементом:":<33} {fruits}")

fruits.sort()                           # Сортируем список
print(f"{"Отсортированный список:":<33} {fruits}")

fruits.reverse()                        # Переворачиваем список
print(f"{"Перевернутый список:":<33} {fruits}")
