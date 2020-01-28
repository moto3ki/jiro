FactoryBot.define do

  factory :noodle_image do
    image {File.open("#{Rails.root}/public/top_image/top.jpg")}
    shop
  end

end