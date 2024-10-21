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

--Consulta: Centro de trabajo de mayor horas laboradas 
select top 1 nombre_centro,pm.Id_CentroTrabajo,SUM(horas_laboradas) as total_de_horas_laboradas from 
Centro_de_Trabajo as ct inner join Planificacion_mensual as pm on ct.Id_CentroTrabajo = pm.Id_CentroTrabajo
inner join Asistencia as a on a.Id_Asistencia = pm.Id_Asistencia
where MONTH(fecha_asistencia) = Month(GETDATE())
group by nombre_centro,pm.Id_CentroTrabajo
order by total_de_horas_laboradas desc 

--Consultas: empleado con mayor cantidad de inasistencias
select nombre_centro, CONCAT(Nombres,' ',Apellidos) as Colaborador, COUNT(asistencia) as inasistencias from Planificacion_mensual as pm 
inner join Asistencia as a on pm.Id_Asistencia = a.Id_Asistencia
inner join Centro_de_Trabajo as ct on ct.Id_CentroTrabajo = pm.Id_CentroTrabajo inner join Empleado as e on pm.Id_Empleado = e.Id_Empleado
where MONTH(fecha_asistencia) = Month(GETDATE()) and YEAR(fecha_asistencia) = YEAR(getdate()) and asistencia = 0
Group by nombre_centro, CONCAT(Nombres,' ',Apellidos)

--Consulta: Horas extras del empleado
select nombres, sum(horas_laboradas-Horas_planificadas) as Horas_Extras from Empleado as e inner join Asistencia as a on e.Id_Empleado = a.Id_Empleado
inner join Planificacion_mensual as pm on a.Id_Asistencia = pm.Id_Asistencia
where MONTH(fecha_asistencia) = Month(GETDATE()) and horas_laboradas >= 8 and YEAR(fecha_asistencia) = YEAR(getdate())
group by nombres

