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
  def initialize(product_params)
    @products = []
    product_params.each do |param|
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



# 商品データ
product_params1 = [
  {name: "トマト", price: 100},
  {name: "きゅうり", price: 200},
  {name: "玉ねぎ", price: 300},
  {name: "なす", price: 400}
]

product_params2 = [
  {name: "パセリ", price: 100},
  {name: "きゅうり", price: 200}
]



# 八百屋の開店
greengrocer1 = Greengrocer.new(product_params1)
greengrocer2 = Greengrocer.new(product_params2)
# 商品を表示
greengrocer1.disp_products
greengrocer2.disp_products