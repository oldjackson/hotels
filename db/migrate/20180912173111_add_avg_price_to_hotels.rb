class AddAvgPriceToHotels < ActiveRecord::Migration
  def change
    add_monetize :hotels, :average_price, currency: { present: false }
  end
end
