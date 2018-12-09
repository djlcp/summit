class FixColumnName < ActiveRecord::Migration[5.2]
	rename_column :profiles, :proffesional_bio, :professional_bio
  def change
  end
end
