class CreateHrmDataPoints < ActiveRecord::Migration
  def change
    create_table :hrm_data_points do |t|
      t.references :hrm_session, index: true
      t.integer :bpm
      t.timestamp :started_at
      t.timestamp :ended_at
      t.integer :duration

      t.timestamps
    end
  end
end
