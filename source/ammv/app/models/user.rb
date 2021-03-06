class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :registerable (habilita sign_up)
  has_many :cadastros
  enum role: [:normal_user, :admin]

  
    
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, :authentication_keys => [:login]

  attr_accessor :login
  
  def self.find_first_by_auth_conditions(warden_conditions)
	  conditions = warden_conditions.dup
	  if login = conditions.delete(:login)
	    where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
	  else
	    where(conditions).first
	  end
  end

 

end
