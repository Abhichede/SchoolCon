module ApplicationHelper
  def current_institute
    SchoolInfo.first
  end
end
