class PostAttachment < ApplicationRecord
  mount_uploader :attachment_path, PostAttachmentUploader
  belongs_to :post

  def created_at_local
    created_at.strftime("%d-%m-%Y %I:%M %p")
  end
end
