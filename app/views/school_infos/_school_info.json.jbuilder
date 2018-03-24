json.extract! school_info, :id, :name, :address, :contact, :registration_no, :gst_no, :email, :code, :logo, :created_at, :updated_at
json.url school_info_url(school_info, format: :json)
