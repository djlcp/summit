class AddDeviseInvitableToAdminModel < ActiveRecord::Migration[5.2]
  def change
  	add_column :admins, :invitation_token, :string
    add_column :admins, :invitation_created_at, :datetime
    add_column :admins, :invitation_sent_at, :datetime
    add_column :admins, :invitation_accepted_at, :datetime
    add_column :admins, :invitation_limit, :integer
    add_column :admins, :invited_by_id, :integer
    add_column :admins, :invited_by_type, :string
    add_index :admins, :invitation_token, :unique => true

    # Allow null encrypted_password
    change_column_null :admins, :encrypted_password, :string, true
  end
end

