-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-05-2025 a las 17:41:37
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdhadoukendojo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `ID_Administrador` int(11) NOT NULL,
  `Nombres` varchar(50) NOT NULL,
  `Paterno` varchar(30) NOT NULL,
  `Materno` varchar(30) DEFAULT NULL,
  `Telefono` varchar(20) NOT NULL,
  `ID_Direccion` int(11) NOT NULL,
  `Password_Admin` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consola`
--

CREATE TABLE `consola` (
  `ID_Consola` int(11) NOT NULL,
  `Nombre_Consola` varchar(50) NOT NULL,
  `Precio_Por_Hora` decimal(10,2) NOT NULL,
  `ID_Local` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `ID_Detalle` int(11) NOT NULL,
  `ID_Venta` int(11) NOT NULL,
  `ID_Producto` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL DEFAULT 1,
  `Precio_Unitario` decimal(10,2) NOT NULL,
  `Subtotal` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `ID_Direccion` int(11) NOT NULL,
  `Calle` varchar(50) NOT NULL,
  `Zona` varchar(50) NOT NULL,
  `Numero` varchar(10) NOT NULL,
  `Ciudad` varchar(50) DEFAULT NULL,
  `Pais` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `ID_Empleado` int(11) NOT NULL,
  `Nombres` varchar(50) NOT NULL,
  `Paterno` varchar(30) NOT NULL,
  `Materno` varchar(30) DEFAULT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Puesto` varchar(30) NOT NULL,
  `Salario` decimal(10,2) NOT NULL,
  `ID_Direccion` int(11) NOT NULL,
  `ID_Local` int(11) NOT NULL,
  `Password_Empleado` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `local`
--

