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