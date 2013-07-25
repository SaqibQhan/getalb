class Album < ActiveRecord::Base
  belongs_to :user
  has_many :album_details
  has_many :svg_texts

  validates_presence_of :title
end
