class OrderMailer < ActionMailer::Preview
    def order_notification
        OrderMailer.order_notification(Order.last).deliver_later
    end
  end
  