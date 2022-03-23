class Menu < ApplicationRecord

  has_many :trainings, dependent: :destroy

end
