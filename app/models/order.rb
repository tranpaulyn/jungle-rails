class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  def send_emails!
      OrderMailer.order_notification(self).deliver_later
  end

end
