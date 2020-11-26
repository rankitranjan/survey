
user_admin = User.new
user_admin.email = 'admin@example.com'
user_admin.password = 'password'
user_admin.password_confirmation = 'password'
user_admin.save!
user_admin.add_role :admin

user_taker = User.new
user_taker.email = 'taker@example.com'
user_taker.password = 'password'
user_taker.password_confirmation = 'password'
user_taker.save!
user_taker.add_role :taker

10.times do
   questionnaire = Questionnaire.create(name: Forgery('lorem_ipsum').title, description: Forgery('lorem_ipsum').text)
   questionnaire.questions.create(title: Forgery('lorem_ipsum').title, question_type: 1, questionnaire_id: questionnaire.id)
   questionnaire.questions.each do |question|
     question.answers.create(response: Forgery('lorem_ipsum').title, question_id: question.id, user_id: user_taker.id)
   end
end
