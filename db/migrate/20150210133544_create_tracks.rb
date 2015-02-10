class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.references :broadcast
      t.integer :part
      t.text :artist
      t.text :title
      t.text :composed
      t.text :published
      t.text :record_label
      t.text :catalogue_no
      t.text :duration
      t.text :notes
    end
  end
end
