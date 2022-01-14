require 'rails_helper'

RSpec.describe BuyerStock, type: :model do
  describe 'check_db' do
    context 'when stock has not yet been bought by buyer' do
      let!(:buyer) { FactoryBot.create(:buyer) }
      let!(:stock) { FactoryBot.create(:stock) }

      it "returns 'nil'" do
        expect(described_class.check_db(stock.id, buyer.id)).to be_nil
      end
    end

    context 'when stock has already been bought by buyer' do
      let!(:buyer) { FactoryBot.create(:buyer) }
      let!(:stock) { FactoryBot.create(:stock) }

      it 'returns the stock object' do
        buyer.stocks << stock
        expect(described_class.check_db(stock.id, buyer.id)).to be_an_instance_of described_class
      end
    end
  end

end
