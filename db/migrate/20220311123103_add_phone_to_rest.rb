class AddPhoneToRest < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :phone, :string, default: "1234"
    add_column :categories, :position, :integer
  end
end
