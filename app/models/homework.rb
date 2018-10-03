class Homework < ApplicationRecord
  belongs_to :standard
  belongs_to :division

  mount_base64_uploader :attachment, HomeworkAttachmentUploader
  attr_accessor :filename
end
