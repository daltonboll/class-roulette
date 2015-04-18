# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding the database..."

# Initialize users
users = {
  :steven => User.create(name: 'Steven', email: 'steven@mail.com', password: 'password'),
  :dalton => User.create(name: 'Dalton', email: 'dalton@mail.com', password: 'password')
}


# Initialize courses
courses = {
  :cs61c => Course.create(name: 'cs61c'),
  :rubyonrails => Course.create(name: 'Ruby On Rails'),
  :cs70 => Course.create(name: 'cs70')
}


# Initialize lectures
cs61c_lectures = {
  :monday => Lecture.create(day: 'Monday', time: '3pm'),
  :wednesday => Lecture.create(day: 'Wednesday', time: '3pm'),
  :friday => Lecture.create(day: 'Friday', time: '3pm'),
}

rubyonrails_lectures = {
  :thursday => Lecture.create(day: 'Thursday', time: '5pm'),
}

cs70_lectures = {
  :tuesday => Lecture.create(day: 'Tuesday', time: '5pm'),
  :thursday => Lecture.create(day: 'Thursday', time: '5pm'),
}


# Assign cs61c lectures to cs61c course
cs61c_lectures.each do |day, lecture|
  lecture.course_id = courses[:cs61c].id
  lecture.save
end


# Assign rubyonrails lectures to rubyonrails course
rubyonrails_lectures.each do |day, lecture|
  lecture.course_id = courses[:rubyonrails].id
  lecture.save
end


# Assign cs70 lectures to cs70 course
cs70_lectures.each do |day, lecture|
  lecture.course_id = courses[:cs70].id
  lecture.save
end


# Initialize messages for Steven
stevens_messages = {
  :cs61c_messages => {
    :monday => Message.create(text: 'Woot! CS61C Monday lecture rocks!'),
    :wednesday => Message.create(text: '61C on hump day... ugh -_-'),
    :friday => Message.create(text: 'It\'s Friday! Suck it 61C!'),
  },
  :rubyonrails_messages => {
    :thursday => Message.create(text: 'Thank god Rails lecture is only once a week...'),
  },
  :cs70_messages => {
    :tuesday => Message.create(text: 'Club going Sahai on a Tuesday!'),
    :thursday => Message.create(text: 'Definitely skipping 70 lecture for rails right meow.'),
  },
}


# Initialize messages for Dalton
daltons_messages = {
  :cs61c_messages => {
    :monday => Message.create(text: 'Mondays are not meant for 61C. For realz.'),
    :wednesday => Message.create(text: 'Dan is always great on Wednesdays!'),
    :friday => Message.create(text: 'Learning about caches on a friday is NOT cool'),
  },
  :rubyonrails_messages => {
    :thursday => Message.create(text: 'Thursdays. Rails. Getting out an hour early. Oh yeah.'),
  },
  :cs70_messages => {
    :tuesday => Message.create(text: 'Ahh can\'t believe I have Sahai this Tuesday.'),
    :thursday => Message.create(text: 'Today is webcasted right? Cause I\'ve got required attendance for the rails decal...'),
  },
}


# Assign Steven's cs61c messages to Steven and cs61c lecture
stevens_messages[:cs61c_messages].each do |day, message|
  message.user_id = users[:steven].id
  message.save
  message.lecture_id = cs61c_lectures[day].id
  message.save
end


# Assign Steven's rubyonrails messages to Steven and rubyonrails lecture
stevens_messages[:rubyonrails_messages].each do |day, message|
  message.user_id = users[:steven].id
  message.save
  message.lecture_id = rubyonrails_lectures[day].id
  message.save
end


# Assign Steven's cs70 messages to Steven and cs70 lecture
stevens_messages[:cs70_messages].each do |day, message|
  message.user_id = users[:steven].id
  message.save
  message.lecture_id = cs70_lectures[day].id
  message.save
end


# Assign Dalton's cs61c messages to Dalton and cs61c lecture
daltons_messages[:cs61c_messages].each do |day, message|
  message.user_id = users[:dalton].id
  message.save
  message.lecture_id = cs61c_lectures[day].id
  message.save
end


# Assign Dalton's rubyonrails messages to Dalton and rubyonrails lecture
daltons_messages[:rubyonrails_messages].each do |day, message|
  message.user_id = users[:dalton].id
  message.save
  message.lecture_id = rubyonrails_lectures[day].id
  message.save
end


# Assign Dalton's cs70 messages to Dalton and cs70 lecture
daltons_messages[:cs70_messages].each do |day, message|
  message.user_id = users[:dalton].id
  message.save
  message.lecture_id = cs70_lectures[day].id
  message.save
end


puts "Database seeded successfully."