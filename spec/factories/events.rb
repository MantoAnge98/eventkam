FactoryBot.define do
  factory :event do
    title {'event1'}
    image {'image.png'}
    content {'Sed ut perspiciatis unde
      omnis iste natus error sit voluptatem
      accusantium doloremque laudantium,
      totam rem aperiam4'}
    date_start {DateTime.now}
    date_end {Time.now + 10.days}
    association :user
  end

  factory :second_event, class: Event do
    title {'event2'}
    image {'image.png'}
    content {'Sed ut perspiciatis unde
      omnis iste natus error sit voluptatem
      accusantium doloremque laudantium,
      totam rem aperiam4'}
    date_start {DateTime.now}
    date_end {Time.now + 10.days}
    association :user
  end

  factory :third_event, class: Event do
    title {'event3'}
    image {'image.png'}
    content {'Sed ut perspiciatis unde
      omnis iste natus error sit voluptatem
      accusantium doloremque laudantium,
      totam rem aperiam4'}
    date_start {DateTime.now}
    date_end {Time.now + 10.days}
    association :user
  end
  
end
