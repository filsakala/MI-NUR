class Knizka < ActiveRecord::Base
  has_many :knizka_obsahs, dependent: :destroy
  has_many :pdfs, dependent: :destroy
end
