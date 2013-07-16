module ApplicationHelper

  def seconds_to_human_time(seconds)
    mm, ss = seconds.divmod(60)
    "%d minutes, %d seconds" % [mm, ss]
  end
end
