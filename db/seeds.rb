# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create!(first_name: 'Nina', last_name: 'Louw', email: 'ninalouw@mac.com', password: 'password', password_confirmation: 'password', admin: true)
# User.create!(first_name: 'Pia', last_name: 'Guerra', email: 'hellkitty3@hotmail.com', password: 'password', password_confirmation: 'password', admin: true)
# categories = Category.create([{ title: 'Comics' },{ title: 'Cover Art' },{ title: 'Satire' }, { title: 'Political Satire' }])
# portfolio_categories = PortfolioCategory.create([{ title: 'Publishing' },{ title: 'Broadcasting' },{ title: 'Appearances' }])

# 5.times do
#   a = Announcement.create({ title: Faker::Book.title,
#                     body: Faker::Hipster.paragraph,
#                     user_id: 1
#                     })
# end

# puts Cowsay.say('Generated 5 announcements', 'random')

# 6.times do
#   p = Portfolio.create({ title: Faker::Book.title,
#                     body: Faker::Hipster.paragraph,
#                     user_id: 1,
#                     portfolio_category_id: rand(1) + 1
#                     })
# end

# puts Cowsay.say('Generated 6 portfolios', 'random')

9.times do
  p = Gallery.create({ title: Faker::Book.title,
                    body: Faker::Book.title,
                    user_id: 1,
                    category_id: rand(2) + 1,
                    image: "assets/gallery-2.jpg"
                    })
end

puts Cowsay.say('Generated 6 galleries', 'random')
