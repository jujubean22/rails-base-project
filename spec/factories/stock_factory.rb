FactoryBot.define do
  factory :stock do
    ticker { 'AAPL' }
    name { 'Apple Inc' }
    last_price { 1 }
    quantity { 1 }
    added_by { 1 }
  end
end
