# 1. У вас есть список продуктов, которые нужно купить. Напишите программу,
#    которая выводит этот список в виде пронумерованного перечня.

shopping_list = ["milk", "bread", "eggs", "butter", "apples"]
print("Список покупок:")

# 1-й вариант
# num = 1
# for i in shopping_list:
#     print(f"{num}. {i}")
#     num += 1

# 2-й вариант с функцией enumerate()
for num, product in enumerate(shopping_list, start = 1):
    print(f"{num}. {product}")
