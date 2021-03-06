require 'restaurant'

describe Restaurant do

  let(:dish_eggs) { double :eggs, name: "Eggs", price: 3 }
  let(:dish_sausages) { double :sausages, name: "Sausages", price: 4 }
  let(:dishes) { [dish_eggs, dish_sausages] }
  let(:bad_diner) { Restaurant.new([dish_eggs]) }
  subject(:restaurant) { Restaurant.new([dish_eggs, dish_sausages]) }

  it 'can list the dishes it has' do
    expect(restaurant.list_dishes).to eq dishes
  end

  describe "#dish" do
    it "fails if no such dish" do
      expect { restaurant.dish("Fake dish") }.to raise_error "No such dish!"
    end

    it 'returns the dish if it exists' do
      expect(restaurant.dish("Eggs")).to eq dish_eggs
    end
  end

  describe "#add_dish" do
    it 'adds dish to dishes' do
      bad_diner.add_dish(dish_sausages)
      expect(bad_diner.list_dishes).to include dish_sausages
    end
  end

end
