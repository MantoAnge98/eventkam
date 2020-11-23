FactoryBot.define do
  factory :event do
    title {'event1'}
    image {'image.png'}
    content {'Sed ut perspiciatis unde
      omnis iste natus error sit voluptatem
      accusantium doloremque laudantium,
      totam rem aperiam4'}
    date_start {'2020-11-27'}
    date_end {'2020-11-30'}

    association :user
  end
end
