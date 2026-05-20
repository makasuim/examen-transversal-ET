INSERT INTO ventas (direccion_compra, valor_compra, fecha_compra, despacho_generado) 
VALUES 
('P Sherman Calle Wallabi 42 Sydney', 22990, '2026-05-17', false),
('Avenida Siempre Viva 742', 12590, '2026-05-16', false),
('Calle Presidente Kirby 8528', 9990, '2026-05-15', false);

-- Insertar datos para la tabla de despachos
INSERT INTO despachos (id_despacho, id_compra, direccion_compra, fecha_despacho, patente_camion, entregado) 
VALUES 
(1, 1001, 'P Sherman Calle Wallabi 42 Sydney', '2026-05-17', 'AB-CD-12', false),
(2, 1002, 'Avenida Siempre Viva 742', '2026-05-18', 'EF-GH-34', true),
(3, 1003, 'Calle Presidente Kirby 8528', '2026-05-19', 'IJ-KL-56', false);