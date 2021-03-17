class Pet < ApplicationRecord
  has_many :histories, dependent: :destroy
end
