require "open-uri"

puts 'Destroying existing rentals'
@rentals = Rental.all
@rentals.each do |rental|
  rental.destroy
end

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

puts 'Creating 4 goats'

@goat1 = Goat.new(name: 'Henry the goat', age: 3, breed: 'Abaza', job: 'Companion', city: 'Mexico city', price_par_day: 120, description: 'Henry loves on long walks on the beach and is a happy companion for all your goat walking or goat friend needs!')
@goat1.user = @user1
@goat1.save
file = URI.open('https://res.cloudinary.com/dtnzbx6ci/image/upload/v1597774132/ju9nvpgq2ogi6cevwtglevhqnejf.jpg')
@goat1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

@goat2 = Goat.new(name: 'Franky', age: 5, breed: 'Alpine', job: 'Model', city: 'Cuernavaca', price_par_day: 240, description: 'Franky is a very serious model and it likes catwalks and flashes')
@goat2.user = @user1
@goat2.save
file = URI.open('https://images.unsplash.com/photo-1584378110636-6949b43b610e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80')
@goat2.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

@goat3 = Goat.new(name: 'Scoot', age: 6, breed: 'Anglo-Nubian', job: 'Kid companion', city: 'Puebla', price_par_day: 200, description: 'This tiny goat will be the best friend for your kids')
@goat3.user = @user2
@goat3.save
file = URI.open('https://images.unsplash.com/photo-1533318087102-b3ad366ed041?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80')
@goat3.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

@goat4 = Goat.new(name: 'Mildred & Jhonny', age: 8, breed: 'Appenzell Goat', job: 'lawn trimmers', city: 'Toluca', price_par_day: 60, description: 'This hungry twins will make your life easier')
@goat4.user = @user2
@goat4.save
file = URI.open('https://images.unsplash.com/photo-1560926036-99ed8d0b0d1c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80')
@goat4.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

puts 'Finished'
