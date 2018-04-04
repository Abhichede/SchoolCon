class StudentCertificate < ApplicationRecord
  acts_as_paranoid

  belongs_to :student

  mount_uploader :path, LeavingCertificateUploader
end
