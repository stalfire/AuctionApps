class CreateAuctions < ActiveRecord::Migration[5.0]
  def change
    create_table :auctions do |t|
		t.string :title
    	t.string :category
    	t.references :user, foreign_key: true
    	t.json :avatar
    	t.timestamps null:false
    end
  end
end
