-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2025 at 04:52 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mediconnect`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `appointment_date` date NOT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `mode` enum('video','physical') DEFAULT 'physical',
  `payment_proof` varchar(255) DEFAULT NULL,
  `consultation_time` time DEFAULT NULL,
  `zoom_link` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `patient_id`, `doctor_id`, `appointment_date`, `status`, `mode`, `payment_proof`, `consultation_time`, `zoom_link`, `location`) VALUES
(7, 32, 4, '2025-05-11', 'Pending', 'physical', NULL, NULL, NULL, NULL),
(28, 48, 4, '2025-05-18', 'Pending', 'physical', 'uploads\\payment_proof\\payment_1746614875554.jpg', '07:00:00', '', 'MediConnect Hospital,Kandy'),
(42, 48, 5, '2025-06-11', 'Confirmed', 'physical', NULL, '14:10:00', NULL, 'Medi connect,Kandy');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `specialization` varchar(100) NOT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `availability` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `user_id`, `name`, `specialization`, `contact`, `availability`, `created_at`) VALUES
(4, 22, 'shereen', 'Cardiologist', '73626183', 'Mon-Fri :9am to 5pm', '2025-05-04 09:25:39'),
(5, 18, 'Herna alis', 'Dermetologist', '783425166', 'Mon-Fri :11am to 3pm', '2025-05-04 16:35:18');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `email`, `message`) VALUES
(1, 'Shala', 'shala123@gmail.com', 'Impressive'),
(2, 'Shara', 'shara123@gmail.com', 'Very bad'),
(3, 'Manju', 'manj123@gmail.com', 'Impressive'),
(5, 'Ameera', 'ameera123@gmail.com', 'Good'),
(6, 'Haya', 'haya123@gmail.com', 'Good'),
(7, 'Hela', 'hela123@gmail.com', 'Excellent'),
(8, 'Asini', 'asini123@gmail.com', 'Impressive'),
(9, 'James', 'james123@gmail.com', 'Not bad'),
(10, 'Mahesh', 'mah123@gmail.com', 'Impressive'),
(11, 'Hathika', 'hathi123@gmail.com', 'Good');

-- --------------------------------------------------------

--
-- Table structure for table `health_readings`
--

CREATE TABLE `health_readings` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `reading_date` date NOT NULL,
  `blood_sugar` decimal(5,2) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `blood_pressure` varchar(15) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `health_readings`
--

INSERT INTO `health_readings` (`id`, `patient_id`, `reading_date`, `blood_sugar`, `weight`, `blood_pressure`, `notes`) VALUES
(1, 48, '2025-05-05', 115.00, 70.50, '120/80', NULL),
(12, 48, '2025-05-30', 600.00, 90.00, '200/150', ''),
(15, 48, '2025-06-02', 120.00, 50.00, '120/80', ''),
(16, 48, '2025-06-02', 250.00, 70.00, '120/80', '');

-- --------------------------------------------------------

--
-- Table structure for table `medical_recommendations`
--

CREATE TABLE `medical_recommendations` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `recommendation_text` text NOT NULL,
  `recommendation_type` enum('Physical Visit','Video Conference','Schedule Meeting') NOT NULL,
  `date_time` datetime NOT NULL,
  `video_link` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `meeting_purpose` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `medical_recommendations`
--

INSERT INTO `medical_recommendations` (`id`, `patient_id`, `recommendation_text`, `recommendation_type`, `date_time`, `video_link`, `location`, `meeting_purpose`, `created_at`) VALUES
(1, 1, 'Diet suggestions', '', '2025-05-14 08:50:00', '', 'Kandy Hospital', '', '2025-05-05 13:47:10');

-- --------------------------------------------------------

--
-- Table structure for table `patient_details`
--

CREATE TABLE `patient_details` (
  `patient_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `medical_history` text DEFAULT NULL,
  `hypertension` tinyint(1) DEFAULT NULL,
  `heart_disease` tinyint(1) DEFAULT NULL,
  `smoking_history` varchar(50) DEFAULT NULL,
  `bmi` decimal(5,2) DEFAULT NULL,
  `HbA1c_level` decimal(4,2) DEFAULT NULL,
  `blood_glucose_level` int(11) DEFAULT NULL,
  `diabetes` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `patient_details`
