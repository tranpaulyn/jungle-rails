# Jungle

A mini e-commerce application built with Rails 4.2. This app uses Rail's ActionMailer to send customers receipts. Admins have secure access to add products and categories.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Get Started

To get started, clone and fork the repository. Run `bundle install`.  Run `bin/rails s -b 0.0.0.0` to start the server. 

The ActionMailer is currently setup using <https://ethereal.email> To see the emailed receipt, log in to ehereal.email with the credentials in `config/environments/development.rb`

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
