# 1.2 Методы строк и форматинг

email = " USER@DOMAIN.COM "
print(f"Неочищенный и неотформатированный E-mail: \"{email}\"")

cleaned_email = email.strip()               # Удаляем лишние пробелы
normalized_email = cleaned_email.lower()    # Приводим к единообразному виду
print(f"Очищенный и отформатированный E-mail: \"{normalized_email}\"")

user_name, domain = normalized_email.split("@")     # Разделяем имя пользователя и домен

print(f"Username: {user_name}, Domain: {domain}")
