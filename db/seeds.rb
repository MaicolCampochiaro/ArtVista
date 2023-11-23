puts "Start seeding"

# Create 5 users
5.times do
  User.create(
    nickname: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    address: Faker::Address.full_address,
    artist: Faker::Boolean.boolean
  )
end
puts "Users created"

# Create 10 artworks
puts "Creating artworks"
10.times do
  artwork = Artwork.new(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    user_id: User.all.sample.id,
    size: Faker::Number.number(digits: 2).to_s,
    price: Faker::Number.decimal(l_digits: 2)
  )
  artwork.image.attach(io: URI.open("https://picsum.photos/200/300"), filename: 'fake_image.jpg')
  artwork.save!
  puts "Artwork created"
end

# Create 5 tags
5.times do
  Tag.create(
    name: Faker::Lorem.word
  )
end

# Create 20 artwork_tags
20.times do
  ArtworkTag.create(
    artwork_id: Artwork.all.sample.id,
    tag_id: Tag.all.sample.id
  )
end

puts "Seeds created"
