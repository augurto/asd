-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-09-2020 a las 03:02:44
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sys-bares`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_admin_user_menus`
--

CREATE TABLE `tbl_admin_user_menus` (
  `id` int(10) NOT NULL,
  `menu_name` varchar(50) DEFAULT NULL,
  `controller_name` varchar(50) DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_admin_user_menus`
--

INSERT INTO `tbl_admin_user_menus` (`id`, `menu_name`, `controller_name`, `del_status`) VALUES
(1, 'Sale', 'Sale', 'Live'),
(2, 'Purchase', 'Purchase', 'Live'),
(3, 'Inventory', 'Inventory', 'Live'),
(4, 'Waste', 'Waste', 'Live'),
(6, 'Expense', 'Expense', 'Live'),
(7, 'Report', 'Report', 'Live'),
(8, 'Dashboard', 'Dashboard', 'Live'),
(9, 'Master', 'Master', 'Live'),
(10, 'User', 'User', 'Live'),
(11, 'Supplier Payment', 'SupplierPayment', 'Live'),
(13, 'Inventory Adjustment', 'Inventory_adjustment', 'Live'),
(14, 'Short Message Service', 'Short_message_service', 'Live'),
(15, 'Customer Due Receive', 'Customer_due_receive', 'Live'),
(16, 'Attendance', 'Attendance', 'Live'),
(17, 'Bar', 'Bar', 'Live'),
(18, 'Kitchen', 'Kitchen', 'Live'),
(19, 'Waiter', 'Waiter', 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_attendance`
--

CREATE TABLE `tbl_attendance` (
  `id` int(10) NOT NULL,
  `reference_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(10) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `in_time` time DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `company_id` int(10) DEFAULT NULL,
  `del_status` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'Live'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_companies`
--

CREATE TABLE `tbl_companies` (
  `id` int(10) NOT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `timezone` varchar(50) DEFAULT NULL,
  `date_format` varchar(50) DEFAULT NULL,
  `outlet_id` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_companies`
--

INSERT INTO `tbl_companies` (`id`, `currency`, `timezone`, `date_format`, `outlet_id`) VALUES
(1, '$', 'America/Lima', 'd/m/Y', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_customers`
--

CREATE TABLE `tbl_customers` (
  `id` int(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `gst_number` varchar(50) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live',
  `date_of_birth` date DEFAULT NULL,
  `date_of_anniversary` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tbl_customers`
--

INSERT INTO `tbl_customers` (`id`, `name`, `phone`, `email`, `address`, `gst_number`, `area_id`, `user_id`, `company_id`, `del_status`, `date_of_birth`, `date_of_anniversary`) VALUES
(1, 'Walk-in Customer', '', NULL, NULL, NULL, 0, 1, 1, 'Live', NULL, NULL),
(23, 'publico en general', '89789787987', '', '', NULL, NULL, 1, 1, 'Live', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_customer_due_receives`
--

CREATE TABLE `tbl_customer_due_receives` (
  `id` int(10) NOT NULL,
  `reference_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `only_date` date DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `outlet_id` int(10) DEFAULT NULL,
  `company_id` int(10) DEFAULT NULL,
  `del_status` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'Live'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_expenses`
--

CREATE TABLE `tbl_expenses` (
  `id` int(10) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `category_id` int(10) DEFAULT NULL,
  `employee_id` int(10) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `outlet_id` int(11) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_expense_items`
--

CREATE TABLE `tbl_expense_items` (
  `id` int(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `company_id` int(10) DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_expense_items`
--

INSERT INTO `tbl_expense_items` (`id`, `name`, `description`, `user_id`, `company_id`, `del_status`) VALUES
(1, 'otros', '', 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_food_menus`
--

CREATE TABLE `tbl_food_menus` (
  `id` int(10) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `category_id` int(10) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `sale_price` float(10,2) DEFAULT NULL,
  `tax_information` text,
  `vat_id` int(11) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `company_id` int(10) DEFAULT NULL,
  `photo` varchar(250) DEFAULT NULL,
  `veg_item` varchar(50) DEFAULT 'Veg No',
  `beverage_item` varchar(50) DEFAULT 'Beverage No',
  `bar_item` varchar(50) DEFAULT 'Bar No',
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tbl_food_menus`
--

INSERT INTO `tbl_food_menus` (`id`, `code`, `name`, `category_id`, `description`, `sale_price`, `tax_information`, `vat_id`, `user_id`, `company_id`, `photo`, `veg_item`, `beverage_item`, `bar_item`, `del_status`) VALUES
(1, '001', '1/4 de pollo  a la brasa', 1, 'pollos + papas', 20.00, '[]', NULL, 1, 1, NULL, 'Veg No', 'Beverage No', 'Bar No', 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_food_menus_ingredients`
--

CREATE TABLE `tbl_food_menus_ingredients` (
  `id` bigint(50) NOT NULL,
  `ingredient_id` int(10) DEFAULT NULL,
  `consumption` float(10,2) DEFAULT NULL,
  `food_menu_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tbl_food_menus_ingredients`
--

INSERT INTO `tbl_food_menus_ingredients` (`id`, `ingredient_id`, `consumption`, `food_menu_id`, `user_id`, `company_id`, `del_status`) VALUES
(1, 1, 0.25, 1, 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_food_menus_modifiers`
--

CREATE TABLE `tbl_food_menus_modifiers` (
  `id` bigint(50) NOT NULL,
  `modifier_id` int(10) DEFAULT NULL,
  `food_menu_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `outlet_id` int(10) DEFAULT NULL,
  `company_id` int(10) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_food_menu_categories`
--

CREATE TABLE `tbl_food_menu_categories` (
  `id` int(10) NOT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_food_menu_categories`
--

INSERT INTO `tbl_food_menu_categories` (`id`, `category_name`, `description`, `user_id`, `company_id`, `del_status`) VALUES
(1, 'pollos a la brasa', '', 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_holds`
--

CREATE TABLE `tbl_holds` (
  `id` int(10) NOT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `hold_no` varchar(30) NOT NULL DEFAULT '000000',
  `total_items` int(10) DEFAULT NULL,
  `sub_total` float(10,2) DEFAULT NULL,
  `paid_amount` double(10,2) DEFAULT NULL,
  `due_amount` double(10,2) DEFAULT NULL,
  `due_payment_date` date DEFAULT NULL,
  `disc` varchar(50) DEFAULT NULL,
  `disc_actual` float(10,2) DEFAULT NULL,
  `vat` float(10,2) DEFAULT NULL,
  `total_payable` float(10,2) DEFAULT NULL,
  `payment_method_id` int(10) DEFAULT NULL,
  `table_id` int(10) DEFAULT NULL,
  `total_item_discount_amount` float(10,2) NOT NULL,
  `sub_total_with_discount` float(10,2) NOT NULL,
  `sub_total_discount_amount` float(10,2) NOT NULL,
  `total_discount_amount` float(10,2) NOT NULL,
  `delivery_charge` float(10,2) NOT NULL,
  `sub_total_discount_value` varchar(10) NOT NULL,
  `sub_total_discount_type` varchar(20) NOT NULL,
  `token_no` varchar(50) DEFAULT NULL,
  `sale_date` varchar(20) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_time` varchar(15) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `waiter_id` int(10) DEFAULT '0',
  `outlet_id` int(10) DEFAULT NULL,
  `order_status` tinyint(1) DEFAULT NULL COMMENT '1=new order, 2=cancelled order, 3=invoiced order',
  `sale_vat_objects` text,
  `order_type` tinyint(1) DEFAULT NULL COMMENT '1=dine in, 2 = take away, 3 = delivery',
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_holds_details`
--

CREATE TABLE `tbl_holds_details` (
  `id` int(10) NOT NULL,
  `food_menu_id` int(10) DEFAULT NULL,
  `menu_name` varchar(50) DEFAULT NULL,
  `qty` int(10) DEFAULT NULL,
  `menu_price_without_discount` float(10,2) NOT NULL,
  `menu_price_with_discount` float(10,2) NOT NULL,
  `menu_unit_price` float(10,2) NOT NULL,
  `menu_vat_percentage` float(10,2) NOT NULL,
  `menu_taxes` text,
  `menu_discount_value` varchar(20) DEFAULT NULL,
  `discount_type` varchar(20) NOT NULL,
  `menu_note` varchar(150) DEFAULT NULL,
  `discount_amount` double(10,2) DEFAULT NULL,
  `holds_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `outlet_id` int(10) DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_holds_details_modifiers`
--

CREATE TABLE `tbl_holds_details_modifiers` (
  `id` int(15) NOT NULL,
  `modifier_id` int(15) NOT NULL,
  `modifier_price` float(10,2) NOT NULL,
  `food_menu_id` int(10) NOT NULL,
  `holds_id` int(15) NOT NULL,
  `holds_details_id` int(15) NOT NULL,
  `user_id` int(15) NOT NULL,
  `outlet_id` int(15) NOT NULL,
  `customer_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ingredients`
--

CREATE TABLE `tbl_ingredients` (
  `id` int(10) NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `category_id` int(10) DEFAULT NULL,
  `purchase_price` float(10,2) DEFAULT NULL,
  `alert_quantity` float(10,2) DEFAULT NULL,
  `unit_id` int(10) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tbl_ingredients`
--

INSERT INTO `tbl_ingredients` (`id`, `code`, `name`, `category_id`, `purchase_price`, `alert_quantity`, `unit_id`, `user_id`, `company_id`, `del_status`) VALUES
(1, '001', 'pollo', 1, 13.00, 1.00, 1, 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ingredient_categories`
--

CREATE TABLE `tbl_ingredient_categories` (
  `id` int(10) NOT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `company_id` int(10) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tbl_ingredient_categories`
--

INSERT INTO `tbl_ingredient_categories` (`id`, `category_name`, `description`, `user_id`, `company_id`, `del_status`) VALUES
(1, 'carnes', '', 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_inventory_adjustment`
--

CREATE TABLE `tbl_inventory_adjustment` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `date` date NOT NULL,
  `note` varchar(200) DEFAULT NULL,
  `employee_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `outlet_id` int(10) DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_inventory_adjustment_ingredients`
--

CREATE TABLE `tbl_inventory_adjustment_ingredients` (
  `id` int(10) NOT NULL,
  `ingredient_id` int(10) DEFAULT NULL,
  `consumption_amount` float(10,2) DEFAULT NULL,
  `inventory_adjustment_id` int(10) DEFAULT NULL,
  `consumption_status` enum('Plus','Minus','') DEFAULT NULL,
  `outlet_id` int(10) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_modifiers`
--

CREATE TABLE `tbl_modifiers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `price` float(10,2) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_modifier_ingredients`
--

CREATE TABLE `tbl_modifier_ingredients` (
  `id` bigint(50) NOT NULL,
  `ingredient_id` int(10) DEFAULT NULL,
  `consumption` float(10,2) DEFAULT NULL,
  `modifier_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_notifications`
--

CREATE TABLE `tbl_notifications` (
  `id` bigint(50) NOT NULL,
  `notification` text NOT NULL,
  `sale_id` int(15) NOT NULL,
  `outlet_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_notification_bar_kitchen_panel`
--

CREATE TABLE `tbl_notification_bar_kitchen_panel` (
  `id` int(15) NOT NULL,
  `notification` text NOT NULL,
  `sale_id` int(15) NOT NULL,
  `outlet_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_orders_table`
--

CREATE TABLE `tbl_orders_table` (
  `id` bigint(50) NOT NULL,
  `persons` int(5) NOT NULL,
  `booking_time` datetime NOT NULL,
  `sale_id` int(10) NOT NULL,
  `sale_no` varchar(20) NOT NULL,
  `outlet_id` int(10) NOT NULL,
  `table_id` int(10) NOT NULL,
  `del_status` varchar(20) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_outlets`
--

CREATE TABLE `tbl_outlets` (
  `id` int(10) NOT NULL,
  `outlet_name` varchar(50) DEFAULT NULL,
  `outlet_code` varchar(10) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `invoice_print` enum('Yes','No') DEFAULT NULL,
  `starting_date` date DEFAULT NULL,
  `invoice_footer` varchar(500) DEFAULT NULL,
  `collect_tax` varchar(10) DEFAULT NULL,
  `tax_title` varchar(10) DEFAULT NULL,
  `tax_registration_no` varchar(30) DEFAULT NULL,
  `tax_is_gst` varchar(10) NOT NULL,
  `state_code` varchar(10) DEFAULT NULL,
  `pre_or_post_payment` varchar(500) DEFAULT 'Post Payment',
  `user_id` int(10) DEFAULT NULL,
  `company_id` int(10) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_outlets`
--

INSERT INTO `tbl_outlets` (`id`, `outlet_name`, `outlet_code`, `address`, `phone`, `invoice_print`, `starting_date`, `invoice_footer`, `collect_tax`, `tax_title`, `tax_registration_no`, `tax_is_gst`, `state_code`, `pre_or_post_payment`, `user_id`, `company_id`, `del_status`) VALUES
(1, 'Texas Bistro', '000001', '421 E. Commerce San Antonio, TX 78205', '(210) 224-1313', 'Yes', '2018-02-18', 'Thank you for visiting us!', 'No', '', '', 'No', '', 'Post Payment', 2, 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_outlet_taxes`
--

CREATE TABLE `tbl_outlet_taxes` (
  `id` int(15) NOT NULL,
  `tax` varchar(50) NOT NULL,
  `outlet_id` int(15) NOT NULL,
  `user_id` int(15) NOT NULL,
  `company_id` int(15) NOT NULL,
  `del_status` varchar(100) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_payment_methods`
--

CREATE TABLE `tbl_payment_methods` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_payment_methods`
--

INSERT INTO `tbl_payment_methods` (`id`, `name`, `description`, `user_id`, `company_id`, `del_status`) VALUES
(3, 'Cash', '', 1, 1, 'Live'),
(4, 'Card', '', 1, 1, 'Live'),
(5, 'Paypal', '', 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_purchase`
--

CREATE TABLE `tbl_purchase` (
  `id` int(10) NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `supplier_id` int(10) DEFAULT NULL,
  `date` varchar(15) NOT NULL,
  `subtotal` float(10,2) DEFAULT NULL,
  `other` float(10,2) DEFAULT NULL,
  `grand_total` float(10,2) DEFAULT NULL,
  `paid` float(10,2) DEFAULT NULL,
  `due` float(10,2) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `outlet_id` int(10) DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_purchase_ingredients`
--

CREATE TABLE `tbl_purchase_ingredients` (
  `id` int(10) NOT NULL,
  `ingredient_id` int(10) DEFAULT NULL,
  `unit_price` float(10,2) DEFAULT NULL,
  `quantity_amount` float(10,2) DEFAULT NULL,
  `total` float(10,2) DEFAULT NULL,
  `purchase_id` int(10) DEFAULT NULL,
  `outlet_id` int(10) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_register`
--

CREATE TABLE `tbl_register` (
  `id` int(15) NOT NULL,
  `opening_balance` float(10,2) NOT NULL,
  `closing_balance` float(10,2) NOT NULL,
  `opening_balance_date_time` datetime NOT NULL,
  `closing_balance_date_time` datetime NOT NULL,
  `sale_paid_amount` float(10,2) NOT NULL,
  `customer_due_receive` float(10,2) NOT NULL,
  `payment_methods_sale` text NOT NULL,
  `register_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=open,2=closed',
  `user_id` int(15) NOT NULL,
  `outlet_id` int(15) NOT NULL,
  `company_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_register`
--

INSERT INTO `tbl_register` (`id`, `opening_balance`, `closing_balance`, `opening_balance_date_time`, `closing_balance_date_time`, `sale_paid_amount`, `customer_due_receive`, `payment_methods_sale`, `register_status`, `user_id`, `outlet_id`, `company_id`) VALUES
(2, 25.00, 0.00, '2020-01-10 08:13:03', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(3, 76.00, 0.00, '2020-09-16 19:35:08', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sales`
--

CREATE TABLE `tbl_sales` (
  `id` int(10) NOT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `sale_no` varchar(30) NOT NULL DEFAULT '000000',
  `total_items` int(10) DEFAULT NULL,
  `sub_total` float(10,2) DEFAULT NULL,
  `paid_amount` double(10,2) DEFAULT NULL,
  `due_amount` float(10,2) DEFAULT NULL,
  `disc` varchar(50) DEFAULT NULL,
  `disc_actual` float(10,2) DEFAULT NULL,
  `vat` float(10,2) DEFAULT NULL,
  `total_payable` float(10,2) DEFAULT NULL,
  `payment_method_id` int(10) DEFAULT NULL,
  `close_time` time NOT NULL,
  `table_id` int(10) DEFAULT NULL,
  `total_item_discount_amount` float(10,2) NOT NULL,
  `sub_total_with_discount` float(10,2) NOT NULL,
  `sub_total_discount_amount` float(10,2) NOT NULL,
  `total_discount_amount` float(10,2) NOT NULL,
  `delivery_charge` float(10,2) NOT NULL,
  `sub_total_discount_value` varchar(10) NOT NULL,
  `sub_total_discount_type` varchar(20) NOT NULL,
  `sale_date` varchar(20) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_time` time NOT NULL,
  `cooking_start_time` datetime NOT NULL,
  `cooking_done_time` datetime NOT NULL,
  `modified` enum('Yes','No') NOT NULL DEFAULT 'No',
  `user_id` int(10) DEFAULT NULL,
  `waiter_id` int(10) NOT NULL DEFAULT '0',
  `outlet_id` int(10) DEFAULT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order, 2=invoiced order, 3=closed order',
  `order_type` tinyint(1) NOT NULL COMMENT '1=dine in, 2 = take away, 3 = delivery',
  `del_status` varchar(50) DEFAULT 'Live',
  `sale_vat_objects` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sales_details`
--

CREATE TABLE `tbl_sales_details` (
  `id` bigint(50) NOT NULL,
  `food_menu_id` int(10) DEFAULT NULL,
  `menu_name` varchar(50) DEFAULT NULL,
  `qty` int(10) DEFAULT NULL,
  `menu_price_without_discount` float(10,2) NOT NULL,
  `menu_price_with_discount` float(10,2) NOT NULL,
  `menu_unit_price` float(10,2) NOT NULL,
  `menu_vat_percentage` float(10,2) NOT NULL,
  `menu_taxes` text,
  `menu_discount_value` varchar(20) DEFAULT NULL,
  `discount_type` varchar(20) NOT NULL,
  `menu_note` varchar(150) DEFAULT NULL,
  `discount_amount` double(10,2) DEFAULT NULL,
  `item_type` varchar(50) DEFAULT NULL,
  `cooking_status` varchar(30) DEFAULT NULL,
  `cooking_start_time` datetime NOT NULL,
  `cooking_done_time` datetime NOT NULL,
  `previous_id` bigint(50) NOT NULL,
  `sales_id` int(10) DEFAULT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order,2=invoiced order, 3=closed order',
  `user_id` int(10) DEFAULT NULL,
  `outlet_id` int(10) DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sales_details_modifiers`
--

CREATE TABLE `tbl_sales_details_modifiers` (
  `id` bigint(50) NOT NULL,
  `modifier_id` int(15) NOT NULL,
  `modifier_price` float(10,2) NOT NULL,
  `food_menu_id` int(10) NOT NULL,
  `sales_id` int(15) NOT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order,2=invoiced order, 3=closed order',
  `sales_details_id` int(15) NOT NULL,
  `user_id` int(15) NOT NULL,
  `outlet_id` int(15) NOT NULL,
  `customer_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sale_consumptions`
--

CREATE TABLE `tbl_sale_consumptions` (
  `id` bigint(50) NOT NULL,
  `sale_id` int(10) DEFAULT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order,2=invoiced order, 3=closed order',
  `user_id` int(10) DEFAULT NULL,
  `outlet_id` int(10) DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sale_consumptions_of_menus`
--

CREATE TABLE `tbl_sale_consumptions_of_menus` (
  `id` bigint(50) NOT NULL,
  `ingredient_id` int(10) DEFAULT NULL,
  `consumption` float(10,2) DEFAULT NULL,
  `sale_consumption_id` int(10) DEFAULT NULL,
  `sales_id` int(10) NOT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order,2=invoiced order, 3=closed order',
  `food_menu_id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `outlet_id` int(10) DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sale_consumptions_of_modifiers_of_menus`
--

CREATE TABLE `tbl_sale_consumptions_of_modifiers_of_menus` (
  `id` bigint(50) NOT NULL,
  `ingredient_id` int(10) DEFAULT NULL,
  `consumption` float(10,2) DEFAULT NULL,
  `sale_consumption_id` int(10) DEFAULT NULL,
  `sales_id` int(10) NOT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order,2=invoiced order, 3=closed order',
  `food_menu_id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `outlet_id` int(10) DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sessions`
--

CREATE TABLE `tbl_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_sessions`
--

INSERT INTO `tbl_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('1mde1qe73glkpahf55472aa2u0uf6gqv', '::1', 1567237935, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536373233373933353b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31343a222832313029203232342d31333133223b656d61696c5f616464726573737c733a31383a2261646d696e40646f6f72736f66742e78797a223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b6f75746c65745f69647c733a313a2231223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c733a31323a224575726f70652f536f666961223b646174655f666f726d61747c733a353a22642f6d2f59223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a323a224e6f223b6773745f73746174655f636f64657c733a303a22223b6f75746c65745f6e616d657c733a31323a2254657861732042697374726f223b616464726573737c733a33373a2234323120452e20436f6d6d657263652053616e20416e746f6e696f2c205458203738323035223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f726567697374726174696f6e5f6e6f7c733a303a22223b696e766f6963655f7072696e747c733a333a22596573223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b7072655f6f725f706f73745f7061796d656e747c733a31323a22506f7374205061796d656e74223b),
('5e0r7hapdg5jd4e9s5fu9lcmdf3lhrsc', '::1', 1567238010, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536373233373933353b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31343a222832313029203232342d31333133223b656d61696c5f616464726573737c733a31383a2261646d696e40646f6f72736f66742e78797a223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b6f75746c65745f69647c733a313a2231223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c733a31323a224575726f70652f536f666961223b646174655f666f726d61747c733a353a22642f6d2f59223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a323a224e6f223b6773745f73746174655f636f64657c733a303a22223b6f75746c65745f6e616d657c733a31323a2254657861732042697374726f223b616464726573737c733a33373a2234323120452e20436f6d6d657263652053616e20416e746f6e696f2c205458203738323035223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f726567697374726174696f6e5f6e6f7c733a303a22223b696e766f6963655f7072696e747c733a333a22596573223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b7072655f6f725f706f73745f7061796d656e747c733a31323a22506f7374205061796d656e74223b),
('401e69c67455ea4d249d142c945fed019703518f', '190.235.216.236', 1578637083, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383633373038333b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31343a222832313029203232342d31333133223b656d61696c5f616464726573737c733a31383a2261646d696e40646f6f72736f66742e78797a223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b6f75746c65745f69647c733a313a2231223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c733a31323a224575726f70652f536f666961223b646174655f666f726d61747c733a353a22642f6d2f59223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a323a224e6f223b6773745f73746174655f636f64657c733a303a22223b6f75746c65745f6e616d657c733a31323a2254657861732042697374726f223b616464726573737c733a33373a2234323120452e20436f6d6d657263652053616e20416e746f6e696f2c205458203738323035223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f726567697374726174696f6e5f6e6f7c733a303a22223b696e766f6963655f7072696e747c733a333a22596573223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b7072655f6f725f706f73745f7061796d656e747c733a31323a22506f7374205061796d656e74223b),
('0920c13f3d174113f0afc918c6443534dc57b115', '43.231.22.62', 1578638826, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383633363937313b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31343a222832313029203232342d31333133223b656d61696c5f616464726573737c733a31383a2261646d696e40646f6f72736f66742e78797a223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b6f75746c65745f69647c733a313a2231223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c733a31323a224575726f70652f536f666961223b646174655f666f726d61747c733a353a22642f6d2f59223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a323a224e6f223b6773745f73746174655f636f64657c733a303a22223b6f75746c65745f6e616d657c733a31323a2254657861732042697374726f223b616464726573737c733a33373a2234323120452e20436f6d6d657263652053616e20416e746f6e696f2c205458203738323035223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f726567697374726174696f6e5f6e6f7c733a303a22223b696e766f6963655f7072696e747c733a333a22596573223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b7072655f6f725f706f73745f7061796d656e747c733a31323a22506f7374205061796d656e74223b),
('7d1163194ce0201e4ad2245d2fec9a66d16e2ef3', '190.235.216.236', 1578637451, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383633373435313b6c616e67756167657c733a373a22656e676c697368223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a323a224e6f223b6773745f73746174655f636f64657c733a303a22223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b7072655f6f725f706f73745f7061796d656e747c733a31323a22506f7374205061796d656e74223b),
('0c5900844b43c89ecd422371a03540ad404f7140', '190.235.216.236', 1578638281, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383633383238313b6c616e67756167657c733a373a227370616e697368223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a323a224e6f223b6773745f73746174655f636f64657c733a303a22223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b7072655f6f725f706f73745f7061796d656e747c733a31323a22506f7374205061796d656e74223b),
('dfa48aad371efacc429de7da003e34519bd5c108', '190.235.216.236', 1578638832, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383633383833323b),
('8f9c85da84c5a556f2e42882f6280a5ac9e4529d', '190.235.216.236', 1578638342, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383633383238313b6c616e67756167657c733a373a227370616e697368223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a323a224e6f223b6773745f73746174655f636f64657c733a303a22223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b7072655f6f725f706f73745f7061796d656e747c733a31323a22506f7374205061796d656e74223b757365725f69647c733a313a2231223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31343a222832313029203232342d31333133223b656d61696c5f616464726573737c733a31383a2261646d696e40646f6f72736f66742e78797a223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b6f75746c65745f69647c733a313a2231223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c733a31323a224575726f70652f536f666961223b646174655f666f726d61747c733a353a22642f6d2f59223b6f75746c65745f6e616d657c733a31323a2254657861732042697374726f223b616464726573737c733a33373a2234323120452e20436f6d6d657263652053616e20416e746f6e696f2c205458203738323035223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f726567697374726174696f6e5f6e6f7c733a303a22223b696e766f6963655f7072696e747c733a333a22596573223b),
('fc4f1b7331ff69244a173aa463ba87ad20f94eb0', '190.235.216.236', 1578639221, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383633393232313b6c616e67756167657c733a373a227370616e697368223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a323a224e6f223b6773745f73746174655f636f64657c733a303a22223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b7072655f6f725f706f73745f7061796d656e747c733a31323a22506f7374205061796d656e74223b),
('656581c895ebb8ec5dba0e8652067ee6a4877351', '190.235.216.236', 1578639525, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383633393532353b6c616e67756167657c733a373a227370616e697368223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a323a224e6f223b6773745f73746174655f636f64657c733a303a22223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b7072655f6f725f706f73745f7061796d656e747c733a31323a22506f7374205061796d656e74223b757365725f69647c733a313a2231223b66756c6c5f6e616d657c733a31393a227475736f6c7574696f6e776562207475746f73223b70686f6e657c733a31343a222832313029203232342d31333133223b656d61696c5f616464726573737c733a32333a227475736f6c7574696f6e77656240676d61696c2e636f6d223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b6f75746c65745f69647c733a313a2231223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c733a31323a224575726f70652f536f666961223b646174655f666f726d61747c733a353a22642f6d2f59223b6f75746c65745f6e616d657c733a31323a2254657861732042697374726f223b616464726573737c733a33373a2234323120452e20436f6d6d657263652053616e20416e746f6e696f2c205458203738323035223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f726567697374726174696f6e5f6e6f7c733a303a22223b696e766f6963655f7072696e747c733a333a22596573223b),
('0ff2f37a0ba867ba60c30f462b5385931e93e912', '190.235.216.236', 1578639620, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383633393532353b6c616e67756167657c733a373a227370616e697368223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a323a224e6f223b6773745f73746174655f636f64657c733a303a22223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b7072655f6f725f706f73745f7061796d656e747c733a31323a22506f7374205061796d656e74223b),
('4c009210ca11ecdc21951ac2843c3b55a3efe8f6', '190.235.216.236', 1578694785, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383639343738353b),
('e037374f4c7c47bf5a5b030a7fee87af27ae1318', '190.235.216.236', 1578695624, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383639353632343b),
('cae51c1a5dc957e37fc2dd3f58eb996aae5cc2c7', '190.235.216.236', 1578696066, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383639363036363b),
('4fca4c16358b6fa76a2baf4ed87f8f533fd8d26b', '190.235.216.236', 1578696078, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383639363037383b),
('2c12f4e34cf3d2ea730f7ed8c4b1945a9fc11b3d', '190.235.216.236', 1578697639, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383639373633393b),
('0f6f83ad35cbc4f714ce7b0fe2596dbec739715f', '190.235.216.236', 1578696382, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383639363338323b),
('c87b805502fc85f38d5d01b3dd410fe34e44ff84', '190.235.216.236', 1578697653, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383639373635333b6c616e67756167657c733a373a227370616e697368223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a323a224e6f223b6773745f73746174655f636f64657c733a303a22223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b7072655f6f725f706f73745f7061796d656e747c733a31323a22506f7374205061796d656e74223b636c69636b65645f636f6e74726f6c6c65727c733a343a2253616c65223b636c69636b65645f6d6574686f647c733a333a22504f53223b),
('6d9a3f7a1be40d530b294795c96c82f3fa1b8b2d', '190.235.216.236', 1578697676, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383639373633393b6c616e67756167657c733a373a227370616e697368223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a323a224e6f223b6773745f73746174655f636f64657c733a303a22223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b7072655f6f725f706f73745f7061796d656e747c733a31323a22506f7374205061796d656e74223b636c69636b65645f636f6e74726f6c6c65727c733a343a2253616c65223b636c69636b65645f6d6574686f647c733a333a22504f53223b),
('c7637e62761ac546b7589876404ae9a08f7abf4c', '190.235.216.236', 1578697653, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383639373635333b6c616e67756167657c733a373a227370616e697368223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a323a224e6f223b6773745f73746174655f636f64657c733a303a22223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b7072655f6f725f706f73745f7061796d656e747c733a31323a22506f7374205061796d656e74223b636c69636b65645f636f6e74726f6c6c65727c733a343a2253616c65223b636c69636b65645f6d6574686f647c733a333a22504f53223b),
('rp4cl51ks54kgj9ush89n38vmnf2bcpf', '::1', 1600288185, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630303238383138353b),
('6a7bfeiqleu40u3sbsin78av34p8lbh1', '::1', 1600300205, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630303239393935363b),
('4o93hbj60q4sg9b8aa0p0cl8l4d3m67n', '::1', 1600300576, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630303330303330363b),
('v51379e0qnebldrckctd1okt0ov4p35g', '::1', 1600300856, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630303330303833393b),
('csl6rn9p70fntd5dc4jk5sjr8tjqqvm5', '::1', 1600302711, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630303330323431333b757365725f69647c733a313a2231223b6c616e67756167657c733a373a227370616e697368223b66756c6c5f6e616d657c733a31383a2253697374656d617320656e206f6665727461223b70686f6e657c733a393a22393530373334333334223b656d61696c5f616464726573737c733a31353a2261646d696e40676d61696c2e636f6d223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b6f75746c65745f69647c733a313a2231223b63757272656e63797c733a323a22732f223b74696d655f7a6f6e657c733a31323a22416d65726963612f4c696d61223b646174655f666f726d61747c733a353a22642f6d2f59223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a323a224e6f223b6773745f73746174655f636f64657c733a303a22223b6f75746c65745f6e616d657c733a31323a2254657861732042697374726f223b616464726573737c733a33373a2234323120452e20436f6d6d657263652053616e20416e746f6e696f2c205458203738323035223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f726567697374726174696f6e5f6e6f7c733a303a22223b696e766f6963655f7072696e747c733a333a22596573223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b7072655f6f725f706f73745f7061796d656e747c733a31323a22506f7374205061796d656e74223b636c69636b65645f636f6e74726f6c6c65727c733a32303a22437573746f6d65725f6475655f72656365697665223b636c69636b65645f6d6574686f647c733a31393a22637573746f6d65724475655265636569766573223b),
('4c2q93dqe3k0hhpopr89r83k973gjeg3', '::1', 1600303381, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630303330323732303b757365725f69647c733a313a2231223b6c616e67756167657c733a373a227370616e697368223b66756c6c5f6e616d657c733a31383a2253697374656d617320656e206f6665727461223b70686f6e657c733a393a22393530373334333334223b656d61696c5f616464726573737c733a31353a2261646d696e40676d61696c2e636f6d223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b6f75746c65745f69647c733a313a2231223b63757272656e63797c733a323a22732f223b74696d655f7a6f6e657c733a31323a22416d65726963612f4c696d61223b646174655f666f726d61747c733a353a22642f6d2f59223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a323a224e6f223b6773745f73746174655f636f64657c733a303a22223b6f75746c65745f6e616d657c733a31323a2254657861732042697374726f223b616464726573737c733a33373a2234323120452e20436f6d6d657263652053616e20416e746f6e696f2c205458203738323035223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f726567697374726174696f6e5f6e6f7c733a303a22223b696e766f6963655f7072696e747c733a333a22596573223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b7072655f6f725f706f73745f7061796d656e747c733a31323a22506f7374205061796d656e74223b),
('9uitg48jigh22v7q8aajng0l968ins34', '::1', 1600303565, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630303330333338383b757365725f69647c733a313a2231223b6c616e67756167657c733a373a227370616e697368223b66756c6c5f6e616d657c733a31383a2253697374656d617320656e206f6665727461223b70686f6e657c733a393a22393530373334333334223b656d61696c5f616464726573737c733a31353a2261646d696e40676d61696c2e636f6d223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b6f75746c65745f69647c733a313a2231223b63757272656e63797c733a323a22732f223b74696d655f7a6f6e657c733a31323a22416d65726963612f4c696d61223b646174655f666f726d61747c733a353a22642f6d2f59223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a323a224e6f223b6773745f73746174655f636f64657c733a303a22223b6f75746c65745f6e616d657c733a31323a2254657861732042697374726f223b616464726573737c733a33373a2234323120452e20436f6d6d657263652053616e20416e746f6e696f2c205458203738323035223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f726567697374726174696f6e5f6e6f7c733a303a22223b696e766f6963655f7072696e747c733a333a22596573223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b7072655f6f725f706f73745f7061796d656e747c733a31323a22506f7374205061796d656e74223b),
('ee019o4ofiqsgjaql31sec8hv9gvnerl', '::1', 1600303992, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630303330333639393b757365725f69647c733a313a2231223b6c616e67756167657c733a373a227370616e697368223b66756c6c5f6e616d657c733a31383a2253697374656d617320656e206f6665727461223b70686f6e657c733a393a22393530373334333334223b656d61696c5f616464726573737c733a31353a2261646d696e40676d61696c2e636f6d223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b6f75746c65745f69647c733a313a2231223b63757272656e63797c733a323a22732f223b74696d655f7a6f6e657c733a31323a22416d65726963612f4c696d61223b646174655f666f726d61747c733a353a22642f6d2f59223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a323a224e6f223b6773745f73746174655f636f64657c733a303a22223b6f75746c65745f6e616d657c733a31323a2254657861732042697374726f223b616464726573737c733a33373a2234323120452e20436f6d6d657263652053616e20416e746f6e696f2c205458203738323035223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f726567697374726174696f6e5f6e6f7c733a303a22223b696e766f6963655f7072696e747c733a333a22596573223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b7072655f6f725f706f73745f7061796d656e747c733a31323a22506f7374205061796d656e74223b),
('b2mrcm1d67ruhrimkn48pvi1om7nmjrp', '::1', 1600304216, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630303330343030343b6c616e67756167657c733a373a227370616e697368223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a323a224e6f223b6773745f73746174655f636f64657c733a303a22223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b7072655f6f725f706f73745f7061796d656e747c733a31323a22506f7374205061796d656e74223b);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `id` int(11) NOT NULL,
  `date_format` varchar(20) DEFAULT NULL,
  `time_zone` varchar(50) DEFAULT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Volcado de datos para la tabla `tbl_settings`
--

INSERT INTO `tbl_settings` (`id`, `date_format`, `time_zone`, `currency`, `company_id`, `del_status`) VALUES
(4, 'd/m/Y', 'America/Lima', 's/', 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sms_settings`
--

CREATE TABLE `tbl_sms_settings` (
  `id` int(11) NOT NULL,
  `email_address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `del_status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Live'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_sms_settings`
--

INSERT INTO `tbl_sms_settings` (`id`, `email_address`, `password`, `company_id`, `del_status`) VALUES
(1, 'info@your-domain.com', '123456', 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_suppliers`
--

CREATE TABLE `tbl_suppliers` (
  `id` int(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `contact_person` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_suppliers`
--

INSERT INTO `tbl_suppliers` (`id`, `name`, `contact_person`, `phone`, `email`, `address`, `description`, `user_id`, `company_id`, `del_status`) VALUES
(1, 'san fernando', 'jorge', '989899989', '', '', '', 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_supplier_payments`
--

CREATE TABLE `tbl_supplier_payments` (
  `id` int(10) NOT NULL,
  `date` date DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `outlet_id` int(10) DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tables`
--

CREATE TABLE `tbl_tables` (
  `id` int(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `sit_capacity` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `outlet_id` int(10) DEFAULT NULL,
  `company_id` int(10) DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_tables`
--

INSERT INTO `tbl_tables` (`id`, `name`, `sit_capacity`, `position`, `description`, `user_id`, `outlet_id`, `company_id`, `del_status`) VALUES
(1, 'salon1', '15', '1', '', 1, 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_temp_kot`
--

CREATE TABLE `tbl_temp_kot` (
  `id` int(10) NOT NULL,
  `temp_kot_info` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_time_zone`
--

CREATE TABLE `tbl_time_zone` (
  `id` int(10) NOT NULL,
  `country_code` varchar(2) DEFAULT NULL,
  `zone_name` varchar(35) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Volcado de datos para la tabla `tbl_time_zone`
--

INSERT INTO `tbl_time_zone` (`id`, `country_code`, `zone_name`, `del_status`) VALUES
(1, 'AD', 'Europe/Andorra', 'Live'),
(2, 'AE', 'Asia/Dubai', 'Live'),
(3, 'AF', 'Asia/Kabul', 'Live'),
(4, 'AG', 'America/Antigua', 'Live'),
(5, 'AI', 'America/Anguilla', 'Live'),
(6, 'AL', 'Europe/Tirane', 'Live'),
(7, 'AM', 'Asia/Yerevan', 'Live'),
(8, 'AO', 'Africa/Luanda', 'Live'),
(9, 'AQ', 'Antarctica/McMurdo', 'Live'),
(10, 'AQ', 'Antarctica/Casey', 'Live'),
(11, 'AQ', 'Antarctica/Davis', 'Live'),
(12, 'AQ', 'Antarctica/DumontDUrville', 'Live'),
(13, 'AQ', 'Antarctica/Mawson', 'Live'),
(14, 'AQ', 'Antarctica/Palmer', 'Live'),
(15, 'AQ', 'Antarctica/Rothera', 'Live'),
(16, 'AQ', 'Antarctica/Syowa', 'Live'),
(17, 'AQ', 'Antarctica/Troll', 'Live'),
(18, 'AQ', 'Antarctica/Vostok', 'Live'),
(19, 'AR', 'America/Argentina/Buenos_Aires', 'Live'),
(20, 'AR', 'America/Argentina/Cordoba', 'Live'),
(21, 'AR', 'America/Argentina/Salta', 'Live'),
(22, 'AR', 'America/Argentina/Jujuy', 'Live'),
(23, 'AR', 'America/Argentina/Tucuman', 'Live'),
(24, 'AR', 'America/Argentina/Catamarca', 'Live'),
(25, 'AR', 'America/Argentina/La_Rioja', 'Live'),
(26, 'AR', 'America/Argentina/San_Juan', 'Live'),
(27, 'AR', 'America/Argentina/Mendoza', 'Live'),
(28, 'AR', 'America/Argentina/San_Luis', 'Live'),
(29, 'AR', 'America/Argentina/Rio_Gallegos', 'Live'),
(30, 'AR', 'America/Argentina/Ushuaia', 'Live'),
(31, 'AS', 'Pacific/Pago_Pago', 'Live'),
(32, 'AT', 'Europe/Vienna', 'Live'),
(33, 'AU', 'Australia/Lord_Howe', 'Live'),
(34, 'AU', 'Antarctica/Macquarie', 'Live'),
(35, 'AU', 'Australia/Hobart', 'Live'),
(36, 'AU', 'Australia/Currie', 'Live'),
(37, 'AU', 'Australia/Melbourne', 'Live'),
(38, 'AU', 'Australia/Sydney', 'Live'),
(39, 'AU', 'Australia/Broken_Hill', 'Live'),
(40, 'AU', 'Australia/Brisbane', 'Live'),
(41, 'AU', 'Australia/Lindeman', 'Live'),
(42, 'AU', 'Australia/Adelaide', 'Live'),
(43, 'AU', 'Australia/Darwin', 'Live'),
(44, 'AU', 'Australia/Perth', 'Live'),
(45, 'AU', 'Australia/Eucla', 'Live'),
(46, 'AW', 'America/Aruba', 'Live'),
(47, 'AX', 'Europe/Mariehamn', 'Live'),
(48, 'AZ', 'Asia/Baku', 'Live'),
(49, 'BA', 'Europe/Sarajevo', 'Live'),
(50, 'BB', 'America/Barbados', 'Live'),
(51, 'BD', 'Asia/Dhaka', 'Live'),
(52, 'BE', 'Europe/Brussels', 'Live'),
(53, 'BF', 'Africa/Ouagadougou', 'Live'),
(54, 'BG', 'Europe/Sofia', 'Live'),
(55, 'BH', 'Asia/Bahrain', 'Live'),
(56, 'BI', 'Africa/Bujumbura', 'Live'),
(57, 'BJ', 'Africa/Porto-Novo', 'Live'),
(58, 'BL', 'America/St_Barthelemy', 'Live'),
(59, 'BM', 'Atlantic/Bermuda', 'Live'),
(60, 'BN', 'Asia/Brunei', 'Live'),
(61, 'BO', 'America/La_Paz', 'Live'),
(62, 'BQ', 'America/Kralendijk', 'Live'),
(63, 'BR', 'America/Noronha', 'Live'),
(64, 'BR', 'America/Belem', 'Live'),
(65, 'BR', 'America/Fortaleza', 'Live'),
(66, 'BR', 'America/Recife', 'Live'),
(67, 'BR', 'America/Araguaina', 'Live'),
(68, 'BR', 'America/Maceio', 'Live'),
(69, 'BR', 'America/Bahia', 'Live'),
(70, 'BR', 'America/Sao_Paulo', 'Live'),
(71, 'BR', 'America/Campo_Grande', 'Live'),
(72, 'BR', 'America/Cuiaba', 'Live'),
(73, 'BR', 'America/Santarem', 'Live'),
(74, 'BR', 'America/Porto_Velho', 'Live'),
(75, 'BR', 'America/Boa_Vista', 'Live'),
(76, 'BR', 'America/Manaus', 'Live'),
(77, 'BR', 'America/Eirunepe', 'Live'),
(78, 'BR', 'America/Rio_Branco', 'Live'),
(79, 'BS', 'America/Nassau', 'Live'),
(80, 'BT', 'Asia/Thimphu', 'Live'),
(81, 'BW', 'Africa/Gaborone', 'Live'),
(82, 'BY', 'Europe/Minsk', 'Live'),
(83, 'BZ', 'America/Belize', 'Live'),
(84, 'CA', 'America/St_Johns', 'Live'),
(85, 'CA', 'America/Halifax', 'Live'),
(86, 'CA', 'America/Glace_Bay', 'Live'),
(87, 'CA', 'America/Moncton', 'Live'),
(88, 'CA', 'America/Goose_Bay', 'Live'),
(89, 'CA', 'America/Blanc-Sablon', 'Live'),
(90, 'CA', 'America/Toronto', 'Live'),
(91, 'CA', 'America/Nipigon', 'Live'),
(92, 'CA', 'America/Thunder_Bay', 'Live'),
(93, 'CA', 'America/Iqaluit', 'Live'),
(94, 'CA', 'America/Pangnirtung', 'Live'),
(95, 'CA', 'America/Atikokan', 'Live'),
(96, 'CA', 'America/Winnipeg', 'Live'),
(97, 'CA', 'America/Rainy_River', 'Live'),
(98, 'CA', 'America/Resolute', 'Live'),
(99, 'CA', 'America/Rankin_Inlet', 'Live'),
(100, 'CA', 'America/Regina', 'Live'),
(101, 'CA', 'America/Swift_Current', 'Live'),
(102, 'CA', 'America/Edmonton', 'Live'),
(103, 'CA', 'America/Cambridge_Bay', 'Live'),
(104, 'CA', 'America/Yellowknife', 'Live'),
(105, 'CA', 'America/Inuvik', 'Live'),
(106, 'CA', 'America/Creston', 'Live'),
(107, 'CA', 'America/Dawson_Creek', 'Live'),
(108, 'CA', 'America/Fort_Nelson', 'Live'),
(109, 'CA', 'America/Vancouver', 'Live'),
(110, 'CA', 'America/Whitehorse', 'Live'),
(111, 'CA', 'America/Dawson', 'Live'),
(112, 'CC', 'Indian/Cocos', 'Live'),
(113, 'CD', 'Africa/Kinshasa', 'Live'),
(114, 'CD', 'Africa/Lubumbashi', 'Live'),
(115, 'CF', 'Africa/Bangui', 'Live'),
(116, 'CG', 'Africa/Brazzaville', 'Live'),
(117, 'CH', 'Europe/Zurich', 'Live'),
(118, 'CI', 'Africa/Abidjan', 'Live'),
(119, 'CK', 'Pacific/Rarotonga', 'Live'),
(120, 'CL', 'America/Santiago', 'Live'),
(121, 'CL', 'America/Punta_Arenas', 'Live'),
(122, 'CL', 'Pacific/Easter', 'Live'),
(123, 'CM', 'Africa/Douala', 'Live'),
(124, 'CN', 'Asia/Shanghai', 'Live'),
(125, 'CN', 'Asia/Urumqi', 'Live'),
(126, 'CO', 'America/Bogota', 'Live'),
(127, 'CR', 'America/Costa_Rica', 'Live'),
(128, 'CU', 'America/Havana', 'Live'),
(129, 'CV', 'Atlantic/Cape_Verde', 'Live'),
(130, 'CW', 'America/Curacao', 'Live'),
(131, 'CX', 'Indian/Christmas', 'Live'),
(132, 'CY', 'Asia/Nicosia', 'Live'),
(133, 'CY', 'Asia/Famagusta', 'Live'),
(134, 'CZ', 'Europe/Prague', 'Live'),
(135, 'DE', 'Europe/Berlin', 'Live'),
(136, 'DE', 'Europe/Busingen', 'Live'),
(137, 'DJ', 'Africa/Djibouti', 'Live'),
(138, 'DK', 'Europe/Copenhagen', 'Live'),
(139, 'DM', 'America/Dominica', 'Live'),
(140, 'DO', 'America/Santo_Domingo', 'Live'),
(141, 'DZ', 'Africa/Algiers', 'Live'),
(142, 'EC', 'America/Guayaquil', 'Live'),
(143, 'EC', 'Pacific/Galapagos', 'Live'),
(144, 'EE', 'Europe/Tallinn', 'Live'),
(145, 'EG', 'Africa/Cairo', 'Live'),
(146, 'EH', 'Africa/El_Aaiun', 'Live'),
(147, 'ER', 'Africa/Asmara', 'Live'),
(148, 'ES', 'Europe/Madrid', 'Live'),
(149, 'ES', 'Africa/Ceuta', 'Live'),
(150, 'ES', 'Atlantic/Canary', 'Live'),
(151, 'ET', 'Africa/Addis_Ababa', 'Live'),
(152, 'FI', 'Europe/Helsinki', 'Live'),
(153, 'FJ', 'Pacific/Fiji', 'Live'),
(154, 'FK', 'Atlantic/Stanley', 'Live'),
(155, 'FM', 'Pacific/Chuuk', 'Live'),
(156, 'FM', 'Pacific/Pohnpei', 'Live'),
(157, 'FM', 'Pacific/Kosrae', 'Live'),
(158, 'FO', 'Atlantic/Faroe', 'Live'),
(159, 'FR', 'Europe/Paris', 'Live'),
(160, 'GA', 'Africa/Libreville', 'Live'),
(161, 'GB', 'Europe/London', 'Live'),
(162, 'GD', 'America/Grenada', 'Live'),
(163, 'GE', 'Asia/Tbilisi', 'Live'),
(164, 'GF', 'America/Cayenne', 'Live'),
(165, 'GG', 'Europe/Guernsey', 'Live'),
(166, 'GH', 'Africa/Accra', 'Live'),
(167, 'GI', 'Europe/Gibraltar', 'Live'),
(168, 'GL', 'America/Godthab', 'Live'),
(169, 'GL', 'America/Danmarkshavn', 'Live'),
(170, 'GL', 'America/Scoresbysund', 'Live'),
(171, 'GL', 'America/Thule', 'Live'),
(172, 'GM', 'Africa/Banjul', 'Live'),
(173, 'GN', 'Africa/Conakry', 'Live'),
(174, 'GP', 'America/Guadeloupe', 'Live'),
(175, 'GQ', 'Africa/Malabo', 'Live'),
(176, 'GR', 'Europe/Athens', 'Live'),
(177, 'GS', 'Atlantic/South_Georgia', 'Live'),
(178, 'GT', 'America/Guatemala', 'Live'),
(179, 'GU', 'Pacific/Guam', 'Live'),
(180, 'GW', 'Africa/Bissau', 'Live'),
(181, 'GY', 'America/Guyana', 'Live'),
(182, 'HK', 'Asia/Hong_Kong', 'Live'),
(183, 'HN', 'America/Tegucigalpa', 'Live'),
(184, 'HR', 'Europe/Zagreb', 'Live'),
(185, 'HT', 'America/Port-au-Prince', 'Live'),
(186, 'HU', 'Europe/Budapest', 'Live'),
(187, 'ID', 'Asia/Jakarta', 'Live'),
(188, 'ID', 'Asia/Pontianak', 'Live'),
(189, 'ID', 'Asia/Makassar', 'Live'),
(190, 'ID', 'Asia/Jayapura', 'Live'),
(191, 'IE', 'Europe/Dublin', 'Live'),
(192, 'IL', 'Asia/Jerusalem', 'Live'),
(193, 'IM', 'Europe/Isle_of_Man', 'Live'),
(194, 'IN', 'Asia/Kolkata', 'Live'),
(195, 'IO', 'Indian/Chagos', 'Live'),
(196, 'IQ', 'Asia/Baghdad', 'Live'),
(197, 'IR', 'Asia/Tehran', 'Live'),
(198, 'IS', 'Atlantic/Reykjavik', 'Live'),
(199, 'IT', 'Europe/Rome', 'Live'),
(200, 'JE', 'Europe/Jersey', 'Live'),
(201, 'JM', 'America/Jamaica', 'Live'),
(202, 'JO', 'Asia/Amman', 'Live'),
(203, 'JP', 'Asia/Tokyo', 'Live'),
(204, 'KE', 'Africa/Nairobi', 'Live'),
(205, 'KG', 'Asia/Bishkek', 'Live'),
(206, 'KH', 'Asia/Phnom_Penh', 'Live'),
(207, 'KI', 'Pacific/Tarawa', 'Live'),
(208, 'KI', 'Pacific/Enderbury', 'Live'),
(209, 'KI', 'Pacific/Kiritimati', 'Live'),
(210, 'KM', 'Indian/Comoro', 'Live'),
(211, 'KN', 'America/St_Kitts', 'Live'),
(212, 'KP', 'Asia/Pyongyang', 'Live'),
(213, 'KR', 'Asia/Seoul', 'Live'),
(214, 'KW', 'Asia/Kuwait', 'Live'),
(215, 'KY', 'America/Cayman', 'Live'),
(216, 'KZ', 'Asia/Almaty', 'Live'),
(217, 'KZ', 'Asia/Qyzylorda', 'Live'),
(218, 'KZ', 'Asia/Aqtobe', 'Live'),
(219, 'KZ', 'Asia/Aqtau', 'Live'),
(220, 'KZ', 'Asia/Atyrau', 'Live'),
(221, 'KZ', 'Asia/Oral', 'Live'),
(222, 'LA', 'Asia/Vientiane', 'Live'),
(223, 'LB', 'Asia/Beirut', 'Live'),
(224, 'LC', 'America/St_Lucia', 'Live'),
(225, 'LI', 'Europe/Vaduz', 'Live'),
(226, 'LK', 'Asia/Colombo', 'Live'),
(227, 'LR', 'Africa/Monrovia', 'Live'),
(228, 'LS', 'Africa/Maseru', 'Live'),
(229, 'LT', 'Europe/Vilnius', 'Live'),
(230, 'LU', 'Europe/Luxembourg', 'Live'),
(231, 'LV', 'Europe/Riga', 'Live'),
(232, 'LY', 'Africa/Tripoli', 'Live'),
(233, 'MA', 'Africa/Casablanca', 'Live'),
(234, 'MC', 'Europe/Monaco', 'Live'),
(235, 'MD', 'Europe/Chisinau', 'Live'),
(236, 'ME', 'Europe/Podgorica', 'Live'),
(237, 'MF', 'America/Marigot', 'Live'),
(238, 'MG', 'Indian/Antananarivo', 'Live'),
(239, 'MH', 'Pacific/Majuro', 'Live'),
(240, 'MH', 'Pacific/Kwajalein', 'Live'),
(241, 'MK', 'Europe/Skopje', 'Live'),
(242, 'ML', 'Africa/Bamako', 'Live'),
(243, 'MM', 'Asia/Yangon', 'Live'),
(244, 'MN', 'Asia/Ulaanbaatar', 'Live'),
(245, 'MN', 'Asia/Hovd', 'Live'),
(246, 'MN', 'Asia/Choibalsan', 'Live'),
(247, 'MO', 'Asia/Macau', 'Live'),
(248, 'MP', 'Pacific/Saipan', 'Live'),
(249, 'MQ', 'America/Martinique', 'Live'),
(250, 'MR', 'Africa/Nouakchott', 'Live'),
(251, 'MS', 'America/Montserrat', 'Live'),
(252, 'MT', 'Europe/Malta', 'Live'),
(253, 'MU', 'Indian/Mauritius', 'Live'),
(254, 'MV', 'Indian/Maldives', 'Live'),
(255, 'MW', 'Africa/Blantyre', 'Live'),
(256, 'MX', 'America/Mexico_City', 'Live'),
(257, 'MX', 'America/Cancun', 'Live'),
(258, 'MX', 'America/Merida', 'Live'),
(259, 'MX', 'America/Monterrey', 'Live'),
(260, 'MX', 'America/Matamoros', 'Live'),
(261, 'MX', 'America/Mazatlan', 'Live'),
(262, 'MX', 'America/Chihuahua', 'Live'),
(263, 'MX', 'America/Ojinaga', 'Live'),
(264, 'MX', 'America/Hermosillo', 'Live'),
(265, 'MX', 'America/Tijuana', 'Live'),
(266, 'MX', 'America/Bahia_Banderas', 'Live'),
(267, 'MY', 'Asia/Kuala_Lumpur', 'Live'),
(268, 'MY', 'Asia/Kuching', 'Live'),
(269, 'MZ', 'Africa/Maputo', 'Live'),
(270, 'NA', 'Africa/Windhoek', 'Live'),
(271, 'NC', 'Pacific/Noumea', 'Live'),
(272, 'NE', 'Africa/Niamey', 'Live'),
(273, 'NF', 'Pacific/Norfolk', 'Live'),
(274, 'NG', 'Africa/Lagos', 'Live'),
(275, 'NI', 'America/Managua', 'Live'),
(276, 'NL', 'Europe/Amsterdam', 'Live'),
(277, 'NO', 'Europe/Oslo', 'Live'),
(278, 'NP', 'Asia/Kathmandu', 'Live'),
(279, 'NR', 'Pacific/Nauru', 'Live'),
(280, 'NU', 'Pacific/Niue', 'Live'),
(281, 'NZ', 'Pacific/Auckland', 'Live'),
(282, 'NZ', 'Pacific/Chatham', 'Live'),
(283, 'OM', 'Asia/Muscat', 'Live'),
(284, 'PA', 'America/Panama', 'Live'),
(285, 'PE', 'America/Lima', 'Live'),
(286, 'PF', 'Pacific/Tahiti', 'Live'),
(287, 'PF', 'Pacific/Marquesas', 'Live'),
(288, 'PF', 'Pacific/Gambier', 'Live'),
(289, 'PG', 'Pacific/Port_Moresby', 'Live'),
(290, 'PG', 'Pacific/Bougainville', 'Live'),
(291, 'PH', 'Asia/Manila', 'Live'),
(292, 'PK', 'Asia/Karachi', 'Live'),
(293, 'PL', 'Europe/Warsaw', 'Live'),
(294, 'PM', 'America/Miquelon', 'Live'),
(295, 'PN', 'Pacific/Pitcairn', 'Live'),
(296, 'PR', 'America/Puerto_Rico', 'Live'),
(297, 'PS', 'Asia/Gaza', 'Live'),
(298, 'PS', 'Asia/Hebron', 'Live'),
(299, 'PT', 'Europe/Lisbon', 'Live'),
(300, 'PT', 'Atlantic/Madeira', 'Live'),
(301, 'PT', 'Atlantic/Azores', 'Live'),
(302, 'PW', 'Pacific/Palau', 'Live'),
(303, 'PY', 'America/Asuncion', 'Live'),
(304, 'QA', 'Asia/Qatar', 'Live'),
(305, 'RE', 'Indian/Reunion', 'Live'),
(306, 'RO', 'Europe/Bucharest', 'Live'),
(307, 'RS', 'Europe/Belgrade', 'Live'),
(308, 'RU', 'Europe/Kaliningrad', 'Live'),
(309, 'RU', 'Europe/Moscow', 'Live'),
(310, 'RU', 'Europe/Simferopol', 'Live'),
(311, 'RU', 'Europe/Volgograd', 'Live'),
(312, 'RU', 'Europe/Kirov', 'Live'),
(313, 'RU', 'Europe/Astrakhan', 'Live'),
(314, 'RU', 'Europe/Saratov', 'Live'),
(315, 'RU', 'Europe/Ulyanovsk', 'Live'),
(316, 'RU', 'Europe/Samara', 'Live'),
(317, 'RU', 'Asia/Yekaterinburg', 'Live'),
(318, 'RU', 'Asia/Omsk', 'Live'),
(319, 'RU', 'Asia/Novosibirsk', 'Live'),
(320, 'RU', 'Asia/Barnaul', 'Live'),
(321, 'RU', 'Asia/Tomsk', 'Live'),
(322, 'RU', 'Asia/Novokuznetsk', 'Live'),
(323, 'RU', 'Asia/Krasnoyarsk', 'Live'),
(324, 'RU', 'Asia/Irkutsk', 'Live'),
(325, 'RU', 'Asia/Chita', 'Live'),
(326, 'RU', 'Asia/Yakutsk', 'Live'),
(327, 'RU', 'Asia/Khandyga', 'Live'),
(328, 'RU', 'Asia/Vladivostok', 'Live'),
(329, 'RU', 'Asia/Ust-Nera', 'Live'),
(330, 'RU', 'Asia/Magadan', 'Live'),
(331, 'RU', 'Asia/Sakhalin', 'Live'),
(332, 'RU', 'Asia/Srednekolymsk', 'Live'),
(333, 'RU', 'Asia/Kamchatka', 'Live'),
(334, 'RU', 'Asia/Anadyr', 'Live'),
(335, 'RW', 'Africa/Kigali', 'Live'),
(336, 'SA', 'Asia/Riyadh', 'Live'),
(337, 'SB', 'Pacific/Guadalcanal', 'Live'),
(338, 'SC', 'Indian/Mahe', 'Live'),
(339, 'SD', 'Africa/Khartoum', 'Live'),
(340, 'SE', 'Europe/Stockholm', 'Live'),
(341, 'SG', 'Asia/Singapore', 'Live'),
(342, 'SH', 'Atlantic/St_Helena', 'Live'),
(343, 'SI', 'Europe/Ljubljana', 'Live'),
(344, 'SJ', 'Arctic/Longyearbyen', 'Live'),
(345, 'SK', 'Europe/Bratislava', 'Live'),
(346, 'SL', 'Africa/Freetown', 'Live'),
(347, 'SM', 'Europe/San_Marino', 'Live'),
(348, 'SN', 'Africa/Dakar', 'Live'),
(349, 'SO', 'Africa/Mogadishu', 'Live'),
(350, 'SR', 'America/Paramaribo', 'Live'),
(351, 'SS', 'Africa/Juba', 'Live'),
(352, 'ST', 'Africa/Sao_Tome', 'Live'),
(353, 'SV', 'America/El_Salvador', 'Live'),
(354, 'SX', 'America/Lower_Princes', 'Live'),
(355, 'SY', 'Asia/Damascus', 'Live'),
(356, 'SZ', 'Africa/Mbabane', 'Live'),
(357, 'TC', 'America/Grand_Turk', 'Live'),
(358, 'TD', 'Africa/Ndjamena', 'Live'),
(359, 'TF', 'Indian/Kerguelen', 'Live'),
(360, 'TG', 'Africa/Lome', 'Live'),
(361, 'TH', 'Asia/Bangkok', 'Live'),
(362, 'TJ', 'Asia/Dushanbe', 'Live'),
(363, 'TK', 'Pacific/Fakaofo', 'Live'),
(364, 'TL', 'Asia/Dili', 'Live'),
(365, 'TM', 'Asia/Ashgabat', 'Live'),
(366, 'TN', 'Africa/Tunis', 'Live'),
(367, 'TO', 'Pacific/Tongatapu', 'Live'),
(368, 'TR', 'Europe/Istanbul', 'Live'),
(369, 'TT', 'America/Port_of_Spain', 'Live'),
(370, 'TV', 'Pacific/Funafuti', 'Live'),
(371, 'TW', 'Asia/Taipei', 'Live'),
(372, 'TZ', 'Africa/Dar_es_Salaam', 'Live'),
(373, 'UA', 'Europe/Kiev', 'Live'),
(374, 'UA', 'Europe/Uzhgorod', 'Live'),
(375, 'UA', 'Europe/Zaporozhye', 'Live'),
(376, 'UG', 'Africa/Kampala', 'Live'),
(377, 'UM', 'Pacific/Midway', 'Live'),
(378, 'UM', 'Pacific/Wake', 'Live'),
(379, 'US', 'America/New_York', 'Live'),
(380, 'US', 'America/Detroit', 'Live'),
(381, 'US', 'America/Kentucky/Louisville', 'Live'),
(382, 'US', 'America/Kentucky/Monticello', 'Live'),
(383, 'US', 'America/Indiana/Indianapolis', 'Live'),
(384, 'US', 'America/Indiana/Vincennes', 'Live'),
(385, 'US', 'America/Indiana/Winamac', 'Live'),
(386, 'US', 'America/Indiana/Marengo', 'Live'),
(387, 'US', 'America/Indiana/Petersburg', 'Live'),
(388, 'US', 'America/Indiana/Vevay', 'Live'),
(389, 'US', 'America/Chicago', 'Live'),
(390, 'US', 'America/Indiana/Tell_City', 'Live'),
(391, 'US', 'America/Indiana/Knox', 'Live'),
(392, 'US', 'America/Menominee', 'Live'),
(393, 'US', 'America/North_Dakota/Center', 'Live'),
(394, 'US', 'America/North_Dakota/New_Salem', 'Live'),
(395, 'US', 'America/North_Dakota/Beulah', 'Live'),
(396, 'US', 'America/Denver', 'Live'),
(397, 'US', 'America/Boise', 'Live'),
(398, 'US', 'America/Phoenix', 'Live'),
(399, 'US', 'America/Los_Angeles', 'Live'),
(400, 'US', 'America/Anchorage', 'Live'),
(401, 'US', 'America/Juneau', 'Live'),
(402, 'US', 'America/Sitka', 'Live'),
(403, 'US', 'America/Metlakatla', 'Live'),
(404, 'US', 'America/Yakutat', 'Live'),
(405, 'US', 'America/Nome', 'Live'),
(406, 'US', 'America/Adak', 'Live'),
(407, 'US', 'Pacific/Honolulu', 'Live'),
(408, 'UY', 'America/Montevideo', 'Live'),
(409, 'UZ', 'Asia/Samarkand', 'Live'),
(410, 'UZ', 'Asia/Tashkent', 'Live'),
(411, 'VA', 'Europe/Vatican', 'Live'),
(412, 'VC', 'America/St_Vincent', 'Live'),
(413, 'VE', 'America/Caracas', 'Live'),
(414, 'VG', 'America/Tortola', 'Live'),
(415, 'VI', 'America/St_Thomas', 'Live'),
(416, 'VN', 'Asia/Ho_Chi_Minh', 'Live'),
(417, 'VU', 'Pacific/Efate', 'Live'),
(418, 'WF', 'Pacific/Wallis', 'Live'),
(419, 'WS', 'Pacific/Apia', 'Live'),
(420, 'YE', 'Asia/Aden', 'Live'),
(421, 'YT', 'Indian/Mayotte', 'Live'),
(422, 'ZA', 'Africa/Johannesburg', 'Live'),
(423, 'ZM', 'Africa/Lusaka', 'Live'),
(424, 'ZW', 'Africa/Harare', 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_units`
--

CREATE TABLE `tbl_units` (
  `id` int(10) NOT NULL,
  `unit_name` varchar(10) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `company_id` int(1) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tbl_units`
--

INSERT INTO `tbl_units` (`id`, `unit_name`, `description`, `company_id`, `del_status`) VALUES
(1, 'unidad', '', 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(10) NOT NULL,
  `full_name` varchar(25) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email_address` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `will_login` varchar(20) NOT NULL DEFAULT 'No',
  `role` varchar(25) NOT NULL,
  `outlet_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  `account_creation_date` datetime NOT NULL,
  `language` varchar(100) NOT NULL DEFAULT 'english',
  `last_login` datetime NOT NULL,
  `active_status` varchar(25) NOT NULL DEFAULT 'Active',
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `full_name`, `phone`, `email_address`, `password`, `designation`, `will_login`, `role`, `outlet_id`, `company_id`, `account_creation_date`, `language`, `last_login`, `active_status`, `del_status`) VALUES
(1, 'Sistemas en oferta', '950734334', 'admin@gmail.com', 'admin', NULL, 'No', 'Admin', 1, 1, '2018-02-17 07:28:32', 'spanish', '2019-01-01 01:01:01', 'Active', 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_user_menu_access`
--

CREATE TABLE `tbl_user_menu_access` (
  `id` int(10) NOT NULL,
  `menu_id` int(10) DEFAULT '0',
  `user_id` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_user_menu_access`
--

INSERT INTO `tbl_user_menu_access` (`id`, `menu_id`, `user_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 9, 1),
(12, 11, 1),
(46, 13, 1),
(103, 14, 1),
(104, 15, 1),
(118, 16, 1),
(133, 5, 1),
(134, 10, 1),
(135, 12, 1),
(140, 17, 1),
(141, 18, 1),
(142, 19, 1),
(143, 16, 3),
(144, 17, 3),
(145, 15, 3),
(146, 8, 3),
(147, 6, 3),
(148, 3, 3),
(149, 13, 3),
(150, 18, 3),
(151, 9, 3),
(152, 2, 3),
(153, 7, 3),
(154, 1, 3),
(155, 14, 3),
(156, 11, 3),
(157, 10, 3),
(158, 19, 3),
(159, 4, 3),
(160, 17, 4),
(161, 18, 4),
(162, 19, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_vats`
--

CREATE TABLE `tbl_vats` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `percentage` float(10,2) NOT NULL,
  `user_id` float(10,2) NOT NULL DEFAULT '1.00',
  `company_id` int(11) DEFAULT NULL,
  `del_status` varchar(6) DEFAULT 'Live'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_vats`
--

INSERT INTO `tbl_vats` (`id`, `name`, `percentage`, `user_id`, `company_id`, `del_status`) VALUES
(1, 'General VAT', 15.00, 0.00, 1, 'Live'),
(2, 'Sales Tax', 15.00, 1.00, 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_wastes`
--

CREATE TABLE `tbl_wastes` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `date` date NOT NULL,
  `total_loss` float(10,2) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `employee_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `outlet_id` int(10) DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live',
  `food_menu_id` int(11) DEFAULT NULL,
  `food_menu_waste_qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_waste_ingredients`
--

CREATE TABLE `tbl_waste_ingredients` (
  `id` int(10) NOT NULL,
  `ingredient_id` int(10) DEFAULT NULL,
  `waste_amount` float(10,2) DEFAULT NULL,
  `last_purchase_price` float(10,2) DEFAULT NULL,
  `loss_amount` float(10,2) DEFAULT NULL,
  `waste_id` int(10) DEFAULT NULL,
  `outlet_id` int(10) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_admin_user_menus`
--
ALTER TABLE `tbl_admin_user_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_attendance`
--
ALTER TABLE `tbl_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_companies`
--
ALTER TABLE `tbl_companies`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_customers`
--
ALTER TABLE `tbl_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_customer_due_receives`
--
ALTER TABLE `tbl_customer_due_receives`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_expenses`
--
ALTER TABLE `tbl_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_expense_items`
--
ALTER TABLE `tbl_expense_items`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_food_menus`
--
ALTER TABLE `tbl_food_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_food_menus_ingredients`
--
ALTER TABLE `tbl_food_menus_ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_food_menus_modifiers`
--
ALTER TABLE `tbl_food_menus_modifiers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_food_menu_categories`
--
ALTER TABLE `tbl_food_menu_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_holds`
--
ALTER TABLE `tbl_holds`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_holds_details`
--
ALTER TABLE `tbl_holds_details`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_holds_details_modifiers`
--
ALTER TABLE `tbl_holds_details_modifiers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_ingredients`
--
ALTER TABLE `tbl_ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_ingredient_categories`
--
ALTER TABLE `tbl_ingredient_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_inventory_adjustment`
--
ALTER TABLE `tbl_inventory_adjustment`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_modifiers`
--
ALTER TABLE `tbl_modifiers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_modifier_ingredients`
--
ALTER TABLE `tbl_modifier_ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_notifications`
--
ALTER TABLE `tbl_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_notification_bar_kitchen_panel`
--
ALTER TABLE `tbl_notification_bar_kitchen_panel`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_orders_table`
--
ALTER TABLE `tbl_orders_table`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_outlets`
--
ALTER TABLE `tbl_outlets`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_outlet_taxes`
--
ALTER TABLE `tbl_outlet_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_payment_methods`
--
ALTER TABLE `tbl_payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_purchase`
--
ALTER TABLE `tbl_purchase`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_purchase_ingredients`
--
ALTER TABLE `tbl_purchase_ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_register`
--
ALTER TABLE `tbl_register`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_sales`
--
ALTER TABLE `tbl_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_sales_details`
--
ALTER TABLE `tbl_sales_details`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_sales_details_modifiers`
--
ALTER TABLE `tbl_sales_details_modifiers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_sale_consumptions`
--
ALTER TABLE `tbl_sale_consumptions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_sale_consumptions_of_menus`
--
ALTER TABLE `tbl_sale_consumptions_of_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_sale_consumptions_of_modifiers_of_menus`
--
ALTER TABLE `tbl_sale_consumptions_of_modifiers_of_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_sessions`
--
ALTER TABLE `tbl_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indices de la tabla `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_sms_settings`
--
ALTER TABLE `tbl_sms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_suppliers`
--
ALTER TABLE `tbl_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_supplier_payments`
--
ALTER TABLE `tbl_supplier_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_tables`
--
ALTER TABLE `tbl_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_temp_kot`
--
ALTER TABLE `tbl_temp_kot`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_time_zone`
--
ALTER TABLE `tbl_time_zone`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_units`
--
ALTER TABLE `tbl_units`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_user_menu_access`
--
ALTER TABLE `tbl_user_menu_access`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_wastes`
--
ALTER TABLE `tbl_wastes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_waste_ingredients`
--
ALTER TABLE `tbl_waste_ingredients`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_admin_user_menus`
--
ALTER TABLE `tbl_admin_user_menus`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `tbl_attendance`
--
ALTER TABLE `tbl_attendance`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_companies`
--
ALTER TABLE `tbl_companies`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_customers`
--
ALTER TABLE `tbl_customers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `tbl_customer_due_receives`
--
ALTER TABLE `tbl_customer_due_receives`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_expenses`
--
ALTER TABLE `tbl_expenses`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_expense_items`
--
ALTER TABLE `tbl_expense_items`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_food_menus`
--
ALTER TABLE `tbl_food_menus`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_food_menus_ingredients`
--
ALTER TABLE `tbl_food_menus_ingredients`
  MODIFY `id` bigint(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_food_menus_modifiers`
--
ALTER TABLE `tbl_food_menus_modifiers`
  MODIFY `id` bigint(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_food_menu_categories`
--
ALTER TABLE `tbl_food_menu_categories`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_holds`
--
ALTER TABLE `tbl_holds`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_holds_details`
--
ALTER TABLE `tbl_holds_details`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_holds_details_modifiers`
--
ALTER TABLE `tbl_holds_details_modifiers`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_ingredients`
--
ALTER TABLE `tbl_ingredients`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_ingredient_categories`
--
ALTER TABLE `tbl_ingredient_categories`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_inventory_adjustment`
--
ALTER TABLE `tbl_inventory_adjustment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_modifiers`
--
ALTER TABLE `tbl_modifiers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_modifier_ingredients`
--
ALTER TABLE `tbl_modifier_ingredients`
  MODIFY `id` bigint(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_notifications`
--
ALTER TABLE `tbl_notifications`
  MODIFY `id` bigint(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_notification_bar_kitchen_panel`
--
ALTER TABLE `tbl_notification_bar_kitchen_panel`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_orders_table`
--
ALTER TABLE `tbl_orders_table`
  MODIFY `id` bigint(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_outlets`
--
ALTER TABLE `tbl_outlets`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_outlet_taxes`
--
ALTER TABLE `tbl_outlet_taxes`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_payment_methods`
--
ALTER TABLE `tbl_payment_methods`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_purchase`
--
ALTER TABLE `tbl_purchase`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_purchase_ingredients`
--
ALTER TABLE `tbl_purchase_ingredients`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_register`
--
ALTER TABLE `tbl_register`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_sales`
--
ALTER TABLE `tbl_sales`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_sales_details`
--
ALTER TABLE `tbl_sales_details`
  MODIFY `id` bigint(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_sales_details_modifiers`
--
ALTER TABLE `tbl_sales_details_modifiers`
  MODIFY `id` bigint(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_sale_consumptions`
--
ALTER TABLE `tbl_sale_consumptions`
  MODIFY `id` bigint(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_sale_consumptions_of_menus`
--
ALTER TABLE `tbl_sale_consumptions_of_menus`
  MODIFY `id` bigint(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_sale_consumptions_of_modifiers_of_menus`
--
ALTER TABLE `tbl_sale_consumptions_of_modifiers_of_menus`
  MODIFY `id` bigint(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_settings`
--
ALTER TABLE `tbl_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_sms_settings`
--
ALTER TABLE `tbl_sms_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_suppliers`
--
ALTER TABLE `tbl_suppliers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_supplier_payments`
--
ALTER TABLE `tbl_supplier_payments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_tables`
--
ALTER TABLE `tbl_tables`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_temp_kot`
--
ALTER TABLE `tbl_temp_kot`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_time_zone`
--
ALTER TABLE `tbl_time_zone`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=425;

--
-- AUTO_INCREMENT de la tabla `tbl_units`
--
ALTER TABLE `tbl_units`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tbl_user_menu_access`
--
ALTER TABLE `tbl_user_menu_access`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT de la tabla `tbl_wastes`
--
ALTER TABLE `tbl_wastes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_waste_ingredients`
--
ALTER TABLE `tbl_waste_ingredients`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
