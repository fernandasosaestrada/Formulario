drop database if exists Formulario;
create database Formulario; 
use Formulario;

create table Cliente (
Id_Usuario int(5) not null primary key,
Nombre varchar(120) not null default 'Nombre',
ApellidoPaterno varchar(120) not null default 'ApellidoP',
ApellidoMaterno varchar(120) not null default 'ApellidoM',
Escuela varchar(120) not null default 'Escuela',
Genero int(10) not null default '1'
);



drop procedure if exists spGuardaCliente;

delimiter **

create procedure spGuardaCliente(in UsuId int, in nom nvarchar(120), in apep nvarchar(120), in apem nvarchar(120), in esc nvarchar(120), in gene int(10))

begin

declare idusu int;

declare msj nvarchar(200);  

declare existe int;

set idusu = 0;

if UsuId = 0 then
 


set existe = (select count(*) from Cliente where Nombre = nom and apep = ApellidoPaterno);


	
	if(existe = 0) then 

		set idusu = (select ifnull(max(Id_Usuario), 0) + 1 from Cliente);
 
    		insert into Cliente (Id_Usuario, Nombre, ApellidoPaterno, ApellidoMaterno, Escuela, Genero)

					values(idusu, nom, apep, apem, esc, gene);
	

	set msj = 'Cliente guardado con exito'; 
else 
			
	set msj = 'No ha sido posible registrar al usuario';

	end if;
else

set idusu = UsuId;


	if((select count(*) from Cliente where Nombre = nom and ApellidoPaterno = apep) = 1) then

	set msj =  'Usuario Actualizado';
 
       
 update Cliente set Nombre = nom , ApellidoPaterno = apep where Id_Usuario = UsuId;
       
 else

		set msj =  'Este Usuario no existe o no ha sido registrado';
 
   end if;

end if;

end; ** 

delimiter ;





drop procedure if exists spValidaUsuario;
delimiter **
create procedure spValidaUsuario(in nom nvarchar(200), in apep nvarchar(60))
begin
declare existe int;
declare msj nvarchar(200);
declare idusu int;


set existe = (select count(*) from Cliente where Nombre = nom and ApellidoPaterno =apep);

if (existe = 1) then

	set msj = 'Este usuario se encuentra registrado';
	select Id_Usuario as idusu, concat(Nombre, ' ', ApellidoPaterno) NombreC, msj from Cliente where Nombre = nom and ApellidoPaterno = apep;

else
	set msj = 'Este usuario no existe';
	
    select msj;

end if;

end; **
delimiter ;



drop procedure if exists spDatosPersona;
delimiter $$
create procedure spDatosPersona(in idper int)
begin

	select *, concat(Nombre, ' ', ApellidoPaterno) as NombreC, Nombre as nom, ApellidoPaterno as app, ApellidoMaterno as apm, Escuela as esc, Genero as gen from Cliente where Id_Usuario  = idper;

end; $$
delimiter ;

insert into Cliente values (1, 'F', 'F', 'F', 'cecyt9', '1');

select * from Cliente;