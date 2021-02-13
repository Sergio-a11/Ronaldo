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


#inserción de datos de prueba
insert into materia_prima values ("301",10,"lino","lila");

select * from materia_prima;

insert into inve_mp (id_mp, cantidad) values (302,12);

select * from inve_mp;


