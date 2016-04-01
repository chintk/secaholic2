class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :title
      t.text :content
      t.text :description
      t.string :link
      t.references :created_by
      t.references :updated_by
      t.string :avatar

      t.timestamps null: false
    end
  end
end
