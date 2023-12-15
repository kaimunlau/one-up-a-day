require 'factory_bot_rails'

puts 'Cleaning database...'
User.destroy_all
Tag.destroy_all
UpdatePost.destroy_all
TagUpdatePost.destroy_all

puts 'Creating users...'
5.times do
  ap FactoryBot.create(:user)
end

puts 'Creating tags...'
10.times do
  ap FactoryBot.create(:tag)
end

puts 'Creating update_posts...'
User.all.each do |user|
  number_of_posts = rand(3..5)
  number_of_posts.times do |index|
    ap FactoryBot.create(:update_post, user:, date: Date.today - (index + 1), tags: Tag.all.sample(rand(1..3)))
  end
end

puts 'Done!'
