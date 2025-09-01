 # 2.3 ● Создайте функцию calculate_average_score(), которая будет вычислять средний балл.
 #     ● Функция должна принимать список оценок scores как обязательный аргумент.
 #     ● Добавьте опциональный булевый параметр ignore_lowest со значением по умолчанию False.
 #     ● Если ignore_lowest равен True, функция должна отбросить наименьшую оценку перед
 #       вычислением среднего. Если в списке всего одна оценка, отбрасывать её не нужно.
 #     ● Используя цикл, пройдитесь по списку student_data. 2 раза, первый раз учитывая все оценки,
 #       а второй раз отбросив худшие оценки

def calculate_average_score(scores, ignore_lowest = False):
    if len(scores) == 0:
        average_scores = 0
    else:
        student_scores = scores.copy()  # Копируем список оценок студента, чтобы не изменять оценки
                                        # в словарях списка student_data

        if ignore_lowest == True and len(student_scores) > 1:   # Если ignore_lowest = True и в списке больше 1-й оценки
            student_scores.remove(min(student_scores))          # Удаляем минимальную оценку из временного списка

        average_scores = sum(student_scores) / len(student_scores)
    return average_scores

student_data = [
{'name': 'Алексей', 'scores': [85, 92, 78, 95]},
{'name': 'Марина', 'scores': [65, 70, 58, 82]},
{'name': 'Светлана', 'scores': [98, 95, 100]}
]

print("* Средний балл всех оценок *")
for student in student_data:
    avg_score = calculate_average_score(student["scores"])
    print(f"{student["name"]:<15} {avg_score:>5.2f}")

print("\n* Средний балл без учета худшей оценки *")
for student in student_data:
    avg_score = calculate_average_score(student["scores"], True)
    print(f"{student["name"]:<15} {avg_score:>5.2f}")
