class Project < ApplicationRecord
  validates :email, :address, :title, :presence => true
  has_many :donations, dependent: :destroy
  extend FriendlyId
  friendly_id :title, :use => :slugged
end
