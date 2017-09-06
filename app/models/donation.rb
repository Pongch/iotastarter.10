class Donation < ApplicationRecord
  validates :email, :name, :tag, :presence => true
  belongs_to :project
  scope :approved, -> {where(:approval => true)}
  scope :pending, -> {where(:approval => false)}

end
