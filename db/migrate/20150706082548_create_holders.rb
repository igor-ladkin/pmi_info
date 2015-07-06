class CreateHolders < ActiveRecord::Migration
  def change
    create_table :holders do |t|
      t.string :name
      t.string :city
      t.string :country
      t.string :credential
      t.date :date_of_certification
      t.string :status

      t.timestamps null: false
    end
  end
end
