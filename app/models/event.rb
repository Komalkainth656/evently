class Event < ApplicationRecord
    before_validation :default_price
    DEFAULT_PRICE = 0 
    def default_price
        self.price ||= DEFAULT_PRICE
      end
    validates(:title,
        presence: true,
        uniqueness: true,
      )
      belongs_to :user
      validates(:start_time,
        presence: true
      )
      has_many :tags, dependent: :destroy
  has_many :users, through: :tags
  def tag_for(user)
    tags.find_by_user_id(user)
  end
end
