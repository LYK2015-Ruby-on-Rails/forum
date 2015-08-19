class TopicSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id, :user_email

  has_many :posts

  def user_email
    object.user.email
  end

end
