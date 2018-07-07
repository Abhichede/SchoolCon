class Homework < ApplicationRecord
  belongs_to :standard
  belongs_to :division

  mount_uploader :attachment, HomeworkAttachmentUploader
end
