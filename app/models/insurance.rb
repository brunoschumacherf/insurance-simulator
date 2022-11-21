class Insurance < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :roofs, class_name: 'Roof'

end
