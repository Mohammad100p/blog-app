class Article < ApplicationRecord
  include Visible

  has_many :comments, -> { offset(1) }, dependent: :destroy
  validates_associated :comments
  validates :title, presence: true, allow_blank: false
  validates :body, presence: true, length: { minimum: 10, too_short: " %{count} characters is the minimum allowed" }, format: { with: /\A[a-zA-Z]+\z/,
  message: "only allows letters" }
end
