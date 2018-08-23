class AddColumnToParentMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :parent_messages, :message_type, :string
  end
end
