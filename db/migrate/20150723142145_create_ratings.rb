class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :swit, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.boolean :rate

      t.timestamps null: false
    end
  end
end
