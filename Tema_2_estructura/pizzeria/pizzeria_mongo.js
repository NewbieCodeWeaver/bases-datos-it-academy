// tabla clientes

db.clientes.insertMany(

    [

        {
            nombre: "andres",
            apellidos: "martinez almeida",
            direccion:
            {
                direccion: "paris 13 1-4",
                cod_postal: 08035,
                localidad: "barcelona",
                provincia: "barcelona"
            },
            telefono: 934456133
        },


        {
            nombre: "jesus",
            apellidos: "ruiz la fuente",
            direccion:
            {
                direccion: "arago 300 1-2",
                cod_postal: 08021,
                localidad: "barcelona",
                provincia: "barcelona"
            },
            telefono: 934456221
        },

        {
            nombre: "paula",
            apellidos: "garcia loreda",
            direccion:
            {
                direccion: "corcega 133 5-4",
                cod_postal: 08031,
                localidad: "barcelona",
                provincia: "barcelona"
            },
            telefono: 931153223
        }

    ]
)


// tabla comandas

db.comandas.insertMany(

    [

        {
            id_cliente: ObjectId("62aa208035a3277c48c25e4a"),
            id_tienda: ObjectId("62aa20f135a3277c48c25e4d"),
            fecha: ISODate("2022-05-18T14:10:30.000Z"),
            entrega:

            {

                tipo: "domicilio",
                empleado: "objeto_empleado",
                direccion_entrega: "corcega 133 5-4",
                hora_entrega: ISODate("2022-05-18T15:10:30.000Z")

            },

            productos:

            {

                nombre: "margarita",
                desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut in.",
                tipo_producto: "pizza",
                cat_pizza: "especial",
                imagen: "img/pizza1.jpg",
                precio: 7.25,
                cantidad: 1

            },

        },



        {
            id_cliente: ObjectId("62aa208035a3277c48c25e4b"),
            id_tienda: ObjectId("62aa20f135a3277c48c25e4d"),
            fecha: ISODate("2022-06-18T13:10:30.000Z"),
            entrega:

            {

                tipo: "restaurante",
                hora_entrega: ISODate("2022-05-18T15:10:30.000Z")

            },

            productos: [

                {

                    nombre: "hamburguesa 4 quesos",
                    desc: "Lorem ipsum dolordolor sit amet, consectetur adipiscing elit. Ut in.",
                    tipo_producto: "hamburguesa",
                    imagen: "img/hamburguesa.jpg",
                    precio: 4.25,
                    cantidad: 1

                },

                {

                    nombre: "coca cola zero",
                    desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eu",
                    tipo_producto: "bebida",
                    imagen: "img/cocacola.jpg",
                    precio: 2.25,
                    cantidad: 3

                }]

        },


        {
            id_cliente: ObjectId("62aa208035a3277c48c25e4c"),
            id_tienda: ObjectId("62aa20f135a3277c48c25e4d"),
            fecha: ISODate("2022-03-18T19:10:30.000Z"),
            entrega:

            {

                tipo: "domicilio",
                empleado: "objeto_empleado",
                direccion_entrega: "granvia 233 3-1",
                hora_entrega: ISODate("2022-03-18T20:10:30.000Z")

            },

            productos:

            {

                nombre: "diavola",
                desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut in.",
                tipo_producto: "pizza",
                cat_pizza: "normal",
                imagen: "img/pizza3.jpg",
                precio: 7.25,
                cantidad: 3

            },

        },

    ]
)



// tabla tienda

db.tiendas.insert(


    {
        direccion: "gran de gracia 23",
        codigo_postal: 08036,
        localidad: "barcelona",
        provincia: "barcelona",
        empleados: [
            {
                nombre: "paula",
                apellidos: "garcia lopez",
                nif: "39454315G",
                telefono: 657876798,
                tipo_empleado: "repartidor"

            },

            {
                nombre: "ernesto",
                apellidos: "saenz de la vega",
                nif: "29434314G",
                telefono: 645789879,
                tipo_empleado: "cocinero"

            },

            {
                nombre: "juan carlos",
                apellidos: "diaz andrade",
                nif: "19244431T",
                telefono: 675987913,
                tipo_empleado: "repartidor"

            }




        ]
    },


)