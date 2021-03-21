class Pet < ApplicationRecord
  has_many :histories
  belongs_to :client

  def history_count
    histories.count
  end

  def avg_weight
    pet_arr = histories.pluck(:weight)
    pet_arr.sum / pet_arr.size
  end

  def avg_height
    pet_arr = histories.pluck(:heigth)
    (pet_arr.sum).to_i / pet_arr.size
  end

  def max_weight
    (histories.pluck(:weight)).max
  end

  def max_height
    (histories.pluck(:heigth)).max
  end
end
