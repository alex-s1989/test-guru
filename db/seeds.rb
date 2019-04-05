
categories = [
  { title: 'Математика' },
  { title: 'География' },
  { title: 'Химия' }
]

categories.map! do |c|
  Category.find_or_create_by!(c)
end

users = [
  { name: 'Саша', email: 'san@gmail.com' },
  { name: 'Маша', email: 'mash@gmail.com' }
]
users.map! do |u|
  User.find_or_create_by!(u)
end


tests = [
  { title: 'Сложение', level: 0, category_id: categories[0].id, author_id: users[0].id },
  { title: 'Умножение', level: 1, category_id: categories[0].id, author_id: users[0].id },
  { title: 'Столицы', level: 2, category_id: categories[1].id, author_id: users[1].id },
  { title: 'Реки', level: 5, category_id: categories[1].id, author_id: users[0].id },
  { title: 'Кислоты', level: 4, category_id: categories[2].id, author_id: users[0].id },
  { title: 'Соли', level: 3, category_id: categories[2].id, author_id: users[1].id }
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
  { user_id: users[0].id, test_id: tests[4].id },
  { user_id: users[0].id, test_id: tests[5].id }
]

users_tests.map! do |ut|
  UsersTest.find_or_create_by!(ut)
end


questions = [
  { body: '2+2=?', test_id: tests[0].id },
  { body: '5*5=?', test_id: tests[1].id },
  { body: 'Столица РФ?', test_id: tests[2].id },
  { body: 'Самая большая река в Беларуси?', test_id: tests[3].id },
  { body: 'Что из перечисленного является кислотой?', test_id: tests[4].id },
  { body: 'CuS04 - соль?', test_id: tests[5].id }
]

questions.map! do |q|
  Question.find_or_create_by!(q)
end


answers = [
  { body: '4', question_id: questions[0].id, correct: true },
  { body: '5', question_id: questions[0].id },
  { body: '10', question_id: questions[0].id },
  { body: '25', question_id: questions[1].id, correct: true },
  { body: '36', question_id: questions[1].id },
  { body: 'Москва', question_id: questions[2].id, correct: true },
  { body: 'Сочи', question_id: questions[2].id },
  { body: 'Днепр', question_id: questions[3].id, correct: true },
  { body: 'Припять', question_id: questions[3].id },
  { body: 'H2S04', question_id: questions[4].id, correct: true },
  { body: 'CO2', question_id: questions[4].id },
  { body: 'HCl', question_id: questions[4].id, correct: true },
  { body: 'H2O', question_id: questions[4].id },
  { body: 'да', question_id: questions[5].id, correct: true },
  { body: 'нет', question_id: questions[5].id }
]

answers.map! do |a|
  Answer.find_or_create_by!(a)
end
