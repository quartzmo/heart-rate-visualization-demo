module ApplicationHelper

  def seconds_to_human_time(seconds)
    mm, ss = seconds.divmod(60)
    "%02d:%02d" % [mm, ss]     # todo: support hours
  end
end
