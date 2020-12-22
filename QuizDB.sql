-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: bestify
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Quiz'),(2,'Games'),(3,'Puzzle');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourites`
--

DROP TABLE IF EXISTS `favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourites` (
  `fav_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`fav_id`),
  UNIQUE KEY `actions_unique` (`user_id`,`activity_id`),
  KEY `activity_id` (`activity_id`),
  CONSTRAINT `favourites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `favourites_ibfk_2` FOREIGN KEY (`activity_id`) REFERENCES `quizzes` (`quiz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourites`
--

LOCK TABLES `favourites` WRITE;
/*!40000 ALTER TABLE `favourites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favourites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_result`
--

DROP TABLE IF EXISTS `game_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_result` (
  `game_result_id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `finised` tinyint(1) DEFAULT NULL,
  `date_played` date DEFAULT NULL,
  PRIMARY KEY (`game_result_id`),
  KEY `game_id` (`game_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `game_result_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`),
  CONSTRAINT `game_result_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_result`
--

LOCK TABLES `game_result` WRITE;
/*!40000 ALTER TABLE `game_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `game_id` int(11) NOT NULL AUTO_INCREMENT,
  `game_name` varchar(255) NOT NULL,
  PRIMARY KEY (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puzzle_result`
--

DROP TABLE IF EXISTS `puzzle_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puzzle_result` (
  `puzzle_result_id` int(11) NOT NULL AUTO_INCREMENT,
  `puzzle_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `finised` tinyint(1) DEFAULT NULL,
  `date_played` date DEFAULT NULL,
  PRIMARY KEY (`puzzle_result_id`),
  KEY `puzzle_id` (`puzzle_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `puzzle_result_ibfk_1` FOREIGN KEY (`puzzle_id`) REFERENCES `puzzles` (`puzzle_id`),
  CONSTRAINT `puzzle_result_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puzzle_result`
--

LOCK TABLES `puzzle_result` WRITE;
/*!40000 ALTER TABLE `puzzle_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `puzzle_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puzzles`
--

DROP TABLE IF EXISTS `puzzles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puzzles` (
  `puzzle_id` int(11) NOT NULL AUTO_INCREMENT,
  `puzzle_question` varchar(255) NOT NULL,
  `puzzle_answer` varchar(255) DEFAULT NULL,
  `puzzle_name` varchar(255) DEFAULT NULL,
  `puzzle_explanation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`puzzle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puzzles`
--

LOCK TABLES `puzzles` WRITE;
/*!40000 ALTER TABLE `puzzles` DISABLE KEYS */;
INSERT INTO `puzzles` VALUES (1,'Puzzle 1','Puzzle 1','Puzzle 1',NULL);
/*!40000 ALTER TABLE `puzzles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_categories`
--

DROP TABLE IF EXISTS `quiz_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_categories` (
  `quiz_cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `quiz_cat_name` varchar(255) NOT NULL,
  PRIMARY KEY (`quiz_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_categories`
--

LOCK TABLES `quiz_categories` WRITE;
/*!40000 ALTER TABLE `quiz_categories` DISABLE KEYS */;
INSERT INTO `quiz_categories` VALUES (1,'Science'),(2,'Arts'),(3,'Technology');
/*!40000 ALTER TABLE `quiz_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_result`
--

DROP TABLE IF EXISTS `quiz_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_result` (
  `quize_result_id` int(11) NOT NULL AUTO_INCREMENT,
  `quiz_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `finised` tinyint(1) DEFAULT NULL,
  `date_played` date DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `out_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`quize_result_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `quiz_result_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`quiz_cat_id`),
  CONSTRAINT `quiz_result_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_result`
--

LOCK TABLES `quiz_result` WRITE;
/*!40000 ALTER TABLE `quiz_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes`
--

DROP TABLE IF EXISTS `quizzes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quizzes` (
  `quiz_id` int(11) NOT NULL AUTO_INCREMENT,
  `quiz_name` varchar(255) NOT NULL,
  `quiz_cat_id` int(11) NOT NULL,
  `questions` json NOT NULL,
  `quiz_time` int(11) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`quiz_id`),
  KEY `quiz_cat_id` (`quiz_cat_id`),
  CONSTRAINT `quizzes_ibfk_1` FOREIGN KEY (`quiz_cat_id`) REFERENCES `quiz_categories` (`quiz_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes`
--

LOCK TABLES `quizzes` WRITE;
/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
INSERT INTO `quizzes` VALUES (6,'Java Quiz',1,'[{\"quesId\": 1, \"option1\": \"-128 to 127\", \"option2\": \"-32768 to 32767\", \"option3\": \"-2147483648 to 2147483647\", \"option4\": \"None of the mentioned\", \"question\": \"What is the range of byte data type in Java?\", \"correctAnswer\": \"a\", \"optionSelected\": \"\"}, {\"quesId\": 2, \"option1\": \"int\", \"option2\": \"long\", \"option3\": \"byte\", \"option4\": \" float\", \"question\": \"An expression involving byte, int, and literal numbers is promoted to which of these?\", \"correctAnswer\": \"a\", \"optionSelected\": \"\"}, {\"quesId\": 3, \"option1\": \"int\", \"option2\": \"long\", \"option3\": \"double\", \"option4\": \" float\", \"question\": \"Which data type value is returned by all transcendental math functions?\", \"correctAnswer\": \"c\", \"optionSelected\": \"\"}, {\"quesId\": 4, \"option1\": \" -128 to 127\", \"option2\": \"0 to 256\", \"option3\": \" 0 to 65535\", \"option4\": \"0 to 32767\", \"question\": \"What is the numerical range of a char data type in Java?\", \"correctAnswer\": \"c\", \"optionSelected\": \"\"}, {\"quesId\": 5, \"option1\": \"ASCII\", \"option2\": \"ISO-LATIN-1\", \"option3\": \"UNICODE\", \"option4\": \" None of the mentioned\", \"question\": \"Which of these coding types is used for data type characters in Java?\", \"correctAnswer\": \"a\", \"optionSelected\": \"\"}, {\"quesId\": 6, \"option1\": \"True & False\", \"option2\": \" 0 & 1\", \"option3\": \"Any integer value\", \"option4\": \"true\", \"question\": \"Which of these values can a boolean variable contain?\", \"correctAnswer\": \"a\", \"optionSelected\": \"\"}, {\"quesId\": 7, \"option1\": \"boolean b1 = 1;\", \"option2\": \" boolean b2 = ‘false’;\", \"option3\": \" boolean b3 = false;\", \"option4\": \"boolean b4 = ‘true’\", \"question\": \"Which one is a valid declaration of a boolean?\", \"correctAnswer\": \"c\", \"optionSelected\": \"\"}, {\"quesId\": 8, \"option1\": \"Integer\", \"option2\": \" Boolean\", \"option3\": \"Character\", \"option4\": \"Integer or Boolean\", \"question\": \"Which of these can be returned by the operator &?\", \"correctAnswer\": \"d\", \"optionSelected\": \"\"}, {\"quesId\": 9, \"option1\": \"integer\", \"option2\": \" Boolean\", \"option3\": \" float\", \"option4\": \"all of the mentioned\", \"question\": \"Literal can be of which of these data types?\", \"correctAnswer\": \"d\", \"optionSelected\": \"\"}, {\"quesId\": 10, \"option1\": \"integer\", \"option2\": \"long\", \"option3\": \" float\", \"option4\": \"double\", \"question\": \"If an expression contains double, int, float, long, then the whole expression will be promoted into which of these data types?\", \"correctAnswer\": \"d\", \"optionSelected\": \"\"}]',300,'Java is a high-level programming language developed by Sun Microsystems. It was originally designed for developing programs for set-top boxes and handheld devices, but later became a popular choice for creating web applications. The test is not official, it\'s just a nice way to see how much you know, or don\'t know, about Java.\nCount Your Score\nYou will get 1 point for each correct answer. At the end of the Quiz, your total score will be mailed'),(7,'Science Quiz',1,'[{\"quesId\": 1, \"option1\": \"Wheat\", \"option2\": \"Sunhemp\", \"option3\": \"Cotton\", \"option4\": \"Rice\", \"question\": \"Which among the following plants is used as Green Manure?\", \"correctAnswer\": \"b\", \"optionSelected\": \"\"}, {\"quesId\": 2, \"option1\": \"Nervous System\", \"option2\": \"Liver\", \"option3\": \"Pancreas\", \"option4\": \"Kidney\", \"question\": \"Nephron is the basic structural and functional unit of which among the following organs?\", \"correctAnswer\": \"d\", \"optionSelected\": \"\"}, {\"quesId\": 3, \"option1\": \"Ethylene\", \"option2\": \"Gibberellic acid\", \"option3\": \"Abscisic Acid\", \"option4\": \"Auxin\", \"question\": \"Which among the following plant hormone plays most important role in establishing dormancy in seeds?\", \"correctAnswer\": \"c\", \"optionSelected\": \"\"}, {\"quesId\": 4, \"option1\": \"Fishes\", \"option2\": \"Insects\", \"option3\": \"Snakes\", \"option4\": \"Amphibians and Reptiles\", \"question\": \"The branch of science Herpatology deals with the study of?\", \"correctAnswer\": \"d\", \"optionSelected\": \"\"}, {\"quesId\": 5, \"option1\": \"AIDS\", \"option2\": \"Tuberculosis\", \"option3\": \"Cancer\", \"option4\": \" Asthama\", \"question\": \"In which among the following diseases, Seed Therapy is used now a days for treatment?\", \"correctAnswer\": \"c\", \"optionSelected\": \"\"}, {\"quesId\": 6, \"option1\": \"Dog Fish\", \"option2\": \" Cuttle Fish\", \"option3\": \"Jelly Fish\", \"option4\": \"Star Fish\", \"question\": \"Which among the following fishes does not have Central Nervous System?\", \"correctAnswer\": \"c\", \"optionSelected\": \"\"}, {\"quesId\": 7, \"option1\": \"Cell membrane\", \"option2\": \"Cell wall\", \"option3\": \"Nucleus\", \"option4\": \"Plasama\", \"question\": \"Effective TB treatment is difficult because of the unusual structure and chemical composition of the which among the following parts of the cells of Tuberculosis Bacteria (Mycobacterium tuberculosis)?\", \"correctAnswer\": \"b\", \"optionSelected\": \"\"}, {\"quesId\": 8, \"option1\": \"Weak Organic Acid\", \"option2\": \"Weak Inorganic Acid\", \"option3\": \"Weak Organic base\", \"option4\": \"Gaseous compound of carbon\", \"question\": \"The plant hormone Auxin is basically a ___?\", \"correctAnswer\": \"a\", \"optionSelected\": \"\"}, {\"quesId\": 9, \"option1\": \"Brain\", \"option2\": \"Liver\", \"option3\": \"Kidney\", \"option4\": \"Spinal Chord\", \"question\": \"Corpus Callosum makes an important part of which among the following organs in Human body?\", \"correctAnswer\": \"a\", \"optionSelected\": \"\"}, {\"quesId\": 10, \"option1\": \"Virus\", \"option2\": \"Bacteria\", \"option3\": \"Protozoan\", \"option4\": \"worm\", \"question\": \"Which among the following causes Hydrophobia?\", \"correctAnswer\": \"a\", \"optionSelected\": \"\"}]',180,'Test your knowledge of science by taking this quiz'),(8,'Fine Arts',2,'[{\"quesId\": 1, \"option1\": \"maroon\", \"option2\": \"violet\", \"option3\": \"orange\", \"option4\": \"brown\", \"question\": \"Mixing the colors blue and red in equal proportion will produce which of the following hues?\", \"correctAnswer\": \"b\", \"optionSelected\": \"\"}, {\"quesId\": 2, \"option1\": \"bladed machinery\", \"option2\": \"hazardous chemicals\", \"option3\": \"loud noises\", \"option4\": \"heat-producing tools\", \"question\": \"According to the Occupational Safety and Health Administration (OSHA), informational safety sheets must be present in art rooms that contain which of the following safety risks?\", \"correctAnswer\": \"b\", \"optionSelected\": \"\"}, {\"quesId\": 3, \"option1\": \"stimulating interest in the church\", \"option2\": \"communicating the need for social justice\", \"option3\": \"entertaining wealthy merchants\", \"option4\": \"celebrating the architectural styles of classical antiquity\", \"question\": \"Italian Baroque art developed primarily for which of the following purposes?\", \"correctAnswer\": \"a\", \"optionSelected\": \"\"}, {\"quesId\": 4, \"option1\": \"flying buttress\", \"option2\": \"portal\", \"option3\": \"stained glass window\", \"option4\": \"clerestory\", \"question\": \"Which of the following components of Gothic cathedrals would be useful to study in a physics class because it was designed to support outward force?\", \"correctAnswer\": \"a\", \"optionSelected\": \"\"}, {\"quesId\": 5, \"option1\": \"corporate curator\", \"option2\": \"art librarian\", \"option3\": \"auction house expert\", \"option4\": \"art professor\", \"question\": \"A student has a knack for communicating and working with people who have limited knowledge of art, enjoys designing installations, and is skilled in the use of electronic databases. Which of the following visual arts-related careers would best match the student\'s strengths and interests?\", \"correctAnswer\": \"a\", \"optionSelected\": \"\"}]',120,'Test your fine arts knowledge'),(9,'Fine Arts 2',2,'[{\"quesId\": 1, \"option1\": \"Line\", \"option2\": \"Space\", \"option3\": \"Shape\", \"option4\": \"Form\", \"question\": \"When lines meet to form an enclosed area this is formed which of the following.\", \"correctAnswer\": \"c\", \"optionSelected\": \"\"}, {\"quesId\": 2, \"option1\": \"Line\", \"option2\": \"Space\", \"option3\": \"Texture\", \"option4\": \"Form\", \"question\": \"This refers to the way something feels or looks as if they might feel like something.\", \"correctAnswer\": \"c\", \"optionSelected\": \"\"}, {\"quesId\": 3, \"option1\": \"Shape\", \"option2\": \"Color\", \"option3\": \"Value\", \"option4\": \"Space\", \"question\": \"Which of the following is an empty place or surface in or around a work of art? It can be two-dimensional, three-dimensional, negative and/or positive.\", \"correctAnswer\": \"d\", \"optionSelected\": \"\"}, {\"quesId\": 4, \"option1\": \"Texture\", \"option2\": \"Space\", \"option3\": \" Line\", \"option4\": \" Value\", \"question\": \"Select the most basic element of the art that is used to form a different kind of art. It is the path of a dot through space. W\", \"correctAnswer\": \"c\", \"optionSelected\": \"\"}, {\"quesId\": 5, \"option1\": \" Color\", \"option2\": \"Space\", \"option3\": \"Form\", \"option4\": \" Value\", \"question\": \"………………..  are three-dimensional having height, width, and thickness. \", \"correctAnswer\": \"c\", \"optionSelected\": \"\"}]',180,'Test your knowledge of Fine Arts'),(10,'POETRY',3,'[{\"quesId\": 1, \"option1\": \"How do I love thee\", \"option2\": \"Ode to a Grecian urn\", \"option3\": \"In faith I do not love thee with mine eyes\", \"option4\": \"Let me not to the marriage of true minds\", \"question\": \"Which poem ends \'I shall but love thee better after death\'?\", \"correctAnswer\": \"a\", \"optionSelected\": \"\"}, {\"quesId\": 2, \"option1\": \"John keats\", \"option2\": \" Lord Byron\", \"option3\": \"Solan\", \"option4\": \"Sappho\", \"question\": \"Which poet is considered a national hero in Greece?\", \"correctAnswer\": \"b\", \"optionSelected\": \"\"}, {\"quesId\": 3, \"option1\": \"Nature\", \"option2\": \"Epics\", \"option3\": \"Sonnets\", \"option4\": \"Nonsense\", \"question\": \"Which kind of poem is Edward Lear associated with?\", \"correctAnswer\": \"d\", \"optionSelected\": \"\"}, {\"quesId\": 4, \"option1\": \"A funeral\", \"option2\": \"A wedding\", \"option3\": \"Market\", \"option4\": \"To the races\", \"question\": \" In coleridge\'s poem \'The rime of the Ancient Mariner\'where were the three gallants going?\", \"correctAnswer\": \"b\", \"optionSelected\": \"\"}, {\"quesId\": 5, \"option1\": \"e. e. Cummings\", \"option2\": \"T. S. Elliot\", \"option3\": \"John Greenleaf Whittier\", \"option4\": \"Walt Whitman\", \"question\": \"Harold Nicholson described which poet as \'Very yellow and glum. Perfect manners\'?\", \"correctAnswer\": \"b\", \"optionSelected\": \"\"}]',60,'Poetry is a type of literature based on the interplay of words and rhythm. It often employs rhyme and meter (a set of rules governing the number and arrangement of syllables in each line). '),(11,'Poetry 2',3,'[{\"quesId\": 1, \"option1\": \"She rarely left home\", \"option2\": \"She wrote in code\", \"option3\": \"She never attempted to publish her poetry\", \"option4\": \"She wrote her poems in invisible ink\", \"question\": \"What was strange about Emily Dickinson?\", \"correctAnswer\": \"a\", \"optionSelected\": \"\"}, {\"quesId\": 2, \"option1\": \"Boer War\", \"option2\": \"Second World War\", \"option3\": \"Korean War\", \"option4\": \"First World War\", \"question\": \" Rupert Brooke wrote his poetry during which conflict?\", \"correctAnswer\": \"d\", \"optionSelected\": \"\"}, {\"quesId\": 3, \"option1\": \"Betjeman\", \"option2\": \"Hughes\", \"option3\": \"Marvel\", \"option4\": \"Larkin\", \"question\": \"Which Poet Laureate wrote about a church mouse?\", \"correctAnswer\": \"a\", \"optionSelected\": \"\"}, {\"quesId\": 4, \"option1\": \"Robert Hass\", \"option2\": \"Jessica Hagdorn\", \"option3\": \" Maya Angelou\", \"option4\": \"Micheal Palmer\", \"question\": \"Which American writer published \'A brave and startling truth\' in 1996\", \"correctAnswer\": \"c\", \"optionSelected\": \"\"}, {\"quesId\": 5, \"option1\": \"Dylan Thomas\", \"option2\": \"Ezra Pound\", \"option3\": \"W. B. Yeats\", \"option4\": \"e. e. cummings\", \"question\": \"Who wrote about the idyllic \'Isle of Innisfree\'?\", \"correctAnswer\": \"c\", \"optionSelected\": \"\"}]',180,'Poetry is a type of literature based on the interplay of words and rhythm. It often employs rhyme and meter (a set of rules governing the number and arrangement of syllables in each line)');
/*!40000 ALTER TABLE `quizzes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scores`
--

DROP TABLE IF EXISTS `scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scores` (
  `score_id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `score` int(11) NOT NULL,
  `date_played` date NOT NULL,
  PRIMARY KEY (`score_id`),
  KEY `game_id` (`game_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`),
  CONSTRAINT `scores_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scores`
--

LOCK TABLES `scores` WRITE;
/*!40000 ALTER TABLE `scores` DISABLE KEYS */;
/*!40000 ALTER TABLE `scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `quiz` json DEFAULT NULL,
  `cat_id` int(11) NOT NULL,
  `timer` int(11) NOT NULL,
  `automatic` tinyint(4) NOT NULL,
  PRIMARY KEY (`state_id`),
  KEY `user_id` (`user_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `cat_id` (`cat_id`),
  CONSTRAINT `state_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `state_ibfk_2` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`quiz_id`),
  CONSTRAINT `state_ibfk_3` FOREIGN KEY (`cat_id`) REFERENCES `quiz_categories` (`quiz_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ayush','krushna','ayush@123','ayush@gmail.com','$2a$04$XN/RBqK0KNJdqw15gNJRcey1Gr.sRtuBiS8bJfvhW/8ngiwMx7RqW',0,'2020-12-21 14:10:10','2020-12-21 14:10:10'),(2,'admin','admin','admin@123','admin@gmail.com','$2a$04$cmv9obbYx2VAa/BFiWPpT.DwhrJXGaIDKQfIkbE00S0lfw3XG2jvW',1,'2020-12-21 14:18:27','2020-12-21 14:18:27'),(3,'chetan','raut','chetan@123','chetan@gmail.com','$2a$04$2Z9x8jZ7XZfbDRsPGSa0tudXObD00gbB8NUONz8MjICPiQ1pceaGS',0,'2020-12-21 14:19:56','2020-12-21 14:19:56'),(4,'Apurva','Jogal','apurva@123','apurvajog@cybage.com','$2a$04$SAPKwVZQp9dzQndM2fTMteLIlDSFSAKG56arGz360syPrOeDkiVs.',0,'2020-12-22 04:47:36','2020-12-22 04:47:36');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-22 20:03:03
