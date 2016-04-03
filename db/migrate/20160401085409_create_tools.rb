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
      t.boolean :hide, default: false
      t.boolean :status, default: false

      t.timestamps null: false
    end
  end
end
