# 2.1 Создайте функцию без параметров show_current_time() — печатает текущие дату и время
#     (используйте модуль datetime)

from datetime import datetime

def show_current_time():
    current_date_and_time = datetime.now()
    formated_current_date_and_time = current_date_and_time.strftime("%d.%m.%Y %H:%M:%S")    # Форматируем дату и время
    return print(f"Текущая дата и время: {formated_current_date_and_time}")

show_current_time()
