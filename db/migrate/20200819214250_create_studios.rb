class CreateStudios < ActiveRecord::Migration[6.0]
  def change
    create_table :studios do |t|
      t.column :name, :string, null: false
      t.column :foundation, :string, null: false
      t.timestamps
    end
  end
end
