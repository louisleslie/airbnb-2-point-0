class AddNameToProperties < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :name, :string
  end
end
