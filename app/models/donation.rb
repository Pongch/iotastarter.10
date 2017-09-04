class Donation < ApplicationRecord
  belongs_to :project
  scope :approved, -> {where(:approval => true)}
  scope :pending, -> {where(:approval => false)}
end
