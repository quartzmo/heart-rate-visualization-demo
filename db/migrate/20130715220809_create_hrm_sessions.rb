class CreateHrmSessions < ActiveRecord::Migration
  def change
    create_table :hrm_sessions do |t|
      t.references :user, index: true
      t.integer :duration

      t.timestamps
    end
  end
end
