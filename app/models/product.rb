class Product < ApplicationRecord
  belongs_to :category
  has_rich_text :description
  has_many_attached :images

  enum sex:   %i[male female other]
  enum size:  %i[xxs xs s m l xl xxl]
  enum color: %i[black white grey red orange blue violet green sky]

  enum brand: {
                PM: 'Puma',
                AD: 'Adidas',
                NB: 'New Balance',
                NK: 'Calvin Klein',
                LV: 'Levi`s'
              }
  # BRAND_LIST = brand.values

  enum type: { JN: 'Jeans',
               TS: 'T-shirt',
               SN: 'Sneakers',
               BT: 'Boots',
               FL: 'Flats',
               SD: 'Sandals',
               CL: 'Clogs',
               SH: 'Shoes'
             }

  validates :name, presence: true, length: { maximum: 150 }
  validates :sku, length: { maximum: 12 }
  validates :discount, inclusion: { in: 0...100 }
  validates :description, presence: true
  validates :brand, inclusion: { in: brands.stringify_keys.keys,
                                  message: 'not included in a specific list!' }
  validates :product_type, inclusion: { in: types.stringify_keys.keys,
                                  message: 'not included in a specific list!' }
  validates :sex, inclusion: { in: sexes.stringify_keys.keys,
                                  message: 'not included in a specific list!' }
  validates :size, inclusion: { in: sizes.stringify_keys.keys,
                                  message: 'not included in a specific list!' }
  validates :color, inclusion: { in: colors.stringify_keys.keys,
                                  message: 'not included in a specific list!' }

  after_create_commit :generate_sku

  def generate_sku
    sku_id = format('%04d', self.id)
    size  = Product::sizes[self.size]
    color = Product::colors[self.color]
    sku = "#{brand}#{product_type}-#{sku_id}-#{size}#{color}"

    self.update(sku: sku)
  end
end
