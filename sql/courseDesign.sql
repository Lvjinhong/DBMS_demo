-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2023-12-21 01:24:54
-- 服务器版本： 5.7.40-log
-- PHP 版本： 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `courseDesign`
--

DELIMITER $$
--
-- 函数
--
CREATE DEFINER=`Mytest`@`%` FUNCTION `MobilePhone` (`str` CHAR(12)) RETURNS INT(11) DETERMINISTIC BEGIN
    DECLARE result INT;
    SET result = 0;

    IF str IS NULL THEN
        SET result = 1;
    ELSEIF (LEFT(str, 1) = '1' AND
            (REGEXP_LIKE(str, '^[0-9]{10}$'))) THEN
        SET result = 1;
    ELSE
        SET result = 0;
    END IF;

    RETURN result;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `Customer`
--

CREATE TABLE `Customer` (
  `CustID` char(12) NOT NULL,
  `CustName` char(50) NOT NULL,
  `CustType` char(20) NOT NULL,
  `ContactNumber` char(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `Customer`
--

INSERT INTO `Customer` (`CustID`, `CustName`, `CustType`, `ContactNumber`, `Email`) VALUES
('CustID1', '张庆生', '个人', '13867187556', 'qingsheng.zhang@email.com'),
('CustID10', '张义', '企业', '13689895059', 'yi.zhang@company.com'),
('CustID2', '谭宁', '个人', '13425222237', 'ning.tan@email.com'),
('CustID3', '黄元君', '个人', '17280015494', 'yuanjun.huang@email.com'),
('CustID4', '胡慧安', '个人', '15969634829', 'huian.hu@email.com'),
('CustID5', '钟和', '个人', '13953829559', 'he.zhong@email.com'),
('CustID6', '陈羽', '企业', '13115794993', 'yu.chen@company.com'),
('CustID7', '许宁', '企业', '15810454371', 'ning.xu@company.com'),
('CustID8', '郭元', '企业', '18768126176', 'yuan.guo@company.com'),
('CustID9', '胡安', '企业', '19821999025', 'an.hu@company.com');

-- --------------------------------------------------------

--
-- 表的结构 `Department`
--

CREATE TABLE `Department` (
  `DepID` char(12) NOT NULL,
  `DepName` char(50) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `Department`
--

INSERT INTO `Department` (`DepID`, `DepName`, `Email`) VALUES
('DepID1', '销售部', 'sales@example.com'),
('DepID2', '仓库部', 'warehouse@example.com');

-- --------------------------------------------------------

--
-- 表的结构 `Employee`
--

CREATE TABLE `Employee` (
  `EmpID` char(12) NOT NULL,
  `EmpName` char(50) NOT NULL,
  `Gender` char(1) NOT NULL,
  `Position` char(30) NOT NULL,
  `ContactNumber` char(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `Employee`
--

INSERT INTO `Employee` (`EmpID`, `EmpName`, `Gender`, `Position`, `ContactNumber`, `Email`) VALUES
('EmpID1', '王建军', 'M', '销售管理员', '0282926306760', 'wangjianjun@example.com'),
('EmpID10', '贾莹', 'F', '仓库管理员', '190976022898', 'jiaying@example.com'),
('EmpID2', '吴红梅', 'F', '销售管理员', '6514247349', 'wuhongmei@example.com'),
('EmpID3', '左君', 'M', '销售管理员', '6564447149', 'zuojun@example.com'),
('EmpID4', '石玉英', 'F', '销售管理员', '71546732745', 'shiyuying@example.com'),
('EmpID5', '黎帅', 'M', '销售管理员', '9596575583720', 'lishuai@example.com'),
('EmpID6', '王玉', 'F', '仓库管理员', '04629909578', 'wangyu@example.com'),
('EmpID7', '林秀云', 'M', '仓库管理员', '8394078965', 'linxiuyun@example.com'),
('EmpID8', '林俊', 'F', '仓库管理员', '5403354462', 'linjun@example.com'),
('EmpID9', '李志强', 'M', '仓库管理员', '57638866682', 'lizhiqiang@example.com');

-- --------------------------------------------------------

--
-- 表的结构 `LogisticsInformation`
--

CREATE TABLE `LogisticsInformation` (
  `LogisticsID` char(12) NOT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `DeliverTime` datetime DEFAULT NULL,
  `SigningTime` datetime DEFAULT NULL,
  `ShippingCompany` varchar(50) DEFAULT NULL,
  `TrackingNumber` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `LogisticsInformation`
--

INSERT INTO `LogisticsInformation` (`LogisticsID`, `Status`, `DeliverTime`, `SigningTime`, `ShippingCompany`, `TrackingNumber`) VALUES
('LogID07240', '待发货', NULL, NULL, '京东', 'JD07536193'),
('LogID25093', '已发货', '2023-04-20 00:00:00', NULL, '京东', 'JD17304722'),
('LogID33956', '待发货', NULL, NULL, '极兔', 'JT09725678'),
('LogID36265', '已签收', '2023-05-03 00:00:00', '2023-05-07 00:00:00', '顺丰', 'SF85239812'),
('LogID40132', '已签收', '2023-06-10 00:00:00', '2023-06-15 00:00:00', '中通', 'ZT87394949'),
('LogID51007', '待发货', NULL, NULL, '京东', 'JD61168789'),
('LogID52473', '已签收', '2023-06-14 00:00:00', '2023-06-17 00:00:00', '京东', 'JD63586555'),
('LogID60518', '已签收', '2023-04-12 00:00:00', '2023-04-21 00:00:00', '中通', 'ZT74170611'),
('LogID61135', '已签收', '2023-04-02 00:00:00', '2023-04-10 00:00:00', '极兔', 'JT69067101'),
('LogID70452', '已发货', '2023-05-24 00:00:00', NULL, '京东', 'JD28269813'),
('LogID72656', '已发货', '2023-05-16 00:00:00', NULL, '中通', 'ZT72258075'),
('LogID73586', '已发货', '2023-07-16 00:00:00', NULL, '京东', 'JD62272948'),
('LogID74919', '已发货', '2023-07-03 00:00:00', NULL, '京东', 'JD72050882'),
('LogID82237', '已发货', '2023-03-28 00:00:00', NULL, '极兔', 'JT79009149'),
('LogID92793', '待发货', NULL, NULL, '京东', 'JD37149277'),
('LogID93006', '已签收', '2023-01-04 00:00:00', '2023-01-06 00:00:00', '顺丰', 'SF04901323'),
('LogID96246', '已签收', '2023-03-16 00:00:00', '2023-03-18 00:00:00', '极兔', 'JT73141054'),
('LogID97853', '待发货', NULL, NULL, '圆通', 'YT86745468');

-- --------------------------------------------------------

--
-- 表的结构 `Part`
--

CREATE TABLE `Part` (
  `PartID` char(12) NOT NULL,
  `PartName` char(50) NOT NULL,
  `Category` char(20) NOT NULL,
  `Brand` char(30) NOT NULL,
  `ApplicableModels` varchar(100) NOT NULL,
  `Specifications` varchar(100) NOT NULL,
  `SafetyStockLevel` int(11) DEFAULT NULL,
  `CurrentStock` int(11) DEFAULT NULL,
  `RetailPrice` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `Part`
--

INSERT INTO `Part` (`PartID`, `PartName`, `Category`, `Brand`, `ApplicableModels`, `Specifications`, `SafetyStockLevel`, `CurrentStock`, `RetailPrice`) VALUES
('PartID1', '发动机油', '润滑油', '壳牌', '多种车型', '5W-30', 50, 100, 250),
('PartID10', '油漆', '车身附件', '杜邦', '补漆', '金属漆', 100, 200, 150),
('PartID11', '轮胎', '车轮系统', '米其林', 'SUV', '205/55 R16', 30, 60, 650),
('PartID12', '悬挂减震器', '悬挂系统', '凯霍', '多种车型', '型号S-2010', 20, 40, 1000),
('PartID13', '传动轴', '传动系统', '德科', '轿车', '型号D-1010', 15, 25, 1500),
('PartID14', '离合器套件', '传动系统', '博格华纳', '卡车', '型号C-3030', 10, 20, 1800),
('PartID15', '转向器', '转向系统', '博世', '多种车型', '电子转向', 25, 50, 2500),
('PartID2', '汽车蓄电池', '电池', '博世', '轿车', '12V 60Ah', 30, 60, 600),
('PartID3', '刹车片', '刹车系统', '安道拓', 'SUV', '前轮用', 100, 200, 190),
('PartID4', '空气滤清器', '滤清器', '曼牌', '奥迪A4', '型号A-2049', 20, 40, 120),
('PartID5', '机油滤清器', '滤清器', '马勒', '宝马3系', '型号ML-1049', 20, 50, 90),
('PartID6', '火花塞', '点火系统', 'NGK', '轿车', '双铂金', 200, 400, 100),
('PartID7', '正时皮带', '传动系统', '盖茨', 'SUV', '型号T-1050', 15, 30, 350),
('PartID8', '水泵', '冷却系统', '爱信', '多种车型', '型号P-2050', 10, 20, 450),
('PartID9', '散热器', '冷却系统', '电装', '轿车', '型号R-3050', 5, 10, 800);

-- --------------------------------------------------------

--
-- 表的结构 `Sales`
--

CREATE TABLE `Sales` (
  `OrderID` char(12) NOT NULL,
  `EmpID` char(12) NOT NULL,
  `CustID` char(12) NOT NULL,
  `PartID` char(12) NOT NULL,
  `SalePrice` float DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `SaleTime` datetime DEFAULT NULL,
  `DeliveryMethod` char(20) DEFAULT NULL,
  `LogisticsID` char(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `Sales`
--

INSERT INTO `Sales` (`OrderID`, `EmpID`, `CustID`, `PartID`, `SalePrice`, `Quantity`, `SaleTime`, `DeliveryMethod`, `LogisticsID`) VALUES
('OrderID01', 'EmpID2', 'CustID6', 'PartID10', 503.16, 2, '2023-01-02 00:00:00', '自提', NULL),
('OrderID02', 'EmpID1', 'CustID2', 'PartID7', 348.63, 2, '2023-01-03 00:00:00', '快递', 'LogID93006'),
('OrderID03', 'EmpID3', 'CustID5', 'PartID4', 190.11, 4, '2023-01-14 00:00:00', '自提', NULL),
('OrderID04', 'EmpID4', 'CustID1', 'PartID6', 238.72, 4, '2023-01-31 00:00:00', '自提', NULL),
('OrderID05', 'EmpID5', 'CustID8', 'PartID3', 422.89, 4, '2023-01-03 00:00:00', '快递', 'LogID93006'),
('OrderID06', 'EmpID2', 'CustID3', 'PartID15', 512.48, 2, '2023-01-03 00:00:00', '快递', 'LogID93006'),
('OrderID07', 'EmpID1', 'CustID7', 'PartID2', 556.95, 1, '2023-01-03 00:00:00', '快递', 'LogID93006'),
('OrderID08', 'EmpID5', 'CustID4', 'PartID13', 576.03, 1, '2023-02-11 00:00:00', '自提', NULL),
('OrderID09', 'EmpID3', 'CustID9', 'PartID6', 295.22, 4, '2023-02-14 00:00:00', '快递', 'LogID97853'),
('OrderID10', 'EmpID4', 'CustID2', 'PartID10', 485.03, 4, '2023-02-16 00:00:00', '自提', NULL),
('OrderID11', 'EmpID2', 'CustID10', 'PartID11', 240.95, 3, '2023-02-23 00:00:00', '快递', 'LogID07240'),
('OrderID12', 'EmpID1', 'CustID1', 'PartID5', 650.81, 2, '2023-02-26 00:00:00', '自提', NULL),
('OrderID13', 'EmpID5', 'CustID7', 'PartID12', 356.42, 2, '2023-03-15 00:00:00', '快递', 'LogID96246'),
('OrderID14', 'EmpID3', 'CustID3', 'PartID3', 394.33, 2, '2023-03-12 00:00:00', '自提', NULL),
('OrderID15', 'EmpID4', 'CustID5', 'PartID13', 306.72, 1, '2023-03-15 00:00:00', '快递', 'LogID96246'),
('OrderID16', 'EmpID2', 'CustID6', 'PartID14', 339.53, 1, '2023-03-15 00:00:00', '快递', 'LogID96246'),
('OrderID17', 'EmpID1', 'CustID4', 'PartID10', 367.1, 3, '2023-03-24 00:00:00', '自提', NULL),
('OrderID18', 'EmpID3', 'CustID8', 'PartID1', 262.87, 1, '2023-03-27 00:00:00', '快递', 'LogID82237'),
('OrderID19', 'EmpID5', 'CustID2', 'PartID2', 437.56, 4, '2023-04-01 00:00:00', '快递', 'LogID61135'),
('OrderID20', 'EmpID4', 'CustID9', 'PartID9', 362.74, 4, '2023-04-05 00:00:00', '自提', NULL),
('OrderID21', 'EmpID2', 'CustID1', 'PartID8', 377.11, 3, '2023-04-11 00:00:00', '快递', 'LogID60518'),
('OrderID22', 'EmpID3', 'CustID10', 'PartID7', 499.22, 1, '2023-04-19 00:00:00', '快递', 'LogID25093'),
('OrderID23', 'EmpID1', 'CustID7', 'PartID6', 457.95, 3, '2023-04-24 00:00:00', '自提', NULL),
('OrderID24', 'EmpID5', 'CustID5', 'PartID5', 309.86, 1, '2023-05-02 00:00:00', '快递', 'LogID36265'),
('OrderID25', 'EmpID4', 'CustID6', 'PartID4', 522.39, 4, '2023-05-02 00:00:00', '快递', 'LogID36265'),
('OrderID26', 'EmpID3', 'CustID3', 'PartID3', 401.15, 1, '2023-05-07 00:00:00', '自提', NULL),
('OrderID27', 'EmpID2', 'CustID8', 'PartID2', 183.72, 2, '2023-05-02 00:00:00', '快递', 'LogID36265'),
('OrderID28', 'EmpID1', 'CustID9', 'PartID1', 245.33, 3, '2023-05-05 00:00:00', '快递', 'LogID72656'),
('OrderID29', 'EmpID5', 'CustID10', 'PartID15', 623.28, 2, '2023-05-20 00:00:00', '自提', NULL),
('OrderID30', 'EmpID4', 'CustID4', 'PartID14', 659.2, 1, '2023-05-23 00:00:00', '快递', 'LogID70452'),
('OrderID31', 'EmpID3', 'CustID1', 'PartID13', 227.56, 1, '2023-05-29 00:00:00', '快递', 'LogID33956'),
('OrderID32', 'EmpID2', 'CustID2', 'PartID12', 538.29, 3, '2023-06-03 00:00:00', '自提', NULL),
('OrderID33', 'EmpID1', 'CustID7', 'PartID11', 376.45, 4, '2023-06-09 00:00:00', '快递', 'LogID40132'),
('OrderID34', 'EmpID5', 'CustID5', 'PartID10', 543.17, 2, '2023-06-13 00:00:00', '快递', 'LogID52473'),
('OrderID35', 'EmpID4', 'CustID3', 'PartID9', 314.93, 3, '2023-06-19 00:00:00', '自提', NULL),
('OrderID36', 'EmpID3', 'CustID8', 'PartID8', 411.75, 1, '2023-06-24 00:00:00', '快递', 'LogID92793'),
('OrderID37', 'EmpID2', 'CustID9', 'PartID7', 592.81, 2, '2023-07-02 00:00:00', '快递', 'LogID74919'),
('OrderID38', 'EmpID1', 'CustID10', 'PartID6', 240.09, 4, '2023-07-06 00:00:00', '自提', NULL),
('OrderID39', 'EmpID5', 'CustID6', 'PartID5', 489.45, 1, '2023-07-15 00:00:00', '快递', 'LogID73586'),
('OrderID40', 'EmpID4', 'CustID4', 'PartID4', 608.92, 2, '2023-07-19 00:00:00', '快递', 'LogID51007');

-- --------------------------------------------------------

--
-- 表的结构 `Storage`
--

CREATE TABLE `Storage` (
  `WareID` char(12) NOT NULL,
  `PartID` char(12) NOT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `Storage`
--

INSERT INTO `Storage` (`WareID`, `PartID`, `Quantity`) VALUES
('WareID1', 'PartID10', 2),
('WareID1', 'PartID15', 6),
('WareID10', 'PartID10', 79),
('WareID10', 'PartID12', 39),
('WareID10', 'PartID14', 19),
('WareID10', 'PartID4', 10),
('WareID10', 'PartID5', 1),
('WareID10', 'PartID6', 264),
('WareID10', 'PartID7', 4),
('WareID10', 'PartID8', 4),
('WareID2', 'PartID10', 4),
('WareID2', 'PartID13', 19),
('WareID2', 'PartID4', 2),
('WareID3', 'PartID11', 1),
('WareID3', 'PartID12', 1),
('WareID3', 'PartID13', 3),
('WareID3', 'PartID15', 21),
('WareID3', 'PartID6', 61),
('WareID3', 'PartID9', 3),
('WareID4', 'PartID11', 31),
('WareID4', 'PartID4', 13),
('WareID4', 'PartID5', 10),
('WareID4', 'PartID6', 75),
('WareID4', 'PartID7', 14),
('WareID4', 'PartID8', 15),
('WareID4', 'PartID9', 5),
('WareID5', 'PartID15', 1),
('WareID5', 'PartID2', 1),
('WareID5', 'PartID5', 32),
('WareID5', 'PartID7', 10),
('WareID6', 'PartID11', 8),
('WareID6', 'PartID13', 3),
('WareID6', 'PartID3', 13),
('WareID6', 'PartID4', 7),
('WareID6', 'PartID9', 1),
('WareID7', 'PartID10', 15),
('WareID7', 'PartID11', 6),
('WareID7', 'PartID15', 7),
('WareID7', 'PartID4', 1),
('WareID7', 'PartID5', 1),
('WareID7', 'PartID7', 2),
('WareID7', 'PartID8', 1),
('WareID8', 'PartID10', 104),
('WareID8', 'PartID11', 14),
('WareID8', 'PartID14', 1),
('WareID8', 'PartID15', 15),
('WareID8', 'PartID2', 5),
('WareID8', 'PartID3', 187),
('WareID8', 'PartID4', 7),
('WareID8', 'PartID5', 6),
('WareID8', 'PartID9', 1),
('WareID9', 'PartID15', 1);

-- --------------------------------------------------------

--
-- 表的结构 `Warehouse`
--

CREATE TABLE `Warehouse` (
  `WareID` char(12) NOT NULL,
  `WareName` char(50) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `ManagerID` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `Warehouse`
--

INSERT INTO `Warehouse` (`WareID`, `WareName`, `Address`, `ManagerID`) VALUES
('WareID1', '仓库A', '新疆维吾尔自治区台北县西峰乌鲁木齐路o座', 'EmpID10'),
('WareID10', '仓库J', '青海省澳门市牧野管街j座', 'EmpID7'),
('WareID2', '仓库B', '澳门特别行政区秀珍市高明深圳路V座', 'EmpID6'),
('WareID3', '仓库C', '海南省涛市西夏太原路u座', 'EmpID6'),
('WareID4', '仓库D', '甘肃省合山县龙潭郭路Q座', 'EmpID8'),
('WareID5', '仓库E', '河南省重庆市永川雷街x座', 'EmpID9'),
('WareID6', '仓库F', '澳门特别行政区丽县清浦六盘水街I座', 'EmpID9'),
('WareID7', '仓库G', '重庆市峰市平山林街q座', 'EmpID6'),
('WareID8', '仓库H', '甘肃省玉英市梁平成都街I座', 'EmpID6'),
('WareID9', '仓库I', '青海省欣县房山天津路H座', 'EmpID10');

-- --------------------------------------------------------

--
-- 替换视图以便查看 `员工业绩视图`
-- （参见下面的实际视图）
--
CREATE TABLE `员工业绩视图` (
`EmpID` char(12)
,`employee_sales` double
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `员工资料`
-- （参见下面的实际视图）
--
CREATE TABLE `员工资料` (
`姓名` char(50)
,`性别` char(1)
,`岗位` char(30)
,`电话` char(15)
,`邮件` varchar(50)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `存货不足视图`
-- （参见下面的实际视图）
--
CREATE TABLE `存货不足视图` (
`零件编号` char(12)
,`零件名称` char(50)
,`零件类别` char(20)
,`品牌` char(30)
,`实用车型` varchar(100)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `客户订单追踪图`
-- （参见下面的实际视图）
--
CREATE TABLE `客户订单追踪图` (
`我的电话` char(15)
,`订单编号` char(12)
,`零件名称` char(50)
,`员工名字` char(50)
,`员工电话` char(15)
,`下单时间` datetime
,`快递单号` varchar(50)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `客户资料`
-- （参见下面的实际视图）
--
CREATE TABLE `客户资料` (
`姓名` char(50)
,`类别` char(20)
,`电话` char(15)
,`邮件` varchar(50)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `销售`
-- （参见下面的实际视图）
--
CREATE TABLE `销售` (
`员工编号` char(12)
,`客户姓名` char(50)
,`客户类型` char(20)
,`客户电话` char(15)
,`客户邮箱` varchar(50)
,`零件编号` char(12)
,`零件名称` char(50)
,`零件类别` char(20)
,`销售单价` float
,`配送方式` char(20)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `零件信息`
-- （参见下面的实际视图）
--
CREATE TABLE `零件信息` (
`零件编号` char(12)
,`零件名称` char(50)
,`零件类别` char(20)
,`品牌` char(30)
,`适用车型` varchar(100)
,`规格` varchar(100)
,`零件单价` float
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `零件库存信息`
-- （参见下面的实际视图）
--
CREATE TABLE `零件库存信息` (
`仓库编号` char(12)
,`零件编号` char(12)
,`零件名称` char(50)
,`零件类别` char(20)
,`品牌` char(30)
,`适用车型` varchar(100)
,`当前数量` int(11)
,`安全存量` int(11)
);

-- --------------------------------------------------------

--
-- 视图结构 `员工业绩视图`
--
DROP TABLE IF EXISTS `员工业绩视图`;

CREATE ALGORITHM=UNDEFINED DEFINER=`Mytest`@`%` SQL SECURITY DEFINER VIEW `员工业绩视图`  AS SELECT `Sales`.`EmpID` AS `EmpID`, sum((`Sales`.`SalePrice` * `Sales`.`Quantity`)) AS `employee_sales` FROM (`Sales` join `Employee`) WHERE (`Sales`.`EmpID` = `Employee`.`EmpID`) GROUP BY `Sales`.`EmpID``EmpID`  ;

-- --------------------------------------------------------

--
-- 视图结构 `员工资料`
--
DROP TABLE IF EXISTS `员工资料`;

CREATE ALGORITHM=UNDEFINED DEFINER=`Mytest`@`%` SQL SECURITY DEFINER VIEW `员工资料`  AS SELECT `Employee`.`EmpName` AS `姓名`, `Employee`.`Gender` AS `性别`, `Employee`.`Position` AS `岗位`, `Employee`.`ContactNumber` AS `电话`, `Employee`.`Email` AS `邮件` FROM `Employee``Employee`  ;

-- --------------------------------------------------------

--
-- 视图结构 `存货不足视图`
--
DROP TABLE IF EXISTS `存货不足视图`;

CREATE ALGORITHM=UNDEFINED DEFINER=`Mytest`@`%` SQL SECURITY DEFINER VIEW `存货不足视图`  AS SELECT `Part`.`PartID` AS `零件编号`, `Part`.`PartName` AS `零件名称`, `Part`.`Category` AS `零件类别`, `Part`.`Brand` AS `品牌`, `Part`.`ApplicableModels` AS `实用车型` FROM `Part` WHERE (`Part`.`CurrentStock` < `Part`.`SafetyStockLevel`)  ;

-- --------------------------------------------------------

--
-- 视图结构 `客户订单追踪图`
--
DROP TABLE IF EXISTS `客户订单追踪图`;

CREATE ALGORITHM=UNDEFINED DEFINER=`Mytest`@`%` SQL SECURITY DEFINER VIEW `客户订单追踪图`  AS SELECT `Customer`.`ContactNumber` AS `我的电话`, `Sales`.`OrderID` AS `订单编号`, `Part`.`PartName` AS `零件名称`, `Employee`.`EmpName` AS `员工名字`, `Employee`.`ContactNumber` AS `员工电话`, `Sales`.`SaleTime` AS `下单时间`, `LogisticsInformation`.`TrackingNumber` AS `快递单号` FROM ((((`Sales` join `Employee`) join `Part`) join `Customer`) join `LogisticsInformation`) WHERE ((`Customer`.`CustID` = `Sales`.`CustID`) AND (`Employee`.`EmpID` = `Sales`.`EmpID`) AND (`Sales`.`PartID` = `Part`.`PartID`) AND (`LogisticsInformation`.`LogisticsID` = `Sales`.`LogisticsID`))  ;

-- --------------------------------------------------------

--
-- 视图结构 `客户资料`
--
DROP TABLE IF EXISTS `客户资料`;

CREATE ALGORITHM=UNDEFINED DEFINER=`Mytest`@`%` SQL SECURITY DEFINER VIEW `客户资料`  AS SELECT `Customer`.`CustName` AS `姓名`, `Customer`.`CustType` AS `类别`, `Customer`.`ContactNumber` AS `电话`, `Customer`.`Email` AS `邮件` FROM `Customer``Customer`  ;

-- --------------------------------------------------------

--
-- 视图结构 `销售`
--
DROP TABLE IF EXISTS `销售`;

CREATE ALGORITHM=UNDEFINED DEFINER=`Mytest`@`%` SQL SECURITY DEFINER VIEW `销售`  AS SELECT `Sales`.`EmpID` AS `员工编号`, `Customer`.`CustName` AS `客户姓名`, `Customer`.`CustType` AS `客户类型`, `Customer`.`ContactNumber` AS `客户电话`, `Customer`.`Email` AS `客户邮箱`, `Sales`.`PartID` AS `零件编号`, `Part`.`PartName` AS `零件名称`, `Part`.`Category` AS `零件类别`, `Part`.`RetailPrice` AS `销售单价`, `Sales`.`DeliveryMethod` AS `配送方式` FROM ((`Customer` join `Part`) join `Sales`) WHERE ((`Sales`.`PartID` = `Part`.`PartID`) AND (`Customer`.`CustID` = `Sales`.`CustID`))  ;

-- --------------------------------------------------------

--
-- 视图结构 `零件信息`
--
DROP TABLE IF EXISTS `零件信息`;

CREATE ALGORITHM=UNDEFINED DEFINER=`Mytest`@`%` SQL SECURITY DEFINER VIEW `零件信息`  AS SELECT `Part`.`PartID` AS `零件编号`, `Part`.`PartName` AS `零件名称`, `Part`.`Category` AS `零件类别`, `Part`.`Brand` AS `品牌`, `Part`.`ApplicableModels` AS `适用车型`, `Part`.`Specifications` AS `规格`, `Part`.`RetailPrice` AS `零件单价` FROM `Part``Part`  ;

-- --------------------------------------------------------

--
-- 视图结构 `零件库存信息`
--
DROP TABLE IF EXISTS `零件库存信息`;

CREATE ALGORITHM=UNDEFINED DEFINER=`Mytest`@`%` SQL SECURITY DEFINER VIEW `零件库存信息`  AS SELECT `Storage`.`WareID` AS `仓库编号`, `Part`.`PartID` AS `零件编号`, `Part`.`PartName` AS `零件名称`, `Part`.`Category` AS `零件类别`, `Part`.`Brand` AS `品牌`, `Part`.`ApplicableModels` AS `适用车型`, `Part`.`CurrentStock` AS `当前数量`, `Part`.`SafetyStockLevel` AS `安全存量` FROM (`Storage` join `Part`) WHERE (`Storage`.`PartID` = `Part`.`PartID`)  ;

--
-- 转储表的索引
--

--
-- 表的索引 `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- 表的索引 `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`CustID`),
  ADD UNIQUE KEY `ContactNumber` (`ContactNumber`);

--
-- 表的索引 `Department`
--
ALTER TABLE `Department`
  ADD PRIMARY KEY (`DepID`);

--
-- 表的索引 `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`EmpID`),
  ADD UNIQUE KEY `ContactNumber` (`ContactNumber`),
  ADD KEY `Employee_index` (`EmpID`);

--
-- 表的索引 `LogisticsInformation`
--
ALTER TABLE `LogisticsInformation`
  ADD PRIMARY KEY (`LogisticsID`);

--
-- 表的索引 `Part`
--
ALTER TABLE `Part`
  ADD PRIMARY KEY (`PartID`),
  ADD KEY `parts_index` (`PartID`),
  ADD KEY `Price_index` (`RetailPrice`);

--
-- 表的索引 `Sales`
--
ALTER TABLE `Sales`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `EmpID` (`EmpID`),
  ADD KEY `CustID` (`CustID`),
  ADD KEY `PartID` (`PartID`),
  ADD KEY `LogisticsID` (`LogisticsID`);

--
-- 表的索引 `Storage`
--
ALTER TABLE `Storage`
  ADD PRIMARY KEY (`WareID`,`PartID`),
  ADD KEY `PartID` (`PartID`);

--
-- 表的索引 `Warehouse`
--
ALTER TABLE `Warehouse`
  ADD PRIMARY KEY (`WareID`),
  ADD KEY `ManagerID` (`ManagerID`);

--
-- 限制导出的表
--

--
-- 限制表 `Sales`
--
ALTER TABLE `Sales`
  ADD CONSTRAINT `Sales_ibfk_1` FOREIGN KEY (`EmpID`) REFERENCES `Employee` (`EmpID`),
  ADD CONSTRAINT `Sales_ibfk_2` FOREIGN KEY (`CustID`) REFERENCES `Customer` (`CustID`),
  ADD CONSTRAINT `Sales_ibfk_3` FOREIGN KEY (`PartID`) REFERENCES `Part` (`PartID`),
  ADD CONSTRAINT `Sales_ibfk_4` FOREIGN KEY (`LogisticsID`) REFERENCES `LogisticsInformation` (`LogisticsID`);

--
-- 限制表 `Storage`
--
ALTER TABLE `Storage`
  ADD CONSTRAINT `Storage_ibfk_1` FOREIGN KEY (`WareID`) REFERENCES `Warehouse` (`WareID`),
  ADD CONSTRAINT `Storage_ibfk_2` FOREIGN KEY (`PartID`) REFERENCES `Part` (`PartID`);

--
-- 限制表 `Warehouse`
--
ALTER TABLE `Warehouse`
  ADD CONSTRAINT `Warehouse_ibfk_1` FOREIGN KEY (`ManagerID`) REFERENCES `Employee` (`EmpID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
