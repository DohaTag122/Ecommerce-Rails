class Brand < ApplicationRecord
    validates :name, :presence => true, :uniqueness => true
    before_create :brand_name
    has_many :products, dependent: :destroy

    def self.get_by_name(brand_name)
        brand_name = brand_name.capitalize
        Brand.where(:name => brand_name).limit(1)[0]
    end

    def self.get_brands_names
        names = []
        Brand.all.each do |brand|
            names.append brand.name
        end
        names
    end

    private
        def brand_name
            self.name = self.name.upcase
        end

end
