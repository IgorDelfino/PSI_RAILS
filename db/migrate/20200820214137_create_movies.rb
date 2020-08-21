class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.column :title, :string, null: false
      t.column :release_date, :string, null: false
      t.column :description, :text, null: false
      t.column :genre, :string, null: false
      t.column :esrb, :string, null: false
      t.belongs_to :studio ,foreign_key: true
      t.timestamps
    end
  end
end
