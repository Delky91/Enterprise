class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relaciones
  has_one_attached :profile_picture
  has_many :jobs, dependent: :destroy
  has_many :job_applications

  # Validaciones
  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 50 }
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true
  validates :profile_picture, attached: true, content_type: ['image/jpg', 'image/gif', 'image/png', 'image/webp'],
                              size: { less_than: 50.megabytes, message: 'is too large' }

  # Roles
  enum role: { user: 'user', admin: 'admin' }
end
