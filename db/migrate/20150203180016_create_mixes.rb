class CreateMixes < ActiveRecord::Migration
  def change
    create_table :mixes do |t|
      t.string :name
      t.string :url
      t.datetime :airdate
      t.timestamps null: false
    end
  end
end
