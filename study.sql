-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016 年 01 月 13 日 12:50
-- 服务器版本: 5.5.20
-- PHP 版本: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `study`
--

-- --------------------------------------------------------

--
-- 表的结构 `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `idnumber` int(11) NOT NULL COMMENT '视频id',
  `support` int(11) NOT NULL DEFAULT '0' COMMENT '支持的次数',
  `opposition` int(11) NOT NULL DEFAULT '0' COMMENT '反对',
  `commentname` varchar(50) NOT NULL,
  `content` text NOT NULL COMMENT '内容',
  `datatime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发表时间',
  `flags` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增',
  KEY `flags` (`flags`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- 转存表中的数据 `comments`
--

INSERT INTO `comments` (`idnumber`, `support`, `opposition`, `commentname`, `content`, `datatime`, `flags`) VALUES
(1, 8, 3, '游客', '这个是要做什么的饿啊', '2015-12-14 01:09:58', 16),
(121, 2, 1, '222', ' 得得得   ', '2015-12-17 10:40:35', 17),
(151, 1, 0, '222', ' lll', '2015-12-17 10:50:39', 18),
(13, 2, 1, '222', ' 的dddd 得得得得得得', '2015-12-17 10:56:35', 19),
(65, 3, 1, '游客', ' lllljkjjjjjjjjjjjjjjjjjj', '2015-12-26 02:05:18', 20),
(18, 3, 0, '游客', '  hjj', '2015-12-28 01:00:21', 21),
(18, 0, 0, '游客', ' jjjjjjjjjjjjjjj', '2015-12-28 01:00:51', 22),
(110, 1, 0, '游客', ' fddddddddd', '2016-01-07 09:50:38', 23),
(121, 3, 1, '222', ' dededede ', '2016-01-07 09:53:16', 24),
(1, 1, 0, 'jet', ' 顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶吧   ', '2016-01-13 05:13:25', 25);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `email` varchar(60) CHARACTER SET gbk DEFAULT NULL COMMENT '登录email',
  `username` varchar(60) CHARACTER SET gbk NOT NULL,
  `password` varchar(60) CHARACTER SET gb2312 NOT NULL COMMENT '密码'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='使用者';

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`email`, `username`, `password`) VALUES
('983433479@qq.com', 'jet', 'wj123'),
('98@12', 'www zssdddd', '123443232'),
('123@123.com', '222', '2222'),
('2@123.com', '22ww', 'weddree'),
('23@123', 'e鐨勭殑鐑︿汉+', '123453221'),
('123@1234.com', 'wkdkldlld', 'wwww'),
('1233@124345.com', 'wkdkldllddldldlldld', 'dddddddddddddddd'),
('ssss@134.nmm', 'wkdkldllddldldlldld2www', 'ssss'),
('ssssssssssssssssssss@123.bb', 'wkdkldllddldldlldld2wwww', 'wwwwwwwwwwwwww'),
('wwww@113234.bgg', 'wkdkldllddldldlldld2wwwwwwwd', 'wwwww'),
('123@11333.cdede', 'wkdkldllwwwwwwd', '12334'),
('777@qq.com', '55555555555555', 'dddddddddddd'),
('dede@q.com', '王的的得得', '1111111111111');

-- --------------------------------------------------------

--
-- 表的结构 `videoitem`
--

