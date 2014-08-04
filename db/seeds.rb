(1..50).each do |i|
  User.create(name: "thanhcong#{i}", email: "thanhcong#{i}@example.com",
  password: "ca27e20fca6a12ac35dfa65398618c6569b1d4c0", password_confirmation: "ca27e20fca6a12ac35dfa65398618c6569b1d4c0", admin: '0')
end

(1..5).each do |i|
  User.create(name: "admin#{i}", email: "admin#{i}@example.com",
  password: "ca27e20fca6a12ac35dfa65398618c6569b1d4c0", password_confirmation: "ca27e20fca6a12ac35dfa65398618c6569b1d4c0", admin: '1')
end

(1..5).each do |i|
  Category.create(name_category: "Category#{i}")
end

(1..10).each do |i|
  Subject.create(total_time: i+10, count_question: i+5, context_display: "subject#{i}")
end

(1..240).each do |i|
  Question.create(context_question: "Question#{i}", subject_id: i%9+1, is_controll_text: false)
end

(1..60).each do |i|
  Question.create(context_question: "Questiontext#{i}", subject_id: i%9+1, is_controll_text: true)
end

(1..1200).each do |i|
  Answer.create(answer: "answer#{i}", question_id: i%299+1, correct: false)
end

(1..300).each do |i|
  Answer.create(answer: "answer#{i}", question_id: i%299+1, correct: true)
end