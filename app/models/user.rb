class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true,
    format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    has_many :tags, dependent: :destroy
    has_many :taged_events, through: :tags, source: :event
    def full_name
        "#{first_name} #{last_name}"
      end
     
end
