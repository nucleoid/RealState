# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :image do
    url "http://photos1.zillowstatic.com/p_f/IS9t4gd1bacd160000000000.jpg"
    is_featured false

    factory :image_featured do
      url "http://photos1.zillowstatic.com/p_f/IS9t4gd1bacd160000000001.jpg"
      is_featured true
    end
  end
end
