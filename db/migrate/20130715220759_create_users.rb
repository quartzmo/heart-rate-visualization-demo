class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :gender
      t.integer :age
      t.integer :hr_zone1_bpm_min
      t.integer :hr_zone1_bpm_max
      t.integer :hr_zone2_bpm_min
      t.integer :hr_zone2_bpm_max
      t.integer :hr_zone3_bpm_min
      t.integer :hr_zone3_bpm_max
      t.integer :hr_zone4_bpm_min
      t.integer :hr_zone4_bpm_max

      t.timestamps
    end
  end
end
