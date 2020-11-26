class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.string :name
      t.text :description
      t.datetime :stat_date
      t.datetime :end_date
      t.integer :status
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
