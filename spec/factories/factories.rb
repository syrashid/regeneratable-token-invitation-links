FactoryBot.define do
  factory(:user) do
    email { Faker::Internet.unique.email }
    password { 'password' }
    username {  Faker::Internet.username(specifier: 10) }
  end

  factory(:group) do
    name { Faker::Movies::LordOfTheRings.location }
    topic { Faker::Movies::StarWars.quote }
  end

  factory(:membership) do
    group
    user
  end
end
