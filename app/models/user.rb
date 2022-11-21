class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: { message: I18n.t('api.required_param') }
  validates :age, presence: { message: I18n.t('api.required_param') }
  validates :address, presence: { message: I18n.t('api.required_param') }
  validates :number, presence: { message: I18n.t('api.required_param') }
  validates :zipcode, presence: { message: I18n.t('api.required_param') }
  validates :email, presence: { message: I18n.t('api.required_param') }
  validates :password, presence: { message: I18n.t('api.required_param') }

  has_many :insurances, class_name: 'Insurance'
  def user_map
    {
      id: id,
      name: name,
      age: age,
      address: address,
      number: number,
      zipcode: zipcode,
      email: email,
      token: authentication_token
    }
  end
end
