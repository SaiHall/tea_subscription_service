class RemoveCustomerReference < ActiveRecord::Migration[7.0]
  def change
    remove_index :subscriptions, :customer_id
    remove_column :subscriptions, :customer_id
  end
end
