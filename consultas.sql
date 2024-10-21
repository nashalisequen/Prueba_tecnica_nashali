create database PRUEBA_T

Create table Empleado(
	Id_Empleado nvarchar(6) not null, 
	Nombres varchar(100) not null,
	Apellidos varchar(100) not null,
	Puesto varchar(100) not null,
	primary key (Id_Empleado)
);

Create table Centro_de_Trabajo(
	Id_CentroTrabajo nvarchar(5) not null,
	nombre_centro varchar(100) not null,
	primary key (Id_CentroTrabajo)
);

Create table Asistencia(
	Id_Asistencia nvarchar(8) not null,
	Id_Empleado nvarchar(6) not null,
	fecha_asistencia date not null,
	asistencia bit not null,
	horas_laboradas int not null,
	primary key (Id_Asistencia),
	foreign key (Id_Empleado) references Empleado
);

Create table Planificacion_mensual(
	Id_CentroTrabajo nvarchar(5) not null,
	Id_Asistencia nvarchar(8) not null,
	fecha date not null,
	Id_Empleado nvarchar(6) not null,
	Horas_planificadas int not null,
	primary key (Id_CentroTrabajo, Id_Asistencia, fecha),
	foreign key (Id_Empleado) references Empleado,
	foreign key (Id_Asistencia) references Asistencia,
	foreign key (Id_CentroTrabajo) references Centro_de_Trabajo
);

insert into Empleado (Id_Empleado, Nombres, Apellidos, Puesto) values (1, 'Ted', 'Harrop', 'Administrador de sistemas');
insert into Empleado (Id_Empleado, Nombres, Apellidos, Puesto) values (2, 'Helenka', 'Sket', 'Analista de datos');
insert into Empleado (Id_Empleado, Nombres, Apellidos, Puesto) values (3, 'Jess', 'O''Dyvoy', 'Ingeniero de software');
insert into Empleado (Id_Empleado, Nombres, Apellidos, Puesto) values (4, 'Jeanelle', 'Ingilson', 'Desarrollador web');
insert into Empleado (Id_Empleado, Nombres, Apellidos, Puesto) values (5, 'Minor', 'Upcraft', 'Desarrollador de aplicaciones móviles');
insert into Empleado (Id_Empleado, Nombres, Apellidos, Puesto) values (6, 'Anderea', 'McCue', 'Gerente de proyectos');
insert into Empleado (Id_Empleado, Nombres, Apellidos, Puesto) values (7, 'Toni', 'Demkowicz', 'Asistente administrativo');
insert into Empleado (Id_Empleado, Nombres, Apellidos, Puesto) values (8, 'Scotti', 'Lissett', 'Contador');
insert into Empleado (Id_Empleado, Nombres, Apellidos, Puesto) values (9, 'Evangelin', 'Sommers', 'Auditor');
insert into Empleado (Id_Empleado, Nombres, Apellidos, Puesto) values (10, 'Chris', 'Pyson', 'Jefe de recursos humanos');
insert into Empleado (Id_Empleado, Nombres, Apellidos, Puesto) values (11, 'Amber', 'Knight', 'Reclutador');
insert into Empleado (Id_Empleado, Nombres, Apellidos, Puesto) values (12, 'Elspeth', 'Filipchikov', 'Asistente de recursos humanos');
insert into Empleado (Id_Empleado, Nombres, Apellidos, Puesto) values (13, 'Charmaine', 'McNeish', 'Especialista en nóminas');
insert into Empleado (Id_Empleado, Nombres, Apellidos, Puesto) values (14, 'Gilli', 'Humm', 'Técnico de soporte');
insert into Empleado (Id_Empleado, Nombres, Apellidos, Puesto) values (15, 'Devan', 'Megahey', 'Ingeniero de redes');

Select * from Empleado

