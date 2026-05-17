CREATE DATABASE IF NOT EXISTS tu_base_de_datos;
USE tu_base_de_datos;

-- Crear tabla de ventas/productos si Spring Boot no la ha creado
CREATE TABLE IF NOT EXISTS ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    direccion_compra VARCHAR(255),
    valor_compra INT,
    fecha_compra VARCHAR(50),
    despacho_generado BOOLEAN
);

-- Inyectar placeholders iniciales
INSERT INTO ventas (direccion_compra, valor_compra, fecha_compra, despacho_generado) 
VALUES 
('P Sherman Calle Wallabi 42 Sydney', 22990, '2026-05-17', false),
('Avenida Siempre Viva 742', 12590, '2026-05-16', false),
('Calle Presidente Kirby 8528', 9990, '2026-05-15', false);