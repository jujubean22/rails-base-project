FactoryBot.define do
  factory :admin do
    id { 1 }
    email { 'admin@hotmama.com' }
    password { '123123' }
    account_type { 'admin' }
  end
end