insert into Centro_de_Trabajo (Id_CentroTrabajo, nombre_centro) values ('051-9', 'Centro de Operaciones Norte');
insert into Centro_de_Trabajo (Id_CentroTrabajo, nombre_centro) values ('906-1', 'Planta de Producción Sur');
insert into Centro_de_Trabajo (Id_CentroTrabajo, nombre_centro) values ('661-5', 'Oficinas Corporativas');
insert into Centro_de_Trabajo (Id_CentroTrabajo, nombre_centro) values ('906-X', 'Centro de Desarrollo de Software');
insert into Centro_de_Trabajo (Id_CentroTrabajo, nombre_centro) values ('308-2', 'Centro de Logística');
insert into Centro_de_Trabajo (Id_CentroTrabajo, nombre_centro) values ('060-1', 'Almacén Central');
insert into Centro_de_Trabajo (Id_CentroTrabajo, nombre_centro) values ('660-2', 'Laboratorio de Innovación');
insert into Centro_de_Trabajo (Id_CentroTrabajo, nombre_centro) values ('940-7', 'Centro de Atención al Cliente');
insert into Centro_de_Trabajo (Id_CentroTrabajo, nombre_centro) values ('520-X', 'Oficinas Regionales del Bajío');
insert into Centro_de_Trabajo (Id_CentroTrabajo, nombre_centro) values ('169-6', 'Centro de Capacitación');

select * from Centro_de_Trabajo order by nombre_centro asc

insert into Asistencia (Id_Asistencia, Id_Empleado, fecha_asistencia, asistencia, horas_laboradas) values ('ZBAD', 1, '2023-03-09', 1, 14);
insert into Asistencia (Id_Asistencia, Id_Empleado, fecha_asistencia, asistencia, horas_laboradas) values ('SSBR', 2, '2023-03-12', 1, 9);
insert into Asistencia (Id_Asistencia, Id_Empleado, fecha_asistencia, asistencia, horas_laboradas) values ('ZUDX', 15, '2023-07-29', 1, 8);
insert into Asistencia (Id_Asistencia, Id_Empleado, fecha_asistencia, asistencia, horas_laboradas) values ('NTTX', 10, '2023-09-16', 0, 8);
insert into Asistencia (Id_Asistencia, Id_Empleado, fecha_asistencia, asistencia, horas_laboradas) values ('WAJA', 3, '2024-04-11', 1, 7);
insert into Asistencia (Id_Asistencia, Id_Empleado, fecha_asistencia, asistencia, horas_laboradas) values ('SBJU', 3, '2023-01-01', 1,8);
insert into Asistencia (Id_Asistencia, Id_Empleado, fecha_asistencia, asistencia, horas_laboradas) values ('HAMR', 5, '2023-09-17', 1, 8);
insert into Asistencia (Id_Asistencia, Id_Empleado, fecha_asistencia, asistencia, horas_laboradas) values ('SKBQ', 1, '2024-02-19', 0, 7);
insert into Asistencia (Id_Asistencia, Id_Empleado, fecha_asistencia, asistencia, horas_laboradas) values ('CZJG', 11, '2023-10-15', 0, 6);
insert into Asistencia (Id_Asistencia, Id_Empleado, fecha_asistencia, asistencia, horas_laboradas) values ('OAUZ', 12, '2023-12-22', 0, 8);
insert into Asistencia (Id_Asistencia, Id_Empleado, fecha_asistencia, asistencia, horas_laboradas) values ('AK49', 11, '2023-08-05', 1, 9);
insert into Asistencia (Id_Asistencia, Id_Empleado, fecha_asistencia, asistencia, horas_laboradas) values ('YDLV', 13, '2023-02-20', 0, 6);
insert into Asistencia (Id_Asistencia, Id_Empleado, fecha_asistencia, asistencia, horas_laboradas) values ('EPLB', 13, '2023-10-02', 1, 9);
insert into Asistencia (Id_Asistencia, Id_Empleado, fecha_asistencia, asistencia, horas_laboradas) values ('SGES', 8, '2024-01-23', 0, 11);
insert into Asistencia (Id_Asistencia, Id_Empleado, fecha_asistencia, asistencia, horas_laboradas) values ('SDLP', 2, '2023-02-23', 0, 8);

select * from Asistencia

