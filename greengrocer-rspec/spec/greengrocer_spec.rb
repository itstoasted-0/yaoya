RSpec.describe Greengrocer do
  # ▼単体テスト2 正常系（Greengrocerクラスのインスタンス生成）
  describe ".initialize" do
    context "インスタンスが生成されたとき" do
      let(:product_params) do
        [
          { name: "トマト", price: "100" },
          { name: "きゅうり", price: "200" }
        ]
      end
      let(:greengrocer) { Greengrocer.new(product_params) }
      let(:products) { greengrocer.products }

      it "@productsの要素の数が，product_paramsの要素の数と等しいこと" do
        expect(products.size).to eq 2
      end

      it "@productsの最初の要素の名前が，product_paramsの最初の要素の名前と等しいこと" do
        expect(products[0].name).to eq "トマト"
      end

      it "@productsの最初の要素の金額が，product_paramsの最初の要素の金額と等しいこと" dod
        expect(products[0].price).to eq "100"
      end
    end
  end

  describe ".register_product" do
    let(:product_params) do
      [
        { name: "トマト", price: 100 },
        { name: "きゅうり", price: 200 }
      ]
    end
    let(:greengrocer) { Greengrocer.new(product_params) }
    let(:products) { greengrocer.products }
    let(:adding_product_params) do
      [
        { name: "ごぼう", price: 250 },
        { name: "れんこん", price: 350 },
      ]
    end

    before { greengrocer.register_product(adding_product_params) }

    it "@productsの要素の数が，「product_paramsとadding_product_paramsの要素の数の和」と等しいこと" do
      expect(products.size).to eq 4
    end

    it "@productsの最後の要素の名前が，adding_product_paramsの最後の要素の名前と等しいこと" do
      expect(products[-1].name).to eq "れんこん"
    end

    it "@productsの最後の要素の名前が，adding_product_paramsの最後の要素の金額と等しいこと" do
      expect(products[-1].price).to eq 350
    end
  end

  describe ".disp_products" do
    let(:base_id) { Product.class_variable_get("@@count") }
    let(:hello_msg) { "いらっしゃいませ！商品を選んで下さい。" }
    let(:product_msg1) { "#{base_id + 1}.トマト(¥100)" }
    let(:product_msg2) { "#{base_id + 2}.きゅうり(¥200)" }
    let(:msg) { "#{hello_msg}\n#{product_msg1}\n#{product_msg2}\n" }
    let(:product_params) do
      [
        { name: "トマト", price: 100 },
        { name: "きゅうり", price: 200 }
      ]
    end
    let(:greengrocer) { Greengrocer.new(product_params) }

    it "期待する表示がされること" do

      expect { greengrocer.disp_products }.to output(msg).to_stdout
    end
  end

end