class AddApprovalToDonation < ActiveRecord::Migration[5.1]
  def change
    add_column :donations, :approval, :boolean
  end
end
