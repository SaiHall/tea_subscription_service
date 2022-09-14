class RemoveStatus < ActiveRecord::Migration[7.0]
  def change
    remove_column :subscriptions, :status
    add_column :customer_subscriptions, :status, :integer, default: 0
  end
end
