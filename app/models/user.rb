class User < ActiveRecord::Base

  has_many :hrm_sessions, order: :created_at

end
