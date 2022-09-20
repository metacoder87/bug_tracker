class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :location
      t.text :description
      # True = Active unsolved bug / False = Archived resolved bug
      t.boolean :status, :default => false 

      t.timestamps
    end
  end
end
