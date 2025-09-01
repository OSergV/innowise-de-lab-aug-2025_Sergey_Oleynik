# 1.4 List comprehension и словари

words = ["hello", "world", "python", "code"]
print(f"Исходный список: {words}")

words_lenghts = [len(word) for word in words]   # Создаем список длин слов, используя списковое включение
print(f"Список длин слов: {words_lenghts}")

# Создаем список слов длиннее 4 символов
# words_longer_four_symbols = []                              # С помощью цикла for
# for word in words:
#     if len(word) > 4:
#         words_longer_four_symbols.append(word)

words_longer_four_symbols = [word for word in words if len(word) > 4]      # Используя списковое включение
print(f"Список слов длиннее 4 символов: {words_longer_four_symbols}")

dict_words_lenghts = {}                     # Создаем пустой словарь
for word in words:
    dict_words_lenghts[word] = len(word)       # Заполняем словарь
#    dict_words_lenghts[word] = str(len(word))   # Если длина нужна в строковом формате
print(f"Словарь {{слово: длина}}: {dict_words_lenghts}")
