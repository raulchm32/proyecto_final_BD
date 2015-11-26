User.create!(name:  "Example User",
             email: "admin@railsbases.org",
             password:              "123456",
             password_confirmation: "123456", admin: true)
             
Inventario.create!(Nombre: "Maxforce",
                   Cantidad: 20,
                   Descripcion: "Para Cucarachas",
                   Preciounit: 421)
                   
Inventario.create!(Nombre: "Racum",
                   Cantidad: 20,
                   Descripcion: "En Pasta",
                   Preciounit: 350)
                   
Inventario.create!(Nombre: "Mitroxsur",
                   Cantidad: 20,
                   Descripcion: "En Polvo",
                   Preciounit: 450)
                   
Buyer.create!(Nombre: "Chili's",
                   Direccion: "Tamaulipas #45",
                   Telefono: 55555555)
                   
Buyer.create!(Nombre: "Samborns",
                   Direccion: 20,
                   Telefono: 55555555)
                
Order.create!(subtotal: 0,
                tax: 0,
                shipping: 0,
                total: 0)
