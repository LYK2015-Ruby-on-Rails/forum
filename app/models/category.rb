class Category < ActiveRecord::Base
	validates :name, presence: true

	has_many :category_topics
	has_many :topics, through: :category_topics
end
