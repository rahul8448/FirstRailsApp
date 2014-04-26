class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :profile_name 
                  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  

  has_many :statuses

  validates  :first_name, presence: true

  validates  :last_name, presence: true

  validates  :profile_name, presence: true,
                            uniqueness: true,
                            format: 
                            {

                               with: /a-zA-Z0-9_/, 
                               message: 'Must has only letters alphabets, numbers and underscores'
                            }  
                            

  

  def full_name
     first_name+ " " +last_name
  end	


end
