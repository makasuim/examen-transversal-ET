-- Insertar datos iniciales para la tabla despacho
-- Omitimos el id_despacho para que Postgres lo auto-genere con el @GeneratedValue
INSERT INTO despacho (id_compra, direccion_compra, valor_compra, fecha_despacho, patente_camion, intento, despachado) 
VALUES 
(1, 'P Sherman Calle Wallabi 42 Sydney', 22990, '2026-05-17', 'AB-CD-12', 1, false),
(2, 'Avenida Siempre Viva 742', 12590, '2026-05-18', 'EF-GH-34', 1, true),
(3, 'Calle Presidente Kirby 8528', 9990, '2026-05-19', 'IJ-KL-56', 1, false);