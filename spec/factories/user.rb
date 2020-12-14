FactoryBot.define do
  factory(:user) do
    email { Faker::Internet.unique.email }
    password { 'password' }
    username {  Faker::Internet.username(specifier: 10) }
  end
end
