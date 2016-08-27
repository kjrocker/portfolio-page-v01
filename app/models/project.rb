class Project < ApplicationRecord
  belongs_to :admin

  has_attached_file :image, path: ':rails_root/public/system/:class/:attachment/:filename'

  validates_attachment :image,
    content_type: { content_type: "image/jpeg" },
    size: { in: 0..2.megabytes }
end
