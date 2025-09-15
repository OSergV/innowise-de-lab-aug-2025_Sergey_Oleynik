# 2.2 Функции с параметрами
#     1) Вынесите расчёт в функцию add_vat().
#     2) Примените её ко всем элементам списка в цикле и распечатайте итоговые цены, используйте цикл.

def add_vat(price_without_nds, nds):
    final_price = price_without_nds + price_without_nds * nds
    return print(f"Цена без НДС: {price_without_nds:>4} {"Итоговая цена:":>25} {final_price:>7.2f}")

prices = [1000, 3499, 250]
nds = 0.20

for price in prices:
    add_vat(price, nds)
