class Inventario < ActiveRecord::Base
    has_many :order_items, dependent: :destroy
    validates :Nombre,  presence: true, length: { maximum: 50 }, uniqueness: true
    validates :Cantidad,  presence: true, length: { maximum: 10 }, numericality: { only_integer: true}, 
    numericality: {greater_than_or_equal_to: 0}
    validates :Descripcion,  presence: true, length: { maximum: 200 }
    validates :Preciounit,  presence: true, length: { maximum: 10 }, numericality: true,
    numericality: {greater_than_or_equal_to: 1}

end
