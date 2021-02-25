class ExercisesController < ApplicationController
  def exercise1
    # 【要件】
    #  1. 注文されていないすべての料理を@foodsに代入すること
    #  2. left_outer_joinsを使うこと
    #  3. 以下のコードに続ける形で記述すること
    @foods = Food
  end

  def exercise2
    # 【要件】
    #  1. 注文されていない料理を提供しているすべてのお店を@shopsに代入すること
    #  2. left_outer_joinsを使うこと
    #  3. 以下のコードに続ける形で記述すること
    @shops = Shop
  end

  def exercise3
    # 【要件】
    #  1. 配達先の一番多い住所を@addressに代入すること
    #  2. joinsを使うこと
    #  3. 取得したAddressのインスタンスにorders_countと呼びかけると注文の数を返すこと
    #  4. 以下のコードに続ける形で記述すること
    @address = Address
  end

  def exercise4
    # 【要件】
    #  1. 一番お金を使っている顧客を@customerに代入すること
    #  2. joinsを使うこと
    #  3. 取得したCustomerのインスタンスにfoods_price_sumと呼びかけると合計金額を返すこと
    #  4. 以下のコードに続ける形で記述すること
    @customer = Customer
  end
end
