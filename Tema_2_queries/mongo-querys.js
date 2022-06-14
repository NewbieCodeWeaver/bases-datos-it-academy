// 1. Escriu una consulta per mostrar tots els documents en la col·lecció Restaurants.

db.restaurante.find({})

// 2. Escriu una consulta per mostrar el restaurant_id, name, borough i cuisine per tots els documents en la col·lecció Restaurants.

db.restaurante.find({}, {restaurant_id: 1 , name: 1 , borough: 1 , cuisine: 1})

// 3 Escriu una consulta per mostrar restaurant_id, name, borough i zip code, però exclou el camp _id per tots els documents en la col·lecció Restaurants.

db.restaurante.find({}, {restaurant_id: 1 , name: 1 , borough: 1 , zip_code: 1, _id:0  })

// 4. Escriu una consulta per mostrar el restaurant_id, name, borough i cuisine, però exclou el camp _id per tots els documents en la col·lecció Restaurants.

db.restaurante.find({}, {restaurant_id: 1 , name: 1 , borough: 1 , cuisine: 1, _id:0  })

// 5. Escriu una consulta per mostrar tots els restaurants que estan en el Bronx.

db.restaurante.find({borough: "Bronx" })

// 6. Escriu una consulta per mostrar els primers 5 restaurants que estan en el Bronx.

db.restaurante.find({borough: "Bronx" }).limit(5)

// 7. Escriu una consulta per mostrar el pròxim 5 restaurants després de saltar els primers 5 del Bronx.

db.restaurante.find({borough: "Bronx" }).limit(5).skip(5)

// 8. Escriu una consulta per trobar els restaurants que tenen algun score més gran de 90
 
db.restaurante.find({'grades.score': { $gt: 90 } }) 
 
db.restaurante.find({grades : { $elemMatch:{"score":{ $gt : 90 }}}}); // usando $elemMatch

// 9.Escriu una consulta per trobar els restaurants que tenen un score de més de 80 però menys que 100.

db.restaurante.find({'grades.score': { $gt: 80, $lt:100 } })

// 10. Escriu una consulta per trobar els restaurants que es localitzen en valor de latitud menys de -95.754168.

db.restaurante.find({ 'address.coord': { $lt: -95.754168 } })

// 11. Escriu una consulta de MongoDB per a trobar els restaurants que no preparen cap cuisine de 'American' i la seva qualificació és superior a 70 i latitud inferior a -65.754168.

db.restaurante.find({$and:[{ cuisine: {$ne:"American "}, 'grades.score':{$gt:70}, 'address.coord':{$lt: -65.754168 } }]})

// 12. Escriu una consulta per trobar els restaurants que no preparen cap cuisine de 'American' i van aconseguir un marcador més de 70 i localitzat en la longitud menys que -65.754168. Nota: Fes aquesta consulta sense utilitzar $and operador. 

db.restaurante.find({ cuisine : {$ne : "American "}, 'grades.score' :{$gt: 70},'address.coord' : {$lt : -65.754168}});

// 13. Escriu una consulta  per trobar els restaurants que no preparen menjar  'American ', tenen alguna nota 'A' i no pertanyen a Brooklyn. S'ha de mostrar el document segons la cuisine en ordre descendent

db.restaurante.find({ cuisine: { $ne:"American "}, 'grades.grade':{ $ne:"A"},  'borough':{ $ne:"Brooklyn"} }).sort( { cuisine: -1 } )

// 14. Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que contenen 'Wil' com les tres primeres lletres en el seu nom.

db.restaurante.find({name: /^Wil/}, {restaurant_id : 1,name:1,borough:1, cuisine :1 });

// 15. Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que contenen 'ces' com les últimes tres lletres en el seu nom.

db.restaurante.find({name: /ces$/},{restaurant_id : 1,name:1,borough:1,cuisine :1});

// 16. Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que contenen 'Reg' com tres lletres en algun lloc en el seu nom.

db.restaurante.find({name: /Reg/},{restaurant_id:1,name: 1, borough:1,})

