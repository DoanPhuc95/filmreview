#Users
# 5.times do |t|
#     name = "Johnson #{t + 1}"
#     email = "johnson#{t+1}@gmail.com"
#     if t%2 == 0
#         gender = "Male"
#     else
#         gender = "Female"
#     end
#     password = "123123"
#     User.create!(name: name, email: email, password: password, gender: gender)
# end

#Movie
# 30.times do |t|
#     name = "Kingsman #{t}"
#     description = Faker::Hipster.paragraphs
#     producer = "Disney Channel"
#     if t%5 == 0
#         image = "https://i.ytimg.com/vi/6Nxc-3WpMbg/maxresdefault.jpg"
#     elsif t%5==1
#         image = "https://upload.wikimedia.org/wikipedia/en/d/d8/Game_of_Thrones_title_card.jpg"
#     elsif t%5==2
#         image = "http://ll-c.ooyala.com/e1/11cnduYjE6BQ5jWju1l4_-cAa5rebe7x/promo322954306"
#     elsif t%5==3
#         image = "https://i.ytimg.com/vi/ue80QwXMRHg/maxresdefault.jpg"
#     else t%5==4
#         image = "https://lumiere-a.akamaihd.net/v1/images/image_ccc4b657.jpeg"
#     end
#     Movie.create!(name: name, description: description, producer: producer, image: image)
# end

#Actor
# 15.times do
#     name = Faker::Name.name
#     Actor.create!(name: name)
# end

#Category
# 30.times do |t|
#     movie_id = t+1
#     rand_count = rand(3)
#     rand_count.times do
#         value = rand(19)
#         while !Category.find_by(movie_id: movie_id, value: value).nil?
#             value = rand(19)
#         end
#         Category.create!(value: value, movie_id: movie_id)
#     end
# end

#Rate
# 20.times do
#     user_id = User.order("RANDOM()").first.id
#     movie_id = Movie.order("RANDOM()").first.id
#     value = rand(5)
#     Rate.create!(user_id: user_id, movie_id: movie_id, value: value)
# end

#Comment
# 30.times do
#     user_id = User.order("RANDOM()").first.id
#     movie_id = Movie.order("RANDOM()").first.id
#     content = Faker::HarryPotter.quote
#     Comment.create!(user_id: user_id, movie_id: movie_id, content: content)
# end

#ActorMovie
# 30.times do |t|
#     movie_id = t+1
#     ran_count = rand(5)
#     ran_count.times do
#         actor_id = Actor.order("RANDOM()").first.id
#         while !ActorMovie.find_by(actor_id: actor_id, movie_id: movie_id).nil?
#             actor_id = Actor.order("RANDOM()").first.id
#         end
#         ActorMovie.create!(movie_id: movie_id, actor_id: actor_id)
#     end
# end