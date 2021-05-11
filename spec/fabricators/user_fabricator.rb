Fabricator :user do
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  email { Faker::Internet.email }
  password 'givegab123!'
  password_digest { '$2a$10$bfcB789vqBevospukhfkVuH9UIe5YQBZZ5b.7/dBqEmvitDxK.Tye' }
end