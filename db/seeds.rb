def rand(size)
  FFaker::Random.rand(size)
end

FFaker::Random.seed = 42

# Create some users

10.times do
  # User.find_or_create_by name: FFaker::Internet.user_name, email: FFaker::Internet.email
  # User.create name: FFaker::Internet.user_name, email: FFaker::Internet.email, password: 'qwerty'
  User.create email: FFaker::Internet.email, password: 'qwerty'
end

# 10.times do
#   # User.find_or_create_by name: FFaker::Internet.user_name
#   User.find_or_create_by email: FFaker::Internet.user_email
# end

# Lets first 7 of them to be creators
# User.where(id: User.select(:id).first(7)).update_all(creator: true)

# Lets first 2 of them to be moderators
# User.where(id: User.select(:id).last(2)).update_all(moderator: true)
# # User.first(2).each { |u| u.update moderator: true }

# Generate some posts
# creators = User.where(creator: true)

creators = User.where(id: User.select(:id))

20.times do
  body = FFaker::HipsterIpsum.paragraphs(20).join "\n\n"
  user = creators[rand(creators.length)]
  Post.create! body: body, user: user, title: FFaker::HipsterIpsum.sentence
  # Post.create_with(body: body, user: user).create title: FFaker::HipsterIpsum.sentence

  # .create title: FFaker::HipsterIpsum.sentence
      # .find_or_create_by(title: FFaker::HipsterIpsum.sentence)
end

# Generate some comment
# users = User.all
# posts = Post.all
#
# 200.times do
#   post = posts[rand(creators.length)]
#   user = users[rand(creators.length)]
#   body = FFaker::HipsterIpsum.paragraph
#   Comment.find_or_create_by user: user, post: post, body: body
# end

