class Topic < ActiveRecord::Base
	extend FriendlyId
  friendly_id :title, use: :slugged

	paginates_per 2

	validates :title, presence: true
	validates :title, length: {minimum: 1, maximum: 140}

	belongs_to :user
	has_many :posts
	has_many :category_topics
	has_many :categories, through: :category_topics
end
