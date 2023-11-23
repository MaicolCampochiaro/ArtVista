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
  if User.last.artist == true
    puts "User #{User.last.nickname} is an artist"
    User.last.nickname = Faker::Artist.name
    User.last.image.attach(io: URI.open(Faker::Avatar.image), filename: 'fake_image.jpg')
    User.last.save!
  end
end

# Create 10 artworks
10.times do
  artwork = Artwork.new(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    user_id: User.where(artist: true).sample.id,
    size: Faker::Number.number(digits: 2).to_s,
    price: Faker::Number.decimal(l_digits: 2)
  )
  artwork.image.attach(io: URI.open("https://picsum.photos/200/300"), filename: 'fake_image.jpg')
  artwork.save!
end

# Create 5 tags
TAGS = ['Landscape', 'Portrait', 'Abstract', 'Still Life', 'Impressionism', 'Modern', 'Contemporary', 'Expressionism', 'Surrealism', 'Pop Art', 'Minimalism']
TAGS.each do |tag|
  Tag.create(
    name: tag
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
