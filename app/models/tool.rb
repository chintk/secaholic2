class Tool < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
end