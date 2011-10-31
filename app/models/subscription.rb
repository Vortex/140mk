class Subscription < ActiveRecord::Base

  # Associations
  belongs_to :user
  belongs_to :category, :counter_cache => true

  # Validations
  validates_presence_of :user_id
  validates_presence_of :category_id
  validates_uniqueness_of :user_id, :scope => :category_id
  validate :number_of_subscriptions

  private

  def number_of_subscriptions
    if user_id? && user.subscriptions.length >= G140[:subscriptions_per_user]
      errors.add(:base, "Error") # we don't dispay error message it in UI
    end
  end

end
