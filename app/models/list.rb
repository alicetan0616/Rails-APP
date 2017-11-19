class List < ApplicationRecord
  validates_presence_of :title, :date
  validates :title, length: { maximum: 20 }


end
