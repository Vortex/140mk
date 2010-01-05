lists = %w(
  Автомобили
  Економија/Бизнис
  Занимливости
  Здравје
  Храна
  Култура
  Археологија
  Мобилни
  Музика
  Мода
  Политика
  Софтвер
  Спорт
  Хардвер
  Вести
  Технологија
  Видео
  Фотографија
  Дизајн
  Веб дизајн
  Интернет
  Туризам
  Општество
  Граѓански\ свет
  Уметност
  Geek
  Маркетинг
  Apple
  Игри
  SEO
  Медиуми
  Слободен\ софтвер
)

lists.each do |category|
  List.find_or_create_by_name(category)
end

List.delete_all(["name NOT IN (?)", lists]) # remove old categories
