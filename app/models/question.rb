#require 'elasticsearch/model'
class Question < ApplicationRecord
	has_many :answers
	belongs_to :user
	belongs_to :category
	include PgSearch
	pg_search_scope :search, against: [:content],using: {tsearch: {dictionary: "english"}},
	associated_against: {user: :name,answers: :content}
  mount_uploader :picture, PictureUploader
	def self.text_search(query)
		if query.present?
			search(query)
		else 
			scoped
		end
	end
end