--

INSERT INTO `patient_details` (`patient_id`, `user_id`, `name`, `email`, `contact`, `address`, `age`, `gender`, `medical_history`, `hypertension`, `heart_disease`, `smoking_history`, `bmi`, `HbA1c_level`, `blood_glucose_level`, `diabetes`) VALUES
(1, 1, '', '', '74233337', 'Matale', 28, 'Female', 'Blood pressure', 0, 1, 'Never', 34.70, 66.70, 67, 'No'),
(2, 32, '', '', '74233333', 'Kandy', 45, 'Male', 'Appendix', 1, 0, 'Often', 25.70, 66.70, 90, 'Yes'),
(5, 38, '', '', '72555555', 'Jaffna', 28, 'Male', 'None', 0, 0, 'Never', 27.32, 5.70, 158, 'No'),
(6, 39, '', '', '759999990', 'Udathalawina', 35, 'Female', 'None', 0, 0, 'Current', 20.14, 5.00, 155, 'No'),
(49, 48, '', '', '0752345677', 'Matale', 45, 'Male', NULL, 0, 0, NULL, 5.50, 4.20, 120, NULL),
(50, 48, '', '', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 5.60, 8.20, 250, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `predictive_suggestions`
--

CREATE TABLE `predictive_suggestions` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `risk_level` varchar(50) DEFAULT NULL,
  `diet_plan` text DEFAULT NULL,
  `exercise_plan` text DEFAULT NULL,
  `lifestyle_tips` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `predictive_suggestions`
--

INSERT INTO `predictive_suggestions` (`id`, `patient_id`, `risk_level`, `diet_plan`, `exercise_plan`, `lifestyle_tips`, `created_at`) VALUES
(1, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit intake of added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-06 21:54:02'),
(2, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit intake of added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-06 22:01:16'),
(20, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit intake of added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-06 23:10:37'),
(21, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit intake of added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-06 23:10:37'),
(36, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit intake of added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-26 07:21:58'),
(37, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit intake of added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-26 07:21:58'),
(38, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit intake of added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 05:55:06'),
(39, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit intake of added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 05:55:06'),
(40, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit intake of added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 05:55:10'),
(41, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit intake of added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 06:05:38'),
(42, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit intake of added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 06:05:38'),
(43, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit intake of added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 06:16:45'),
(44, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit intake of added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 06:16:45'),
(45, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit intake of added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 06:18:22'),
(46, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit intake of added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 06:18:22'),
(47, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit intake of added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 06:18:27'),
(48, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit intake of added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 07:50:02'),
(49, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit intake of added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 07:50:02'),
(50, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit intake of added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 08:45:06'),
(51, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit intake of added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 08:45:06'),
(52, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit intake of added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 08:47:31'),
(53, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit intake of added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 08:47:31'),
(54, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit intake of added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 08:47:34'),
(55, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 09:30:16'),
(56, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 09:30:16'),
(57, 48, 'High Risk', 'Adopt a low glycemic index diet rich in vegetables, whole grains, lean proteins, and legumes. Avoid sugary drinks, processed snacks, and fried foods. Eat smaller, frequent meals to maintain stable glucose levels.', 'Engage in at least 150 minutes of moderate-intensity aerobic exercise weekly (e.g., brisk walking, cycling, swimming). Include strength training 2 times per week.', 'Monitor blood sugar regularly. Prioritize 7–8 hours of quality sleep daily. Practice mindfulness, reduce stress through yoga/meditation, avoid smoking, and limit alcohol.', '2025-05-30 09:36:02'),
(58, 48, 'High Risk', 'Adopt a low glycemic index diet rich in vegetables, whole grains, lean proteins, and legumes. Avoid sugary drinks, processed snacks, and fried foods. Eat smaller, frequent meals to maintain stable glucose levels.', 'Engage in at least 150 minutes of moderate-intensity aerobic exercise weekly (e.g., brisk walking, cycling, swimming). Include strength training 2 times per week.', 'Monitor blood sugar regularly. Prioritize 7–8 hours of quality sleep daily. Practice mindfulness, reduce stress through yoga/meditation, avoid smoking, and limit alcohol.', '2025-05-30 09:36:02'),
(59, 48, 'High Risk', 'Adopt a low glycemic index diet rich in vegetables, whole grains, lean proteins, and legumes. Avoid sugary drinks, processed snacks, and fried foods. Eat smaller, frequent meals to maintain stable glucose levels.', 'Engage in at least 150 minutes of moderate-intensity aerobic exercise weekly (e.g., brisk walking, cycling, swimming). Include strength training 2 times per week.', 'Monitor blood sugar regularly. Prioritize 7–8 hours of quality sleep daily. Practice mindfulness, reduce stress through yoga/meditation, avoid smoking, and limit alcohol.', '2025-05-30 09:38:30'),
(60, 48, 'High Risk', 'Adopt a low glycemic index diet rich in vegetables, whole grains, lean proteins, and legumes. Avoid sugary drinks, processed snacks, and fried foods. Eat smaller, frequent meals to maintain stable glucose levels.', 'Engage in at least 150 minutes of moderate-intensity aerobic exercise weekly (e.g., brisk walking, cycling, swimming). Include strength training 2 times per week.', 'Monitor blood sugar regularly. Prioritize 7–8 hours of quality sleep daily. Practice mindfulness, reduce stress through yoga/meditation, avoid smoking, and limit alcohol.', '2025-05-30 09:38:30'),
(61, 48, 'High Risk', 'Adopt a low glycemic index diet rich in vegetables, whole grains, lean proteins, and legumes. Avoid sugary drinks, processed snacks, and fried foods. Eat smaller, frequent meals to maintain stable glucose levels.', 'Engage in at least 150 minutes of moderate-intensity aerobic exercise weekly (e.g., brisk walking, cycling, swimming). Include strength training 2 times per week.', 'Monitor blood sugar regularly. Prioritize 7–8 hours of quality sleep daily. Practice mindfulness, reduce stress through yoga/meditation, avoid smoking, and limit alcohol.', '2025-05-30 09:38:33'),
(62, 48, 'High Risk', 'Adopt a low glycemic index diet rich in vegetables, whole grains, lean proteins, and legumes. Avoid sugary drinks, processed snacks, and fried foods. Eat smaller, frequent meals to maintain stable glucose levels.', 'Engage in at least 150 minutes of moderate-intensity aerobic exercise weekly (e.g., brisk walking, cycling, swimming). Include strength training 2 times per week.', 'Monitor blood sugar regularly. Prioritize 7–8 hours of quality sleep daily. Practice mindfulness, reduce stress through yoga/meditation, avoid smoking, and limit alcohol.', '2025-05-30 09:38:35'),
(63, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 09:39:29'),
(64, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 09:39:29'),
(65, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 09:40:02'),
(66, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 09:40:02'),
(67, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 09:40:03'),
(68, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 09:40:29'),
(69, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 09:40:29'),
(70, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 09:40:31'),
(71, 48, 'High Risk', 'Adopt a low glycemic index diet rich in vegetables, whole grains, lean proteins, and legumes. Avoid sugary drinks, processed snacks, and fried foods. Eat smaller, frequent meals to maintain stable glucose levels.', 'Engage in at least 150 minutes of moderate-intensity aerobic exercise weekly (e.g., brisk walking, cycling, swimming). Include strength training 2 times per week.', 'Monitor blood sugar regularly. Prioritize 7–8 hours of quality sleep daily. Practice mindfulness, reduce stress through yoga/meditation, avoid smoking, and limit alcohol.', '2025-05-30 10:17:22'),
(72, 48, 'High Risk', 'Adopt a low glycemic index diet rich in vegetables, whole grains, lean proteins, and legumes. Avoid sugary drinks, processed snacks, and fried foods. Eat smaller, frequent meals to maintain stable glucose levels.', 'Engage in at least 150 minutes of moderate-intensity aerobic exercise weekly (e.g., brisk walking, cycling, swimming). Include strength training 2 times per week.', 'Monitor blood sugar regularly. Prioritize 7–8 hours of quality sleep daily. Practice mindfulness, reduce stress through yoga/meditation, avoid smoking, and limit alcohol.', '2025-05-30 10:17:22'),
(73, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 10:18:12'),
(74, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 10:18:12'),
(75, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 10:18:24'),
(76, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-05-30 10:18:24'),
(77, 48, 'High Risk', 'Adopt a low glycemic index diet rich in vegetables, whole grains, lean proteins, and legumes. Avoid sugary drinks, processed snacks, and fried foods. Eat smaller, frequent meals to maintain stable glucose levels.', 'Engage in at least 150 minutes of moderate-intensity aerobic exercise weekly (e.g., brisk walking, cycling, swimming). Include strength training 2 times per week.', 'Monitor blood sugar regularly. Prioritize 7–8 hours of quality sleep daily. Practice mindfulness, reduce stress through yoga/meditation, avoid smoking, and limit alcohol.', '2025-05-30 10:20:02'),
(78, 48, 'High Risk', 'Adopt a low glycemic index diet rich in vegetables, whole grains, lean proteins, and legumes. Avoid sugary drinks, processed snacks, and fried foods. Eat smaller, frequent meals to maintain stable glucose levels.', 'Engage in at least 150 minutes of moderate-intensity aerobic exercise weekly (e.g., brisk walking, cycling, swimming). Include strength training 2 times per week.', 'Monitor blood sugar regularly. Prioritize 7–8 hours of quality sleep daily. Practice mindfulness, reduce stress through yoga/meditation, avoid smoking, and limit alcohol.', '2025-05-30 10:20:02'),
(79, 48, 'High Risk', 'Adopt a low glycemic index diet rich in vegetables, whole grains, lean proteins, and legumes. Avoid sugary drinks, processed snacks, and fried foods. Eat smaller, frequent meals to maintain stable glucose levels.', 'Engage in at least 150 minutes of moderate-intensity aerobic exercise weekly (e.g., brisk walking, cycling, swimming). Include strength training 2 times per week.', 'Monitor blood sugar regularly. Prioritize 7–8 hours of quality sleep daily. Practice mindfulness, reduce stress through yoga/meditation, avoid smoking, and limit alcohol.', '2025-05-30 10:31:09'),
(80, 48, 'High Risk', 'Adopt a low glycemic index diet rich in vegetables, whole grains, lean proteins, and legumes. Avoid sugary drinks, processed snacks, and fried foods. Eat smaller, frequent meals to maintain stable glucose levels.', 'Engage in at least 150 minutes of moderate-intensity aerobic exercise weekly (e.g., brisk walking, cycling, swimming). Include strength training 2 times per week.', 'Monitor blood sugar regularly. Prioritize 7–8 hours of quality sleep daily. Practice mindfulness, reduce stress through yoga/meditation, avoid smoking, and limit alcohol.', '2025-05-30 10:31:11'),
(81, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-06-02 03:13:40'),
(82, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-06-02 03:13:40'),
(83, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-06-02 06:31:18'),
(84, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-06-02 06:31:18'),
(85, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-06-02 06:31:29'),
(86, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-06-02 06:31:29'),
(87, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-06-02 06:36:46'),
(88, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-06-02 06:36:46'),
(89, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-06-02 08:40:52'),
(90, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-06-02 08:40:52'),
(91, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-06-02 08:43:03'),
(92, 48, 'Low Risk', 'Maintain a balanced diet rich in fruits, vegetables, lean proteins, and whole grains. Limit added sugars and saturated fats. Stay hydrated.', 'Do 30–45 minutes of physical activity most days, like walking, jogging, or yoga. Include occasional strength or flexibility exercises.', 'Keep a regular sleep routine (7–9 hours/night). Manage stress with hobbies or relaxation techniques. Avoid smoking and consume alcohol in moderation if at all.', '2025-06-02 08:43:03'),
(93, 48, 'High Risk', 'Adopt a low glycemic index diet rich in vegetables, whole grains, lean proteins, and legumes. Avoid sugary drinks, processed snacks, and fried foods. Eat smaller, frequent meals to maintain stable glucose levels.', 'Engage in at least 150 minutes of moderate-intensity aerobic exercise weekly (e.g., brisk walking, cycling, swimming). Include strength training 2 times per week.', 'Monitor blood sugar regularly. Prioritize 7–8 hours of quality sleep daily. Practice mindfulness, reduce stress through yoga/meditation, avoid smoking, and limit alcohol.', '2025-06-02 08:45:41'),
(94, 48, 'High Risk', 'Adopt a low glycemic index diet rich in vegetables, whole grains, lean proteins, and legumes. Avoid sugary drinks, processed snacks, and fried foods. Eat smaller, frequent meals to maintain stable glucose levels.', 'Engage in at least 150 minutes of moderate-intensity aerobic exercise weekly (e.g., brisk walking, cycling, swimming). Include strength training 2 times per week.', 'Monitor blood sugar regularly. Prioritize 7–8 hours of quality sleep daily. Practice mindfulness, reduce stress through yoga/meditation, avoid smoking, and limit alcohol.', '2025-06-02 08:45:41');

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `prescribed_date` date DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `prescriptions`
--

INSERT INTO `prescriptions` (`id`, `doctor_id`, `patient_id`, `appointment_id`, `prescribed_date`, `notes`) VALUES
(1, 4, 1, 7, '2025-05-04', 'Paracetamol 500mg twice daily'),
(3, 5, 32, 7, '2025-05-05', 'Antibiotic for 5 days'),
(6, 4, 48, 28, '2025-05-06', 'Paracetamol 500mg twice daily\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `fee` decimal(10,2) DEFAULT NULL,
  `slots` int(11) DEFAULT NULL,
  `room` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id`, `user_id`, `date`, `start_time`, `end_time`, `fee`, `slots`, `room`, `notes`) VALUES
(2, 22, '2025-05-20', '07:30:00', '10:30:00', 3000.00, 12, '123', ''),
(4, 34, '2025-05-22', '06:42:00', '10:42:00', 5000.00, 17, '234', ''),
(5, 18, '2025-05-20', '07:25:00', '13:25:00', 5000.00, 20, '123', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `status` enum('pending','approved') NOT NULL DEFAULT 'approved'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `status`) VALUES
(1, 'Maha', 'maha123@gmail.com', '$2b$10$u8tEgzSPLYqsBX3LlLuJ..SQ1RczvKZsZtRqJWu2Mp7duLm6A9kDW', 'Patient', 'approved'),
(18, 'herna', 'herna123@gmail.com', '$2b$10$lq8jknrmAOKSMJ4TwCGPGel2CmtWC8S/gil54sBvkP19DFS9iqWOK', 'Doctor', 'approved'),
(22, 'shereen', 'shereen123@gmail.com', '$2b$10$YGYyrT0i82aLTZuOrDJcIukdWmge2yBhM9a0Lk/BDYSRwlcwPMWNS', 'Doctor', 'approved'),
(32, 'Mahdhi', 'mahdhi123@gmail.com', '', 'Patient', 'approved'),
(34, 'Perera', 'perera123@gmail.com', '$2b$10$9d8pIcNdYREZTE.7X.peXez13A.dknYfYCqjWDS9mI4fjiRtFsey.', 'Doctor', 'pending'),
(35, 'Dilshan', 'dilshan123@gmail.com', '$2b$10$0hXOxNMk1jOJ1CQtYsDr6uQuIZysawTYh6B/TTMlOIme8QowdmFji', 'Admin', 'approved'),
(38, 'Thisara', 'thisara123@gmail.com', '', 'Patient', 'approved'),
(39, 'Fathima', 'fathima123@gmail.com', '', 'Patient', 'approved'),
(42, 'Sadeepa', 'sadeepa123@gmail.com', '$2b$10$db4AV9pEF00BeSd.y8Eedu0eZ3k6GwH5hOu0rB5KZGJFgzSkIp6ZO', 'Super Admin', 'approved'),
(48, 'Kamal', 'kamal123@gmail.com', '$2b$10$lLXaI1Vl0clZcPHsCK6hJenJwnPI6X246WF9PkgubQHv.I8UtS86y', 'Patient', 'approved'),
(49, 'Ganga', 'ganga123@gmail.com', '$2b$10$iJpMv9ZytN55BLcE7tc4U.A1smZRp7xOJq5XeA0AY5MrJFO1aZSSS', 'Patient', 'approved'),
(55, 'Hashen', 'hashen123@gmail.com', '$2b$10$JMZ5zXt7ld1cLSOfwrkX/.vVZiEAZJvh/tF7MJBGKebJOKu7AC/E2', 'Patient', 'approved'),
(65, 'Manal', 'manal123@gmail.com', '$2b$10$JEyfEM5t.ggQduDI1YSUMuBVMQAuZ3.PPNaTqoCIe4HBoyvA9vEGK', 'Patient', 'approved'),
(66, 'Hema', 'hema123@gmail.com', '$2b$10$3oysbsMYyLSQa4LWUkMEJu1xB4/d4hRT8hZxJhXTN3gv.Z4FoeebG', 'Admin', 'approved'),
(67, 'Jame', 'jame123@gmail.com', '$2b$10$KuC58sb8pmQiBhmIeGaNPedskGBdZZ6bLeRM.SRVBmj6mudil78Cy', 'Patient', 'approved'),
(68, 'Haseni', 'haseni123@gmail.com', '$2b$10$dRdL2I7nqMreL11nvcPsfOWFg2YFKD4whB3Vtqa0OIR3omXaThEXe', 'Admin', 'pending'),
(69, 'Keshala', 'kes123@gmail.com', '', 'Patient', 'approved'),
(70, 'Hathika', 'hathi123@gmail.com', '$2b$10$ZMIothPc2XB99cQv/nXI7uMJ1quvgLcilAkn7p0NAGvm0rFcj/V.q', 'Doctor', 'approved'),
(71, 'Farhana', 'farhana123@gmail.com', '$2b$10$KuYORDNs3CRaXmi5DusJMOBCucjjYNx/es64B0y1jSBBSMcZ.KP5G', 'Admin', 'pending'),
(72, 'Hama', 'hama123@gmail.com', '$2b$10$2OHB9ECaxBgKSwtP8g612uyIUSKuzlnbjBQZcUCB5HlRSsWrzFq.y', 'Patient', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `video_consultations`
--

CREATE TABLE `video_consultations` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `meeting_link` varchar(255) NOT NULL,
  `scheduled_time` datetime NOT NULL,
  `status` enum('pending','completed','cancelled') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `health_readings`
--
ALTER TABLE `health_readings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `medical_recommendations`
--
ALTER TABLE `medical_recommendations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `patient_details`
--
ALTER TABLE `patient_details`
  ADD PRIMARY KEY (`patient_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `predictive_suggestions`
--
ALTER TABLE `predictive_suggestions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `video_consultations`
--
ALTER TABLE `video_consultations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointment_id` (`appointment_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `health_readings`
--
ALTER TABLE `health_readings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `medical_recommendations`
--
ALTER TABLE `medical_recommendations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `patient_details`
--
ALTER TABLE `patient_details`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `predictive_suggestions`
--
ALTER TABLE `predictive_suggestions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `video_consultations`
--
ALTER TABLE `video_consultations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`);

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `health_readings`
--
ALTER TABLE `health_readings`
  ADD CONSTRAINT `health_readings_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `medical_recommendations`
--
ALTER TABLE `medical_recommendations`
  ADD CONSTRAINT `medical_recommendations_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `patient_details`
--
ALTER TABLE `patient_details`
  ADD CONSTRAINT `patient_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `predictive_suggestions`
--
ALTER TABLE `predictive_suggestions`
  ADD CONSTRAINT `predictive_suggestions_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `prescriptions_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `prescriptions_ibfk_3` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`);

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `video_consultations`
--
ALTER TABLE `video_consultations`
  ADD CONSTRAINT `video_consultations_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`),
  ADD CONSTRAINT `video_consultations_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `video_consultations_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `patient_details` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
