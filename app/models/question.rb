#require 'elasticsearch/model'
class Question < ApplicationRecord
	has_many :answers
	belongs_to :user
	belongs_to :category
  mount_uploader :picture, PictureUploader
	 #include Elasticsearch::Model
  #include Elasticsearch::Model::Callbacks
end

# Question.import force: true
