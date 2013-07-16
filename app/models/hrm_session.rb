class HrmSession < ActiveRecord::Base
  belongs_to :user
  has_many :hrm_data_points, -> { order(:started_at) }

  before_save :set_computed_attributes

  def set_computed_attributes
    set_bpm_max
    set_bpm_min
    set_bpm_weighted_avg
    set_hr_zone1_duration
    set_hr_zone2_duration
    set_hr_zone3_duration
    set_hr_zone4_duration
  end

  def set_bpm_max
    self.bpm_max           = self.hrm_data_points.maximum(:bpm)
  end

  def set_bpm_min
    self.bpm_min           = self.hrm_data_points.minimum(:bpm)
  end

  def set_bpm_weighted_avg
    self.bpm_weighted_avg = self.hrm_data_points.to_a.sum { |e| e.bpm * e.duration } / self.hrm_data_points.sum(:duration)
  end

  def set_hr_zone1_duration
    self.hr_zone1_duration = set_hr_zone_duration(self.user.hr_zone1_bpm_min, self.user.hr_zone1_bpm_max)
  end

  def set_hr_zone2_duration
    self.hr_zone2_duration = set_hr_zone_duration(self.user.hr_zone2_bpm_min, self.user.hr_zone2_bpm_max)
  end

  def set_hr_zone3_duration
    self.hr_zone3_duration = set_hr_zone_duration(self.user.hr_zone3_bpm_min, self.user.hr_zone3_bpm_max)
  end

  def set_hr_zone4_duration
    self.hr_zone4_duration = set_hr_zone_duration(self.user.hr_zone4_bpm_min, self.user.hr_zone4_bpm_max)
  end

  private

  def set_hr_zone_duration(min, max)
    self.hrm_data_points.where("bpm >= ? and bpm <= ?", min, max).sum(:duration)
  end

end
