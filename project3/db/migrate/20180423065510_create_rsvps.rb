class CreateRsvps < ActiveRecord::Migration[5.2]
  def change
    create_table :rsvps do |t|
      t.references :event, foreign_key: true
      t.string :name
      t.text :email
      t.text :key

      t.timestamps
    end
  end
end
