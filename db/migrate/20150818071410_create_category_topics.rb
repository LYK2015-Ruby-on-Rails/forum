class CreateCategoryTopics < ActiveRecord::Migration
  def change
    create_table :category_topics do |t|
    	t.integer :category_id
    	t.integer :topic_id

      t.timestamps null: false
    end
  end
end
