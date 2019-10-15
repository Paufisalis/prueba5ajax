class Company < ApplicationRecord
  has_many :complaints, dependent: :destroy
end
