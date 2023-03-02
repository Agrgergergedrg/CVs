-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 02 Mar 2023, 06:03
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `cvs`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `doswiadczenie_zawodowe`
--

CREATE TABLE `doswiadczenie_zawodowe` (
  `id_uzytkownik` int(11) NOT NULL,
  `pracodawca` varchar(30) NOT NULL,
  `d_roz_pracy` date DEFAULT NULL,
  `d_skon_pracy` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `doswiadczenie_zawodowe`
--

INSERT INTO `doswiadczenie_zawodowe` (`id_uzytkownik`, `pracodawca`, `d_roz_pracy`, `d_skon_pracy`) VALUES
(1, 'Microsoft', '2018-05-01', '2025-06-25');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `podstawowe_informacje`
--

CREATE TABLE `podstawowe_informacje` (
  `id_uzy` int(11) NOT NULL,
  `imie` varchar(50) NOT NULL,
  `nazwisko` varchar(100) NOT NULL,
  `email` varchar(320) NOT NULL,
  `nr_telefonu` varchar(12) NOT NULL,
  `zdjecie` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `podstawowe_informacje`
--

INSERT INTO `podstawowe_informacje` (`id_uzy`, `imie`, `nazwisko`, `email`, `nr_telefonu`, `zdjecie`) VALUES
(1, 'Jan', 'Kowalski', 'jkowalski@mail.pl', '123 456 789', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `szkoly/uczelnie/kursy`
--

CREATE TABLE `szkoly/uczelnie/kursy` (
  `id_uzytkownik` int(11) NOT NULL,
  `szkoly` text DEFAULT NULL,
  `uczelnie` text DEFAULT NULL,
  `kursy` text DEFAULT NULL,
  `d_rozp_nauki` date DEFAULT NULL,
  `d_skon_nauki` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `szkoly/uczelnie/kursy`
--

INSERT INTO `szkoly/uczelnie/kursy` (`id_uzytkownik`, `szkoly`, `uczelnie`, `kursy`, `d_rozp_nauki`, `d_skon_nauki`) VALUES
(1, 'Szkoła podstawowa nr 1\r\nSzkoła średnia nr 1', 'Uczelnia xx', 'Kurs xx', '1999-03-02', '2018-04-05');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `doswiadczenie_zawodowe`
--
ALTER TABLE `doswiadczenie_zawodowe`
  ADD KEY `id_uzytkownik` (`id_uzytkownik`) USING BTREE;

--
-- Indeksy dla tabeli `podstawowe_informacje`
--
ALTER TABLE `podstawowe_informacje`
  ADD PRIMARY KEY (`id_uzy`) USING BTREE;

--
-- Indeksy dla tabeli `szkoly/uczelnie/kursy`
--
ALTER TABLE `szkoly/uczelnie/kursy`
  ADD KEY `id_uzytkownik` (`id_uzytkownik`) USING BTREE;

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `doswiadczenie_zawodowe`
--
ALTER TABLE `doswiadczenie_zawodowe`
  MODIFY `id_uzytkownik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `podstawowe_informacje`
--
ALTER TABLE `podstawowe_informacje`
  MODIFY `id_uzy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `szkoly/uczelnie/kursy`
--
ALTER TABLE `szkoly/uczelnie/kursy`
  MODIFY `id_uzytkownik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `doswiadczenie_zawodowe`
--
ALTER TABLE `doswiadczenie_zawodowe`
  ADD CONSTRAINT `doswiadczenie_zawodowe_ibfk_1` FOREIGN KEY (`id_uzytkownik`) REFERENCES `podstawowe_informacje` (`id_uzy`);

--
-- Ograniczenia dla tabeli `szkoly/uczelnie/kursy`
--
ALTER TABLE `szkoly/uczelnie/kursy`
  ADD CONSTRAINT `szkoly/uczelnie/kursy_ibfk_1` FOREIGN KEY (`id_uzytkownik`) REFERENCES `podstawowe_informacje` (`id_uzy`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
