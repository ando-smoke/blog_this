FactoryGirl.define do
  factory(:user) do
    email('andy@amail.com')
    password('12345678')
    password_confirmation('12345678')
  end

  factory(:user_2, class: User) do
    email('bob@amail.com')
    password('12345678')
    password_confirmation('12345678')
  end

  factory(:post) do
    title('Best foodcarts in PDX')
    body('The area around 10th and Alder is the best!')
    user
  end

  factory(:comment) do
    body('I totally agree.')
    association :user, factory: :user_2
    post
  end
end
