class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.datetime :date
      t.integer :status, default: 3
      t.references :user
      t.timestamps
    end
  end
end
