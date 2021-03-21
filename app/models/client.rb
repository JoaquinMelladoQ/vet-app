class Client < ApplicationRecord
  has_many :pets

    def pets_number 
        pets.count
    end
end
