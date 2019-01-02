class AddLongUrlUniqueConstraint < ActiveRecord::Migration[5.2]
  def change
    add_index :short_links, [:long_url], :unique => true
  end
end
