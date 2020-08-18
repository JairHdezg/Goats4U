require "open-uri"

puts 'Destroying existing goats'
@goats = Goat.all
@goats.each do |goat|
  goat.photo.purge if goat.photo.attached?
  goat.destroy
end

puts 'Destroying existing users'
@users = User.all
@users.each do |user|
  user.destroy
end

puts 'Creating 2 users'

@user1 = User.create(email: 'pepe@mail.com', password: '123456')
@user2 = User.create(email: 'bob@mail.com', password: '123456')

puts 'Finished'

puts 'Creating 1 goat'

@goat1 = Goat.new(name: 'Henry the goat', age: 3, breed: 'good', job: 'companion', city: 'Mexico city', price_par_day: 120, description: 'A good goat')
@goat1.user = @user1
@goat1.save
file = URI.open('https://res.cloudinary.com/dtnzbx6ci/image/upload/v1597774132/ju9nvpgq2ogi6cevwtglevhqnejf.jpg')
@goat1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

puts 'Finished'
