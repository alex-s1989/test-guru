
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
  { title: 'Сложение', level: 0, category_id: categories[0].id, author_id: users[0].id },
  { title: 'Умножение', level: 0, category_id: categories[0].id, author_id: users[0].id },
  { title: 'Извлечение квадратного корня', level: 1, category_id: categories[0].id, author_id: users[1].id },
  { title: 'Столицы', level: 0, category_id: categories[1].id, author_id: users[1].id },
  { title: 'Реки', level: 0, category_id: categories[1].id, author_id: users[0].id },
  { title: 'Горы', level: 1, category_id: categories[1].id, author_id: users[0].id },
  { title: 'Кислоты', level: 0, category_id: categories[2].id, author_id: users[0].id },
  { title: 'Соли', level: 1, category_id: categories[2].id, author_id: users[1].id },
  { title: 'Металлы', level: 0, category_id: categories[2].id, author_id: users[1].id }
]

tests.map! do |t|
  Test.find_or_create_by!(t)
end

users_tests = [
  { user_id: users[0].id, test_id: tests[0].id },
  { user_id: users[1].id, test_id: tests[0].id },
  { user_id: users[0].id, test_id: tests[1].id },
  { user_id: users[1].id, test_id: tests[1].id },
  { user_id: users[0].id, test_id: tests[2].id },
  { user_id: users[1].id, test_id: tests[3].id },
  { user_id: users[0].id, test_id: tests[3].id },
  { user_id: users[0].id, test_id: tests[5].id },
  { user_id: users[0].id, test_id: tests[6].id }
]

users_tests.map! do |ut|
  UsersTest.find_or_create_by!(ut)
end


questions = [
    { body: '2+2=5?', test_id: tests[0].id },
    { body: '2+2=4?', test_id: tests[0].id },
    { body: '5*5=25?', test_id: tests[1].id },
    { body: '7*7=47?', test_id: tests[1].id },
    { body: 'корень из 4 равно 2?', test_id: tests[2].id },
    { body: 'корень из 16 равно 2?', test_id: tests[2].id },
    { body: 'Столица РФ - Москва?', test_id: tests[3].id },
    { body: 'Столица РФ - Сочи?', test_id: tests[3].id },
    { body: 'Самая длинная река в Беларуси - Амазонка?', test_id: tests[4].id },
    { body: 'Самая высокая гора в США - Эверест?', test_id: tests[5].id },
    { body: 'H2S04 - соляная кислота?', test_id: tests[6].id },
    { body: 'Cu - металл?', test_id: tests[8].id },
    { body: 'CuS04 - соль?', test_id: tests[7].id }
]

questions.map! do |q|
  Question.find_or_create_by!(q)
end
