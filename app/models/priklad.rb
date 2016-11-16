class Priklad < ActiveRecord::Base
  has_many :komentars, dependent: :destroy
  belongs_to :kolo
end
