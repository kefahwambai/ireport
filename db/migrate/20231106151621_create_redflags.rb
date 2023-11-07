class CreateRedflags < ActiveRecord::Migration[7.0]
  def change
    create_table :redflags do |t|
      t.string :title
      t.string :description
      t.string :status, default: 'pending'
      t.references :user, null: false, foreign_key: true
      t.string :location
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
