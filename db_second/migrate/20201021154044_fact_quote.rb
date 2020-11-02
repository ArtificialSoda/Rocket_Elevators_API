class FactQuote < ActiveRecord::Migration[5.2]
  def change
    create_table :factquote do |t|
      t.date :creation
      t.string :company_name
      t.string :email
      t.integer :nb_elevator
    end
  end
end
