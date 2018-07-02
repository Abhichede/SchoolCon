class Homework < ApplicationRecord
  belongs_to :standard

  mount_uploader :attachment, HomeworkAttachmentUploader
end
