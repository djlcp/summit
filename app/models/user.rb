class User < ApplicationRecord
	has_many :users_projects, dependent: :destroy
	has_many :projects, :through => :users_projects
	has_many :questions, dependent: :destroy
	has_many :answers, dependent: :destroy
	has_many :comments, dependent: :destroy
		
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :invitable


end
