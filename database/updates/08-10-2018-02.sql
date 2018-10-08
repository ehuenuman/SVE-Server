USE `pontinel`;
DROP procedure IF EXISTS `getSensorsOfStructure`;

DELIMITER $$
USE `pontinel`$$
CREATE DEFINER=`pontinel_root`@`localhost` PROCEDURE `getSensorsOfStructure`(in structureId int)
BEGIN
	select 
		sensor_info.*,		
		IFNULL(IF(STRCMP(alert_info.alert_type, "Advertencia") = 0 , count(alert_info.alert_type),0), 0) as adv_count,
		IFNULL(IF(STRCMP(alert_info.alert_type, "Alerta") = 0 , count(alert_info.alert_type),0), 0) as ale_count
	from 
		(
		select
			sensor.id as id,
			sensor.name as name,        
			sensor.type_sensor_name as type_sensor_name
		from
			( pontinel.node, pontinel.daq )
		inner join
			( 
				select 
					pontinel.sensor.*, 
					pontinel.type_sensor.name as type_sensor_name,
					pontinel.type_sensor.model as type_sensor_model,
					pontinel.type_sensor.unit as type_sensor_unit,
					pontinel.type_sensor.datasheet as type_sensor_datasheet
				from pontinel.sensor inner join pontinel.type_sensor on pontinel.sensor.type_id = pontinel.type_sensor.id
			) as sensor
		on
			pontinel.node.daq_id = pontinel.daq.id and
			pontinel.node.id = sensor.node_id and
            pontinel.sensor.is_active = 1 and
			pontinel.daq.structure_id = structureId
		group by
			pontinel.sensor.id
		) as sensor_info
	left join 
		(
		select 
			pontinel.alert.id as alert_id,
			pontinel.alert.sensor_id as sensor_id,
			pontinel.type_threshold.name as alert_type
		from
			pontinel.alert
		inner join
			( pontinel.threshold, pontinel.type_threshold )
		on
			pontinel.alert.threshold_id = pontinel.threshold.id and
			pontinel.type_threshold.id = pontinel.threshold.type_threshold_id and
			pontinel.threshold.is_active = 1
		) as alert_info
	on
		alert_info.sensor_id = sensor_info.id
	group by
		sensor_info.id,
		alert_info.alert_type
	order by 
		sensor_info.id;
END$$

DELIMITER ;

