class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :location
      t.text :description
      t.boolean :status

      t.timestamps
    end
  end
end
