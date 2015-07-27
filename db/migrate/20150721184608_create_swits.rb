class CreateSwits < ActiveRecord::Migration
  def change
    create_table :swits do |t|
      t.references :user, index: true, foreign_key: true
      t.string :content

      t.timestamps null: false
    end
    add_index :swits, [:user_id, :created_at]
  end
end
