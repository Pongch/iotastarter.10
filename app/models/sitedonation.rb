class Sitedonation < ApplicationRecord
  scope :approved, -> {where(:approval => true)}
  scope :pending, -> {where(:approval => false)}
end
