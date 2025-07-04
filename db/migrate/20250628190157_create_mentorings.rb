class CreateMentorings < ActiveRecord::Migration[8.0]
  def change
    create_table :mentorings do |t|
      t.references :mentee, null: false, foreign_key: true
      t.references :mentor, null: false, foreign_key: true
      t.timestamps
    end
  end
end
