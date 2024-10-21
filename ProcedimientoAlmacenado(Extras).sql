use PRUEBA_T
go

alter procedure ObtenercentroconmayorHorasLaboradas (@mes int, @anio int)
as 
begin
select top 1 nombre_centro,SUM(horas_laboradas) as total_de_horas_laboradas from 
Centro_de_Trabajo as ct inner join Planificacion_mensual as pm on ct.Id_CentroTrabajo = pm.Id_CentroTrabajo
inner join Asistencia as a on a.Id_Asistencia = pm.Id_Asistencia
where MONTH(fecha_asistencia) = @mes and  YEAR(fecha_asistencia) = @anio
group by nombre_centro
order by total_de_horas_laboradas desc 
end
go
exec ObtenercentroconmayorHorasLaboradas 8,2023
go

Create procedure Inasistencias_Empleado (@mes int, @anio int)
as 
begin
select top 1 nombre_centro, CONCAT(Nombres,' ',Apellidos) as Colaborador, COUNT(*) as inasistencias 
from Planificacion_mensual as pm 
inner join Asistencia as a on pm.Id_Empleado = a.Id_Empleado
inner join Centro_de_Trabajo as ct on ct.Id_CentroTrabajo = pm.Id_CentroTrabajo 
inner join Empleado as e on pm.Id_Empleado = e.Id_Empleado
where MONTH(fecha_asistencia) = @mes and YEAR(fecha_asistencia) = @anio and asistencia = 0
Group by nombre_centro, e.Id_Empleado, Nombres,Apellidos  order by inasistencias desc 
end
go 
exec Inasistencias_Empleado 10, 2024

alter procedure ObtenerHorasExtras (@mes int, @anio int)
as 
begin
select CONCAT(Nombres,' ',Apellidos) as Colaborador,
SUM(
	case 
		when horas_laboradas > Horas_planificadas
		then horas_laboradas - Horas_planificadas
		else 0
		end
) as Horas_Extras
from Empleado as e 
inner join Asistencia as a on e.Id_Empleado = a.Id_Empleado
inner join Planificacion_mensual as pm on a.Id_Asistencia = pm.Id_Asistencia
where MONTH(fecha_asistencia) = @mes
and YEAR(fecha_asistencia) = @anio
group by e.Id_Empleado, CONCAT(Nombres,' ',Apellidos)
end

exec ObtenerHorasExtras 10,2024

