
categories = [
  { title: 'Математика' },
  { title: 'География' },
  { title: 'Химия' }
]

categories.map! do |c|
  Category.find_or_create_by!(c)
end

tests = [
    { title: 'Сложение', level: 0, category_id: Category.find_by(title: 'Математика').id },
    { title: 'Умножение', level: 0, category_id: Category.find_by(title: 'Математика').id },
    { title: 'Извлечение квадратного корня', level: 1, category_id: Category.find_by(title: 'Математика').id },
    { title: 'Столицы', level: 0, category_id: Category.find_by(title: 'География').id },
    { title: 'Реки', level: 0, category_id: Category.find_by(title: 'География').id },
    { title: 'Горы', level: 1, category_id: Category.find_by(title: 'География').id },
    { title: 'Кислоты', level: 0, category_id: Category.find_by(title: 'Химия').id },
    { title: 'Соли', level: 1, category_id: Category.find_by(title: 'Химия').id },
    { title: 'Металлы', level: 0, category_id: Category.find_by(title: 'Химия').id }
]

tests.map! do |t|
  Test.find_or_create_by!(t)
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


users = [
    { name: 'Саша' },
    { name: 'Маша' }
]

users.map! do |u|
  User.find_or_create_by!(u)
end

user_answers = [
  { user_id: User.find_by(name: 'Саша').id, question_id: Question.find_by(body: '2+2=5?').id, correct: false },
  { user_id: User.find_by(name: 'Саша').id, question_id: Question.find_by(body: '2+2=4?').id, correct: true },
  { user_id: User.find_by(name: 'Саша').id, question_id: Question.find_by(body: '5*5=25?').id, correct: true },
  { user_id: User.find_by(name: 'Саша').id, question_id: Question.find_by(body: '7*7=47?').id, correct: false },
  { user_id: User.find_by(name: 'Саша').id, question_id: Question.find_by(body: 'корень из 4 равно 2?').id, correct: true },
  { user_id: User.find_by(name: 'Саша').id, question_id: Question.find_by(body: 'Столица РФ - Москва?').id, correct: true },
  { user_id: User.find_by(name: 'Саша').id, question_id: Question.find_by(body: 'Самая высокая гора в США - Эверест?').id, correct: false },
  { user_id: User.find_by(name: 'Саша').id, question_id: Question.find_by(body: 'H2S04 - соляная кислота?').id, correct: false }
]

user_answers.map! do |ua|
  UserAnswer.find_or_create_by!(ua)
end


user_tests = [
  { users_id: User.find_by(name: 'Саша').id, tests_id: Test.find_by(title: 'Сложение').id },
  { users_id: User.find_by(name: 'Маша').id, tests_id: Test.find_by(title: 'Сложение').id },
  { users_id: User.find_by(name: 'Саша').id, tests_id: Test.find_by(title: 'Умножение').id },
  { users_id: User.find_by(name: 'Маша').id, tests_id: Test.find_by(title: 'Умножение').id },
  { users_id: User.find_by(name: 'Саша').id, tests_id: Test.find_by(title: 'Извлечение квадратного корня').id },
  { users_id: User.find_by(name: 'Маша').id, tests_id: Test.find_by(title: 'Столицы').id },
  { users_id: User.find_by(name: 'Саша').id, tests_id: Test.find_by(title: 'Столицы').id },
  { users_id: User.find_by(name: 'Саша').id, tests_id: Test.find_by(title: 'Горы').id },
  { users_id: User.find_by(name: 'Саша').id, tests_id: Test.find_by(title: 'Кислоты').id }
]

user_tests.map! do |ut|
  UserTest.find_or_create_by!(ut)
end