CREATE TABLE `local` (
  `ID_Local` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `NIT` varchar(20) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Logo_Link` varchar(255) DEFAULT NULL,
  `ID_Direccion` int(11) NOT NULL,
  `ID_Encargado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maquina`
--

CREATE TABLE `maquina` (
  `ID_Maquina` int(11) NOT NULL,
  `Nombre_Maquina` varchar(50) NOT NULL,
  `Precio_Por_Ronda` decimal(5,2) NOT NULL,
  `Juego` varchar(100) NOT NULL,
  `ID_Local` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `ID_Producto` int(11) NOT NULL,
  `Nombre_Producto` varchar(100) NOT NULL,
  `Descripcion` text DEFAULT NULL,
  `Stock` int(11) NOT NULL DEFAULT 0,
  `Precio_Unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recaudacion_maquina`
--

CREATE TABLE `recaudacion_maquina` (
  `ID_Recaudacion_Maquina` int(11) NOT NULL,
  `Fecha_Recaudacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Monto_Recaudado` decimal(10,2) NOT NULL,
  `ID_Maquina` int(11) NOT NULL,
  `ID_Empleado` int(11) NOT NULL,
  `ID_Local` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesion_consola`
--

CREATE TABLE `sesion_consola` (
  `ID_Sesion` int(11) NOT NULL,
  `ID_Consola` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `ID_Empleado` int(11) NOT NULL,
  `Tiempo_Uso_Minutos` int(11) NOT NULL,
  `Fecha_Hora_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Monto_Cobrado` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_Usuario` int(11) NOT NULL,
  `Nombres` varchar(100) NOT NULL,
  `CI` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Nickname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_producto`
--

CREATE TABLE `venta_producto` (
  `ID_Venta` int(11) NOT NULL,
  `Fecha_Venta` timestamp NOT NULL DEFAULT current_timestamp(),
  `Total_Venta` decimal(12,2) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `ID_Empleado` int(11) NOT NULL,
  `ID_Local` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`ID_Administrador`),
  ADD KEY `fk_admin_direccion` (`ID_Direccion`);

--
-- Indices de la tabla `consola`
--
ALTER TABLE `consola`
  ADD PRIMARY KEY (`ID_Consola`),
  ADD UNIQUE KEY `UQ_Consola_Nombre_Local` (`Nombre_Consola`,`ID_Local`),
  ADD KEY `fk_consola_local` (`ID_Local`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`ID_Detalle`),
  ADD KEY `fk_detalle_venta` (`ID_Venta`),
  ADD KEY `fk_detalle_producto` (`ID_Producto`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`ID_Direccion`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`ID_Empleado`),
  ADD KEY `fk_empleado_direccion` (`ID_Direccion`),
  ADD KEY `fk_empleado_local` (`ID_Local`);

--
-- Indices de la tabla `local`
--
ALTER TABLE `local`
  ADD PRIMARY KEY (`ID_Local`),
  ADD UNIQUE KEY `UQ_Local_NIT` (`NIT`),
  ADD KEY `fk_local_direccion` (`ID_Direccion`),
  ADD KEY `fk_local_encargado` (`ID_Encargado`);

--
-- Indices de la tabla `maquina`
--
ALTER TABLE `maquina`
  ADD PRIMARY KEY (`ID_Maquina`),
  ADD KEY `fk_maquina_local` (`ID_Local`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ID_Producto`),
  ADD KEY `idx_producto_stock` (`Stock`);

--
-- Indices de la tabla `recaudacion_maquina`
--
ALTER TABLE `recaudacion_maquina`
  ADD PRIMARY KEY (`ID_Recaudacion_Maquina`),
  ADD KEY `fk_recmaq_maquina` (`ID_Maquina`),
  ADD KEY `fk_recmaq_empleado` (`ID_Empleado`),
  ADD KEY `fk_recmaq_local` (`ID_Local`),
  ADD KEY `idx_recaudacion_fecha` (`Fecha_Recaudacion`);

--
-- Indices de la tabla `sesion_consola`
--
ALTER TABLE `sesion_consola`
  ADD PRIMARY KEY (`ID_Sesion`),
  ADD KEY `fk_sescon_consola` (`ID_Consola`),
  ADD KEY `fk_sescon_usuario` (`ID_Usuario`),
  ADD KEY `fk_sescon_empleado` (`ID_Empleado`),
  ADD KEY `idx_sescon_fecha` (`Fecha_Hora_Creacion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_Usuario`),
  ADD UNIQUE KEY `UQ_Usuario_Nickname` (`Nickname`),
  ADD UNIQUE KEY `UQ_Usuario_CI` (`CI`),
  ADD UNIQUE KEY `UQ_Usuario_Email` (`Email`);

--
-- Indices de la tabla `venta_producto`
--
ALTER TABLE `venta_producto`
  ADD PRIMARY KEY (`ID_Venta`),
  ADD KEY `fk_venta_usuario` (`ID_Usuario`),
  ADD KEY `fk_venta_empleado` (`ID_Empleado`),
  ADD KEY `fk_venta_local` (`ID_Local`),
  ADD KEY `idx_venta_fecha` (`Fecha_Venta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `ID_Administrador` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `consola`
--
ALTER TABLE `consola`
  MODIFY `ID_Consola` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `ID_Detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `ID_Direccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `ID_Empleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `local`
--
ALTER TABLE `local`
  MODIFY `ID_Local` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `maquina`
--
ALTER TABLE `maquina`
  MODIFY `ID_Maquina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `ID_Producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recaudacion_maquina`
--
ALTER TABLE `recaudacion_maquina`
  MODIFY `ID_Recaudacion_Maquina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sesion_consola`
--
ALTER TABLE `sesion_consola`
  MODIFY `ID_Sesion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta_producto`
--
ALTER TABLE `venta_producto`
  MODIFY `ID_Venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `fk_admin_direccion` FOREIGN KEY (`ID_Direccion`) REFERENCES `direccion` (`ID_Direccion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `consola`
--
ALTER TABLE `consola`
  ADD CONSTRAINT `fk_consola_local` FOREIGN KEY (`ID_Local`) REFERENCES `local` (`ID_Local`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `fk_detalle_producto` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detalle_venta` FOREIGN KEY (`ID_Venta`) REFERENCES `venta_producto` (`ID_Venta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_empleado_direccion` FOREIGN KEY (`ID_Direccion`) REFERENCES `direccion` (`ID_Direccion`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_empleado_local` FOREIGN KEY (`ID_Local`) REFERENCES `local` (`ID_Local`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `local`
--
ALTER TABLE `local`
  ADD CONSTRAINT `fk_local_direccion` FOREIGN KEY (`ID_Direccion`) REFERENCES `direccion` (`ID_Direccion`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_local_encargado` FOREIGN KEY (`ID_Encargado`) REFERENCES `administrador` (`ID_Administrador`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `maquina`
--
ALTER TABLE `maquina`
  ADD CONSTRAINT `fk_maquina_local` FOREIGN KEY (`ID_Local`) REFERENCES `local` (`ID_Local`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `recaudacion_maquina`
--
ALTER TABLE `recaudacion_maquina`
  ADD CONSTRAINT `fk_recmaq_empleado` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_recmaq_local` FOREIGN KEY (`ID_Local`) REFERENCES `local` (`ID_Local`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_recmaq_maquina` FOREIGN KEY (`ID_Maquina`) REFERENCES `maquina` (`ID_Maquina`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `sesion_consola`
--
ALTER TABLE `sesion_consola`
  ADD CONSTRAINT `fk_sescon_consola` FOREIGN KEY (`ID_Consola`) REFERENCES `consola` (`ID_Consola`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sescon_empleado` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sescon_usuario` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `venta_producto`
--
ALTER TABLE `venta_producto`
  ADD CONSTRAINT `fk_venta_empleado` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_venta_local` FOREIGN KEY (`ID_Local`) REFERENCES `local` (`ID_Local`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_venta_usuario` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
