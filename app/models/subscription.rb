class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :event, presence: true

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/, unless: -> { user.present? }

  validate :subscriber_cannot_be_event_owner
  validate :email_is_already_taken_by_registrated_user, unless: -> { user.present? }

  validates :user, uniqueness: {scope: :event_id}, if: -> { user.present? }
  validates :user_email, uniqueness: {scope: :event_id}, unless: -> { user.present? }

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  def subscriber_cannot_be_event_owner
    errors.add(:user, :subscriber_cannot_be_event_owner) if event.user == user
  end

  def email_is_already_taken_by_registrated_user
    errors.add(:event, :email_was_already_taken_by_some_registrated_user) if User.exists?(email: user_email)
  end
end
