
categories = [
  { title: 'Математика' },
  { title: 'География' },
  { title: 'Химия' }
]

categories.map! do |c|
  Category.find_or_create_by!(c)
end

users = [
  { name: 'Саша' },
  { name: 'Маша' }
]

users.map! do |u|
  User.find_or_create_by!(u)
end


tests = [
  { title: 'Сложение', level: 0, category_id: Category.find_by(title: 'Математика').id, author_id: User.find_by(name: 'Саша').id },
  { title: 'Умножение', level: 0, category_id: Category.find_by(title: 'Математика').id, author_id: User.find_by(name: 'Саша').id },
  { title: 'Извлечение квадратного корня', level: 1, category_id: Category.find_by(title: 'Математика').id, author_id: User.find_by(name: 'Маша').id },
  { title: 'Столицы', level: 0, category_id: Category.find_by(title: 'География').id, author_id: User.find_by(name: 'Маша').id },
  { title: 'Реки', level: 0, category_id: Category.find_by(title: 'География').id, author_id: User.find_by(name: 'Саша').id },
  { title: 'Горы', level: 1, category_id: Category.find_by(title: 'География').id, author_id: User.find_by(name: 'Саша').id },
  { title: 'Кислоты', level: 0, category_id: Category.find_by(title: 'Химия').id, author_id: User.find_by(name: 'Саша').id },
  { title: 'Соли', level: 1, category_id: Category.find_by(title: 'Химия').id, author_id: User.find_by(name: 'Маша').id },
  { title: 'Металлы', level: 0, category_id: Category.find_by(title: 'Химия').id, author_id: User.find_by(name: 'Маша').id }
]

tests.map! do |t|
  Test.find_or_create_by!(t)
end

users_tests = [
  { user_id: User.find_by(name: 'Саша').id, test_id: Test.find_by(title: 'Сложение').id },
  { user_id: User.find_by(name: 'Маша').id, test_id: Test.find_by(title: 'Сложение').id },
  { user_id: User.find_by(name: 'Саша').id, test_id: Test.find_by(title: 'Умножение').id },
  { user_id: User.find_by(name: 'Маша').id, test_id: Test.find_by(title: 'Умножение').id },
  { user_id: User.find_by(name: 'Саша').id, test_id: Test.find_by(title: 'Извлечение квадратного корня').id },
  { user_id: User.find_by(name: 'Маша').id, test_id: Test.find_by(title: 'Столицы').id },
  { user_id: User.find_by(name: 'Саша').id, test_id: Test.find_by(title: 'Столицы').id },
  { user_id: User.find_by(name: 'Саша').id, test_id: Test.find_by(title: 'Горы').id },
  { user_id: User.find_by(name: 'Саша').id, test_id: Test.find_by(title: 'Кислоты').id }
]

users_tests.map! do |ut|
  UsersTest.find_or_create_by!(ut)
end


questions = [
    { body: '2+2=5?', test_id: Test.find_by(title: 'Сложение').id },
    { body: '2+2=4?', test_id: Test.find_by(title: 'Сложение').id },
    { body: '5*5=25?', test_id: Test.find_by(title: 'Умножение').id },
    { body: '7*7=47?', test_id: Test.find_by(title: 'Умножение').id },
    { body: 'корень из 4 равно 2?', test_id: Test.find_by(title: 'Извлечение квадратного корня').id },
    { body: 'корень из 16 равно 2?', test_id: Test.find_by(title: 'Извлечение квадратного корня').id },
    { body: 'Столица РФ - Москва?', test_id: Test.find_by(title: 'Столицы').id },
    { body: 'Столица РФ - Сочи?', test_id: Test.find_by(title: 'Столицы').id },
    { body: 'Самая длинная река в Беларуси - Амазонка?', test_id: Test.find_by(title: 'Реки').id },
    { body: 'Самая высокая гора в США - Эверест?', test_id: Test.find_by(title: 'Горы').id },
    { body: 'H2S04 - соляная кислота?', test_id: Test.find_by(title: 'Кислоты').id },
    { body: 'Cu - металл?', test_id: Test.find_by(title: 'Металлы').id },
    { body: 'CuS04 - соль?', test_id: Test.find_by(title: 'Соли').id }
]

questions.map! do |q|
  Question.find_or_create_by!(q)
end






