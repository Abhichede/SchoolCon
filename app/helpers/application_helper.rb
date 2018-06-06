module ApplicationHelper
  def current_institute
    SchoolInfo.first
  end

  def random_boot_panel
    panels = %w(default danger success info warning)

    panels.sample
  end
end
