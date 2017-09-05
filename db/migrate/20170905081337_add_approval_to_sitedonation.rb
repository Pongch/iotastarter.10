class AddApprovalToSitedonation < ActiveRecord::Migration[5.1]
  def change
    add_column :sitedonations, :approval, :boolean
  end
end
