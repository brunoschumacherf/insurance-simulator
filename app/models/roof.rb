class Roof < ApplicationRecord
  belongs_to :insurance, class_name: 'Insurance'
end
