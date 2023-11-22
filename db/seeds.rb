# Create 5 users
5.times do
  User.create(
    nickname: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    avatar_url: Faker::LoremFlickr.image(size: "50x60", search_terms: ['avatar']),
    address: Faker::Address.full_address,
    artist: Faker::Boolean.boolean
  )
end

# Create 10 artworks
10.times do
  Artwork.create(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    user_id: User.all.sample.id,
    image_url: Faker::LoremFlickr.image(size: "50x60", search_terms: ['art'])
  )
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
