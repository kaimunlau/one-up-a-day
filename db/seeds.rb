require 'factory_bot_rails'

puts 'Cleaning database...'
User.destroy_all
Tag.destroy_all
UpdatePost.destroy_all
TagUpdatePost.destroy_all

puts 'Creating test user...'
ap FactoryBot.create(:user, email: 'test@test.com', first_name: 'Tester')

puts 'Creating random users...'
random_users = []
5.times do
  ap user = FactoryBot.create(:user)
  random_users << user
end

puts 'Creating tags...'
10.times do
  ap FactoryBot.create(:tag)
end

puts 'Creating update_posts...'
possible_titles = [
  'done absolutely nothing',
  'gone to the moon',
  'eaten a sandwich',
  'slept for 12 hours',
  'watched a movie',
  'read a book',
  'gone for a walk',
  'done a lot of work',
  'played a game',
  'devised a plan to take over the world'
]

random_users.each do |user|
  number_of_posts = rand(3..5)
  number_of_posts.times do |index|
    ap FactoryBot.create(
      :update_post,
      user:,
      date: Date.today - (index + 1),
      title: possible_titles.sample,
      tags: Tag.all.sample(rand(1..3))
    )
  end
end

puts 'Finished seeding the database! ヽ(•‿•)ノ'
puts '-----------------------------------'
puts 'You can now signup or login with'
puts 'Email: test@test.com'
puts 'Password: password'
