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
  Subject.create(total_time: i+10, count_question: i+10, context_display: "subject#{i}")
end