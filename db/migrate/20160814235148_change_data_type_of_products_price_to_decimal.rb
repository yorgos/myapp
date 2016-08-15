class ChangeDataTypeOfProductsPriceToDecimal < ActiveRecord::Migration[5.0]

  def self.up
    change_column :products, :price, :decimal
  end

  def self.down
    change_column :products, :price, :integer
  end

end
