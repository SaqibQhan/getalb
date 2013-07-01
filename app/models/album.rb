class Album < ActiveRecord::Base
  belongs_to :template
  belongs_to :user
  has_many :album_details
end
