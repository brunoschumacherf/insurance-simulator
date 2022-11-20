class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: { message: I18n.t('api.required_param', param: 'nome') }
  validates :age, presence: { message: I18n.t('api.required_param', param: 'idade') }
  validates :address, presence: { message: I18n.t('api.required_param', param: 'endereço') }
  validates :number, presence: { message: I18n.t('api.required_param', param: 'número') }
  validates :zipcode, presence: { message: I18n.t('api.required_param', param: 'CEP') }
  validates :email, presence: { message: I18n.t('api.required_param', param: 'email') }
  validates :password, presence: { message: I18n.t('api.required_param', param: 'senha') }

  has_many :insurances
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
