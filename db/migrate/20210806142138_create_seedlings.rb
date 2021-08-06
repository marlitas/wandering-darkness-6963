class CreateSeedlings < ActiveRecord::Migration[5.2]
  def change
    create_table :seedlings do |t|
      t.references :plant, foreign_key: true
      t.references :plot, foreign_key: true
    end
  end
end
