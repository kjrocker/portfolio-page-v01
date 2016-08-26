class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :source_link
      t.string :complete_link
      t.boolean :active

      t.timestamps
    end
  end
end
