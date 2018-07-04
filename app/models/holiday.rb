class Holiday < ApplicationRecord

  def date_f
    date.strftime("%d-%b-%Y")
  end
end
