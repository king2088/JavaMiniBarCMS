-- MySQL dump 10.13  Distrib 5.4.3-beta, for Win32 (ia32)
--
-- Host: localhost    Database: bar
-- ------------------------------------------------------
-- Server version	5.4.3-beta-community

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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `articleid` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` mediumtext,
  `userid` bigint(20) DEFAULT '0',
  `readcount` int(11) DEFAULT '0',
  `recount` int(11) DEFAULT '0',
  `picurl` varchar(30) DEFAULT '0',
  `picname` varchar(100) DEFAULT NULL,
  `typeid` enum('1','2','3') NOT NULL DEFAULT '1',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`articleid`),
  UNIQUE KEY `articleid` (`articleid`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'国外广告创意摄影(10p)信息','<p>国外广告创意摄影(10p)信息</p>',1,5,0,'0',NULL,'2','2009-12-03 12:06:03'),(2,'请所有会员把真实姓名写上','<p>请所有会员把真实姓名写上</p>',1,0,0,'0',NULL,'2','2009-12-03 12:13:57'),(3,'请大家要转钱进来的使用网银','<p>请大家要转钱进来的使用网银</p>',1,2,0,'0',NULL,'2','2009-12-03 12:14:25'),(4,'本站工作人员8月20日聚会','<p>本站工作人员8月20日聚会</p>',1,4,0,'0',NULL,'2','2009-12-03 12:15:05'),(5,'本酒吧最近装修，到8月30日开发','<p>本酒吧最近装修，到8月30日开发</p>',1,3,0,'0',NULL,'1','2009-12-03 12:15:38'),(6,'英国酒吧关门了','<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 一些数字令人吃惊。英国<font color=\"#ff0000\">啤酒</font>与酒吧协会<span>(BritishBeerandPubAssociation)表示，目前每周有39家酒吧倒闭。啤酒销售额已滑落至上世纪30年代大萧条时期的水平。人们过去常说，英国是个喝啤酒的国家。我们似乎正在戒除这一嗜好。</span></p>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">大不列颠的酒吧究竟怎么了？你或许以为，经营一家酒吧是一件非常简单的事：倒酒、收钱。但它做起来比看上去困难得多。酒吧经营者发现自己面临特殊的压力。人们正在围绕酒吧所有者与经营者之间各种不同的关系展开激烈的讨论。至于哪种办法最好，人们没达成什么共识。</div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">在英国，酒吧所有权有<span>3种形式。一种是所谓的&ldquo;自由酒吧&rdquo;(freehouses)，约占三分之一的市场份额，这种酒吧为执照持有者所有和管理；一种是有管理的酒吧(managedhouses)，市场份额约为六分之一，这种酒吧为酒吧公司或酿酒商所有，聘请管理人员及职员来经营。还有一种是出租酒吧（约占一半的市场份额），它是由酒吧公司或酿酒厂所有，同时所有者向执照持有者收取租金。从理论上讲，执照持有者会把它当作自己的酒吧来经营。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">所有权结构非常重要。你立刻就会发现，管理这些不同种类的酒吧是截然不同的工作。一家自由酒吧的经营者有明确的所有权意识。这是他（或她）自己的买卖，不是别人的。有管理酒吧的经营者是酒吧公司或酿酒厂的雇员，是一个较大整体中的一部分。酒吧经营者必须要建立某种公司情感或认同感，而他（或她）的雇员必须要向共同的目标努力。</div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">出租酒吧的经营者对&ldquo;房东&rdquo;怀有感激之情。但这首先是一种财务关系。两家最大的英国&ldquo;房东&rdquo;&mdash;&mdash;<span>EnterpriseInns和PunchTaverns&mdash;&mdash;已经因为在租金和承租人必须向其购买的啤酒及其它饮料上索价太高而受到谴责。它们使用先进的技术来监控承租人的啤酒销售情况，以确保它们不会在别处找到要价较低的供应商。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">这两家大&ldquo;房东&rdquo;的股价近几个月来暴跌，这是它们咎由自取。它们均选择了一度盛行的方式：借入巨额资金建造其地产王国。但目前，作为那些借款基础的预期现金流正逐渐枯竭。</div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">拥有并管理<font color=\"#ff0000\">酒吧</font>的酒吧集团&mdash;&mdash;<span>JDWetherspoon的总裁提姆&bull;马丁(TimMartin)对此并不同情。他表示，如果没有多余的资金用于维护地产，如果价格高得丧失了竞争力，那么如果你失去了顾客，也没什么可惊讶的。马丁正在以每品脱99便士的价格销售啤酒。因为他有这个能力。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">但<span>Enterprise和Punch看上去像是21世纪初杠杆热潮的另外两个受害者，同时也像是中了被伦敦商学院(LondonBusinessSchool)会计学教授克里斯&bull;希格森(ChrisHigson)称之为&ldquo;零规模资产负债&rdquo;的诅咒。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">不论你是一位多么出色的管理者，有些趋势是难以抗拒的。生活方式已经改变。人们在闲暇时有了更多的事情可做，而不只是泡酒吧。工作模式已经改变。仅仅为了消磨几小时而在一天结束时去泡酒吧的男人越来越少。社会已然改变。私人会员俱乐部近年来蓬勃发展，而许多酒吧则逐渐销声匿迹。你不再能够在酒吧里吸烟。一些酒吧表示，这也削弱了它们对许多老顾客的吸引力。</div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">另外，还有经济上的原因。现在，人们可供支出的钱少了。比起拐角处的酒吧，凭借其购买能力，超市可以以低得多的价格出售啤酒。已经有人指责大型超市损害了屠夫、面包师，无疑还有烛台制造商的利益。现在，轮到酒吧了。酿酒商和酒吧老板正发起为啤酒减税的运动，不过这可能只是一场徒劳。</div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">从最基础的层面上来看，这场危机告诉了我们一些有关在市场和品味改变时留住客户的困难的东西。但酒吧是人类所知最古老的零售店形式之一。自《圣经》时代起，小酒店和酒馆就一直存在。经营酒吧到底有多困难？英语中有一个通俗的说法：无能的最高境界包括无力组织酿酒厂的饮酒会。但许多人难以成功经营酒吧。</div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">酒吧不是一定要消亡。有些酒吧仍然很受欢迎，且人满为患。上周，在英国公共政策研究院<span>(InstituteforPublicPolicyResearch)主办的一个关于英国酒吧未来的研讨会上，一位获奖的酒吧女房东直截了当地说：&ldquo;到世界末日，它还会存在。&rdquo;她表示，一家成功酒吧的标志是：当你走进一家酒吧的时候，它感觉就像&ldquo;某个人的地方&rdquo;&mdash;&mdash;你可以感觉到打理这家酒吧的主人的影响。罗克&bull;福特爵士(SirRoccoForte)和我谈到好酒店时，曾表达过一模一样的观点。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">当顾客始终都能接收到他们看重和喜爱的服务时，他们就会展现出忠诚。它就这么简单，也就这么困难。但为了拯救不断倒闭的酒吧，必须采取紧急行动。对于苦苦挣扎的酒吧经营者来说，信息十分清楚：该是迅速采取行动的时候了。</div>',1,8,0,'0',NULL,'1','2009-12-03 14:54:09'),(7,'天津又添一条酒吧街可容纳8000','<p>&nbsp;</p>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">汇集<span>30个国家的名酒，品种可达千余种,可容纳8000人至10000人&hellip;&hellip;据悉，坐落于河北区海河沿岸的狄奥酒吧街预计年内建成，届时，本市又将增添一条独具特色的<a title=\"英国哈里王子受前女友邀请酒吧狂欢\" target=\"_blank\" href=\"http://www.wanzui.com/jiuba/jbxwzx/ArticleShow49175.htm\"><font color=\"#ff0000\">酒吧</font></a>街。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">狄奥酒吧街位于奥式商务区，北至金汤桥，南至北安桥，全长约一公里，一期工程已经建设了<span>3个木质别墅式酒吧，酒吧内设吧台服务区、顾客休息区、文化演艺区等。今年将陆续开展二期、三期工程建设。二期工程预计在10月1日前可以完成建设，而三期工程也将在年内完工。据介绍，狄奥酒吧街的酒吧大多是欧式风格，讲究&ldquo;错落有致&rdquo;&ldquo;自成一景&rdquo;。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">该项目的负责人<span>&mdash;&mdash;天津百事弘方文化传媒有限公司的总经理王维龙介绍，狄奥酒吧街具有独特的环境优势，它以袁世凯、冯国璋故居和现代奥式建筑群为依托，毗邻意式风情街，和平路商业街、古文化街、鼓楼步行街、远东百货、新安购物、大胡同商业区在其周边分布。&ldquo;这里是海河最具观赏性的地段，是遗存古迹最具代表性的中央地段，是海河景观地标性的区域，也是最具有商业、旅游、文化市场潜力价值的区域。&rdquo;</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">据介绍，狄奥酒吧街在海河河面上还设有演艺船，目前已经举办过大型婚介会、香港某品牌的推介会等多项活动。船内有两层，可容纳<span>400人。二层主要是水上舞台，可以进行演出。此外，船上还设有4个单间，包括咖啡室、茶室、商务室等，游客可以在此欣赏京韵大鼓表演，领略特色音乐。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">狄奥酒吧街将建设<span>30个酒吧，基本上每一个酒吧代表一个国家的风格，最小的酒吧大约有33平方米，最大的酒吧可以达到96平方米。一般的屋子大概可以容纳20-30人，算上院子的话，可以容纳40-50人。酒吧将全部建成木质别墅，建成后，一共可以容纳8000至10000人。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">据介绍，狄奥酒吧街力图打造成国际型酒吧街，届时，<span>30个国家的千余种酒类将汇集于此，包括国内外知名品牌的<a title=\"鉴赏啤酒的要点\" target=\"_blank\" href=\"http://www.wanzui.com/jiupinyp/qitapjh/ArticleShow49136.htm\"><font color=\"#ff0000\">啤酒</font></a>、红酒、白酒及咖啡、饮料、特色食品等。狄奥酒吧街还将与世界500强企业进行接触，吸引他们在此建立体验店，并与天津中华老字号进行联系，挖掘津门文化。</span></div>',1,1,0,'0',NULL,'1','2009-12-03 14:54:50'),(8,'酒吧老板雇凶持枪砸场 险些误伤','<p>&nbsp;</p>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">去年<span>12月13日晚，位于南宁市新民路的阿伦故事<font color=\"#ff0000\">酒吧</font>，发生了一起被自治区公安厅挂牌督办的涉枪案件。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">历经两个月的缜密侦查，南宁警方抓获涉案的<span>7名嫌疑人，缴获6支自制枪支等管制器具。今年2月24日，其中5名落网的嫌疑人指认现场。这起枪案的背后，到底有着怎么样的故事呢？</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">案发：</div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">深夜里有人朝天放枪</div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">今年<span>2月24日上午11时许，5名身穿囚服、手脚戴着镣铐的青年男子，被几名荷枪实弹的民警押着，来到南宁市新民路阿伦故事酒吧门前。他们一一用手指指向&ldquo;阿伦故事酒吧&rdquo;门面。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">&ldquo;怎么了？是抢夺吗？<span>&rdquo;这时一些路人开始彼此打探消息，他们没有想到的是，在这家已关门停业近两个月的酒吧门前，发生的是一起涉枪案件。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">南宁市刑侦支队七大队向记者提供的该酒吧监控录像显示：去年<span>12月13日晚11时45分，一辆面包车从新民路由南向北行至阿伦故事酒吧门前路边后，突然从车上和马路对面冲过来近10名男子，他们手持长枪、短枪和砍刀，先是有人朝夜空中&ldquo;砰&rdquo;地开了一枪后，接着凶狠地推搡和围攻酒吧门前站着的几名男子，随后，这伙人上了面包车逃离现场，整个过程为40秒钟。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">当时接警后，南宁市公安分局青秀分局、南宁市公安局刑侦支队领导率领大批民警赶到了现场走访调查，证实此案造成两名男子分别被砍成轻伤和轻微伤。此枪案发生时，正值自治区成立<span>50周年大庆活动期间。自治区公安厅将这起案件列为挂牌督办案件，要求尽快侦破。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">很快，南宁市刑侦支队七大队和新城派出所联合成立了专案组。办案民警事后侦查发现，该酒吧安装的监控录像如实记录了这起枪案的案发时间、涉案人物及经过等相关信息。专案组迅速请专家对此监控录像进行了技术取证，随后开展了秘密辨认和大量的调查走访工作。</div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">查明：</div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">老板买凶差点误伤自己</div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">经过一个多月的缜密侦查，专案组初步查明，这起枪案系因阿伦故事酒吧转让纠纷引起。</div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">最初锁定的主要嫌疑人包括<span>&ldquo;猪霸&rdquo;（吴铁某）、&ldquo;崩牙&rdquo;（吴东某）、&ldquo;阿猫&rdquo;（黎某）和&ldquo;木薯&rdquo;（磨某）等人。&ldquo;猪霸&rdquo;原是一名无业人员，平时主要在南宁市的一些娱乐场所贩卖K粉等毒品，后来与&ldquo;比较讲义气&rdquo;的&ldquo;阿猫&rdquo;认识。&ldquo;阿猫&rdquo;虽然经营着一个酒楼，却不是一个安于生意的人，他曾在2006年参与了一次打砸南宁某酒吧的不法活动。而&ldquo;崩牙&rdquo;等人，则曾因打架斗殴、抢劫等违法犯罪活动，被公安、司法机关打击处理过。这伙人中，有的是同学，有的是狱友，他们经彼此介绍认识玩在了一起，平时一旦有&ldquo;事&rdquo;，就出来互相帮忙。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">后<span>&ldquo;猪霸&rdquo;等人与阿伦故事酒吧原来的女老板陈某认识。这家经营了多年的酒吧，在创立之初，因推行&ldquo;日日上演爱情，夜夜都是情人节&rdquo;的营销理念和策略，受到了不少年轻人青睐，生意曾一度红火，后来由于受多方因素影响，这家酒吧的经营出现了问题，先后换了多任老板。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">去年下半年，接手这家酒吧的另一老板陈某见生意愈发不景气，便将酒吧转让承租给了手下的一个管理高层阿民（化名）。当时，双方签下协议说，在阿民接手经营酒吧后的两个月，支付给陈某<span>10万元租金等费用，可两个月后，阿民迟迟没有兑现，陈某遂决定找人给对方点颜色看看。后来，陈某找来了&ldquo;猪霸&rdquo;、&ldquo;崩牙&rdquo;等人，请他们到阿民那里&ldquo;收数&rdquo;，如成功即给二人共2万元报酬。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">去年<span>12月13日晚，&ldquo;猪霸&rdquo;等两个嫌疑人从陈某处先拿了3000元&ldquo;辛苦费&rdquo;后，径直上门找阿民&ldquo;收数&rdquo;，但被泼了冷水。接着，陈某亲自到场谈判，但双方没谈拢。继而引发了枪案。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">后来警方查明，由于那次报复行动是<span>&ldquo;层层转包&rdquo;，实际持刀枪动手的马仔中，有人并不认识雇主陈某。当晚，这伙马仔来到酒吧门口后，不问青红皂白，枪支竟然指向了雇主陈某。在场的&ldquo;猪霸&rdquo;看到自己的马仔如此鲁莽，立即制止这场&ldquo;误会&rdquo;。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">抓捕：</div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">从疑犯父亲处寻找突破口</div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">锁定了嫌疑人，专案组兵分多路展开了统一收网行动。</div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">经过<span>20多个小时的伏击守候，今年2月11日，一路民警在南宁市广园路某住宅小区，抓获&ldquo;阿猫&rdquo;和李某等3名嫌疑人。就在民警撞开房门进入房内的当口，&ldquo;阿猫&rdquo;和女友发了一条短信，给居住在南宁市明秀路某小区的同伙&ldquo;猪霸&rdquo;通风报信说：&ldquo;我们在公安局了。&rdquo;</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">&ldquo;猪霸<span>&rdquo;和陆某看到信息后，遂反应了过来，刚想出逃，旋即被守候多时的另一组民警堵在了家门口。在&ldquo;猪霸&rdquo;和陆某身上和住处，民警当场缴获了毒品K粉376.7克、大麻53.1克、麻古4.6克。与此同时，在唐山路某住宅，另一组民警抓获了嫌疑人&ldquo;木薯&rdquo;，缴获毒品麻古4.6克、K粉11.2克。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">对嫌疑人<span>&ldquo;崩牙&rdquo;的抓捕可谓一波三折。据专案组前期秘密掌握的情况来看，&ldquo;崩牙&rdquo;家住南宁市新阳路某社区，在家中可能藏有多把枪支和管制刀具。在警方统一抓捕行动前，&ldquo;崩牙&rdquo;似乎嗅到了气息，他从2月10日晚回到家后，直到11日下午都未曾出门。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">对警方抓捕不利的客观条件是，<span>&ldquo;崩牙&rdquo;家安装有坚固的防盗大铁门。当时如果是调动特警强攻，很可能引来&ldquo;困兽犹斗&rdquo;的&ldquo;崩牙&rdquo;的反击，若请消防队员破拆防盗门，也难料躲在暗处的嫌疑人&ldquo;放冷枪&rdquo;。&ldquo;难道除了强攻就没有其他办法了吗？&rdquo;紧要关头，为了确保抓捕工作万无一失以及周边群众的安全，专案组决定智取。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">这时，警方得知<span>&ldquo;崩牙&rdquo;的父亲住在同一个社区另一栋房内。刑侦支队七大队大队长陈平遂对吴父说：&ldquo;你儿子犯事是肯定的了，但这个事情不大，没有必要躲着。如果我们强攻，伤到你家小孩也不好。&rdquo;经过3分钟的思想工作，吴父决定配合警方：&ldquo;那我就帮你们开门呗！&rdquo;</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">吴父用钥匙打开自家防盗门后，专案组立即冲进房间内，将<span>&ldquo;崩牙&rdquo;抓获。经细致搜查，民警在&ldquo;崩牙&rdquo;房内衣柜等处，共缴获了自制连发猎枪2支，双管猎枪1支，仿五四、六四式手枪3支，子弹5发及砍刀3把。经审讯，&ldquo;猪霸&rdquo;、&ldquo;崩牙&rdquo;等7名嫌疑人对参与阿伦故事酒吧涉枪案件的犯罪事实供认不讳。据供认，当时朝天开枪的正是嫌疑人李某。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">在警方收网期间，嫌疑人陈某侥幸逃脱。</div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 5.25pt 0cm\">目前，这<span>7名嫌疑人已被刑事拘留，原酒吧老板陈某和打手张某等团伙成员已被列为网上逃犯。警方同时也希望这些嫌疑人尽快投案自首。</span></div>',1,2,0,'0',NULL,'1','2009-12-03 14:55:33'),(9,'酒吧员工烧开水煮干引发火灾','<p>&nbsp;</p>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 6pt 0cm\"><span style=\"line-height: 150%\">2</span><span style=\"line-height: 150%\">月12日</span><span style=\"line-height: 150%\">下午1点45分，市区保佑桥直街的一家<font color=\"#ff0000\">酒吧</font>内突然冒出滚滚浓烟，随后，4辆消防车紧急赶到。在酒吧员工的配合下，消防战士很快消除了险情。深夜时分酒吧的厨房内怎么会起火？原来，这火是因员工干烧茶壶引起。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 6pt 0cm\"><span style=\"line-height: 150%\">据消防战士介绍，当晚有酒吧员工在厨房里烧开水，可是点燃煤气后人却走开了。时间一长，茶壶内的水被烧干，最后导致煤气软管也起了火。厨房起火后，酒吧员工立即取来灭火器扑救，几分钟后，火被扑灭了，可过了没多久，软管再次起火。这时大伙都不敢再上前扑救，生怕气瓶爆炸，只好报警请消防队员来救急。（记者/陈波、马亚娜）</span></div>',1,1,0,'0',NULL,'1','2009-12-03 14:55:57'),(10,'昆明一酒吧爆炸 警方初步确定嫌','<p>&nbsp;</p>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 6pt 0cm\"><span style=\"line-height: 150%\">12</span><span style=\"line-height: 150%\">月24日</span><span style=\"line-height: 150%\">上午10时40分许，<font color=\"#ff0000\">昆明市</font>五华区文化巷76号萨尔瓦多酒吧发生爆炸案，一男子死亡。昆明市公安局新闻发言人昨日称，公安机关已经初步确定了犯罪嫌疑人。此外，国家公安部已派员赴昆明参与调查该案。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 6pt 0cm\"><span style=\"line-height: 150%\">据悉，萨尔瓦多酒吧是4个美国人和一个日本人合伙开的。爆炸中一名男子受伤，后经抢救无效死亡。有医院人士称，死者死前称自己是昆明公交爆炸案的元凶。但此消息未获警方证实。</span></div>',1,47,0,'0',NULL,'1','2009-12-03 15:17:34'),(11,'东方神起本色出演酒吧歌手（图）','<p>&nbsp;</p>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 6pt 0cm\" align=\"center\"><span style=\"line-height: 150%\"><img width=\"500\" height=\"258\" alt=\"\" src=\"http://www.wanzui.com/UploadFile/2008-1-15jiuba/2008.12.16（jb）-13.jpg\" /></span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 6pt 0cm\"><span style=\"line-height: 150%\"><font color=\"#ff0000\">韩国人气组合</font>东方神起，将会首度客串电影《舞吧！昂》。据组合所属的SM娱乐公司日前透露，东方神起09年1月在日本推出的最新单曲已被选为该片的主题曲，5子还会首次为电影客串，他们会演回自己，饰演酒吧歌手。《舞》片改编自日本人气漫画，从00年开始在&ldquo;小学馆&rdquo;的漫画周刊《BigComicSpirits》连载，发行量超过180万册。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 6pt 0cm\"><span style=\"line-height: 150%\">韩国人气组合东方神起，将会首度客串电影《舞吧！昂》。据组合所属的SM娱乐公司日前透露，东方神起09年1月在日本推出的最新单曲已被选为该片的主题曲，5子还会首次为电影客串，他们会演回自己，饰演酒吧歌手。《舞》片改编自日本人气漫画，从00年开始在&ldquo;小学馆&rdquo;的漫画周刊《BigComicSpirits》连载，发行量超过180万册。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 6pt 0cm\"><span style=\"line-height: 150%\">故事讲述一名少女立志成为芭蕾舞蹈员，女主角人选已铁定由日本女星黑木美沙饰演，暂定于明年3月20日在<font color=\"#ff0000\">日本</font>上映。</span></div>',1,15,0,'0',NULL,'1','2009-12-03 15:18:10'),(12,'女星米莎巴顿酒吧与新欢亲热(图)','<p>&nbsp;</p>\r\n<div style=\"text-align: center; line-height: 150%; text-indent: 21pt; margin: 6pt 0cm\" align=\"center\"><span style=\"line-height: 150%\">&nbsp;<img src=\"http://www.wanzui.com/UploadFile/2008-1-15jiuba/2008.12.16（jb）-01.jpg\" width=\"331\" height=\"500\" alt=\"\" /></span></div>\r\n<div style=\"text-align: center; line-height: 150%; text-indent: 21pt; margin: 6pt 0cm\" align=\"center\"><span style=\"line-height: 150%\">米莎巴顿</span></div>\r\n<div style=\"text-align: center; line-height: 150%; text-indent: 21pt; margin: 6pt 0cm\" align=\"center\"><span lang=\"EN-US\" style=\"line-height: 150%; font-family: 宋体; mso-bidi-font-size: 10.5pt\"><o:p>&nbsp;<img src=\"http://www.wanzui.com/UploadFile/2008-1-15jiuba/2008.12.16（jb）-02.jpg\" width=\"500\" height=\"337\" alt=\"\" /></o:p></span>&nbsp;</div>\r\n<div style=\"text-align: center; line-height: 150%; text-indent: 21pt; margin: 6pt 0cm\" align=\"center\"><span style=\"line-height: 150%\">路克-皮特查得</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 6pt 0cm\"><span style=\"line-height: 150%\">女星米莎-巴顿最近被指与英国乐队TheKooks主音路克-皮特查得(LukePritchard)拍拖，二人出席派对时被目睹在酒吧又搂又亲，当Luke即兴上台献唱时，米莎毫不避忌地卖力欢呼。对于恋情，Luke说：&ldquo;是！我们开始了！我好幸运，因为她那么漂亮竟然会同我这类人拍拖。&rdquo;他表示<font color=\"#ff0000\">乐队</font>现已完成巡回演出，可与女友有更多机会见面，但亦有传米莎搭上英国DJ的儿子汤姆-怀特(TomWright)。</span></div>',1,5,0,'0',NULL,'1','2009-12-03 15:19:00'),(13,'昆明百余警察凌晨出动平息酒吧群','<p>&nbsp;</p>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 6pt 0cm\"><span style=\"line-height: 150%\">11</span><span style=\"line-height: 150%\">月24日</span><span style=\"line-height: 150%\">凌晨，一伙不明身份的男子在昆明市宝善街&ldquo;八点半&rdquo;酒吧门口聚集许久后，和从<font color=\"#ff0000\">酒吧</font>内冲出的另一伙人发生冲突，现场一度十分混乱。昆明市公安局紧急出动百余警力，短时间内平息了此次群殴，同时带回15人进行调查。</span></div>\r\n<div style=\"text-align: center; line-height: 150%; text-indent: 21pt; margin: 6pt 0cm\" align=\"center\"><img src=\"http://www.wanzui.com/UploadFile/2008-1-15jiuba/2008.11.26（jb）-24.jpg\" style=\"width: 396px; height: 208px\" alt=\"\" />&nbsp;</div>\r\n<div style=\"text-align: center; line-height: 150%; text-indent: 21pt; margin: 6pt 0cm\" align=\"center\"><span style=\"line-height: 150%\">昆明警方带走15人调查</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 6pt 0cm\"><span style=\"line-height: 150%\">附近报刊亭老板刘明(化名)说，23日晚11点左右，&ldquo;八点半&rdquo;酒吧门口来了一群外地口音男子，但并未进去消费，而是聚在门口聊天。&ldquo;今天不给个说法，我们就不走。&rdquo;嘈杂的现场中，刘明听到来人这么说。由于忙着卖报纸，刘明没再注意。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 6pt 0cm\"><span style=\"line-height: 150%\">随着时间越来越晚，除娱乐场所外，多数店铺都相继关门。11点40分左右，不知什么原因，&ldquo;八点半&rdquo;酒吧提前结束了营业，工作人员将里面的客人请出场外。一些客人以为发生了什么大事，聚集在门口不愿离开。凌晨1点左右，酒吧里突然冲出一群男子，和等在门外的那伙外地男子对打起来。&ldquo;场面太吓人了，有的人手上还有刀，很快就有人中刀倒地，整条路瞬间水泄不通。&rdquo;事发现场距离报刊亭不足5米，刘明慌忙关了铺面，骑车离开了。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 6pt 0cm\"><span style=\"line-height: 150%\">记者从一段视频上看到，现场十分混乱，周围停放着数十辆警车。近百名保安人员身着防穿刺背心，在酒吧门口围出一块空地，空地上几名警察正在拍照取证。一名伤者被送上救护车后，还对着镜头打出象征胜利的&ldquo;V&rdquo;字。此人臀部受伤，包扎的纱布清晰可见。据了解，事情发生后，昆明市<font color=\"#ff0000\">公安局</font>紧急调动相关派出所力量，对现场形成合围之势，短时间内平息了殴斗，并带回多人接受调查，连夜开展审讯工作。</span></div>\r\n<div style=\"line-height: 150%; text-indent: 21pt; margin: 6pt 0cm\"><span style=\"line-height: 150%\">&ldquo;八点半&rdquo;酒吧负责人金晓叶在接受采访时表示，对此事起因并不清楚。他说，当酒吧门口出现不明身份的人后，就有人报警了。为防止出现意外，按警方的要求，酒吧方面立即停止了营业，并将客人劝出场外。但就在警方展开调查时，楼下就打了起来。目前，他正在积极配合警方工作。</span></div>',1,11,0,'0',NULL,'1','2009-12-04 18:21:58');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email` (
  `emailid` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject` varchar(200) DEFAULT NULL,
  `content` mediumtext,
  `sender` varchar(50) NOT NULL DEFAULT '',
  `receiver` varchar(50) NOT NULL DEFAULT '',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`emailid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` VALUES (1,'你好吗？','你好吗？管理员……','xx','admin','2009-12-04 12:27:21',1),(3,'你好吗？','最近还好吗？好久没有上你们的酒吧喝酒了，你现在生意应该不错吧，呵呵，这段时间一直忙着写论文，好久都没有时间去你酒吧喝酒了，等下周，我把论文写好了，一定去你那里，到时候在网站上先预定一个，希望你给我优惠点哦，呵呵，好 了，我又要开始写论文了！\r\n\r\n     祝：生意兴隆……\r\n                                                                                                     署名：张飞3','xx','admin','2009-12-04 12:52:44',1),(4,'你好嘛？','你还好吗？我是XXX，好久没有上你酒吧，明天我去，新闻能预定到很好的桌子','xx','admin','2009-12-06 14:55:09',1),(5,'回复：你好嘛？','我还好的，多来我酒吧喝酒，我给你更加优惠的价格\r\n\r\n\r\n----------------------------------------------------------\r\n【 在 xx 的来信中提到: 】\r\n你还好吗？我是XXX，好久没有上你酒吧，明天我去，新闻能预定到很好的桌子\r\n','admin','xx','2009-12-07 11:17:04',1),(6,'回复：你好吗？','呵呵，好好搞学习吧，把学习搞好了，再来喝酒\r\n\r\n\r\n----------------------------------------------------------\r\n【 在 xx 的来信中提到: 】\r\n近还好吗？好久没有上你们的酒吧喝酒了，你现在生意应该不错吧，呵呵，这段时间一直忙着写论文，好久都没有时间去你酒吧喝酒了，等下周，我把论文写好了，一定去你那里，到时候在网站上先预定一个，希望你给我优惠………………\r\n','admin','xx','2009-12-07 11:17:35',1),(7,'回复：你好吗？','\r\n我好啊\r\n\r\n----------------------------------------------------------\r\n【 在 xx 的来信中提到: 】\r\n你好吗？管理员……\r\n','admin','xx','2009-12-07 11:18:10',1);
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goodinfo`
--

DROP TABLE IF EXISTS `goodinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goodinfo` (
  `goodinfoid` bigint(20) NOT NULL AUTO_INCREMENT,
  `goodinfoname` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `addr` varchar(50) DEFAULT NULL,
  `price` float(20,3) DEFAULT NULL,
  `picurl` varchar(30) DEFAULT NULL,
  `intro` mediumtext,
  `num` varchar(100) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`goodinfoid`),
  UNIQUE KEY `goodinfoid` (`goodinfoid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodinfo`
--

LOCK TABLES `goodinfo` WRITE;
/*!40000 ALTER TABLE `goodinfo` DISABLE KEYS */;
INSERT INTO `goodinfo` VALUES (1,'4人聚会套餐','大理啤酒有限公司','云南省昆明市高薪开发区海原路28号',235.000,'20091203173841.jpg','此套餐正适合4人聚会等','4','2009-12-03 09:38:41'),(2,'5人亲情套餐','云南大理啤酒有限公司','云南大理',300.000,'20091204142222.jpg','此套餐适合于5人家人聚会、朋友聚会，本酒吧环境优雅，空气新鲜，伴随着优美的音乐，让您在音乐中感受快乐的聚会，享受友情的时光。我们将陪伴你度过这个美好的夜晚。欢迎您的订购','5','2009-12-04 06:22:22'),(3,'10人高级套餐-百威','百威啤酒','北京',1200.000,'20091204153756.jpg','此乃世界著名的百威啤酒公司生产的百威啤酒，6打，正合适10人饮用，玩得尽兴，玩得高兴就好，不要喝醉，人生唯有酒能相伴，但是要切记酒后误事。','6','2009-12-04 07:37:56'),(6,'8人聚会套餐','百威啤酒','北京',620.000,'20091208010023.jpg','8人聚会套餐，最适合8人聚会使用，欢迎大家订购本酒吧的酒水和租用本酒吧的酒水。','7','2009-12-07 17:00:23');
/*!40000 ALTER TABLE `goodinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `goodsid` bigint(20) NOT NULL AUTO_INCREMENT,
  `buynumber` bigint(20) DEFAULT '1',
  `userid` bigint(20) NOT NULL DEFAULT '0',
  `price` float(20,3) DEFAULT NULL,
  `goodinfoid` bigint(20) NOT NULL DEFAULT '0',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`goodsid`),
  UNIQUE KEY `goodsid` (`goodsid`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (4,5,3,1200.000,3,'2009-12-06 14:50:53'),(5,100,3,300.000,2,'2009-12-06 14:52:23'),(6,100,3,235.000,1,'2009-12-06 14:53:06'),(7,100,3,300.000,2,'2009-12-06 14:53:22'),(8,1,3,1200.000,3,'2009-12-06 14:53:41'),(9,1,3,620.000,6,'2009-12-07 17:03:02'),(10,1,3,235.000,1,'2009-12-07 17:06:01'),(11,5,3,1500.000,2,'2009-12-07 17:06:15'),(12,10,3,12000.000,3,'2009-12-07 17:06:58'),(13,3,3,3600.000,3,'2009-12-07 17:10:56'),(15,1,3,300.000,2,'2009-12-11 06:10:39');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ku`
--

DROP TABLE IF EXISTS `ku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ku` (
  `kuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `goodname` varchar(200) NOT NULL DEFAULT '',
  `num` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kuid`),
  UNIQUE KEY `kuid` (`kuid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ku`
--

LOCK TABLES `ku` WRITE;
/*!40000 ALTER TABLE `ku` DISABLE KEYS */;
INSERT INTO `ku` VALUES (1,'大理啤酒','100'),(2,'雪花啤酒','50'),(3,'燕京啤酒','200'),(5,'百威啤酒','300');
/*!40000 ALTER TABLE `ku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music`
--

DROP TABLE IF EXISTS `music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `music` (
  `musicid` bigint(20) NOT NULL AUTO_INCREMENT,
  `musicname` text,
  `musicurl` text,
  `userid` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`musicid`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music`
--

LOCK TABLES `music` WRITE;
/*!40000 ALTER TABLE `music` DISABLE KEYS */;
INSERT INTO `music` VALUES (2,'悲伤音乐','http://www.coolvc.cn/music.mp3',1),(12,'失业情歌 胡彦斌','http://220.181.50.101/10aacd026352b76e0958c6aba1ae0eeb/60a510087f0b97c4062fc6410d829d2d.mp3',3);
/*!40000 ALTER TABLE `music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myusers`
--

DROP TABLE IF EXISTS `myusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myusers` (
  `myuserid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `myuname` char(36) NOT NULL DEFAULT '',
  `sex` enum('男','女') NOT NULL DEFAULT '男',
  `pname` char(50) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `email` char(50) NOT NULL DEFAULT '',
  `tel` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`myuserid`),
  UNIQUE KEY `myuserid` (`myuserid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myusers`
--

LOCK TABLES `myusers` WRITE;
/*!40000 ALTER TABLE `myusers` DISABLE KEYS */;
INSERT INTO `myusers` VALUES (2,'刘国强','女','雪花啤酒','云南昆明市五华区北京路33号大型工业大楼21楼309室','lgq@126.com','13710102298'),(3,'刘阳','男','大理啤酒','云南省昆明市北京路89号','323333@163.com','15728282828');
/*!40000 ALTER TABLE `myusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systems`
--

DROP TABLE IF EXISTS `systems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systems` (
  `sid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `sitename` varchar(255) NOT NULL DEFAULT '小型酒吧在线管理系统',
  `description` varchar(255) NOT NULL DEFAULT '小型酒吧在线管理系统',
  `keywords` varchar(255) NOT NULL DEFAULT '酒吧,管理,系统,在线',
  `author` varchar(255) NOT NULL DEFAULT '张飞',
  `email` char(50) NOT NULL DEFAULT '',
  `tel` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systems`
--

LOCK TABLES `systems` WRITE;
/*!40000 ALTER TABLE `systems` DISABLE KEYS */;
INSERT INTO `systems` VALUES (1,'小型酒吧在线管理系统','小型酒吧在线管理系统','酒吧,管理,系统,在线','张飞','514337551@qq.com','15825254472');
/*!40000 ALTER TABLE `systems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talk`
--

DROP TABLE IF EXISTS `talk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talk` (
  `talkid` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` mediumtext,
  `userid` bigint(20) NOT NULL DEFAULT '0',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`talkid`),
  UNIQUE KEY `talkid` (`talkid`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talk`
--

LOCK TABLES `talk` WRITE;
/*!40000 ALTER TABLE `talk` DISABLE KEYS */;
INSERT INTO `talk` VALUES (5,'你好',3,'2009-12-05 10:19:36'),(2,'大家好，我是\r\nxxx',1,'2009-12-04 05:51:32'),(29,'酒吧老板很热情',3,'2009-12-06 14:57:08'),(30,'酒吧老板很热情',3,'2009-12-07 17:53:11');
/*!40000 ALTER TABLE `talk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `typeid` bigint(20) NOT NULL AUTO_INCREMENT,
  `typename` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`typeid`),
  UNIQUE KEY `articleid` (`typename`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'酒吧新闻'),(2,'酒吧公告'),(3,'酒吧活动');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uname` char(36) NOT NULL DEFAULT '',
  `name` char(50) NOT NULL DEFAULT '',
  `pwd` char(32) NOT NULL DEFAULT '',
  `spwd` char(32) NOT NULL DEFAULT '',
  `sex` enum('男','女','保密') NOT NULL DEFAULT '保密',
  `email` char(50) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `tel` varchar(255) NOT NULL DEFAULT '',
  `birth` date DEFAULT '0000-00-00',
  `post` char(50) NOT NULL DEFAULT '',
  `safequestion` char(50) NOT NULL DEFAULT '',
  `safeanswer` char(50) NOT NULL DEFAULT '',
  `role` enum('0','1','2') NOT NULL DEFAULT '0',
  `money` char(50) NOT NULL DEFAULT '0',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','管理员','E10ADC3949BA59ABBE56E057F20F883E','123456','男','514337551@qq.com','云南师大商学院','15825254472','1987-10-18','650106','我是管理员吗？','是的','1','0','2009-12-04 18:48:07'),(2,'king2066','李四','E10ADC3949BA59ABBE56E057F20F883E','123456','男','taochenghong@126.com','云南昆明商院路1号','15928282833','1983-07-14','22222222','我最喜欢的东西是什么？','我的宠物','0','0.0','2009-12-04 18:57:13'),(3,'xx','关羽','E10ADC3949BA59ABBE56E057F20F883E','123456','男','taochenghong@126.com','云南昆明商院路1号','15825256627','1987-10-20','22222222','我最喜欢的东西是什么？','我的宠物','0','93100.0','2009-12-05 04:53:09'),(4,'m16','浏阳','E10ADC3949BA59ABBE56E057F20F883E','123456','女','taochenghong@126.com','云南昆明商院路1号','15825256627','1987-10-20','650105','我最喜欢的东西是什么？','我就是你。','0','0.0','2009-12-05 05:07:56'),(5,'admin','管理员','21232F297A57A5A743894A0E4A801FC3','admin','男','514337551@qq.com','云南师大商学院','15825254472','1987-10-18','650106','我是管理员吗？','是的','2','1800.0','2009-12-05 09:48:24');
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

-- Dump completed on 2009-12-11 15:57:33
