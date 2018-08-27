
categories = [
  { title: 'Математика' },
  { title: 'География' },
  { title: 'Химия' }
]

categories.each do |c|
  cat = Category.find_or_initialize_by(title: c[:title])
  cat.save!
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

tests.each do |t|
  test = Test.find_or_initialize_by(title: t[:title], level: t[:level], category_id: t[:category_id])
  test.save!
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

questions.each do |q|
  quest = Question.find_or_initialize_by(body: q[:body], test_id: q[:test_id])
  quest.save!
end


users = [
    { name: 'Саша' },
    { name: 'Маша' }
]

users.each do |u|
  user = User.find_or_initialize_by(name: u[:name])
  user.save!
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

user_answers.each do |ua|
  user_a = UserAnswer.find_or_initialize_by(user_id: ua[:user_id], question_id: ua[:question_id])
  user_a.save!
end
