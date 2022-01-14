require 'rails_helper'

RSpec.describe Broker, type: :model do
  context 'when signs up' do
    it 'is not allowed without account_type' do
      broker = described_class.new(account_type: nil, broker_name: "testing", email: "test@test.com")
      expect(broker).not_to be_valid
    end

    it 'is not allowed without broker_name' do
      broker = described_class.new(account_type: "broker", broker_name: nil, email: "test@test.com")
      expect(broker).not_to be_valid
    end

    it 'is not allowed email' do
      broker = described_class.new(account_type: "broker", broker_name: "testing", email: nil)
      expect(broker).not_to be_valid
    end
  end
end

