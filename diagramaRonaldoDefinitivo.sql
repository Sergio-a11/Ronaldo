#REALIZADO EN MYSQL
#Código SQL proyecto BD - Empresa textil ronald
#Sergio Andrés Cruz Guerrero 20192578014
#Daniel Mauricio Torres Martinez 20192578005

#base de datos
CREATE database ronald;

#seleccion de la base de datos a trabajar
use ronald;

#tabla Materia Prima
CREATE TABLE materia_prima(
	id_mp varchar(3) primary key,
    tamaño int not null,
    tipo_tela varchar(30) null,
    color varchar(15) null
);

#tabla producto
CREATE TABLE producto(
	id_p varchar(3) primary key,
    prenda varchar(40) not null,
    genero varchar(7) not null,
    precio decimal(11,2) not null,
    color varchar(15) null
);

#tabla cliente
CREATE TABLE cliente(
	id_c varchar(4) primary key,
    nombre varchar(70) not null,
    telefono varchar(15) null,
    direccion varchar(256) not null
);

#tabla proveedor
CREATE TABLE proveedor(
	id_proveedor varchar(4) primary key,
    nombre varchar(70) not null,
    telefono varchar(15) null,
    direccion varchar(256) not null
);

#tabla cargo
CREATE TABLE cargo(
	id_cargo int auto_increment primary key,
    tipo_cargo varchar(20) not null
);

#tabla empleado
CREATE TABLE empleado(
	id_empleado varchar(4) primary key,
    nombre varchar(70) not null,
    telefono varchar(15) null,
    direccion varchar(256) not null,
    id_cargo int not null,
    foreign key (id_cargo) references cargo(id_cargo)
);

#tabla corte
CREATE TABLE corte(
	id_corte varchar(3) primary key,
    id_empleado varchar(4) not null,
    id_mp varchar(3) not null,
    foreign key (id_empleado) references empleado(id_empleado),
    foreign key (id_mp) references materia_prima(id_mp)
);

#tabla compra
CREATE TABLE compra(
	id_compra int auto_increment primary key,
    id_mp varchar(3) not null,
    id_proveedor varchar(4) not null,
    fecha date,
    precio decimal(11,2) not null,
    cantidad int not null,
    detalles text null,
    foreign key (id_mp) references materia_prima(id_mp),
    foreign key (id_proveedor) references proveedor(id_proveedor)
);

#tabla venta
CREATE TABLE venta(
	id_venta int auto_increment primary key,
    id_empleado varchar(4) not null,
    id_cliente varchar(4) not null,
    id_producto varchar(3) not null,
    cantidad int not null,
    fecha date,
    detalles varchar(256) null,
    talla varchar(4) not null,
    foreign key (id_cliente) references cliente(id_c),
    foreign key (id_empleado) references empleado(id_empleado),
    foreign key (id_producto) references producto(id_p)
);

#tabla inventario materia_prima
CREATE TABLE inve_mp(
	id_inventario int auto_increment primary key,
	id_mp varchar(3) not null,
    cantidad int not null,
    foreign key (id_mp) references materia_prima(id_mp)
);

#tabla inventario corte
CREATE TABLE inve_corte(
	id_inventario int auto_increment primary key,
	id_corte varchar(3) not null,
    cantidad int not null,
    foreign key (id_corte) references corte(id_corte)
);

#tabla inventario producto
CREATE TABLE inve_producto(
	id_inventario int auto_increment primary key,
	id_producto varchar(3) not null,
    cantidad int not null,
    foreign key (id_producto) references producto(id_p)
);


#inserción de datos
insert into cargo (tipo_cargo) values ("Gerente"),("Supervisor"),("Operario"),("Satelite"),("Vendedor");

insert into empleado values ("1001","Ramon Fernandez", "3112111111", "Soacha, Cra 1. #12-21", 3),
							("1002","Flora Martinez", "3122121212", "Bogotá, Bosa, Calle 3 #46-07", 1),
                            ("1003","Camilo Betancour", "3203212223", "Zipaquira, Km5, Calle 176, #03-12", 4),
                            ("1004","Erika Martinez", "3143561387", "Bogotá, Bosa, Calle 3 #46-07", 5),
                            ("1005","Sebastian Ramos", "3128976541", "Bogotá, Suba, Av. 5, Calle 145, C3", 4);
                            
select * from empleado;

insert into cliente values ("4001","Pablo Benitez", "3121562498", "Medellin, Av. 6, Calle 31, S5"),
							("4002","Pedro Fernandez", "3566548998", "Bogota, Av 68, Calle 56, C6"),
                            ("4003","Paloma Martinez", "3264562233", "Bogota, Av 67, Calle 57, G88"),
                            ("4004","Patricia Aldana", "3188956621", "Valledupar, Av 99, Calle 32, J6"),
                            ("4005","Prudencia Pancracia", "3655986452", "Soacha, Av 56, Calle 33, B89"); 

select * from cliente;                            

insert into proveedor values ("3001","Armando Mendoza", "3216568979", "Barranquilla, Av 56, Calle 16, L6"),
							("3002","Beatriz Pinzon ", "3876541928", "Valledupar, Av 79, Calle 34, B66"),
                            ("3003","Jose Celestino", "3152963458", "Bogota, Av 65, Calle 42, G3"),
                            ("3004","Jorge Pedraza", "3256489952", "Soacha, Av 34, Calle 29, S6"),
                            ("3005","Selena Pancracia", "3756254899", "Medellin, Av 85, Calle 17, A2");
                            
