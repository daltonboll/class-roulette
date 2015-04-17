class AddMessagesReferenceToLectures < ActiveRecord::Migration
  def change
    # add_reference :child, :parent, index: true
    add_reference :messages, :lectures, index: true
  end
end