// 17. Escriu una consulta per trobar els restaurants que pertanyen al Bronx i van preparar qualsevol plat americà o xinès.

db.restaurante.find({borough: "Bronx" , $or: [ {cuisine:"American "}, {cuisine:"Chinese"}]})

// 18. Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que pertanyen a Staten Island o Queens o Bronx o Brooklyn.

db.restaurante.find({"borough" :{$in :["Staten Island","Queens","Bronx","Brooklyn"]}},{restaurant_id : 1,name:1,borough:1 ,cuisine  :1});

// 19. Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que no pertanyen a Staten Island o Queens o Bronx o Brooklyn.

db.restaurante.find({"borough" :{$nin :["Staten Island","Queens","Bronx","Brooklyn"]}},{restaurant_id : 1,name:1,borough:1 ,cuisine  :1});

// 20. Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que aconsegueixin un marcador que no és més de 10.

db.restaurante.find({}, {restaurant_id: 1 , name: 1 , borough: 1 , cuisine: 1, 'grades.score': { $lt: 10 }})

// 21. Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que preparen peix excepte 'American' i 'Chinees' o el name del restaurant comença amb lletres 'Wil'.

db.restaurante.find({}, {restaurant_id: 1 , name: 1 , borough: 1 , cuisine: {$or: [ { $ne:"American" }, { $ne:"Chinesa" }]}})

// 22. Escriu una consulta per trobar el restaurant_id, name, i grades per a aquells restaurants que aconsegueixin un grau "A" i un score 11 en dades d'estudi ISODate "2014-08-11T00:00:00Z".

db.restaurante.find({}, {restaurant_id: 1 , name: 1 , 'grades.grade': { $eq: "A" }, 'grades.score': { $eq: 11 }, 'grades.date': { $eq: "2014-08-11T00:00:00Z" }})

// 23. Escriu una consulta per trobar el restaurant_id, name i grades per a aquells restaurants on el 2n element de varietat de graus conté un grau de "A" i marcador 9 sobre un ISODate "2014-08-11T00:00:00Z".

// *************

// 24. Escriu una consulta per trobar el restaurant_id, name, adreça i ubicació geogràfica per a aquells restaurants on el segon element del array coord conté un valor que és més de 42 i fins a 52.

// *************

// 25. Escriu una consulta per organitzar el nom dels restaurants en ordre ascendent juntament amb totes les columnes.

db.restaurante.find({}).sort( { name: 1 } )

// 26. Escriu una consulta per organitzar el nom dels restaurants en ordre descendent juntament amb totes les columnes.

db.restaurante.find({}).sort( { name: -1 } )

// 27. Escriu una consulta per organitzar el nom de la cuisine en ordre ascendent i pel mateix barri de cuisine. Ordre descendent.

// *************

// 28. Escriu una consulta per saber tant si totes les direccions contenen el carrer o no.

db.records.find( { address: { $exists: true } } )

// 29. Escriu una consulta que seleccionarà tots els documents en la col·lecció de restaurants on el valor del camp coord és Double.

db.restaurante.find({'address.coord' :{$type : 1}});

// 30. Escriu una consulta que seleccionarà el restaurant_id, name i grade per a aquells restaurants que retornin 0 com a resta després de dividir el marcador per 7.

db.restaurante.find( {'grades.score' :{$mod : [7,0]}},{"restaurant_id" : 1,"name":1,"grades":1});

// 31. Escriu una consulta per trobar el name de restaurant, borough, longitud i altitud i cuisine per a aquells restaurants que contenen 'mon' com tres lletres en algun lloc del seu nom.

db.restaurante.find( { name : { $regex :/Reg/ }  }, {name:1, "borough":1,"address.coord":1,"cuisine" :1});

// 32. Escriu una consulta per trobar el name de restaurant, borough, longitud i latitud i cuisine per a aquells restaurants que contenen 'Mad' com primeres tres lletres del seu nom.

db.restaurante.find({ name : { $regex : /^Mad/ } },{name: 1,borough:1,'address.coord':1, cuisine :1});