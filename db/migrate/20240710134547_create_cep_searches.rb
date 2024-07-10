class CreateCepSearches < ActiveRecord::Migration[7.1]
  def change
    create_table :cep_searches do |t|
      t.string :cep
      t.integer :count
      t.string :state
      t.string :city

      t.timestamps
    end
  end
end
