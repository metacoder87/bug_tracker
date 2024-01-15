class CreateBugs < ActiveRecord::Migration[7.0]
  def change
    create_table :bugs do |t|
      t.text :project, null: false
      t.text :path, null: false
      t.integer :priority, null: false, default: 0
      t.text :description, null: false
      t.text :finder, null: false
      t.integer :status, null: false, default: 0
      t.text :fixer, default: 'Unassigned'

      t.timestamps
    end
    add_index :bugs, :priority
    add_index :bugs, :status
  end
end
