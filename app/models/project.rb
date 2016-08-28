class Project < ApplicationRecord
  belongs_to :admin

  has_attached_file :image, default_url: "/images/missing.jpg",
                    path: ':rails_root/public/system/:class/:attachment/:filename'

  validates_attachment :image,
    content_type: { content_type: /\Aimage\/.*\z/ },
    size: { in: 0..1.megabytes }

  def stripped_name
    name.gsub(/[ -]/, '_').downcase
  end

end
