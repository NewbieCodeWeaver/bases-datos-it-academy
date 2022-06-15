// tabla gafas


db.gafas.insertMany(

    [

        { marca: "police",
          graduacion: "+2,25, -1,75, + 4,50, -0,75",
          montura: "flotante", 
          color_montura: "gris", 
          color_vidrio: "azul", 
          precio: 154.99,
          proveedor: { 

            nombre: "progafas.sl",
            direccion: "urgell 43 barcelona",
            telefono: 934465743,
            fax: 936545764,
            nif: "G29565330",
            marcas_disp: ['police', 'carrera', 'dior']}},
            
        { marca: "carolina herrera", graduacion: "+1,25, -2,75, + 4,00, -1,25", montura: "metalica", color_montura: "negra", color_vidrio: "normal", precio: 123.99},
        { marca: "ralph lauren", graduacion: "+2,25, -1,75, + 3,40, -1,75", montura: "flotante", color_montura: "roja", color_vidrio: "rojo", precio: 154.99},

    ]
)



// tabla clientes

db.clientes.insertMany(

    [

        { nombre: "andres",
          direccion: { "calle": "paris", "numero": 13, "piso": 1, "puerta": 4, "ciudad": "barcelona", "codigo_postal": 08036, "pais": "espanya" }, 
          telefono: 934586125, email: "andres23@hotmai.com",
          fecha_alta: ISODate("2020-01-22"),
          recomendado_por: ObjectId("62a9ae7d5d747f31a8acd318"),
          ventas_asociadas: { 
            gafas_id: ObjectId("62a9a99a5d747f31a8acd313"),
            fecha_venta: ISODate("2020-01-22"),
            vendedor: "miguel angel"
           }},


        { nombre: "jose", direccion: { "calle": "londres", "numero": 163, "piso": 5, "puerta": 9, "ciudad": "barcelona", "codigo_postal": 08034, "pais": "espanya" }, telefono: 934543254, email: "josegz@gmail.com", fecha_alta: ISODate("2020-05-10"), recomendado_por: "nombre_cliente" },
        { nombre: "ana gabriel", direccion: { "calle": "gran via", "numero": 1063, "piso": 9, "puerta": 2, "ciudad": "badalona", "codigo_postal": 08010, "pais": "espanya" }, telefono: 934546255, email: "anag@gmail.com", fecha_alta: ISODate("2020-05-16"), recomendado_por: "nombre_cliente"},

    ]
)


