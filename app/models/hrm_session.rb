class HrmSession < ActiveRecord::Base
  belongs_to :user
  has_many :hrm_data_points
end
