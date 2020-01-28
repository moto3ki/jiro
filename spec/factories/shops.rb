FactoryBot.define do

  factory :shop do
    name {"三田"}
    address {"東京都港区"}
    map {File.open("#{Rails.root}/public/top_image/top.jpg")}
    horiday {"日"}
    opening_hours {"12-17"}
    menu {"小ラーメン"}
    rule {"卓上に蓮華あり"}
    detail {"麺は、中太平ストレート。"}
    latitude {35.6432}
    longitude {139.74}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user 
    after(:build) do |shop|
      shop.noodle_images<< build(:noodle_image, shop: shop)
    end
  end

end