class AddMessagesReferenceToUsers < ActiveRecord::Migration
  def change
    # add_reference :child, :parent, index: true
    add_reference :messages, :users, index: true
  end
end
