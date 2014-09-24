SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

DROP DATABASE IF EXISTS protocolos;
CREATE DATABASE protocolos CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE protocolos;

--
-- Database: `protocolos`
--

-- --------------------------------------------------------

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telefone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

--
-- Dumping data for table `empresa`
--

INSERT INTO `empresa` (`id`, `nome`, `descricao`, `telefone`) VALUES
(1, 'Vivo', 'Celular, Fixo, Internet, TV', '7142055471'),
(2, 'Motorola do Brasil', 'Eletrônicos, celulares', '7155668879'),
(3, 'NET Serviços', 'TV, Banda Larga e Telefone', '7132809224'),
(4, 'Oi', 'Móvel, Fixo, Internet, TV', '7147124037'),
(5, 'Tim', 'Celular', '7138095021'),
(6, 'Sky', 'TV por assinatura', '7141630235'),
(7, 'Claro', 'Telefonia móvel', '3149588852'),
(8, 'Samsung Electronics', 'Eletrônicos', '1133110909'),
(9, 'Walmart (loja Virtual)', 'Departamento', '8131127746'),
(10, 'Pank', 'Marketplace', '1135404876'),
(11, 'Saraiva', 'Livraria, Editora e Loja Virtual', '3149200018'),
(12, 'Extra.com.br', 'Rede varejista', '9144171303'),
(13, 'Gvt', 'Telefonia', '1142727630'),
(14, 'Correios', 'Empresa Brasileira de Correios e Telégrafos', '4133607128'),
(15, 'Nextel Telecomunicações Ltda', 'Telecomunicações', '9136574876'),
(16, 'Poucas Horas', 'Marketplace', '5146574076'),
(17, 'Ponto Frio - Loja Virtual', 'Eletrônicos, móveis etc.', '8147741549'),
(18, 'Banco Itaú S/a', 'Banco privado', '5130666640'),
(19, 'Ricardo Eletro (Internet)', 'Eletrônicos, móveis etc.', '9140502930');

-- --------------------------------------------------------

--
-- Table structure for table `reclamacao`
--

DROP TABLE IF EXISTS `reclamacao`;
CREATE TABLE IF NOT EXISTS `reclamacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` datetime NOT NULL,
  `resolvido` tinyint(1) NOT NULL,
  `empresa` int(11) NOT NULL,
  `comentarios` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `empresa` (`empresa`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `reclamacao`
--

INSERT INTO `reclamacao` (`id`, `titulo`, `data`, `resolvido`, `empresa`, `comentarios`) VALUES
(3, 'Fatura com cobrança indevida!', '2014-08-07 10:21:48', 0, 4, NULL),
(4, 'Promoção não foi ativada', '2014-06-10 07:29:32', 0, 12, NULL),
(5, 'Pacote de dados cancelado', '2014-08-12 00:00:00', 1, 5, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reclamacao`
--
ALTER TABLE `reclamacao`
  ADD CONSTRAINT `reclamacao_ibfk_1` FOREIGN KEY (`empresa`) REFERENCES `empresa` (`id`);
