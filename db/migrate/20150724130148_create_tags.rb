class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.references :swit, index: true, foreign_key: true
      t.string :content

      t.timestamps null: false
    end
  end
end
