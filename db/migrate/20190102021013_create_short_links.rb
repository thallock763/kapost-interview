class CreateShortLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :short_links do |t|
      t.string :short_url
      t.string :long_url

      t.timestamps
    end
  end
end