CREATE TABLE IF NOT EXISTS `videoitem` (
  `type` varchar(20) NOT NULL COMMENT ' 视频的类型',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `imgpath` varchar(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '加入日期',
  `videoname` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL COMMENT '定位的url的连接',
  `briefintroduction` text COMMENT '视频的简介',
  `videourl` varchar(300) DEFAULT NULL COMMENT '网址的连接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=166 ;

--
-- 转存表中的数据 `videoitem`
--

INSERT INTO `videoitem` (`type`, `id`, `imgpath`, `date`, `videoname`, `url`, `briefintroduction`, `videourl`) VALUES
('android', 1, '/Study/image/android/1.jpg', '2015-12-07 08:00:47', '视频1', 'item.php?id=1', 'Android第1节', 'http://www.imooc.com/course/list?c=android'),
('android', 2, '/Study/image/android/2.jpg', '2015-12-07 10:40:56', '视频2', 'item.php?id=2', 'Android第2节', 'http://www.imooc.com/course/list?c=android'),
('android', 3, '/Study/image/android/3.jpg', '2015-12-07 10:40:56', '视频3', 'item.php?id=3', 'Android第3节', 'http://www.imooc.com/course/list?c=android'),
('android', 4, '/Study/image/android/4.jpg', '2015-12-07 10:42:47', '视频4', 'item.php?id=4', 'Android第4节', 'http://www.imooc.com/course/list?c=android'),
('android', 5, '/Study/image/android/5.jpg', '2015-12-07 10:42:47', '视频5', 'item.php?id=5', 'Android第5节', 'http://www.imooc.com/course/list?c=android'),
('android', 6, '/Study/image/android/6.jpg', '2015-12-07 10:42:54', '视频6', 'item.php?id=6', 'Android第6节', 'http://www.imooc.com/course/list?c=android'),
('android', 7, '/Study/image/android/7.jpg', '2015-12-07 10:43:09', '视频7', 'item.php?id=7', 'Android第7节', 'http://www.imooc.com/course/list?c=android'),
('android', 8, '/Study/image/android/8.jpg', '2015-12-07 10:43:12', '视频8', 'item.php?id=8', 'Android第8节', 'http://www.imooc.com/course/list?c=android'),
('android', 9, '/Study/image/android/9.jpg', '2015-12-07 10:43:15', '视频9', 'item.php?id=9', 'Android第9节', 'http://www.imooc.com/course/list?c=android'),
('android', 10, '/Study/image/android/10.jpg', '2015-12-07 10:43:15', '视频10', 'item.php?id=10', 'Android第10节', 'http://www.imooc.com/course/list?c=android'),
('android', 11, '/Study/image/android/11.jpg', '2015-12-07 10:43:19', '视频11', 'item.php?id=11', 'Android第11节', 'http://www.imooc.com/course/list?c=android'),
('android', 12, '/Study/image/android/12.jpg', '2015-12-07 10:43:21', '视频12', 'item.php?id=12', 'Android第12节', 'http://www.imooc.com/course/list?c=android'),
('android', 13, '/Study/image/android/13.jpg', '2015-12-07 10:43:23', '视频13', 'item.php?id=13', 'Android第13节', 'http://www.imooc.com/course/list?c=android'),
('android', 14, '/Study/image/android/14.jpg', '2015-12-07 10:43:25', '视频14', 'item.php?id=14', 'Android第14节', 'http://www.imooc.com/course/list?c=android'),
('android', 15, '/Study/image/android/15.jpg', '2015-12-07 10:43:27', '视频15', 'item.php?id=15', 'Android第15节', 'http://www.imooc.com/course/list?c=android'),
('c', 16, '/Study/image/c/1.jpg', '2015-12-07 08:00:47', '视频1', 'item.php?id=16', 'C语言第1节', 'http://www.imooc.com/course/list?c=c'),
('c', 17, '/Study/image/c/2.jpg', '2015-12-07 10:40:56', '视频2', 'item.php?id=17', 'C语言第2节', 'http://www.imooc.com/course/list?c=c'),
('c', 18, '/Study/image/c/3.jpg', '2015-12-07 10:40:56', '视频3', 'item.php?id=18', 'C语言第3节', 'http://www.imooc.com/course/list?c=c'),
('c', 19, '/Study/image/c/4.jpg', '2015-12-07 10:42:47', '视频4', 'item.php?id=19', 'C语言第4节', 'http://www.imooc.com/course/list?c=c'),
('c', 20, '/Study/image/c/5.jpg', '2015-12-07 10:42:47', '视频5', 'item.php?id=20', 'C语言第5节', 'http://www.imooc.com/course/list?c=c'),
('c', 21, '/Study/image/c/6.jpg', '2015-12-07 10:42:54', '视频6', 'item.php?id=21', 'C语言第6节', 'http://www.imooc.com/course/list?c=c'),
('c', 22, '/Study/image/c/7.jpg', '2015-12-07 10:43:09', '视频7', 'item.php?id=22', 'C语言第7节', 'http://www.imooc.com/course/list?c=c'),
('c', 23, '/Study/image/c/8.jpg', '2015-12-07 10:43:12', '视频8', 'item.php?id=23', 'C语言第8节', 'http://www.imooc.com/course/list?c=c'),
('c', 24, '/Study/image/c/9.jpg', '2015-12-07 10:43:15', '视频9', 'item.php?id=24', 'C语言第9节', 'http://www.imooc.com/course/list?c=c'),
('c', 25, '/Study/image/c/10.jpg', '2015-12-07 10:43:15', '视频10', 'item.php?id=25', 'C语言第10节', 'http://www.imooc.com/course/list?c=c'),
('c', 26, '/Study/image/c/11.jpg', '2015-12-07 10:43:19', '视频11', 'item.php?id=26', 'C语言第11节', 'http://www.imooc.com/course/list?c=c'),
('c', 27, '/Study/image/c/12.jpg', '2015-12-07 10:43:21', '视频12', 'item.php?id=27', 'C语言第12节', 'http://www.imooc.com/course/list?c=c'),
('c', 28, '/Study/image/c/13.jpg', '2015-12-07 10:43:23', '视频13', 'item.php?id=28', 'C语言第13节', 'http://www.imooc.com/course/list?c=c'),
('c', 29, '/Study/image/c/14.jpg', '2015-12-07 10:43:25', '视频14', 'item.php?id=29', 'C语言第14节', 'http://www.imooc.com/course/list?c=c'),
('c', 30, '/Study/image/c/15.jpg', '2015-12-07 10:43:27', '视频15', 'item.php?id=30', 'C语言第15节', 'http://www.imooc.com/course/list?c=c'),
('c++', 31, '/Study/image/c++/1.jpg', '2015-12-07 08:00:47', '视频1', 'item.php?id=31', 'C++第1节', 'http://www.imooc.com/course/list?C+puls+puls'),
('c++', 32, '/Study/image/c++/2.jpg', '2015-12-07 10:40:56', '视频2', 'item.php?id=32', 'C++第2节', 'http://www.imooc.com/course/list?C+puls+puls'),
('c++', 33, '/Study/image/c++/3.jpg', '2015-12-07 10:40:56', '视频3', 'item.php?id=33', 'C++第3节', 'http://www.imooc.com/course/list?C+puls+puls'),
('c++', 34, '/Study/image/c++/4.jpg', '2015-12-07 10:42:47', '视频4', 'item.php?id=34', 'C++第4节', 'http://www.imooc.com/course/list?C+puls+puls'),
('c++', 35, '/Study/image/c++/5.jpg', '2015-12-07 10:42:47', '视频5', 'item.php?id=35', 'C++第5节', 'http://www.imooc.com/course/list?C+puls+puls'),
('c++', 36, '/Study/image/c++/6.jpg', '2015-12-07 10:42:54', '视频6', 'item.php?id=36', 'C++第6节', 'http://www.imooc.com/course/list?C+puls+puls'),
('c++', 37, '/Study/image/c++/7.jpg', '2015-12-07 10:43:09', '视频7', 'item.php?id=37', 'C++第7节', 'http://www.imooc.com/course/list?C+puls+puls'),
('c++', 38, '/Study/image/c++/8.jpg', '2015-12-07 10:43:12', '视频8', 'item.php?id=38', 'C++第8节', 'http://www.imooc.com/course/list?C+puls+puls'),
('c++', 39, '/Study/image/c++/9.jpg', '2015-12-07 10:43:15', '视频9', 'item.php?id=39', 'C++第9节', 'http://www.imooc.com/course/list?C+puls+puls'),
('c++', 40, '/Study/image/c++/10.jpg', '2015-12-07 10:43:15', '视频10', 'item.php?id=40', 'C++第10节', 'http://www.imooc.com/course/list?C+puls+puls'),
('c++', 41, '/Study/image/c++/11.jpg', '2015-12-07 10:43:19', '视频11', 'item.php?id=41', 'C++第11节', 'http://www.imooc.com/course/list?C+puls+puls'),
('c++', 42, '/Study/image/c++/12.jpg', '2015-12-07 10:43:21', '视频12', 'item.php?id=42', 'C++第12节', 'http://www.imooc.com/course/list?C+puls+puls'),
('c++', 43, '/Study/image/c++/13.jpg', '2015-12-07 10:43:23', '视频13', 'item.php?id=43', 'C++第13节', 'http://www.imooc.com/course/list?C+puls+puls'),
('c++', 44, '/Study/image/c++/14.jpg', '2015-12-07 10:43:25', '视频14', 'item.php?id=44', 'C++第14节', 'http://www.imooc.com/course/list?C+puls+puls'),
('c++', 45, '/Study/image/c++/15.jpg', '2015-12-07 10:43:27', '视频15', 'item.php?id=45', 'C++第15节', 'http://www.imooc.com/course/list?C+puls+puls'),
('ios', 46, '/Study/image/ios/1.jpg', '2015-12-07 08:00:47', '视频1', 'item.php?id=46', 'IOS第1节', 'http://www.imooc.com/course/list?c=ios'),
('ios', 47, '/Study/image/ios/2.jpg', '2015-12-07 10:40:56', '视频2', 'item.php?id=47', 'IOS第2节', 'http://www.imooc.com/course/list?c=ios'),
('ios', 48, '/Study/image/ios/3.jpg', '2015-12-07 10:40:56', '视频3', 'item.php?id=48', 'IOS第3节', 'http://www.imooc.com/course/list?c=ios'),
('ios', 49, '/Study/image/ios/4.jpg', '2015-12-07 10:42:47', '视频4', 'item.php?id=49', 'IOS第4节', 'http://www.imooc.com/course/list?c=ios'),
('ios', 50, '/Study/image/ios/5.jpg', '2015-12-07 10:42:47', '视频5', 'item.php?id=50', 'IOS第5节', 'http://www.imooc.com/course/list?c=ios'),
('ios', 51, '/Study/image/ios/6.jpg', '2015-12-07 10:42:54', '视频6', 'item.php?id=51', 'IOS第6节', 'http://www.imooc.com/course/list?c=ios'),
('ios', 52, '/Study/image/ios/7.jpg', '2015-12-07 10:43:09', '视频7', 'item.php?id=52', 'IOS第7节', 'http://www.imooc.com/course/list?c=ios'),
('ios', 53, '/Study/image/ios/8.jpg', '2015-12-07 10:43:12', '视频8', 'item.php?id=53', 'IOS第8节', 'http://www.imooc.com/course/list?c=ios'),
('ios', 54, '/Study/image/ios/9.jpg', '2015-12-07 10:43:15', '视频9', 'item.php?id=54', 'IOS第9节', 'http://www.imooc.com/course/list?c=ios'),
('ios', 55, '/Study/image/ios/10.jpg', '2015-12-07 10:43:15', '视频10', 'item.php?id=55', 'IOS第10节', 'http://www.imooc.com/course/list?c=ios'),
('ios', 56, '/Study/image/ios/11.jpg', '2015-12-07 10:43:19', '视频11', 'item.php?id=56', 'IOS第11节', 'http://www.imooc.com/course/list?c=ios'),
('ios', 57, '/Study/image/ios/12.jpg', '2015-12-07 10:43:21', '视频12', 'item.php?id=57', 'IOS第12节', 'http://www.imooc.com/course/list?c=ios'),
('ios', 58, '/Study/image/ios/13.jpg', '2015-12-07 10:43:23', '视频13', 'item.php?id=58', 'IOS第13节', 'http://www.imooc.com/course/list?c=ios'),
('ios', 59, '/Study/image/ios/14.jpg', '2015-12-07 10:43:25', '视频14', 'item.php?id=59', 'IOS第14节', 'http://www.imooc.com/course/list?c=ios'),
('ios', 60, '/Study/image/ios/15.jpg', '2015-12-07 10:43:27', '视频15', 'item.php?id=60', 'IOS第15节', 'http://www.imooc.com/course/list?c=ios'),
('java', 61, '/Study/image/java/1.jpg', '2015-12-07 08:00:47', '视频1', 'item.php?id=61', 'Java第1节', 'http://www.imooc.com/course/list?c=java'),
('java', 62, '/Study/image/java/2.jpg', '2015-12-07 10:40:56', '视频2', 'item.php?id=62', 'Java第2节', 'http://www.imooc.com/course/list?c=java'),
('java', 63, '/Study/image/java/3.jpg', '2015-12-07 10:40:56', '视频3', 'item.php?id=63', 'Java第3节', 'http://www.imooc.com/course/list?c=java'),
('java', 64, '/Study/image/java/4.jpg', '2015-12-07 10:42:47', '视频4', 'item.php?id=64', 'Java第4节', 'http://www.imooc.com/course/list?c=java'),
('java', 65, '/Study/image/java/5.jpg', '2015-12-07 10:42:47', '视频5', 'item.php?id=65', 'Java第5节', 'http://www.imooc.com/course/list?c=java'),
('java', 66, '/Study/image/java/6.jpg', '2015-12-07 10:42:54', '视频6', 'item.php?id=66', 'Java第6节', 'http://www.imooc.com/course/list?c=java'),
('java', 67, '/Study/image/java/7.jpg', '2015-12-07 10:43:09', '视频7', 'item.php?id=67', 'Java第7节', 'http://www.imooc.com/course/list?c=java'),
('java', 68, '/Study/image/java/8.jpg', '2015-12-07 10:43:12', '视频8', 'item.php?id=68', 'Java第8节', 'http://www.imooc.com/course/list?c=java'),
('java', 69, '/Study/image/java/9.jpg', '2015-12-07 10:43:15', '视频9', 'item.php?id=69', 'Java第9节', 'http://www.imooc.com/course/list?c=java'),
('java', 70, '/Study/image/java/10.jpg', '2015-12-07 10:43:15', '视频10', 'item.php?id=70', 'Java第10节', 'http://www.imooc.com/course/list?c=java'),
('java', 71, '/Study/image/java/11.jpg', '2015-12-07 10:43:19', '视频11', 'item.php?id=71', 'Java第11节', 'http://www.imooc.com/course/list?c=java'),
('java', 72, '/Study/image/java/12.jpg', '2015-12-07 10:43:21', '视频12', 'item.php?id=72', 'Java第12节', 'http://www.imooc.com/course/list?c=java'),
('java', 73, '/Study/image/java/13.jpg', '2015-12-07 10:43:23', '视频13', 'item.php?id=73', 'Java第13节', 'http://www.imooc.com/course/list?c=java'),
('java', 74, '/Study/image/java/14.jpg', '2015-12-07 10:43:25', '视频14', 'item.php?id=74', 'Java第14节', 'http://www.imooc.com/course/list?c=java'),
('java', 75, '/Study/image/java/15.jpg', '2015-12-07 10:43:27', '视频15', 'item.php?id=75', 'Java第15节', 'http://www.imooc.com/course/list?c=java'),
('jsp', 76, '/Study/image/jsp/1.jpg', '2015-12-07 08:00:47', '视频1', 'item.php?id=76', 'JSP第1节', 'http://www.runoob.com/jsp/jsp-tutorial.html'),
('jsp', 77, '/Study/image/jsp/2.jpg', '2015-12-07 10:40:56', '视频2', 'item.php?id=77', 'JSP第2节', 'http://www.runoob.com/jsp/jsp-tutorial.html'),
('jsp', 78, '/Study/image/jsp/3.jpg', '2015-12-07 10:40:56', '视频3', 'item.php?id=78', 'JSP第3节', 'http://www.runoob.com/jsp/jsp-tutorial.html'),
('jsp', 79, '/Study/image/jsp/4.jpg', '2015-12-07 10:42:47', '视频4', 'item.php?id=79', 'JSP第4节', 'http://www.runoob.com/jsp/jsp-tutorial.html'),
('jsp', 80, '/Study/image/jsp/5.jpg', '2015-12-07 10:42:47', '视频5', 'item.php?id=80', 'JSP第5节', 'http://www.runoob.com/jsp/jsp-tutorial.html'),
('jsp', 81, '/Study/image/jsp/6.jpg', '2015-12-07 10:42:54', '视频6', 'item.php?id=81', 'JSP第6节', 'http://www.runoob.com/jsp/jsp-tutorial.html'),
('jsp', 82, '/Study/image/jsp/7.jpg', '2015-12-07 10:43:09', '视频7', 'item.php?id=82', 'JSP第7节', 'http://www.runoob.com/jsp/jsp-tutorial.html'),
('jsp', 83, '/Study/image/jsp/8.jpg', '2015-12-07 10:43:12', '视频8', 'item.php?id=83', 'JSP第8节', 'http://www.runoob.com/jsp/jsp-tutorial.html'),
('jsp', 84, '/Study/image/jsp/9.jpg', '2015-12-07 10:43:15', '视频9', 'item.php?id=84', 'JSP第9节', 'http://www.runoob.com/jsp/jsp-tutorial.html'),
('jsp', 85, '/Study/image/jsp/10.jpg', '2015-12-07 10:43:15', '视频10', 'item.php?id=85', 'JSP第10节', 'http://www.runoob.com/jsp/jsp-tutorial.html'),
('jsp', 86, '/Study/image/jsp/11.jpg', '2015-12-07 10:43:19', '视频11', 'item.php?id=86', 'JSP第11节', 'http://www.runoob.com/jsp/jsp-tutorial.html'),
('jsp', 87, '/Study/image/jsp/12.jpg', '2015-12-07 10:43:21', '视频12', 'item.php?id=87', 'JSP第12节', 'http://www.runoob.com/jsp/jsp-tutorial.html'),
('jsp', 88, '/Study/image/jsp/13.jpg', '2015-12-07 10:43:23', '视频13', 'item.php?id=88', 'JSP第13节', 'http://www.runoob.com/jsp/jsp-tutorial.html'),
('jsp', 89, '/Study/image/jsp/14.jpg', '2015-12-07 10:43:25', '视频14', 'item.php?id=89', 'JSP第14节', 'http://www.runoob.com/jsp/jsp-tutorial.html'),
('jsp', 90, '/Study/image/jsp/15.jpg', '2015-12-07 10:43:27', '视频15', 'item.php?id=90', 'JSP第15节', 'http://www.runoob.com/jsp/jsp-tutorial.html'),
('linux', 91, '/Study/image/linux/1.jpg', '2015-12-07 08:00:47', '视频1', 'item.php?id=91', 'Linux第1节', 'http://www.imooc.com/course/list?c=linux'),
('linux', 92, '/Study/image/linux/2.jpg', '2015-12-07 10:40:56', '视频2', 'item.php?id=92', 'Linux第2节', 'http://www.imooc.com/course/list?c=linux'),
('linux', 93, '/Study/image/linux/3.jpg', '2015-12-07 10:40:56', '视频3', 'item.php?id=93', 'Linux第3节', 'http://www.imooc.com/course/list?c=linux'),
('linux', 94, '/Study/image/linux/4.jpg', '2015-12-07 10:42:47', '视频4', 'item.php?id=94', 'Linux第4节', 'http://www.imooc.com/course/list?c=linux'),
('linux', 95, '/Study/image/linux/5.jpg', '2015-12-07 10:42:47', '视频5', 'item.php?id=95', 'Linux第5节', 'http://www.imooc.com/course/list?c=linux'),
('linux', 96, '/Study/image/linux/6.jpg', '2015-12-07 10:42:54', '视频6', 'item.php?id=96', 'Linux第6节', 'http://www.imooc.com/course/list?c=linux'),
('linux', 97, '/Study/image/linux/7.jpg', '2015-12-07 10:43:09', '视频7', 'item.php?id=97', 'Linux第7节', 'http://www.imooc.com/course/list?c=linux'),
('linux', 98, '/Study/image/linux/8.jpg', '2015-12-07 10:43:12', '视频8', 'item.php?id=98', 'Linux第8节', 'http://www.imooc.com/course/list?c=linux'),
('linux', 99, '/Study/image/linux/9.jpg', '2015-12-07 10:43:15', '视频9', 'item.php?id=99', 'Linux第9节', 'http://www.imooc.com/course/list?c=linux'),
('linux', 100, '/Study/image/linux/10.jpg', '2015-12-07 10:43:15', '视频10', 'item.php?id=100', 'Linux第10节', 'http://www.imooc.com/course/list?c=linux'),
('linux', 101, '/Study/image/linux/11.jpg', '2015-12-07 10:43:19', '视频11', 'item.php?id=101', 'Linux第11节', 'http://www.imooc.com/course/list?c=linux'),
('linux', 102, '/Study/image/linux/12.jpg', '2015-12-07 10:43:21', '视频12', 'item.php?id=102', 'Linux第12节', 'http://www.imooc.com/course/list?c=linux'),
('linux', 103, '/Study/image/linux/13.jpg', '2015-12-07 10:43:23', '视频13', 'item.php?id=103', 'Linux第13节', 'http://www.imooc.com/course/list?c=linux'),
('linux', 104, '/Study/image/linux/14.jpg', '2015-12-07 10:43:25', '视频14', 'item.php?id=104', 'Linux第14节', 'http://www.imooc.com/course/list?c=linux'),
('linux', 105, '/Study/image/linux/15.jpg', '2015-12-07 10:43:27', '视频15', 'item.php?id=105', 'Linux第15节', 'http://www.imooc.com/course/list?c=linux'),
('mysql', 106, '/Study/image/mysql/1.jpg', '2015-12-07 08:00:47', '视频1', 'item.php?id=106', 'MySQL第1节', 'http://www.imooc.com/course/list?c=mysql'),
('mysql', 107, '/Study/image/mysql/2.jpg', '2015-12-07 10:40:56', '视频2', 'item.php?id=107', 'MySQL第2节', 'http://www.imooc.com/course/list?c=mysql'),
('mysql', 108, '/Study/image/mysql/3.jpg', '2015-12-07 10:40:56', '视频3', 'item.php?id=108', 'MySQL第3节', 'http://www.imooc.com/course/list?c=mysql'),
('mysql', 109, '/Study/image/mysql/4.jpg', '2015-12-07 10:42:47', '视频4', 'item.php?id=109', 'MySQL第4节', 'http://www.imooc.com/course/list?c=mysql'),
('mysql', 110, '/Study/image/mysql/5.jpg', '2015-12-07 10:42:47', '视频5', 'item.php?id=110', 'MySQL第5节', 'http://www.imooc.com/course/list?c=mysql'),
('mysql', 111, '/Study/image/mysql/6.jpg', '2015-12-07 10:42:54', '视频6', 'item.php?id=111', 'MySQL第6节', 'http://www.imooc.com/course/list?c=mysql'),
('mysql', 112, '/Study/image/mysql/7.jpg', '2015-12-07 10:43:09', '视频7', 'item.php?id=112', 'MySQL第7节', 'http://www.imooc.com/course/list?c=mysql'),
('mysql', 113, '/Study/image/mysql/8.jpg', '2015-12-07 10:43:12', '视频8', 'item.php?id=113', 'MySQL第8节', 'http://www.imooc.com/course/list?c=mysql'),
('mysql', 114, '/Study/image/mysql/9.jpg', '2015-12-07 10:43:15', '视频9', 'item.php?id=114', 'MySQL第9节', 'http://www.imooc.com/course/list?c=mysql'),
('mysql', 115, '/Study/image/mysql/10.jpg', '2015-12-07 10:43:15', '视频10', 'item.php?id=115', 'MySQL第10节', 'http://www.imooc.com/course/list?c=mysql'),
('mysql', 116, '/Study/image/mysql/11.jpg', '2015-12-07 10:43:19', '视频11', 'item.php?id=116', 'MySQL第11节', 'http://www.imooc.com/course/list?c=mysql'),
('mysql', 117, '/Study/image/mysql/12.jpg', '2015-12-07 10:43:21', '视频12', 'item.php?id=117', 'MySQL第12节', 'http://www.imooc.com/course/list?c=mysql'),
('mysql', 118, '/Study/image/mysql/13.jpg', '2015-12-07 10:43:23', '视频13', 'item.php?id=118', 'MySQL第13节', 'http://www.imooc.com/course/list?c=mysql'),
('mysql', 119, '/Study/image/mysql/14.jpg', '2015-12-07 10:43:25', '视频14', 'item.php?id=119', 'MySQL第14节', 'http://www.imooc.com/course/list?c=mysql'),
('mysql', 120, '/Study/image/mysql/15.jpg', '2015-12-07 10:43:27', '视频15', 'item.php?id=120', 'MySQL第15节', 'http://www.imooc.com/course/list?c=mysql'),
('php', 121, '/Study/image/php/1.jpg', '2015-12-07 08:00:47', '视频1', 'item.php?id=121', 'PHP第1节', 'http://www.imooc.com/course/list?c=php'),
('php', 122, '/Study/image/php/2.jpg', '2015-12-07 10:40:56', '视频2', 'item.php?id=122', 'PHP第2节', 'http://www.imooc.com/course/list?c=php'),
('php', 123, '/Study/image/php/3.jpg', '2015-12-07 10:40:56', '视频3', 'item.php?id=123', 'PHP第3节', 'http://www.imooc.com/course/list?c=php'),
('php', 124, '/Study/image/php/4.jpg', '2015-12-07 10:42:47', '视频4', 'item.php?id=124', 'PHP第4节', 'http://www.imooc.com/course/list?c=php'),
('php', 125, '/Study/image/php/5.jpg', '2015-12-07 10:42:47', '视频5', 'item.php?id=125', 'PHP第5节', 'http://www.imooc.com/course/list?c=php'),
('php', 126, '/Study/image/php/6.jpg', '2015-12-07 10:42:54', '视频6', 'item.php?id=126', 'PHP第6节', 'http://www.imooc.com/course/list?c=php'),
('php', 127, '/Study/image/php/7.jpg', '2015-12-07 10:43:09', '视频7', 'item.php?id=127', 'PHP第7节', 'http://www.imooc.com/course/list?c=php'),
('php', 128, '/Study/image/php/8.jpg', '2015-12-07 10:43:12', '视频8', 'item.php?id=128', 'PHP第8节', 'http://www.imooc.com/course/list?c=php'),
('php', 129, '/Study/image/php/9.jpg', '2015-12-07 10:43:15', '视频9', 'item.php?id=129', 'PHP第9节', 'http://www.imooc.com/course/list?c=php'),
('php', 130, '/Study/image/php/10.jpg', '2015-12-07 10:43:15', '视频10', 'item.php?id=130', 'PHP第10节', 'http://www.imooc.com/course/list?c=php'),
('php', 131, '/Study/image/php/11.jpg', '2015-12-07 10:43:19', '视频11', 'item.php?id=131', 'PHP第11节', 'http://www.imooc.com/course/list?c=php'),
('php', 132, '/Study/image/php/12.jpg', '2015-12-07 10:43:21', '视频12', 'item.php?id=132', 'PHP第12节', 'http://www.imooc.com/course/list?c=php'),
('php', 133, '/Study/image/php/13.jpg', '2015-12-07 10:43:23', '视频13', 'item.php?id=133', 'PHP第13节', 'http://www.imooc.com/course/list?c=php'),
('php', 134, '/Study/image/php/14.jpg', '2015-12-07 10:43:25', '视频14', 'item.php?id=134', 'PHP第14节', 'http://www.imooc.com/course/list?c=php'),
('php', 135, '/Study/image/php/15.jpg', '2015-12-07 10:43:27', '视频15', 'item.php?id=135', 'PHP第15节', 'http://www.imooc.com/course/list?c=php'),
('ps', 136, '/Study/image/ps/1.jpg', '2015-12-07 08:00:47', '视频1', 'item.php?id=136', 'PhotoShop第1节', 'http://www.imooc.com/course/list?photoshop'),
('ps', 137, '/Study/image/ps/2.jpg', '2015-12-07 10:40:56', '视频2', 'item.php?id=137', 'PhotoShop第2节', 'http://www.imooc.com/course/list?photoshop'),
('ps', 138, '/Study/image/ps/3.jpg', '2015-12-07 10:40:56', '视频3', 'item.php?id=138', 'PhotoShop第3节', 'http://www.imooc.com/course/list?photoshop'),
('ps', 139, '/Study/image/ps/4.jpg', '2015-12-07 10:42:47', '视频4', 'item.php?id=139', 'PhotoShop第4节', 'http://www.imooc.com/course/list?photoshop'),
('ps', 140, '/Study/image/ps/5.jpg', '2015-12-07 10:42:47', '视频5', 'item.php?id=140', 'PhotoShop第5节', 'http://www.imooc.com/course/list?photoshop'),
('ps', 141, '/Study/image/ps/6.jpg', '2015-12-07 10:42:54', '视频6', 'item.php?id=141', 'PhotoShop第6节', 'http://www.imooc.com/course/list?photoshop'),
('ps', 142, '/Study/image/ps/7.jpg', '2015-12-07 10:43:09', '视频7', 'item.php?id=142', 'PhotoShop第7节', 'http://www.imooc.com/course/list?photoshop'),
('ps', 143, '/Study/image/ps/8.jpg', '2015-12-07 10:43:12', '视频8', 'item.php?id=143', 'PhotoShop第8节', 'http://www.imooc.com/course/list?photoshop'),
('ps', 144, '/Study/image/ps/9.jpg', '2015-12-07 10:43:15', '视频9', 'item.php?id=144', 'PhotoShop第9节', 'http://www.imooc.com/course/list?photoshop'),
('ps', 145, '/Study/image/ps/10.jpg', '2015-12-07 10:43:15', '视频10', 'item.php?id=145', 'PhotoShop第10节', 'http://www.imooc.com/course/list?photoshop'),
('ps', 146, '/Study/image/ps/11.jpg', '2015-12-07 10:43:19', '视频11', 'item.php?id=146', 'PhotoShop第11节', 'http://www.imooc.com/course/list?photoshop'),
('ps', 147, '/Study/image/ps/12.jpg', '2015-12-07 10:43:21', '视频12', 'item.php?id=147', 'PhotoShop第12节', 'http://www.imooc.com/course/list?photoshop'),
('ps', 148, '/Study/image/ps/13.jpg', '2015-12-07 10:43:23', '视频13', 'item.php?id=148', 'PhotoShop第13节', 'http://www.imooc.com/course/list?photoshop'),
('ps', 149, '/Study/image/ps/14.jpg', '2015-12-07 10:43:25', '视频14', 'item.php?id=149', 'PhotoShop第14节', 'http://www.imooc.com/course/list?photoshop'),
('ps', 150, '/Study/image/ps/15.jpg', '2015-12-07 10:43:27', '视频15', 'item.php?id=150', 'PhotoShop第15节', 'http://www.imooc.com/course/list?photoshop'),
('python', 151, '/Study/image/python/1.jpg', '2015-12-07 08:00:47', '视频1', 'item.php?id=151', 'Python第1节', 'http://www.imooc.com/course/list?c=python'),
('python', 152, '/Study/image/python/2.jpg', '2015-12-07 10:40:56', '视频2', 'item.php?id=152', 'Python第2节', 'http://www.imooc.com/course/list?c=python'),
('python', 153, '/Study/image/python/3.jpg', '2015-12-07 10:40:56', '视频3', 'item.php?id=153', 'Python第3节', 'http://www.imooc.com/course/list?c=python'),
('python', 154, '/Study/image/python/4.jpg', '2015-12-07 10:42:47', '视频4', 'item.php?id=154', 'Python第4节', 'http://www.imooc.com/course/list?c=python'),
('python', 155, '/Study/image/python/5.jpg', '2015-12-07 10:42:47', '视频5', 'item.php?id=155', 'Python第5节', 'http://www.imooc.com/course/list?c=python'),
('python', 156, '/Study/image/python/6.jpg', '2015-12-07 10:42:54', '视频6', 'item.php?id=156', 'Python第6节', 'http://www.imooc.com/course/list?c=python'),
('python', 157, '/Study/image/python/7.jpg', '2015-12-07 10:43:09', '视频7', 'item.php?id=157', 'Python第7节', 'http://www.imooc.com/course/list?c=python'),
('python', 158, '/Study/image/python/8.jpg', '2015-12-07 10:43:12', '视频8', 'item.php?id=158', 'Python第8节', 'http://www.imooc.com/course/list?c=python'),
('python', 159, '/Study/image/python/9.jpg', '2015-12-07 10:43:15', '视频9', 'item.php?id=159', 'Python第9节', 'http://www.imooc.com/course/list?c=python'),
('python', 160, '/Study/image/python/10.jpg', '2015-12-07 10:43:15', '视频10', 'item.php?id=160', 'Python第10节', 'http://www.imooc.com/course/list?c=python'),
('python', 161, '/Study/image/python/11.jpg', '2015-12-07 10:43:19', '视频11', 'item.php?id=161', 'Python第11节', 'http://www.imooc.com/course/list?c=python'),
('python', 162, '/Study/image/python/12.jpg', '2015-12-07 10:43:21', '视频12', 'item.php?id=162', 'Python第12节', 'http://www.imooc.com/course/list?c=python'),
('python', 163, '/Study/image/python/13.jpg', '2015-12-07 10:43:23', '视频13', 'item.php?id=163', 'Python第13节', 'http://www.imooc.com/course/list?c=python'),
('python', 164, '/Study/image/python/14.jpg', '2015-12-07 10:43:25', '视频14', 'item.php?id=164', 'Python第14节', 'http://www.imooc.com/course/list?c=python'),
('python', 165, '/Study/image/python/15.jpg', '2015-12-07 10:43:27', '视频15', 'item.php?id=165', 'Python第15节', 'http://www.imooc.com/course/list?c=python');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