insert into Planificacion_mensual (Id_CentroTrabajo, Id_Asistencia, fecha, Id_Empleado, Horas_planificadas) values ('051-9', 'AK49', '2024-01-20', 3, 8);
insert into Planificacion_mensual (Id_CentroTrabajo, Id_Asistencia, fecha, Id_Empleado, Horas_planificadas) values ('940-7', 'EPLB', '2023-05-16', 12, 8);
insert into Planificacion_mensual (Id_CentroTrabajo, Id_Asistencia, fecha, Id_Empleado, Horas_planificadas) values ('660-2', 'OAUZ', '2024-04-03', 13, 8);
insert into Planificacion_mensual (Id_CentroTrabajo, Id_Asistencia, fecha, Id_Empleado, Horas_planificadas) values ('906-X', 'CZJG', '2023-04-05', 9, 8);
insert into Planificacion_mensual (Id_CentroTrabajo, Id_Asistencia, fecha, Id_Empleado, Horas_planificadas) values ('060-1', 'NTTX', '2023-08-09', 7, 8);
insert into Planificacion_mensual (Id_CentroTrabajo, Id_Asistencia, fecha, Id_Empleado, Horas_planificadas) values ('051-9', 'SGES', '2023-05-12', 4, 8);
insert into Planificacion_mensual (Id_CentroTrabajo, Id_Asistencia, fecha, Id_Empleado, Horas_planificadas) values ('051-9', 'SGES', '2024-06-26', 7, 8);
insert into Planificacion_mensual (Id_CentroTrabajo, Id_Asistencia, fecha, Id_Empleado, Horas_planificadas) values ('169-6', 'SKBQ', '2024-05-18', 8, 8);
insert into Planificacion_mensual (Id_CentroTrabajo, Id_Asistencia, fecha, Id_Empleado, Horas_planificadas) values ('906-1', 'AK49', '2023-01-02', 14, 8);
insert into Planificacion_mensual (Id_CentroTrabajo, Id_Asistencia, fecha, Id_Empleado, Horas_planificadas) values ('660-2', 'EPLB', '2024-02-24', 1, 8);
insert into Planificacion_mensual (Id_CentroTrabajo, Id_Asistencia, fecha, Id_Empleado, Horas_planificadas) values ('520-X', 'NTTX', '2024-07-22', 6, 8);
insert into Planificacion_mensual (Id_CentroTrabajo, Id_Asistencia, fecha, Id_Empleado, Horas_planificadas) values ('906-X', 'HAMR', '2024-06-03', 5, 8);
insert into Planificacion_mensual (Id_CentroTrabajo, Id_Asistencia, fecha, Id_Empleado, Horas_planificadas) values ('906-1', 'SDLP', '2024-06-15', 8, 8);
insert into Planificacion_mensual (Id_CentroTrabajo, Id_Asistencia, fecha, Id_Empleado, Horas_planificadas) values ('940-7', 'SDLP', '2023-04-09', 15, 8);
insert into Planificacion_mensual (Id_CentroTrabajo, Id_Asistencia, fecha, Id_Empleado, Horas_planificadas) values ('308-2', 'HAMR', '2024-07-30', 12, 8);
insert into Planificacion_mensual (Id_CentroTrabajo, Id_Asistencia, fecha, Id_Empleado, Horas_planificadas) values ('169-6', 'OAUZ', '2024-05-07', 11, 8);
insert into Planificacion_mensual (Id_CentroTrabajo, Id_Asistencia, fecha, Id_Empleado, Horas_planificadas) values ('308-2', 'SBJU', '2023-03-23', 9, 8);
insert into Planificacion_mensual (Id_CentroTrabajo, Id_Asistencia, fecha, Id_Empleado, Horas_planificadas) values ('060-1', 'SBJU', '2024-09-24', 10, 8);
insert into Planificacion_mensual (Id_CentroTrabajo, Id_Asistencia, fecha, Id_Empleado, Horas_planificadas) values ('520-X', 'CZJG', '2023-12-06', 2, 8);
insert into Planificacion_mensual (Id_CentroTrabajo, Id_Asistencia, fecha, Id_Empleado, Horas_planificadas) values ('051-9', 'AK49', '2023-10-04', 14, 8);

Select * from Planificacion_mensual
