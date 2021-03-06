class PaymentType < ActiveRecord::Base
  attr_accessible :name

  has_many :orders, dependent: :destroy
  validates_presence_of :name
end
