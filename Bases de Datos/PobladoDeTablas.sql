INSERT INTO `proyecto2023`.`camion`
(`idCamion`,
`plate`,
`chofer`,
`capacidadLt`)

VALUES
(1, 'SBL1483', 1, 5000),
(2, 'AAU4356', 2, 6000),
(3, 'SCK5789', 3, 5500);

INSERT INTO `proyecto2023`.`depositos`
(`idDeposito`,
`direccion`,
`calle`,
`puerta`,
`flagDelCliente`,
`flagDepPropio`)

VALUES
(1, 'Dirección 1', 'Calle A', 'Puerta 1'),
(2, 'Dirección 2', 'Calle B', 'Puerta 2'),
(3, 'Dirección 3', 'Calle C', 'Puerta 3');

INSERT INTO `proyecto2023`.`loginSessions`
(`token`,
`username`,
`created_at`,
`expireiN`)

VALUES
(5342890, 'marcosalan', 27/08/2023, '27/08/2023'),
(2938785, 'pbenitez', 23/07/2023, '23/07/2023'),
(0394589, 'alromero', 18/08/2023, '18/08/2023');

INSERT INTO `proyecto2023`.`lotes`
(`idLote`,
`descLote`,
`barrioDestino`)

VALUES
(124, 'Vestimenta', 'Pocitos'),
(293, 'Indumentaria Deportiva', 'Cordon'),
(239, 'Herramientas', 'Maroñas');

INSERT INTO `proyecto2023`.`paquetes`
(`idPaquete`,
`idLote`,
`descripcion`,
`peso`,
`direccionDestino`,
`propietario`,
`estado`,
`ubicacion`,
`idDeposito`)

VALUES

(423, 101, 'Electrónicos', 2.5, 'Calle Los Alamos 123', 'Juan Pérez', 'En tránsito', 'Montevideo - Carrasco', 1),
(234, 102, 'Ropa', 1.2, 'Avenida Las Rosas 456', 'María Rodríguez', 'Entregado', 'Montevideo - Casavalle', 2),
(543, 103, 'Libros', 3.0, 'Calle Los Pinos 789', 'Pedro Gómez', 'En espera', 'Montevideo - Centro', 3);

INSERT INTO `proyecto2023`.`roles`
(`idRol`,
`descRol`)

VALUES
(4, 'Administrador'),
(1, 'Usuario'),
(2, 'Camionero');

INSERT INTO `proyecto2023`.`statusEnvio`
(`idStatus`,
`desc`)

VALUES
(1, 'En deposito'),
(3, 'En viaje'),
(4, 'Entregado');

INSERT INTO `proyecto2023`.`usuarios`
(`idUser`,
`username`,
`password`,
`nombre`,
`apellido`,
`email`,
`telefono`,
`roles`,
`timestamp_creacion`)

VALUES

(1, 'juanperez', 'pass1234', 'Juan', 'Pérez', 'juanperez@gmail.com', '092345678', '4', '2023-08-21 13:46:00'),
(2, 'anamartinez', 'ana7890', 'Ana', 'Martínez', 'anamartinez@gmail.com', '099234569', '1', '2023-09-16 09:05:00'),
(3, 'luisgonzalez', 'luis4567', 'Luis', 'González', 'luisgonzalez@gmail.com', '096534680', '2', '2023-08-11 11:30:00');
