/* Obtener todos los paquetes que están en tránsito: */

SELECT * FROM `proyecto2023`.`paquetes` WHERE estado = 'En tránsito';

/* Listar todos los camioneros y la capacidad de su camión */

SELECT u.nombre, u.apellido, c.capacidadLt FROM `proyecto2023`.`usuarios` u
JOIN `proyecto2023`.`camion` c ON u.idUser = c.chofer WHERE idRol = '2';

/* Obtener las sesiones de login creadas en agosto de 2023: */

SELECT * FROM `proyecto2023`.`loginSessions` WHERE MONTH(created_at) = 8 AND YEAR(created_at) = 2023;

/* Obtener la dirección completa (dirección, calle y puerta) de todos los depósitos propios:
 */

SELECT direccion, calle, puerta FROM `proyecto2023`.`depositos` WHERE flagDepPropio = 1;

/* Mostrar la descripción de los lotes que serán enviados al barrio Pocitos:
*/

SELECT descLote FROM `proyecto2023`.`lotes` WHERE barrioDestino = 'Pocitos';

/* Buscar los datos de los choferes asignados a cada camión:
*/

SELECT u.nombre, u.apellido, c.plate 
FROM `proyecto2023`.`usuarios` u
JOIN `proyecto2023`.`camion` c ON u.idUser = c.chofer
WHERE idRol = '2';

/* Obtener la cantidad de paquetes por cada estado:
*/

SELECT estado, COUNT(*) as cantidad 
FROM `proyecto2023`.`paquetes`
GROUP BY estado;

/* Encontrar todos los paquetes entregados en una dirección específica:
*/

SELECT * 
FROM `proyecto2023`.`paquetes` 
WHERE direccionDestino = 'Calle Los Alamos 123' AND estado = 'Entregado';

/* Listar los últimos 5 registros de sesiones de login:
*/

SELECT * 
FROM `proyecto2023`.`loginSessions` 
ORDER BY created_at DESC 
LIMIT 5;

/* Mostrar todos los depósitos que son propiedad del cliente y sus respectivas direcciones:
*/

SELECT direccion, calle, puerta 
FROM `proyecto2023`.`depositos` 
WHERE flagDelCliente = 1;

/* Encontrar los usuarios que han iniciado sesión después de una fecha específica:
*/

SELECT u.nombre, u.apellido, ls.username 
FROM `proyecto2023`.`usuarios` u
JOIN `proyecto2023`.`loginSessions` ls ON u.username = ls.username
WHERE ls.created_at > '2023-09-01';
