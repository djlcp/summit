class CreateTagsTagables < ActiveRecord::Migration[5.2]
  def change
    create_table :tags_tagables do |t|

    	t.integer :tag_id, index: true
    	t.integer :tagable_id, index: true
    	t.string :tagable_type

      t.timestamps
    end
  end
end
