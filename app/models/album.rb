class Album < ActiveRecord::Base
  belongs_to :user
  has_many :album_details

  validates_presence_of :title
end
