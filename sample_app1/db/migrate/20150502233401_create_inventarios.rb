class CreateInventarios < ActiveRecord::Migration
  def change
    create_table :inventarios do |t|
      t.string :Nombre
      t.integer :Cantidad
      t.string :Descripcion
      t.float :Preciounit, :precision => 2

      t.timestamps null: false
    end
  end
end
