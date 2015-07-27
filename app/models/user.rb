class User < ActiveRecord::Base
	has_many :swits, dependent: :destroy

	has_secure_password

	validates_confirmation_of :password

	validates_uniqueness_of :username
	validates_presence_of :username

	validates_length_of :password, :in => 6..20, :on => :create

end
