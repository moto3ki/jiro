FactoryBot.define do

  factory :user do
    nickname              {"Lucy"}
    email                 {"example@railstutorial.org"}
    password              {"testtest"}
    password_confirmation {"testtest"}
    admin {"1"}
  end

end