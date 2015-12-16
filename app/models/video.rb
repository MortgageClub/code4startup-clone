class Video < ActiveRecord::Base
  validates :wistia, length: {maximum: 10}, uniqueness: true
  validates :title, length: {maximum: 40}, presence: true
  validates :description, length: {maximum: 800}

  def next
    Video.where("id > ?", id).first
  end

  def prev
    Video.where("id < ?", id).last
  end
end
