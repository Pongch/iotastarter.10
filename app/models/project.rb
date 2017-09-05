class Project < ApplicationRecord
  has_many :donations, dependent: :destroy
  extend FriendlyId
  friendly_id :title, :use => :slugged
end
