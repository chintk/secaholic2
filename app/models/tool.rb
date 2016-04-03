class Tool < ActiveRecord::Base
  DEFAULT_ATTRIBUTES = [:title, :content, :link, :created_by_id, :updated_by_id,
    :avatar, :description]
  PER_PAGE = 1

  mount_uploader :avatar, AvatarUploader

  scope :visible, ->{where hide: false}
end
