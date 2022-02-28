require 'rails_helper'

RSpec.describe ExercisesController, type: :controller do
  describe "exercise1" do
    let(:foods) { Food.where.not(id: OrderFood.pluck(:food_id).uniq) }
    before do
      expect(Food).to receive(:left_outer_joins).and_call_original
      get :exercise1
    end
    it "All dishes that have not been ordered are assigned to `@foods`." do
      expect(assigns(:foods)).to match_array foods
      expect(assigns(:foods).class.to_s).to eq "Food::ActiveRecord_Relation"
    end
  end

  describe "exercise2" do
    let(:foods) { Food.where.not(id: OrderFood.pluck(:food_id).uniq) }
    let(:shops) { Shop.all.select{|shop| shop.foods.any?{|food| foods.include?(food) } } }
    before do
      expect(Shop).to receive(:left_outer_joins).and_call_original
      get :exercise2
    end
    it "All stores that serve food that has not been ordered are assigned to `@shops`." do
      expect(assigns(:shops)).to match_array shops
      expect(assigns(:shops).class.to_s).to eq "Shop::ActiveRecord_Relation"
    end
  end

  describe "exercise3" do
    let(:address) { Address.all.sort{|a, b| b.orders.size <=> a.orders.size }.first }
    before do
      expect(Address).to receive(:joins).and_call_original
      get :exercise3
    end
    it "The most common delivery address is assigned to `@address``." do
      expect(assigns(:address)).to eq address
    end
    it "Calling `@address` with `orders_count` will return the number of orders." do
      expect(assigns(:address).orders_count).to eq address.orders.size
    end
  end

  describe "exercise4" do
    let(:customer) {
      Customer.module_eval { def foods_price_sum; orders.map(&:foods).flatten.sum(&:price); end }
      Customer.all.sort{|a, b| b.foods_price_sum <=> a.foods_price_sum }.first
    }
    before do
      expect(Customer).to receive(:joins).and_call_original
      get :exercise4
    end
    it "The customer who spends the most money is assigned to `@customer`." do
      expect(assigns(:customer)).to eq customer
    end
    it "Calling `foods_price_sum` on `@customer` returns the total amount." do
      expect(assigns(:customer).foods_price_sum).to eq customer.foods_price_sum
    end
  end

end
