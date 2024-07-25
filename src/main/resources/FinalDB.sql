-- --------------------------------------------------------
-- 호스트:                          3.36.117.205
-- 서버 버전:                        11.3.2-MariaDB-1:11.3.2+maria~ubu2004 - mariadb.org binary distribution
-- 서버 OS:                        debian-linux-gnu
-- HeidiSQL 버전:                  12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- 테이블 GA.attendance 구조 내보내기
CREATE TABLE IF NOT EXISTS `attendance` (
  `atd_num` int(11) NOT NULL AUTO_INCREMENT,
  `emp_code` varchar(50) NOT NULL,
  `atd_in_time` datetime DEFAULT NULL,
  `atd_out_time` datetime DEFAULT NULL,
  PRIMARY KEY (`atd_num`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.calendar 구조 내보내기
CREATE TABLE IF NOT EXISTS `calendar` (
  `cal_num` int(11) NOT NULL AUTO_INCREMENT,
  `cal_writer` varchar(50) NOT NULL,
  `cal_type` varchar(50) NOT NULL,
  `cal_target_type` varchar(50) NOT NULL,
  `cal_title` varchar(50) NOT NULL,
  `cal_content` varchar(50) NOT NULL,
  `cal_start_date` datetime NOT NULL,
  `cal_end_date` datetime NOT NULL,
  `cal_create_date` datetime NOT NULL,
  `cal_update_date` datetime NOT NULL,
  PRIMARY KEY (`cal_num`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.cal_comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `cal_comment` (
  `cal_comment_num` int(11) NOT NULL AUTO_INCREMENT,
  `cal_num` int(11) NOT NULL,
  `cal_comment_writer` varchar(50) NOT NULL,
  `cal_comment_create_content` varchar(50) NOT NULL,
  `cal_comment_create_date` date NOT NULL,
  `cal_comment_update_date` date NOT NULL,
  PRIMARY KEY (`cal_comment_num`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.chat 구조 내보내기
CREATE TABLE IF NOT EXISTS `chat` (
  `chat_sender` varchar(20) NOT NULL,
  `chat_name` varchar(20) NOT NULL,
  `chat_group` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.chat_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `chat_history` (
  `chat_history_num` varchar(20) NOT NULL,
  `chat_room_num` varchar(20) NOT NULL,
  `chat_sender` varchar(20) NOT NULL,
  `chat_name` varchar(50) DEFAULT NULL,
  `chat_message` varchar(20) NOT NULL,
  `chat_timestamp` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.chat_room 구조 내보내기
CREATE TABLE IF NOT EXISTS `chat_room` (
  `chat_room_num` varchar(20) NOT NULL,
  `chat_room_name` varchar(20) NOT NULL,
  `chat_room_ppnum` varchar(20) NOT NULL,
  `chat_room_timestamp` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.common_code 구조 내보내기
CREATE TABLE IF NOT EXISTS `common_code` (
  `code_id` varchar(50) NOT NULL,
  `code_group_name` varchar(50) NOT NULL,
  `code_value` varchar(50) NOT NULL,
  `code_name` varchar(50) NOT NULL,
  `code_desc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.community 구조 내보내기
CREATE TABLE IF NOT EXISTS `community` (
  `comm_num` int(11) NOT NULL AUTO_INCREMENT,
  `comm_writer` varchar(50) NOT NULL,
  `file_name` varchar(50) DEFAULT NULL,
  `comm_category` enum('T','F','A') NOT NULL DEFAULT 'T',
  `comm_title` varchar(50) NOT NULL,
  `comm_content` varchar(50) NOT NULL,
  `comm_blind` enum('F','A') NOT NULL DEFAULT 'F',
  `comm_map_addr` varchar(50) DEFAULT NULL,
  `comm_create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `comm_update_date` datetime DEFAULT NULL,
  `comm_count` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`comm_num`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.community_comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `community_comment` (
  `comm_comment_num` int(11) NOT NULL AUTO_INCREMENT,
  `comm_num` int(11) NOT NULL,
  `comm_comment_writer` varchar(50) NOT NULL,
  `comm_comment_content` varchar(200) NOT NULL,
  `comm_comment_create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `comm_comment_update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`comm_comment_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.edoc 구조 내보내기
CREATE TABLE IF NOT EXISTS `edoc` (
  `edoc_num` int(11) NOT NULL AUTO_INCREMENT,
  `edoc_type` varchar(50) NOT NULL,
  `file_name` varchar(50) DEFAULT NULL,
  `edoc_writer` varchar(50) NOT NULL DEFAULT '0',
  `edoc_status` enum('0','1','2','-1','-2') NOT NULL DEFAULT '0',
  `edoc_del_status` enum('0','1') NOT NULL DEFAULT '0',
  `edoc_enroll_date` date NOT NULL DEFAULT current_timestamp(),
  `edoc_done_date` date DEFAULT NULL,
  `edoc_title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`edoc_num`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.edoc_approval 구조 내보내기
CREATE TABLE IF NOT EXISTS `edoc_approval` (
  `appr_num` int(11) NOT NULL AUTO_INCREMENT,
  `edoc_num` int(11) NOT NULL,
  `approver` varchar(50) NOT NULL DEFAULT '0',
  `appr_order` varchar(50) NOT NULL,
  `appr_status` enum('0','1','-1') NOT NULL DEFAULT '0',
  `appr_reason` varchar(50) DEFAULT NULL,
  `appr_date` date DEFAULT NULL,
  PRIMARY KEY (`appr_num`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.edoc_car 구조 내보내기
CREATE TABLE IF NOT EXISTS `edoc_car` (
  `edoc_num` int(11) NOT NULL,
  `car_reason` varchar(50) NOT NULL,
  `car_departure` varchar(50) NOT NULL,
  `car_arrival` varchar(50) NOT NULL,
  `car_start_date` date NOT NULL,
  `car_return_date` date NOT NULL,
  `car_type` varchar(50) NOT NULL,
  `car_num` varchar(50) NOT NULL,
  PRIMARY KEY (`edoc_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.edoc_draft 구조 내보내기
CREATE TABLE IF NOT EXISTS `edoc_draft` (
  `edoc_num` int(11) NOT NULL,
  `prop_start_date` datetime NOT NULL,
  `prop_end_date` datetime NOT NULL,
  `prop_title` varchar(50) NOT NULL,
  `prop_content` varchar(200) NOT NULL,
  PRIMARY KEY (`edoc_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.edoc_event 구조 내보내기
CREATE TABLE IF NOT EXISTS `edoc_event` (
  `edoc_num` int(11) NOT NULL,
  `event_type` varchar(50) NOT NULL,
  `event_date` date NOT NULL,
  `event_place` varchar(50) NOT NULL,
  `event_expense` int(11) NOT NULL,
  PRIMARY KEY (`edoc_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.edoc_file 구조 내보내기
CREATE TABLE IF NOT EXISTS `edoc_file` (
  `file_name` varchar(50) NOT NULL,
  `original_file_name` varchar(50) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `file_create_date` date NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`file_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.edoc_form_type 구조 내보내기
CREATE TABLE IF NOT EXISTS `edoc_form_type` (
  `edoc_type` varchar(50) NOT NULL,
  `edoc_form_title` varchar(50) NOT NULL,
  `edoc_form_desc` varchar(200) NOT NULL,
  `edoc_form_create_date` date NOT NULL,
  `edoc_form_update_date` date NOT NULL,
  PRIMARY KEY (`edoc_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.edoc_project 구조 내보내기
CREATE TABLE IF NOT EXISTS `edoc_project` (
  `edoc_num` int(11) NOT NULL,
  `project_content` varchar(200) NOT NULL,
  `project_estimate` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`edoc_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.edoc_report 구조 내보내기
CREATE TABLE IF NOT EXISTS `edoc_report` (
  `edoc_num` int(11) NOT NULL,
  `report_type` varchar(50) NOT NULL,
  `report_content` varchar(50) NOT NULL,
  PRIMARY KEY (`edoc_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.edoc_vacation 구조 내보내기
CREATE TABLE IF NOT EXISTS `edoc_vacation` (
  `edoc_num` int(11) NOT NULL,
  `vac_type` varchar(50) NOT NULL,
  `vac_start_date` date NOT NULL,
  `vac_end_date` date NOT NULL,
  `vac_reason` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`edoc_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.emp 구조 내보내기
CREATE TABLE IF NOT EXISTS `emp` (
  `emp_code` varchar(8) NOT NULL,
  `team_code` varchar(20) NOT NULL,
  `rank_code` varchar(20) NOT NULL,
  `emp_profile` varchar(50) DEFAULT NULL,
  `emp_id` varchar(100) NOT NULL,
  `emp_pw` varchar(20) NOT NULL,
  `emp_kor_name` varchar(20) NOT NULL,
  `emp_eng_name` varchar(20) DEFAULT NULL,
  `emp_reg_no` varchar(20) DEFAULT NULL,
  `emp_gender` varchar(20) DEFAULT NULL,
  `emp_phone` varchar(20) DEFAULT NULL,
  `emergency_phone_relation` varchar(20) DEFAULT NULL,
  `emergency_phone` varchar(20) DEFAULT NULL,
  `post_code` varchar(20) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `detail_address` varchar(20) DEFAULT NULL,
  `total_leave` int(11) DEFAULT NULL,
  `use_leave` int(11) DEFAULT 0,
  `emp_ext` varchar(20) DEFAULT NULL,
  `emp_hire_date` date DEFAULT NULL,
  `emp_resign_date` date DEFAULT NULL,
  `emp_update_date` date DEFAULT NULL,
  `final_modifier` varchar(20) DEFAULT NULL,
  `org_icon` varchar(50) NOT NULL,
  PRIMARY KEY (`emp_code`) USING BTREE,
  UNIQUE KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.forum_file 구조 내보내기
CREATE TABLE IF NOT EXISTS `forum_file` (
  `file_name` varchar(50) NOT NULL,
  `original_file_name` varchar(50) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `file_create_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`file_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.msg 구조 내보내기
CREATE TABLE IF NOT EXISTS `msg` (
  `msg_num` int(11) NOT NULL AUTO_INCREMENT,
  `msg_sender` varchar(8) NOT NULL,
  `msg_receiver` varchar(8) NOT NULL,
  `file_name` varchar(50) DEFAULT NULL,
  `msg_title` varchar(50) NOT NULL,
  `msg_content` varchar(200) NOT NULL,
  `msg_send_time` datetime NOT NULL DEFAULT current_timestamp(),
  `msg_read_time` datetime DEFAULT NULL,
  `msg_send_del_status` enum('N','Y','D') NOT NULL DEFAULT 'N',
  `msg_receive_del_status` enum('N','Y','D') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`msg_num`),
  KEY `FK_msg_sender` (`msg_receiver`),
  KEY `FK_msg_receiver` (`msg_sender`),
  CONSTRAINT `FK_msg_receiver` FOREIGN KEY (`msg_sender`) REFERENCES `emp` (`emp_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_msg_sender` FOREIGN KEY (`msg_receiver`) REFERENCES `emp` (`emp_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.msg_file 구조 내보내기
CREATE TABLE IF NOT EXISTS `msg_file` (
  `file_name` varchar(50) NOT NULL,
  `original_file_name` varchar(50) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `file_create_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`file_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.notice 구조 내보내기
CREATE TABLE IF NOT EXISTS `notice` (
  `notice_num` int(11) NOT NULL AUTO_INCREMENT,
  `notice_writer` varchar(50) NOT NULL,
  `file_name` varchar(50) DEFAULT NULL,
  `notice_category` enum('T','C','M','Q') NOT NULL DEFAULT 'T',
  `notice_title` varchar(50) NOT NULL,
  `notice_content` varchar(50) NOT NULL,
  `notice_create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `notice_update_date` datetime DEFAULT NULL,
  `notice_count` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`notice_num`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.payment 구조 내보내기
CREATE TABLE IF NOT EXISTS `payment` (
  `order_num` int(11) NOT NULL AUTO_INCREMENT,
  `prod_code` varchar(50) NOT NULL,
  `emp_code` varchar(50) NOT NULL,
  `pay_type` varchar(50) NOT NULL,
  `pay_amount` int(11) NOT NULL,
  `pay_price` int(11) NOT NULL,
  `pay_time` date NOT NULL,
  PRIMARY KEY (`order_num`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.product 구조 내보내기
CREATE TABLE IF NOT EXISTS `product` (
  `prod_code` varchar(50) NOT NULL,
  `prod_price` varchar(50) NOT NULL,
  `prod_content` varchar(50) NOT NULL,
  `prod_create_date` date NOT NULL,
  `prod_update_date` date NOT NULL,
  `prod_Img` varchar(50) NOT NULL,
  PRIMARY KEY (`prod_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.profileimg 구조 내보내기
CREATE TABLE IF NOT EXISTS `profileimg` (
  `img_name` varchar(50) NOT NULL,
  `img_original_name` varchar(50) NOT NULL,
  `img_type` varchar(20) NOT NULL,
  `img_size` varchar(20) NOT NULL,
  `img_create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `img_update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`img_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.pw_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `pw_history` (
  `pw_num` int(11) NOT NULL AUTO_INCREMENT,
  `emp_code` varchar(8) NOT NULL,
  `pw_previous` varchar(20) NOT NULL,
  `pw_create_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`pw_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.team 구조 내보내기
CREATE TABLE IF NOT EXISTS `team` (
  `team_code` varchar(20) NOT NULL,
  `team_name` varchar(20) NOT NULL,
  `team_des` varchar(50) DEFAULT NULL,
  `parent_team_code` varchar(20) NOT NULL,
  `team_create_date` date NOT NULL DEFAULT current_timestamp(),
  `team_update_date` date NOT NULL,
  `org_icon` varchar(50) NOT NULL,
  PRIMARY KEY (`team_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 GA.team_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `team_history` (
  `team_history_num` int(11) NOT NULL AUTO_INCREMENT,
  `emp_code` varchar(8) NOT NULL,
  `asis_team_code` varchar(20) NOT NULL,
  `tobe_team_code` varchar(20) NOT NULL,
  `team_history_reason` varchar(100) NOT NULL,
  `team_move_date` date NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`team_history_num`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
