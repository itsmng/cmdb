DROP TABLE IF EXISTS `glpi_plugin_cmdb_criticity_items`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_cmdb_criticity_items` (
   `id` int(11) UNSIGNED NOT NULL auto_increment PRIMARY KEY,
   `itemtype` varchar(100) collate utf8_unicode_ci NOT NULL COMMENT 'see .class.php file',
   `items_id` int(11) UNSIGNED NOT NULL default '0' COMMENT 'RELATION to various tables, according to itemtype (id)',
   `value` int(11) UNSIGNED NOT NULL default '0'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_cmdb_operationprocesses`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_cmdb_operationprocesses` (
   `id` int(11) UNSIGNED NOT NULL auto_increment PRIMARY KEY,
   `name` varchar(255) collate utf8_unicode_ci default '',
   `entities_id` int(11) UNSIGNED NOT NULL default '0',
   `is_recursive` tinyint(1) NOT NULL default '0',
   `plugin_cmdb_operationprocessstates_id` int(11) UNSIGNED NOT NULL default '0', 
   `users_id_tech` int(11) UNSIGNED NOT NULL default '0' COMMENT 'RELATION to glpi_users (id)', 
   `groups_id_tech` int(11) NOT NULL default '0' COMMENT 'RELATION to glpi_groups (id)',
   `locations_id` int(11) NOT NULL default '0' COMMENT 'RELATION to glpi_locations (id)',
   `date_mod` datetime default NULL,
   `is_deleted` tinyint(1) NOT NULL default '0',
   `is_helpdesk_visible` int(11) NOT NULL default '1',
   `comment` text collate utf8_unicode_ci
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_cmdb_operationprocesses_items`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_cmdb_operationprocesses_items`(
   `id` int(11) UNSIGNED NOT NULL auto_increment PRIMARY KEY,
   `plugin_cmdb_operationprocesses_id` int(11) NOT NULL default '0' COMMENT 'RELATION to glpi_plugin_cmdb_operationprocesses (id)',
   `items_id` int(11) UNSIGNED NOT NULL default '0' COMMENT 'RELATION to various tables, according to itemtype (id)',
   `itemtype` varchar(100) collate utf8_unicode_ci NOT NULL COMMENT 'see .class.php file'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_cmdb_operationprocessstates`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_cmdb_operationprocessstates` (
   `id` int(11) UNSIGNED NOT NULL auto_increment PRIMARY KEY,
   `name` varchar(255) collate utf8_unicode_ci default '',
   `comment` text collate utf8_unicode_ci
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_cmdb_typelinks`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_cmdb_typelinks` (
   `id` int(11) UNSIGNED NOT NULL auto_increment PRIMARY KEY,
   `name` varchar(255) collate utf8_unicode_ci default '',
   `entities_id` int(11) UNSIGNED NOT NULL default '0',
   `is_recursive` tinyint(1) NOT NULL default '0',
   `comment` text collate utf8_unicode_ci
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `glpi_plugin_cmdb_typelinkrights`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_cmdb_typelinkrights` (
   `id` int(11) UNSIGNED NOT NULL auto_increment PRIMARY KEY,
   `plugin_cmdb_typelinks_id` int(11) UNSIGNED NOT NULL default '0',
   `plugin_cmdb_citypes_id_1` int(11) UNSIGNED NOT NULL,
   `plugin_cmdb_citypes_id_2` int(11) UNSIGNED NOT NULL,
   `is_validated` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_cmdb_links_items`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_cmdb_links_items` (
   `id` int(11) UNSIGNED NOT NULL auto_increment PRIMARY KEY,
   `plugin_cmdb_citypes_id_1` int(11) UNSIGNED NOT NULL,
   `items_id_1` int(11) UNSIGNED NOT NULL default '0' COMMENT 'RELATION to various tables, according to plugin_cmdb_citypes_id_1',
   `plugin_cmdb_citypes_id_2` int(11) UNSIGNED NOT NULL,
   `items_id_2` int(11) UNSIGNED NOT NULL default '0' COMMENT 'RELATION to various tables, according to plugin_cmdb_citypes_id_2',
   `plugin_cmdb_typelinks_id` int(11) UNSIGNED NOT NULL default '0'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_cmdb_baselines`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_cmdb_baselines` (
   `id` int(11) UNSIGNED NOT NULL auto_increment PRIMARY KEY,
   `name` varchar(255) collate utf8_unicode_ci default '',
   `entities_id` int(11) UNSIGNED NOT NULL default '0',
   `is_recursive` tinyint(1) NOT NULL default '0',
   `plugin_cmdb_baselines_cis_id` int(11) UNSIGNED NOT NULL default '0',
   `date_mod` datetime DEFAULT NULL,
   `date_creation` datetime DEFAULT NULL,
   `users_id_tech` int(11) UNSIGNED NOT NULL default '0' COMMENT 'RELATION to glpi_users (id)', 
   `groups_id_tech` int(11) NOT NULL default '0' COMMENT 'RELATION to glpi_groups (id)',
   `plugin_cmdb_baselinestates_id` int(11) UNSIGNED NOT NULL default '0',
   `plugin_cmdb_baselinetypes_id` int(11) UNSIGNED NOT NULL default '0',
   `is_deleted` tinyint(1) NOT NULL default '0',
   `is_helpdesk_visible` int(11) NOT NULL default '1',
   `comment` text collate utf8_unicode_ci
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_cmdb_baselines_cis`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_cmdb_baselines_cis` (
   `id` int(11) UNSIGNED NOT NULL auto_increment PRIMARY KEY,
   `name` varchar(255) collate utf8_unicode_ci default '',
   `plugin_cmdb_citypes_name` varchar(255) collate utf8_unicode_ci default '',
   `types_name` varchar(255) collate utf8_unicode_ci default '',
   `criticity_value` int(11) UNSIGNED NOT NULL default '2',
   `items_id` int(11) UNSIGNED NOT NULL default '0',
   `plugin_cmdb_citypes_id` int(11) UNSIGNED NOT NULL default '0'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_cmdb_baselinetypes`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_cmdb_baselinetypes` (
   `id` int(11) UNSIGNED NOT NULL auto_increment PRIMARY KEY,
   `name` varchar(255) collate utf8_unicode_ci default '',
   `comment` text collate utf8_unicode_ci
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_cmdb_baselines_items_items`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_cmdb_baselines_items_items` (
   `id` int(11) UNSIGNED NOT NULL auto_increment PRIMARY KEY,
   `plugin_cmdb_baselines_id` int(11) UNSIGNED NOT NULL default '0',
   `plugin_cmdb_baselines_cis_id_1` int(11) UNSIGNED NOT NULL default '0',
   `plugin_cmdb_baselines_cis_id_2` int(11) UNSIGNED NOT NULL default '0',
   `plugin_cmdb_baselines_typelinks_id` varchar(255) collate utf8_unicode_ci default ''
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_cmdb_baselines_typelinks`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_cmdb_baselines_typelinks` (
   `id` int(11) UNSIGNED NOT NULL auto_increment PRIMARY KEY,
   `name` varchar(255) collate utf8_unicode_ci default ''
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `glpi_plugin_cmdb_baselinestates`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_cmdb_baselinestates` (
   `id` int(11) UNSIGNED NOT NULL auto_increment PRIMARY KEY,
   `name` varchar(255) collate utf8_unicode_ci default '',
   `comment` text collate utf8_unicode_ci
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_cmdb_citypes`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_cmdb_citypes` (
   `id` int(11) UNSIGNED NOT NULL auto_increment PRIMARY KEY,
   `name` varchar(255) collate utf8_unicode_ci default '',
   `entities_id` int(11) UNSIGNED NOT NULL default '0',
   `is_recursive` tinyint(1) NOT NULL default '0',
   `is_imported` tinyint(1) NOT NULL default '0',
   `fields` text collate utf8_unicode_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_cmdb_cis`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_cmdb_cis` (
   `id` int(11) UNSIGNED NOT NULL auto_increment PRIMARY KEY,
   `name` varchar(255) collate utf8_unicode_ci default '',
   `entities_id` int(11) UNSIGNED NOT NULL default '0',
   `is_recursive` tinyint(1) NOT NULL default '0',
   `plugin_cmdb_citypes_id` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_cmdb_cifields`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_cmdb_cifields` (
   `id` int(11) UNSIGNED NOT NULL auto_increment PRIMARY KEY,
   `name` varchar(255) collate utf8_unicode_ci default '',
   `typefield` int(11) UNSIGNED NOT NULL,
   `plugin_cmdb_citypes_id` int(11) UNSIGNED NOT NULL 
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_cmdb_civalues`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_cmdb_civalues` (
   `id` int(11) UNSIGNED NOT NULL auto_increment PRIMARY KEY,
   `value` varchar(255) collate utf8_unicode_ci default '',
   `plugin_cmdb_cis_id` int(11) UNSIGNED NOT NULL,
   `plugin_cmdb_cifields_id` int(11) UNSIGNED NOT NULL 
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_cmdb_preferences`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_cmdb_preferences` (
   `id` int(11) UNSIGNED NOT NULL auto_increment PRIMARY KEY,
   `name` varchar(255) collate utf8_unicode_ci default '',
   `value` varchar(255) collate utf8_unicode_ci default '',
   `users_id` int(11) UNSIGNED NOT NULL default '0'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_cmdb_cis_positions`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_cmdb_cis_positions` (
   `id` int(11) UNSIGNED NOT NULL auto_increment PRIMARY KEY,
   `position_x` int(11) UNSIGNED NOT NULL default '0',
   `position_y` int(11) UNSIGNED NOT NULL default '0',
   `plugin_cmdb_citypes_id` int(11) UNSIGNED NOT NULL default '0',
   `items_id` int(11) UNSIGNED NOT NULL default '0',
   `plugin_cmdb_citypes_id_ref` int(11) UNSIGNED NOT NULL default '0',
   `items_id_ref` int(11) UNSIGNED NOT NULL default '0'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_cmdb_baselines_positions`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_cmdb_baselines_positions` (
   `id` int(11) UNSIGNED NOT NULL auto_increment PRIMARY KEY,
   `position_x` int(11) UNSIGNED NOT NULL default '0',
   `position_y` int(11) UNSIGNED NOT NULL default '0',
   `plugin_cmdb_baselines_cis_id` int(11) UNSIGNED NOT NULL default '0'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_cmdb_citypes_documents`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_cmdb_citypes_documents` (
   `id` int(11) UNSIGNED NOT NULL auto_increment PRIMARY KEY,
   `plugin_cmdb_citypes_id` int(11) UNSIGNED NOT NULL default '0',
   `types_id` int(11) UNSIGNED NOT NULL default '0',
   `documents_id` int(11) UNSIGNED NOT NULL default '0'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `glpi_displaypreferences` (`id`, `itemtype`, `num`, `rank`, `users_id`) 
VALUES (NULL, 'PluginCmdbOperationprocess', 2, 4, 0),
(NULL, 'PluginCmdbOperationprocess', 9, 5, 0),
(NULL, 'PluginCmdbOperationprocess', 10, 6, 0),
(NULL, 'PluginCmdbOperationprocess', 16, 7, 0),
(NULL, 'PluginCmdbBaseline',2,3,0),
(NULL, 'PluginCmdbBaseline',3,4,0),
(NULL, 'PluginCmdbCIType', '9', '5', '0');

INSERT INTO `glpi_plugin_cmdb_baselinestates` (`name`)
VALUES ('waiting'),
('in production'),
('reference'),
('archived'),
('canceled');