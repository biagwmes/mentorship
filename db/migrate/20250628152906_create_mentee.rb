class CreateMentee < ActiveRecord::Migration[8.0]
  def change
    create_table :mentees do |t|
      t.string :name
      t.string :current_title
      t.string :current_company
      t.string :email
      t.string :linkedin_url
      t.text :bio

      t.timestamps
    end
    add_index :mentees, :email, unique: true
  end
end
