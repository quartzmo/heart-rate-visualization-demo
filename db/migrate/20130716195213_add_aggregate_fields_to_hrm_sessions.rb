class AddAggregateFieldsToHrmSessions < ActiveRecord::Migration
  def change
    add_column :hrm_sessions, :bpm_max, :integer
    add_column :hrm_sessions, :bpm_min, :integer
    add_column :hrm_sessions, :bpm_weighted_avg, :integer
    add_column :hrm_sessions, :hr_zone1_duration, :integer
    add_column :hrm_sessions, :hr_zone2_duration, :integer
    add_column :hrm_sessions, :hr_zone3_duration, :integer
    add_column :hrm_sessions, :hr_zone4_duration, :integer
  end
end
