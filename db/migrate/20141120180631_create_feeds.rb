class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :feed_name

      t.timestamps null: false
    end
  end
end
