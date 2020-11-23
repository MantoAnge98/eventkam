FactoryBot.define do
  factory :user do
    name { "user1" }
    avatar {"image.png"}
    email { "user@gmail.com" }
    password{ "000000" }
    password_confirmation{ "000000" }
  end

  factory :second_user , class: User do
    name { "user2" }
    avatar {"image.png"}
    email { "user1@gmail.com" }
    password{ "000000" }
    password_confirmation{ "000000" }
  end

  factory :admin_user, class: User do
    name { "admin" }
    avatar {"image.png"}
    email { "admin@gmail.com" }
    password { "000000" }
    password_confirmation{ "000000" }
    admin {true}
  end

end
