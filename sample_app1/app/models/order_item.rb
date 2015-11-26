class OrderItem < ActiveRecord::Base
  belongs_to :inventario
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :inventario_present
  validate :order_present
  validates :inventario, uniqueness: true
  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      inventario.Preciounit
    end
  end

  def total_price
    unit_price * quantity
  end

private
  def inventario_present
    if inventario.nil?
      errors.add(:inventario, "no es valido o no esta activo.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "no es valida la orden.")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end