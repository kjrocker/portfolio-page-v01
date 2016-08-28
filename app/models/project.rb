class Project < ApplicationRecord
  belongs_to :admin

  has_attached_file :image, default_url: "missing.jpg",
                    path: ':rails_root/public/system/:class/:attachment/:filename'

  validates_attachment :image,
    content_type: { content_type: /\Aimage\/.*\z/ },
    size: { in: 0..1.megabytes }

  def stripped_name
    name.gsub(/[ -]/, '_').downcase
  end

  def full_source
    return full_url(self.source_link)
  end

  def full_completed
    return full_url(self.complete_link)
  end

  private
    def full_url(link)
      link.start_with?('http://') || link.start_with?('https://') ? link : "http://#{link}"
    end

end
