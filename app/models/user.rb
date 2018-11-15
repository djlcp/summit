class User < ApplicationRecord
	has_many :users_projects
	has_many :projects, :through => :users_projects
		
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :invitable


end
