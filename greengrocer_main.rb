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

end

class User

  def choose_product(products)
    while true
      print "商品の番号を選択 > "
      select_product_id = gets.to_i
      @choose_product = products.find{|product| product.id == select_product_id}
      break if !@choose_product.nil?
      puts "#{products.first.id}から#{products.last.id}番号から選んで下さい。"
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