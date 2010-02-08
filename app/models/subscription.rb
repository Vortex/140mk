class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :list, :counter_cache => true

  validates_uniqueness_of :user_id, :scope => :list_id
  validate :number_of_subscriptions

  private
  def number_of_subscriptions
    if user.subscriptions.length >= G140[:subscriptions_per_user]
      errors.add(:base, "Error") # we don't dispay error message it in UI
    end
  end
end
