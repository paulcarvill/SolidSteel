class CreateBroadcasts < ActiveRecord::Migration
  def change
    create_table :broadcasts do |t|
      t.text :name
      t.text :url
      t.timestamps null: false
      t.datetime :broadcast_date
      t.text :session_name
      t.text :real_audio
      t.text :part1title
      t.text :part2title
      t.text :part3title
      t.text :part4title
      t.text :ra1
      t.text :ra2
      t.text :ra3
    end
  end
end
