USE modava;
DELIMITER $$

CREATE FUNCTION obtener_profesional_mas_frecuente(idServicio INT)
RETURNS VARCHAR(45)
DETERMINISTIC
BEGIN
    DECLARE nombre_profesional VARCHAR(45);

    -- Obtiene el nombre del profesional que más veces ha realizado el servicio
    SELECT p.Nombre
    INTO nombre_profesional
    FROM detalle_cita dc
    JOIN profesional p ON dc.IdProfesional = p.idcedula
    WHERE dc.IdServicio = idServicio
    GROUP BY p.idcedula
    ORDER BY COUNT(*) DESC
    LIMIT 1;

    RETURN nombre_profesional;
END $$

DELIMITER ;



SELECT obtener_profesional_mas_frecuente(2) AS Profesional_Mas_Frecuente;
