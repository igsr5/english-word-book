class CreateWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.string :origin, null: false
      t.string :text, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
