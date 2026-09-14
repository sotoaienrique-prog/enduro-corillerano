-- ============================================================================
-- Mejora de Performance: Agregar Índices Faltantes
-- ============================================================================
-- Script para agregar índices en tablas con alto volumen de registros
-- Fecha: 2026-09-14
-- ============================================================================

-- ============================================================================
-- 1. ÍNDICES PARA TABLA: grilla_de_partida (23,510 registros)
-- ============================================================================
-- Problema: Solo tiene 1 índice (PRIMARY KEY)
-- Solución: Agregar índices en columnas frecuentemente consultadas

ALTER TABLE `grilla_de_partida`
ADD INDEX `idx_piloto_oid` (`piloto_oid`),
ADD INDEX `idx_estado_partida` (`estado_piloto_partida`),
ADD INDEX `idx_grilla_categoria_oid` (`grilla_de_partida_categoria_oid`);

-- Índice compuesto para búsquedas frecuentes (piloto + categoría)
ALTER TABLE `grilla_de_partida`
ADD INDEX `idx_piloto_categoria` (`piloto_oid`, `categoria_oid`);

-- ============================================================================
-- 2. ÍNDICES PARA TABLA: lectura_tags_antena (65,050 registros)
-- ============================================================================
-- Problema: SIN ÍNDICES - causa queries lentas en lecturas de tags
-- Solución: Crear índices para búsquedas por tag y timestamp

ALTER TABLE `lectura_tags_antena`
ADD INDEX `idx_tagid` (`tagid`),
ADD INDEX `idx_timestampux` (`timestampux`);

-- Índice único compuesto (para evitar duplicados si es necesario)
-- Descomenta si necesitas garantizar que no haya lecturas duplicadas
-- ALTER TABLE `lectura_tags_antena`
-- ADD UNIQUE INDEX `idx_tag_timestamp_unique` (`tagid`, `timestampux`);

-- Índice compuesto para búsquedas por rango de tiempo
ALTER TABLE `lectura_tags_antena`
ADD INDEX `idx_tag_timestamp` (`tagid`, `timestampux`);

-- ============================================================================
-- 3. ÍNDICES ADICIONALES RECOMENDADOS
-- ============================================================================

-- evento: Índice en campeonato_oid para joins frecuentes
ALTER TABLE `evento`
ADD INDEX `idx_campeonato_oid` (`campeonato_oid`);

-- inscripcion_piloto_evento: Ya tiene buen índice único
-- Comentado porque ya existe: ipe_idx (evento_oid, piloto_oid, tipo_categoria_oid)

-- ============================================================================
-- INFORMACIÓN DE PERFORMANCE
-- ============================================================================
-- 
-- Impacto esperado:
-- - Búsquedas en grilla_de_partida: 50-70% más rápidas
-- - Búsquedas en lectura_tags_antena: 60-80% más rápidas
-- - Queries con JOINs: 40-60% más rápidas
--
-- Espacio adicional utilizado:
-- - grilla_de_partida: ~3-5 MB adicionales
-- - lectura_tags_antena: ~4-6 MB adicionales
--
-- Nota: Los índices ralentizarán ligeramente los INSERT/UPDATE/DELETE
-- pero es un tradeoff aceptable para este caso (lectura intensiva)
--
-- ============================================================================
