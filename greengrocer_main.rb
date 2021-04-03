class Product
  attr_reader :id, :name, :price
  @@count = 30

  def initialize(product_params)
    @id = @@count += 1
    @name = product_params[:name]
    @price = product_params[:price]
  end

end

class Greengrocer
  attr_reader :products

  def initialize(product_params)
    @products = []
    register_product(product_params)
  end

  #商品の追加
  def register_product(adding_product_params)
    adding_product_params.each do |param|
      @products << Product.new(param)
    end
  end

  def disp_products
    puts "いらっしゃいませ！商品を選んで下さい。"
    @products.each do |product|
      puts "#{product.id}.#{product.name}(#{product.price}円)"
    end
  end

  def ask_quantity(chosen_product)
    puts "#{chosen_product.name}ですね。何個買いますか？"

  end

  # 合計金額を計算
  def calculate_charges(chosen_product, quantity_of_product)
    total_price = chosen_product.price * quantity_of_product
    if quantity_of_product >= 5
      puts "5個以上なので10％割引となります！"
      total_price *= 0.9
    end
    puts "合計金額は#{total_price.floor}円です。"
    puts "お買い上げありがとうございました！"
  end

end

class User
  attr_reader :chosen_product, :quantity_of_product

  def choose_product(products)
    while true
      print "商品の番号を選択 > "
      select_product_id = gets.to_i
      @chosen_product = products.find{|product| product.id == select_product_id}
      break if !@chosen_product.nil?
      puts "#{products.first.id}から#{products.last.id}番号から選んで下さい。"
    end
  end

  def decide_quantity
    while true
      print "商品の個数を入力 > "
      @quantity_of_product = gets.to_i
      break if @quantity_of_product >= 1
      puts "1個以上選んで下さい。"
    end
  end

end

# 商品データ
product_params1 = [
  {name: "トマト", price: 100},
  {name: "きゅうり", price: 200},
  {name: "玉ねぎ", price: 300},
  {name: "なす", price: 400}
]

# 八百屋の開店
greengrocer1 = Greengrocer.new(product_params1)

# 追加商品データadding_product_params1を定義
adding_product_params1 = [
  {name: "ごぼう", price: 250},
  {name: "れんこん", price: 350}
]

# 商品を登録するメソッドを呼び出す
greengrocer1.register_product(adding_product_params1)

# お客さんの来店
user = User.new

# 商品を表示
greengrocer1.disp_products

# (2)商品を選択するメソッドを呼び出し（実引数を設定）
user.choose_product(greengrocer1.products)

# (3)引数を設定し、「個数を質問する」メソッドを呼び出す
greengrocer1.ask_quantity(user.chosen_product)

# 個数を決定
user.decide_quantity

greengrocer1.calculate_charges(user.chosen_product, user.quantity_of_product)