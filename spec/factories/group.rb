FactoryBot.define do
  factory(:group) do
    name { Faker::Movies::LordOfTheRings.location }
    topic { Faker::Movies::StarWars.quote }
  end
end
