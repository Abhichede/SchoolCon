class StudentCertificate < ApplicationRecord
  belongs_to :student

  mount_uploader :path, LeavingCertificateUploader
end
