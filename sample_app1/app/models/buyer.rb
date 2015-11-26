class Buyer < ActiveRecord::Base
    validates :Nombre,  presence: true, length: { maximum: 50 }, uniqueness: true
    validates :Direccion,  presence: true, length: { maximum: 200 }
    validates :Telefono,  presence: true, length: { maximum: 10 }, numericality: { only_integer: true },
    numericality: {greater_than_or_equal_to: 0}
end
