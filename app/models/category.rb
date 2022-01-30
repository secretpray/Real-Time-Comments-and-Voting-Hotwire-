class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  enum type: %i[SHOES CLOTHING BAGS ACCESSORIES WOMEN'S MEN'S KIDS CLEARANCE BRANDS]

  validates :name, presence: true, inclusion: { in: types.stringify_keys.keys,
                                   message: 'not included in a specific list!' }
end
