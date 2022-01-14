require 'rails_helper'

RSpec.describe Buyer, type: :model do
  it { expect(described_class.new).to validate_presence_of :email }
  it { expect(described_class.new).to validate_presence_of :account_type }

  describe 'stock_already_added?' do
    context 'when stock searched has not been added before' do
      let!(:buyer) { FactoryBot.create(:buyer) }
      let!(:stock) { FactoryBot.create(:stock) }

      it "returns 'false'" do
        expect(buyer).not_to be_stock_already_bought(stock.id, buyer.id)
      end
    end

    context 'when stock has been added before' do
      let!(:buyer) { FactoryBot.create(:buyer) }
      let!(:stock) { FactoryBot.create(:stock) }

      it "returns 'true'" do
        buyer.stocks << stock
        expect(buyer).to be_stock_already_bought(stock.id, buyer.id)
      end
    end
  end

  describe 'can_add_stock?' do
    context 'when stock can be added by buyer' do
      let!(:buyer) { FactoryBot.create(:buyer) }
      let!(:stock) { FactoryBot.create(:stock) }

      it "returns 'true'" do
        expect(buyer).to be_can_buy_stock(stock.id, buyer.id)
      end
    end

    context "when stock can't be added by buyer" do
      let!(:buyer) { FactoryBot.create(:buyer) }
      let!(:stock) { FactoryBot.create(:stock) }

      it "returns 'false'" do
        buyer.stocks << stock
        expect(buyer).not_to be_can_buy_stock(stock.id, buyer.id)
      end
    end
  end

end
