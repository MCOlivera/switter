class ChangeRateDataTypeInRating < ActiveRecord::Migration
  def up
    change_column :ratings, :rate, :boolean
  end

  def down
    change_column :ratings, :rate, :integer
  end
end
