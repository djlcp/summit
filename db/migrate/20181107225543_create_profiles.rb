class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :user_name
      t.text :proffesional_bio
      t.text :personal_bio

      t.timestamps
    end
  end
end
