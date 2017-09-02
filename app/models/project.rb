class Project < ApplicationRecord
  has_many :donations, dependent: :destroy
end
