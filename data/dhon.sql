-- MySQL dump 10.15  Distrib 10.0.25-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: dhon
-- ------------------------------------------------------
-- Server version	10.0.25-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,'Dota'),(2,'Heroes of Newerth');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hero_conversions`
--

DROP TABLE IF EXISTS `hero_conversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hero_conversions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hon` int(10) unsigned DEFAULT NULL,
  `dota` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_hero_conversions_hon` (`hon`),
  UNIQUE KEY `uq_hero_conversions_dota` (`dota`),
  KEY `fk_hero_conversions_heroes_dota_idx` (`dota`),
  KEY `fk_hero_conversions_heroes_hon_idx` (`hon`),
  CONSTRAINT `fk_hero_conversions_heroes_dota` FOREIGN KEY (`dota`) REFERENCES `heroes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hero_conversions_heroes_hon` FOREIGN KEY (`hon`) REFERENCES `heroes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hero_conversions`
--

LOCK TABLES `hero_conversions` WRITE;
/*!40000 ALTER TABLE `hero_conversions` DISABLE KEYS */;
INSERT INTO `hero_conversions` VALUES (1,110,1),(2,113,100),(3,115,12),(4,119,28),(5,121,61),(6,123,9),(7,126,68),(8,128,33),(9,130,72),(10,134,22),(11,135,21),(12,136,69),(13,137,86),(14,146,83),(15,152,19),(16,156,87),(17,157,104),(18,158,62),(19,159,95),(20,163,5),(21,166,4),(22,167,75),(23,174,49),(24,177,73),(25,181,16),(26,185,94),(27,186,81),(28,187,18),(29,188,44),(30,189,78),(31,190,45),(32,194,46),(33,196,85),(34,203,84),(35,208,101),(36,210,58),(37,211,77),(38,212,6),(39,213,39),(40,214,32),(41,217,41),(42,219,109),(43,220,43),(44,222,8),(45,223,54),(46,224,79),(47,225,107),(48,226,50),(49,227,48),(50,228,47),(51,229,71);
/*!40000 ALTER TABLE `hero_conversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heroes`
--

DROP TABLE IF EXISTS `heroes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heroes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `game` int(10) unsigned DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_heroes_games_idx` (`game`),
  CONSTRAINT `fk_heroes_games` FOREIGN KEY (`game`) REFERENCES `games` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heroes`
--

LOCK TABLES `heroes` WRITE;
/*!40000 ALTER TABLE `heroes` DISABLE KEYS */;
INSERT INTO `heroes` VALUES (1,1,'Abaddon'),(2,1,'Alchemist'),(3,1,'Ancient Apparition'),(4,1,'Anti-Mage'),(5,1,'Axe'),(6,1,'Bane'),(7,1,'Batrider'),(8,1,'Beastmaster'),(9,1,'Bloodseeker'),(10,1,'Bounty Hunter'),(11,1,'Brewmaster'),(12,1,'Bristleback'),(13,1,'Broodmother'),(14,1,'Centaur Warrunner'),(15,1,'Chaos Knight'),(16,1,'Chen'),(17,1,'Clinkz'),(18,1,'Clockwerk'),(19,1,'Crystal Maiden'),(20,1,'Dark Seer'),(21,1,'Dazzle'),(22,1,'Death Prophet'),(23,1,'Disruptor'),(24,1,'Doom'),(25,1,'Dragon Knight'),(26,1,'Drow Ranger'),(27,1,'Earth Spirit'),(28,1,'Earthshaker'),(29,1,'Elder Titan'),(30,1,'Ember Spirit'),(31,1,'Enchantress'),(32,1,'Enigma'),(33,1,'Faceless Void'),(34,1,'Gyrocopter'),(35,1,'Huskar'),(36,1,'Invoker'),(37,1,'Io'),(38,1,'Jakiro'),(39,1,'Juggernaut'),(40,1,'Keeper of the Light'),(41,1,'Kunkka'),(42,1,'Legion Commander'),(43,1,'Leshrac'),(44,1,'Lich'),(45,1,'Lifestealer'),(46,1,'Lina'),(47,1,'Lion'),(48,1,'Lone Druid'),(49,1,'Luna'),(50,1,'Lycan'),(51,1,'Magnus'),(52,1,'Medusa'),(53,1,'Meepo'),(54,1,'Mirana'),(55,1,'Morphling'),(56,1,'Naga Siren'),(57,1,'Natures Prophet'),(58,1,'Necrophos'),(59,1,'Night Stalker'),(60,1,'Nyx Assassin'),(61,1,'Ogre Magi'),(62,1,'Omniknight'),(63,1,'Oracle'),(64,1,'Outworld Devourer'),(65,1,'Phantom Assassin'),(66,1,'Phantom Lancer'),(67,1,'Phoenix'),(68,1,'Puck'),(69,1,'Pudge'),(70,1,'Pugna'),(71,1,'Queen of Pain'),(72,1,'Razor'),(73,1,'Riki'),(74,1,'Rubick'),(75,1,'Sand King'),(76,1,'Shadow Demon'),(77,1,'Shadow Fiend'),(78,1,'Shadow Shaman'),(79,1,'Silencer'),(80,1,'Skywrath Mage'),(81,1,'Slardar'),(82,1,'Slark'),(83,1,'Sniper'),(84,1,'Spectre'),(85,1,'Spirit Breaker'),(86,1,'Storm Spirit'),(87,1,'Sven'),(88,1,'Techies'),(89,1,'Templar Assassin'),(90,1,'Terrorblade'),(91,1,'Tidehunter'),(92,1,'Timbersaw'),(93,1,'Tinker'),(94,1,'Tiny'),(95,1,'Treant Protector'),(96,1,'Troll Warlord'),(97,1,'Tusk'),(98,1,'Undying'),(99,1,'Ursa'),(100,1,'Vengeful Spirit'),(101,1,'Venomancer'),(102,1,'Viper'),(103,1,'Visage'),(104,1,'Warlock'),(105,1,'Weaver'),(106,1,'Windranger'),(107,1,'Witch Doctor'),(108,1,'Wraith King'),(109,1,'Zeus'),(110,2,'Accursed'),(111,2,'Aluna'),(112,2,'Amun-ra'),(113,2,'Andromeda'),(114,2,'Arachna'),(115,2,'Armadon'),(116,2,'Artesia'),(117,2,'Artillery'),(118,2,'Balphagore'),(119,2,'Behemoth'),(120,2,'Berzerker'),(121,2,'Blacksmith'),(122,2,'Blitz'),(123,2,'Blood Hunter'),(124,2,'Bombardier'),(125,2,'Bramble'),(126,2,'Bubbles'),(127,2,'Bushwack'),(128,2,'Chronos'),(129,2,'Circe'),(130,2,'Corrupted Disciple'),(131,2,'Cthulhuphant'),(132,2,'Dampeer'),(133,2,'Deadwood'),(134,2,'Defiler'),(135,2,'Demented Shaman'),(136,2,'Devourer'),(137,2,'Doctor Repulsor'),(138,2,'Draconis'),(139,2,'Drunken Master'),(140,2,'Electrician'),(141,2,'Ellonia'),(142,2,'Emerald Warden'),(143,2,'Empath'),(144,2,'Engineer'),(145,2,'Fayde'),(146,2,'Flint Beastwood'),(147,2,'Flux'),(148,2,'Forsaken Archer'),(149,2,'Gauntlet'),(150,2,'Gemini'),(151,2,'Geomancer'),(152,2,'Glacius'),(153,2,'Gravekeeper'),(154,2,'Grinex'),(155,2,'Gunblade'),(156,2,'Hammerstorm'),(157,2,'Hellbringer'),(158,2,'Jeraziah'),(159,2,'Keeper of the Forest'),(160,2,'Kinesis'),(161,2,'Klanx'),(162,2,'Kraken'),(163,2,'Legionnaire'),(164,2,'Lodestone'),(165,2,'Lord Salforis'),(166,2,'Magebane'),(167,2,'Magmus'),(168,2,'Maliken'),(169,2,'Martyr'),(170,2,'Master of Arms'),(171,2,'Midas'),(172,2,'Monarch'),(173,2,'Monkey King'),(174,2,'Moon Queen'),(175,2,'Moraxus'),(176,2,'Myrmidon'),(177,2,'Night Hound'),(178,2,'Nomad'),(179,2,'Nymphora'),(180,2,'Oogie'),(181,2,'Ophelia'),(182,2,'Pandamonium'),(183,2,'Parasite'),(184,2,'Pearl'),(185,2,'Pebbles'),(186,2,'Pestilence'),(187,2,'Pharaoh'),(188,2,'Plague Rider'),(189,2,'Pollywog Priest'),(190,2,'Predator'),(191,2,'Prisoner 945'),(192,2,'Prophet'),(193,2,'Puppet Master'),(194,2,'Pyromancer'),(195,2,'Rally'),(196,2,'Rampage'),(197,2,'Ravenor'),(198,2,'Revenant'),(199,2,'Rhapsody'),(200,2,'Riftwalker'),(201,2,'Riptide'),(202,2,'Salomon'),(203,2,'Sand Wraith'),(204,2,'Scout'),(205,2,'Shadowblade'),(206,2,'Silhouette'),(207,2,'Sir Benzington'),(208,2,'Slither'),(209,2,'Solstice'),(210,2,'Soul Reaper'),(211,2,'Soulstealer'),(212,2,'Succubus'),(213,2,'Swiftblade'),(214,2,'Tempest'),(215,2,'The Chipper'),(216,2,'The Dark Lady'),(217,2,'The Gladiator'),(218,2,'The Madman'),(219,2,'Thunderbringer'),(220,2,'Torturer'),(221,2,'Tremble'),(222,2,'Tundra'),(223,2,'Valkyrie'),(224,2,'Vindicator'),(225,2,'Voodoo Jester'),(226,2,'War Beast'),(227,2,'Wildsoul'),(228,2,'Witch Slayer'),(229,2,'Wretched Hag'),(230,2,'Zephyr');
/*!40000 ALTER TABLE `heroes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_conversions`
--

DROP TABLE IF EXISTS `item_conversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_conversions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hon` int(10) unsigned DEFAULT NULL,
  `dota` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_item_conversions_hon` (`hon`),
  UNIQUE KEY `uq_item_conversions_dota` (`dota`),
  KEY `fk_item_conversions_items_hon_idx` (`hon`),
  KEY `fk_item_conversions_items_dota_idx` (`dota`),
  CONSTRAINT `fk_item_conversions_items_dota` FOREIGN KEY (`dota`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_conversions_items_hon` FOREIGN KEY (`hon`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_conversions`
--

LOCK TABLES `item_conversions` WRITE;
/*!40000 ALTER TABLE `item_conversions` DISABLE KEYS */;
INSERT INTO `item_conversions` VALUES (1,130,69),(2,131,125),(3,132,58),(4,133,49),(5,134,19),(6,135,56),(7,136,85),(8,137,70),(9,138,120),(10,139,95),(11,140,71),(12,141,128),(13,142,104),(14,143,23),(15,144,2),(16,145,53),(17,146,17),(18,147,11),(19,148,42),(20,149,30),(21,150,84),(22,151,115),(23,152,75),(24,153,13),(25,154,103),(26,155,119),(27,157,92),(28,158,14),(29,159,6),(30,160,107),(31,162,108),(32,163,18),(33,164,51),(34,165,114),(35,166,99),(36,167,116),(37,170,100),(38,171,54),(39,172,40),(40,173,127),(41,176,7),(42,177,24),(43,179,3),(44,180,79),(45,181,96),(46,182,29),(47,183,5),(48,184,43),(49,185,109),(50,186,101),(51,187,83),(52,189,26),(53,190,52),(54,191,81),(55,192,66),(56,193,123),(57,195,25),(58,197,36),(59,198,1),(60,199,124),(61,200,39),(62,201,15),(63,202,20),(64,203,12),(65,204,88),(66,205,41),(67,206,22),(68,208,102),(69,209,111),(70,210,126),(71,212,34),(72,213,46),(73,214,59),(74,215,50),(75,216,16),(76,217,27),(77,218,73),(78,219,21),(79,220,61),(80,221,80),(81,222,82),(82,224,60),(83,225,28),(84,226,86),(85,228,89),(86,229,37),(87,231,94),(88,232,62),(89,233,112),(90,234,98),(91,235,118),(92,236,45),(93,238,48),(94,241,78),(95,242,55),(96,243,31),(97,244,74),(98,245,65),(99,246,57),(100,247,121),(101,248,117),(102,249,72),(103,250,110),(104,251,38),(105,252,4),(106,253,44),(107,254,10),(108,255,9),(109,256,35),(110,257,122),(111,258,106),(112,259,91);
/*!40000 ALTER TABLE `item_conversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `game` int(10) unsigned DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_items_games_idx` (`game`),
  CONSTRAINT `fk_items_games` FOREIGN KEY (`game`) REFERENCES `games` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,1,'Clarity'),(2,1,'Tango'),(3,1,'Healing Salve'),(4,1,'Smoke of Deceit'),(5,1,'Town Portal Scroll'),(6,1,'Dust of Appearance'),(7,1,'Animal Courier'),(8,1,'Flying Courier'),(9,1,'Observer Ward'),(10,1,'Sentry Ward'),(11,1,'Bottle'),(12,1,'Iron Branch'),(13,1,'Gauntlets of Strength'),(14,1,'Slippers of Agility'),(15,1,'Mantle of Intelligence'),(16,1,'Circlet'),(17,1,'Belt of Strength'),(18,1,'Band of Elvenskin'),(19,1,'Robe of the Magi'),(20,1,'Ogre Club'),(21,1,'Blade of Alacrity'),(22,1,'Staff of Wizardry'),(23,1,'Ultimate Orb'),(24,1,'Ring of Protection'),(25,1,'Quelling Blade'),(26,1,'Stout Shield'),(27,1,'Blades of Attack'),(28,1,'Chainmail'),(29,1,'Helm of Iron Will'),(30,1,'Broadsword'),(31,1,'Quarterstaff'),(32,1,'Claymore'),(33,1,'Javelin'),(34,1,'Platemail'),(35,1,'Mithril Hammer'),(36,1,'Magic Stick'),(37,1,'Sages Mask'),(38,1,'Ring of Regen'),(39,1,'Boots of Speed'),(40,1,'Gloves of Haste'),(41,1,'Cloak'),(42,1,'Gem of True Sight'),(43,1,'Morbid Mask'),(44,1,'Ghost Scepter'),(45,1,'Talisman of Evasion'),(46,1,'Blink Dagger'),(47,1,'Shadow Amulet'),(48,1,'Wraith Band'),(49,1,'Null Talisman'),(50,1,'Magic Wand'),(51,1,'Bracer'),(52,1,'Poor Mans Shield'),(53,1,'Soul Ring'),(54,1,'Phase Boots'),(55,1,'Power Treads'),(56,1,'Oblivion Staff'),(57,1,'Perseverance'),(58,1,'Hand of Midas'),(59,1,'Boots of Travel'),(60,1,'Ring of Basilius'),(61,1,'Headdress'),(62,1,'Buckler'),(63,1,'Urn of Shadows'),(64,1,'Ring of Aquila'),(65,1,'Tranquil Boots'),(66,1,'Medallion of Courage'),(67,1,'Arcane Boots'),(68,1,'Drum of Endurance'),(69,1,'Vladmirs Offering'),(70,1,'Mekansm'),(71,1,'Pipe of Insight'),(72,1,'Force Staff'),(73,1,'Necronomicon'),(74,1,'Euls Scepter of Divinity'),(75,1,'Dagon'),(76,1,'Veil of Discord'),(77,1,'Rod of Atos'),(78,1,'Aghanims Scepter'),(79,1,'Orchid Malevolence'),(80,1,'Refresher Orb'),(81,1,'Scythe of Vyse'),(82,1,'Crystalys'),(83,1,'Armlet of Mordiggian'),(84,1,'Skull Basher'),(85,1,'Shadow Blade'),(86,1,'Battlefury'),(87,1,'Ethereal Blade'),(88,1,'Radiance'),(89,1,'Monkey King Bar'),(90,1,'Daedalus'),(91,1,'Butterfly'),(92,1,'Divine Rapier'),(93,1,'Abyssal Blade'),(94,1,'Hood of Defiance'),(95,1,'Blademail'),(96,1,'Vanguard'),(97,1,'Soul Booster'),(98,1,'Black King Bar'),(99,1,'Shivas Guard'),(100,1,'Manta Style'),(101,1,'Bloodstone'),(102,1,'Linkens Sphere'),(103,1,'Assault Cuirass'),(104,1,'Heart of Tarrasque'),(105,1,'Crimson Guard'),(106,1,'Helm of the Dominator'),(107,1,'Mask of Madness'),(108,1,'Sange'),(109,1,'Yasha'),(110,1,'Maelstrom'),(111,1,'Diffusal Blade'),(112,1,'Desolator'),(113,1,'Heavens Halberd'),(114,1,'Sange and Yasha'),(115,1,'Mjollnir'),(116,1,'Eye of Skadi'),(117,1,'Satanic'),(118,1,'Demon Edge'),(119,1,'Eaglesong'),(120,1,'Reaver'),(121,1,'Sacred Relic'),(122,1,'Hyperstone'),(123,1,'Ring of Health'),(124,1,'Void Stone'),(125,1,'Mystic Staff'),(126,1,'Energy Booster'),(127,1,'Point Booster'),(128,1,'Vitality Booster'),(129,1,'Orb of Venom'),(130,2,'Abyssal Skull'),(131,2,'Acolytes Staff'),(132,2,'Alchemists Bones'),(133,2,'Amulet of Exile'),(134,2,'Apprentices Robe'),(135,2,'Arcana'),(136,2,'Assassins Shroud'),(137,2,'Astrolabe'),(138,2,'Axe of the Malphai'),(139,2,'Barbed Armor'),(140,2,'Barrier Idol'),(141,2,'Beastheart'),(142,2,'Behemoths Heart'),(143,2,'Blessed Orb'),(144,2,'Blight Stones'),(145,2,'Blood Chalice'),(146,2,'Bolstering Armband'),(147,2,'Bottle of Tears'),(148,2,'Bound Eye'),(149,2,'Broadsword'),(150,2,'Brutalizer'),(151,2,'Charged Hammer'),(152,2,'Codex'),(153,2,'Crushing Claws'),(154,2,'Daemonic Breastplate'),(155,2,'Dancing Blade'),(156,2,'Dawnbringer'),(157,2,'Doom Bringer'),(158,2,'Duck Boots'),(159,2,'Dust of Revelation'),(160,2,'Elder Parasite'),(161,2,'Energizer'),(162,2,'Firebrand'),(163,2,'Fleetfeet'),(164,2,'Fortified Bracer'),(165,2,'Frostburn'),(166,2,'Frostfield Plate'),(167,2,'Frostwolfs Skull'),(168,2,'Frozen Light'),(169,2,'Genjuro'),(170,2,'Geometers Bane'),(171,2,'Ghost Marchers'),(172,2,'Gloves of the Swift'),(173,2,'Glowstone'),(174,2,'Grave Locket'),(175,2,'Grimoire of Power'),(176,2,'Ground Courier'),(177,2,'Guardian Ring'),(178,2,'Harkons Blade'),(179,2,'Health Potion'),(180,2,'Hellflower'),(181,2,'Helm of the Black Legion'),(182,2,'Helm of the Victim'),(183,2,'Homecoming Stone'),(184,2,'Hungry Spirit'),(185,2,'Icebrand'),(186,2,'Icon of the Goddess'),(187,2,'Insanitarius'),(188,2,'Ioyn Stone'),(189,2,'Iron Buckler'),(190,2,'Iron Shield'),(191,2,'Kuldras Sheepstick'),(192,2,'Lex Talionis'),(193,2,'Lifetube'),(194,2,'Lightbrand'),(195,2,'Loggers Hatchet'),(196,2,'Major Totem'),(197,2,'Mana Battery'),(198,2,'Mana Potion'),(199,2,'Manatube'),(200,2,'Marchers'),(201,2,'Mark of the Novice'),(202,2,'Mighty Blade'),(203,2,'Minor Totem'),(204,2,'Mock of Brilliance'),(205,2,'Mystic Vestments'),(206,2,'Neophytes Book'),(207,2,'Nomes Wisdom'),(208,2,'Null Stone'),(209,2,'Nullfire Blade'),(210,2,'Pickled Brain'),(211,2,'Plated Greaves'),(212,2,'Platemail'),(213,2,'Portal Key'),(214,2,'Post Haste'),(215,2,'Power Supply'),(216,2,'Pretenders Crown'),(217,2,'Punchdagger'),(218,2,'Puzzlebox'),(219,2,'Quickblade'),(220,2,'Refreshing Ornament'),(221,2,'Restoration Stone'),(222,2,'Riftshards'),(223,2,'Ring of Sorcery'),(224,2,'Ring of the Teacher'),(225,2,'Ringmail'),(226,2,'Runed Cleaver'),(227,2,'Sacrificial Stone'),(228,2,'Savage Mace'),(229,2,'Scarab'),(230,2,'Searing Light'),(231,2,'Shamans Headdress'),(232,2,'Shield of the Five'),(233,2,'Shieldbreaker'),(234,2,'Shrunken Head'),(235,2,'Slayer'),(236,2,'Snake Bracelet'),(237,2,'Sols Bulwark'),(238,2,'Soulscream Ring'),(239,2,'Spell Sunder'),(240,2,'Spellshards'),(241,2,'Staff of the Master'),(242,2,'Steamboots'),(243,2,'Steamstaff'),(244,2,'Stormspirit'),(245,2,'Striders'),(246,2,'Sustainer'),(247,2,'Sword of the High'),(248,2,'Symbol of Rage'),(249,2,'Tablet of Command'),(250,2,'Thunderclaw'),(251,2,'Trinket of Restoration'),(252,2,'Veiled Rot'),(253,2,'Void Talisman'),(254,2,'Ward of Revelation'),(255,2,'Ward of Sight'),(256,2,'Warhammer'),(257,2,'Warpcleft'),(258,2,'Whispering Helm'),(259,2,'Wingbow');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dhon'
--

--
-- Dumping routines for database 'dhon'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-16 12:12:55
