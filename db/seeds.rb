categories = %w(
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

categories.each do |category|
  Category.find_or_create_by_name(category)
end

Category.delete_all(["name NOT IN (?)", categories]) # remove old categories

# For existing test database
# Link all tweets with the lists to which user is subscribed to
User.transaction do
  User.find(:all, :select => "users.id, categories.id, subscriptions.user_id, subscriptions.category_id", :include => :categories).each do |user|
    user.tweets.each do |tweet|
      user.categories.each do |category|
        category.tweets << tweet
      end
    end
  end
end

# Update category counters
Category.reset_column_information

Category.all.each do |category|
  Category.update_counters category.id, :subscriptions_count => category.subscriptions.length # size uses counter cache column
end

# Create default configuration if not present
if Configuration.first.nil?
  Configuration.create(:today_topic => '#140mk')
end