select * from proveedor;  

insert into materia_prima values ("301",10,"Seda","Blanco"),
								 ("302",16,"Lino","Lila"),
                                 ("303",20,"Licra","Negro"),
                                 ("304",5,"Cuero","Negro"),
                                 ("305",30,"Lana","Roja");
select * from materia_prima;  

insert into corte values ("401",1003,301),
						 ("402",1003,303),
						 ("403",1005,305),
						 ("404",1003,304),
						 ("405",1005,302);

select * from corte; 

insert into producto values ("201","Pantalon Jean con Rotos","Hombre",30000,"Azul"),
							("202","Pantalon Jean con Rotos","Mujer",34000,"Azul"),
                            ("203","Ropa Interior","Mujer",21500,"Azul"),
                            ("204","Camisa","Hombre",56000,"Morado"),
                            ("205","Blusa","Mujer",25000,"Verde Deportivo");      
                            
select * from producto;

insert into inve_mp (id_mp, cantidad)values(301, 45),(302, 12),(303, 20),(304, 25),(305, 1);
select * from inve_mp;
insert into inve_corte (id_corte, cantidad)values(401, 22),(402, 8),(403, 41),(404, 3),(405, 18);
select * from inve_corte;
insert into inve_producto (id_producto, cantidad)values(201, 22),(202, 8),(203, 41),(204, 3),(205, 18);
select * from inve_producto;

insert into venta (id_empleado,id_cliente,id_producto,cantidad ,fecha,detalles ,talla)  values (1004,4002,202,4,'2020-12-24',"Cliente Feliz","32"),
																							   (1004,4003,203,6,'2021-01-21',"Cliente Feliz","12"),
                                                                                               (1004,4005,204,3,'2020-12-28',"Cliente Feliz","S"),
                                                                                               (1004,4001,204,2,'2020-12-24',"Cliente Feliz","L"),
                                                                                               (1004,4005,205,5,'2020-12-30',"Cliente Feliz","XL");
select * from venta;

insert into compra (id_mp,id_proveedor,fecha,precio,cantidad,detalles) values (302,3001,'2020-10-20',300000,2,"Se compran dos rollos de lino"),
																			  (304,3003,'2020-10-23',250000,3,"Se compran cuatro rollos de cuero"),
                                                                              (303,3005,'2020-09-28',450000,4,"Se compran cuatro rollos de licra"),
                                                                              (305,3002,'2020-09-03',500000,3,"Se compran tres rollos de lana"),
                                                                              (301,3004,'2020-10-23',350000,2,"Se compran dos rollos de seda");
select * from compra; 


#Consulta de restriccion de funciones
#Obtener la suma del tamaño de la materia prima en forma de extensión en la tela cuyo color es negro:
select SUM(tamaño) as "extension" from (materia_prima) where color='Negro';

#Obtener el promedio de las ganancias de las ventas
select AVG( cantidad*precio) as "Promedio ventas" from producto, venta where id_p=id_producto;

#Obtener el id producto del producto menos vendido
#select MIN(cantidad), id_producto from venta;

#Obtener la tela de mayor tamaño
select MAX(tamaño) from materia_prima;

#Obtener los productos cuyos precios son mayores o igual 30000
select COUNT(*) from producto where precio>=30000;

#Actulizar la cantidad de productos en su inventario, id=203 (-10)
update inve_producto set cantidad = cantidad-10 where id_producto='203';
select * from inve_producto;



#Actualizar el tipo de la tela a 'Algodón' id='302'
update materia_prima set tipo_tela = 'Algodón' where id_mp='302';
select * from materia_prima;

#Actualizar los datos de la compra, precio, cantidad, detalles cuyo ID_mp = '302'
update compra set precio = '48000', cantidad = '6', detalles = 'Se compran seis rollos de algodón' where id_mp = '302';
select * from compra;

#Actualizar los datos del cliente con id = '4005'
update cliente set nombre = 'Calamardo Tentaculos', telefono = '3214127888', direccion = 'Cundinamarca Soacha Unisur Isla 3' where id_c = '4005';
select * from cliente;

#Actualizar el empleado que trabajo el corte id = '401'
update corte set id_empleado = '1005' where id_corte = '401';
select * from corte; 

#Eliminar las ventas realizadas el 24 de dicembre del 2020
delete from venta where fecha = '2020-12-24';
select * from venta;

#Eliminar las unidades del inventario de materias primas menores a 10
delete from inve_mp where cantidad < 10;

#Eliminar las unidades del inventario de materias primas con tela de color blanco
delete from inve_mp where id_mp = (select id_mp from materia_prima where color = 'Blanco');
select * from inve_mp;

#Eliminar las ventas del producto 'Blusa'
delete from venta where id_producto = (select id_p from producto where prenda = 'Blusa');
select * from venta;

#Eliminar el producto 'Blusa' de inventarios y de la lista de producto de la empresa
delete from inve_producto where id_producto = (select id_p from producto where prenda = 'Blusa');
select * from inve_producto;
delete from producto where prenda = 'Blusa';
select * from producto;