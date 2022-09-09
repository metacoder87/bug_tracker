class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :location
      t.text :description
      # True = Active unsolved bug / False = Archived resolved bug
      t.boolean :status 

      t.timestamps
    end
  end
end
