-- Insertar datos en VENTAS (usamos nombres exactos del DESCRIBE)
INSERT INTO ventas (despacho_generado, direccion_compra, fecha_compra, valor_compra) 
VALUES 
(b'0', 'P Sherman Calle Wallabi 42 Sydney', '2026-05-17', 22990),
(b'0', 'Avenida Siempre Viva 742', '2026-05-16', 12590),
(b'0', 'Calle Presidente Kirby 8528', '2026-05-15', 9990);

-- Insertar datos en DESPACHOS (usamos nombres exactos del DESCRIBE)
INSERT INTO despachos (despachado, direccion_compra, fecha_despacho, id_compra, intento, patente_camion, valor_compra) 
VALUES 
(b'0', 'P Sherman Calle Wallabi 42 Sydney', '2026-05-17', 1001, 0, 'AB-CD-12', 22990),
(b'1', 'Avenida Siempre Viva 742', '2026-05-18', 1002, 0, 'EF-GH-34', 12590),
(b'0', 'Calle Presidente Kirby 8528', '2026-05-19', 1003, 0, 'IJ-KL-56', 9990);