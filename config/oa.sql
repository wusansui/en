/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.1.51-community : Database - oa
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`oa` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `oa`;

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('2',1,'LeaveBill.bpmn','1','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"LeaveBill\" name=\"LeaveBillprocess\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\"></startEvent>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <userTask id=\"usertask1\" name=\"æäº¤ç”³è¯·\" activiti:assignee=\"#{userId}\" activiti:formKey=\"workflowAction_audit.action\"></userTask>\n    <userTask id=\"usertask2\" name=\"å®¡æ‰¹ã€éƒ¨é—¨ç»ç†ã€‘\" activiti:formKey=\"workflowAction_audit.action\">\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"com.oa.listener.ManagerTask\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"usertask3\" name=\"å®¡æ‰¹ã€æ€»ç»ç†ã€‘\" activiti:formKey=\"workflowAction_audit.action\">\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"com.oa.listener.TopManagerTask\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"></sequenceFlow>\n    <sequenceFlow id=\"flow2\" name=\"æäº¤ç”³è¯·\" sourceRef=\"usertask1\" targetRef=\"usertask2\"></sequenceFlow>\n    <sequenceFlow id=\"flow3\" name=\"æ‰¹æ³¨\" sourceRef=\"usertask2\" targetRef=\"usertask3\"></sequenceFlow>\n    <sequenceFlow id=\"flow4\" name=\"æ‰¹æ³¨\" sourceRef=\"usertask3\" targetRef=\"endevent1\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_LeaveBill\">\n    <bpmndi:BPMNPlane bpmnElement=\"LeaveBill\" id=\"BPMNPlane_LeaveBill\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"320.0\" y=\"60.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"320.0\" y=\"410.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"BPMNShape_usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"285.0\" y=\"130.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"BPMNShape_usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"285.0\" y=\"220.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"BPMNShape_usertask3\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"285.0\" y=\"313.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"337.0\" y=\"95.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"337.0\" y=\"130.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"337.0\" y=\"185.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"337.0\" y=\"220.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"48.0\" x=\"347.0\" y=\"185.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"337.0\" y=\"275.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"337.0\" y=\"313.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"347.0\" y=\"275.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"337.0\" y=\"368.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"337.0\" y=\"410.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"347.0\" y=\"368.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('2202',1,'LeaveBill.bpmn','2201','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"LeaveBill\" name=\"LeaveBillprocess\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\"></startEvent>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <userTask id=\"usertask1\" name=\"æäº¤ç”³è¯·\" activiti:assignee=\"#{userId}\" activiti:formKey=\"workflowAction_audit.action\"></userTask>\n    <userTask id=\"usertask2\" name=\"å®¡æ‰¹ã€éƒ¨é—¨ç»ç†ã€‘\" activiti:formKey=\"workflowAction_audit.action\">\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"com.oa.listener.ManagerTask\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"usertask3\" name=\"å†å®¡æ‰¹ã€æ€»ç»ç†ã€‘\" activiti:formKey=\"workflowAction_audit.action\">\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"com.oa.listener.TopManagerTask\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"></sequenceFlow>\n    <sequenceFlow id=\"flow2\" name=\"æäº¤ç”³è¯·\" sourceRef=\"usertask1\" targetRef=\"usertask2\"></sequenceFlow>\n    <sequenceFlow id=\"flow3\" name=\"æ‰¹æ³¨\" sourceRef=\"usertask2\" targetRef=\"usertask3\"></sequenceFlow>\n    <sequenceFlow id=\"flow4\" name=\"æ‰¹æ³¨\" sourceRef=\"usertask3\" targetRef=\"endevent1\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_LeaveBill\">\n    <bpmndi:BPMNPlane bpmnElement=\"LeaveBill\" id=\"BPMNPlane_LeaveBill\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"320.0\" y=\"60.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"320.0\" y=\"410.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"BPMNShape_usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"285.0\" y=\"130.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"BPMNShape_usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"285.0\" y=\"220.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"BPMNShape_usertask3\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"285.0\" y=\"313.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"337.0\" y=\"95.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"337.0\" y=\"130.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"337.0\" y=\"185.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"337.0\" y=\"220.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"48.0\" x=\"347.0\" y=\"185.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"337.0\" y=\"275.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"337.0\" y=\"313.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"347.0\" y=\"275.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"337.0\" y=\"368.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"337.0\" y=\"410.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"347.0\" y=\"368.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('2203',1,'LeaveBill.png','2201','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0o\0\0Â\0\0\0÷°f²\0\0(mIDATxœíİl]å}?pk…á¡Mõ´n±ö®öşc#ÖZ)ùkqF<i+–†ˆ·?RK“JP5ZMSk6ÓJMkM-¢[Ë¬M|ç©\nX*°¬æ±@=I Ì·!Ô—å×cÇç{r\r—Ëıå{n÷øÜózé£èøø9Ï}ò<o{}Ü\0@»ºÒ\0\0\0&M\0Ğ>i\0€öI“\0\0´Oš\0 }Ò$\0\0í“&\0hŸ4	\0@û¤I\0\0Ú\'M\0Ğ>i\0€öI“\0\0´Oš\0 }Ò$\0\0í“&\0hŸ4	\0@û¤I\0\0Ú\'M\0Ğ>i\0€öI“\0\0´Oš\0 }Ò$\0\0í“&\0hŸ4	\0@û¤I\0\0Ú\'M\0Ğ>i\0€öI“\0\0´Oš\0 }Ò$\0\0í“&\0hŸ4	\0@û¤I\0\0Ú\'M\0Ğ>i\0€öI“\0\0´Oš\0 }Ò$\0\0í“&\0hŸ4	\0@û¤I\0\0Ú\'M\0Ğ>i\0€öI“\0\0´Oš\0 }Ò$\0\0í“&\0hŸ4	\0@û¤I\0\0Ú\'M\0Ğ>i\0€öI“\0\0´Oš\0 }Ò$\0\0í“&\0hŸ4	\0@û¤I\0\0Ú\'M\0Ğ>i\0€öI“ĞáŠÅâäää]wİ5<<<ø¡¡¡¡xÏÄÄD¡PH{€\0d›4	+‘qjìîîsdœwï~à±½/×C?rÇwŒŒôôôlÜ¸q||<íÁUÒ$t C‡\rÆ!2N›×¾\'ŸÚ¶íóSSSi€ì‘&¡ÓìÜ¹3†í}|ÅYYûŸ=°iÓ¦íÛ·‹Å´Ï\0€,‘&¡sÄApdddll,Q¬¬oİsÏàààÜÜ\\Ú§@fH“Ğ!â(¹qãÆ‰‰‰¶£dùï¸ŸÙÙÙ´O€l&¡CŒŒŒ\\~”,¿ëJoyĞ\ni:ÁÎ;/ç\rîÚÚ½ûááá´O€&!ó:4000J.×¾pË½÷Ş›öÉ°ÖI“yq”ÜÿìàiòØÇ¯¹¦Ïûİ\04\'MB¶MNN’ËuÛm_ÚµkWÚ§Àš&MB¶\r&}´d¢Û“½½½iŸ\"\0kš4	V(zzzV)J.×†\r¦§§Ó>Q\0Ö.i2l|||tttUÓäİ;vŒ¥}¢\0¬]Ò$dØöíÛï½÷ŞUM“í}|pp0í`í’&!Ã†††zø‘UM“¯=zÍ5}iŸ(\0k—4	¶JÏª¬S§Ïtww§}¢\0¬]Ò$dXooï±7¯jšŒ««ËD@C	È°şşş‘&H‘E2lU6és“\0´Bš„ıî}÷­jšÜ÷äS6lHûDX»¤IÈ°]»vİvÛ—V5MÆiuÛ¶Ï§}¢\0¬]Ò$dØììl__ßª¦É-[¶ìÙ³\'í`í’&!ÛVõqN>ÓÓÓS,Ó>K\0Ö.i²mUßìşú7¾wö)°¦I“mÅb±¯¯o5:yêô™k®é›››KûXÓ¤IÈ¼‰‰‰›·nuc€TH“Ğ	>wã»w?0J¾päÈúõëO>“ö™°ÖI“Ğ	\n…Â†\rBı:Î‰wNÆQòµ£GÓ>-\02@š„133Ê8^~”üÜ7>ôğ#iŸ\0Ù MBç8tèĞúõë÷=ùÔå¼ÁGRQ€ÖI“ĞQ\n…Â¦M›î¸ãÎïœL”#O>óõo|cùíò´O€,‘&¡Ó‹Å8M^{mœãŒØJ”üî}÷Åío»íKqM{ø\0dŒ4	innîË_şrOOÏçn¼1‹ûŸ=P• ã=÷ßÿÿnŞº5n³mÛçgggÓ2\0™$MB\'+‹“““£££ë×¯ïú¸xO%\'&&\n…BÚÃ Ã¤IÈ—8Y¦=\0:Š4	ùÒÕå=\0!YW _¤I\0Â²®@¾H“\0„e]|‘&Ëºù\"M–uòEš ,ë\nä‹4	@XÖÈi€°¬+/Ò$\0aYW _¤I\0Â²®@¾H“\0„e]|‘&Ëºù\"M–uòEš ,ë\nä‹4	@XÖÈi€°¬+/Ò$\0aYW _¤I\0Â²®@¾H“\0„e]|‘&Ëºù\"M–uòEš ,ë\nä‹4	@XÖÈi€°¬+/Ò$\0aYW óMLLÄ!²»»{`` Şèííÿ½úê«gffÒ\Z\0™\'MBç{ğÁ»jlŞ¼yrr2í¡yÒ$t¾b±xÕUWUFÉë®»®···P(¤=4\02Oš„\\¸ıöÛ¯¸âŠrš¼õÖ[ÇÆÆÒ\0@š„¼X·nİr”Üºuk___±XL{D\0tiòâ‰\'¸òÊ+ã4944ä“\0„\"MB\\ıõËi2í\0Ğ9¤IÈ‘¹¹¹8Mz0\0I“/^@XÖøY(‹###ƒƒƒ}}}µOÌ‰øÜãŸÀğğğøø¸çtiVİ={âGÉûï¿ÿ±½{_;zôÂÂB>+>÷ø\'°{÷îmÛ¶Å?“8S¦}q\0¸\\Ò$¬¢B¡0::ºeË–co»°pAUÖ‰wNÄ™2şáÌÍÍ¥}¡\0hŸ4	«%’ß½ï;æU£zèá‡6lØ0;;›öå MÒ$¬–ÑÑÑR”<¯š×c{İ´éwÒ¾\\\0´Iš„U±gÏ-[nXX,ªVê+_ıó;¾–öE Ò$„W,ûúúŞ8>»°xNµR§Ï¼·~ıu„	EÒ$„7>>>::º°x¶\\›‡~¿ÅgèT•«Ú±ã¯ÇÆÆÒ¾t\0$&MBxÃÃÃ»ø÷¢ä\r[~\ZE?¾½º½8=7í?½¸ëÇpüı§/Dÿ[Œ.FûÎFşaßá/l¿%õ`—J={`z`` íK@bÒ$„×ßßäÈÁ…Å3ËÕÕÕu:ŠÎ,Eï/Fï^ˆÎFÑŸıÅ]?÷‹o>¾›f‹Ñk‹Ñ÷~ø\\éöä™Öé3\'»»»Ó¾t\0$&MBx===ïœ<¾°xz¹â€xöb4ñÒ·—.ıûıGşó×ã7ÿòî¯/FÑ©Åèı…èİ…¨E>ó|)MÎguù«\0dî†ğJ‰ğT¹â/Ï,F\'ÏE.~Ğ P(üı7¿ıµ¿ûæ±7/=¸{a)ºPJ™O=û\\Õ±¹*i ‹Ìİ^)ş_¹.¥É‹Ñ‰³Ñ[§£…(º0?ßíµ]]Ÿèêê¾é¶U¸ÿÀÁªcsUÒ$@™»!¼R\"|¿\\ËïtŸ<½y*zû|´ÿÈÖ­[÷‰+~ş>ù©‘?şXš|æÙUÇæª¤I€,2wCx¥DX(Wüå¹¥èİâ¥{“\'ÎG{Ÿ™ù­õŸùÔ¯şÚ\'{~ùÛÿò½óQtz>:;éÀ}ÓÏT›«’&²ÈÜ\ráÅ©hqñ½r-‡¤8P¾¿½w!zóÔÂS‡g×ÿög7ÿîï½=½UŒŞ.F\'ç£8Oî{ú™ªcsUÒ$@™»!¼ªD8¸yÓó/½ºÿğÌô¡™\'Ì<yğ•§?ú_O¿øÃÃ¯?qà•ÿ9ğò“_~î•Ã¯şä¼ïæ­7§ê¤I\0Zgî†ğJiòİÊúâoiåáüáM7U˜«’&²ÈÜ\rá•ÒäI•´¤I€,2wCx—ÒäÅwTÒ’&²ÈÜ\rá•Òä	•´¤I€,2wCx¥4ù¶JZÒ$@™»!¼Rš|K%-i ‹Ìİ^)MÎ©¤%Md‘¹Â“&¥I€ü0wCx¥4ùÓÕ¨rÏUªlÒ²Å›ï\\½3ªz•´/\0‰™»!¼8]¼øæjT¹çÊ—hôr­£ù±²¾zg—ö¥ 1s7„WÊ[ÇW£Ê=×Ä»:;ë¥Àš­øº«ZÒ$@™»!¼Röz#lÕK~}+iW+n·òº«qi_:\03wCx¥Èul5ªÜsMÂ«ß¬j»ùw«:otÈê•4	Eæn¯”½~²\ZÕJÏµmªö4}§ûc‡¬Ø,øÙ¥}é\0HÌÜ\rá­jŞj”óªR`m.¬.WÜ®M¢«tjÒ$@F™»!¼RäúqØªHÛÙ¤}£•;WÜ®[ŸZå‹¦}é\0HÌÜ\rá]Š\\K³«Qå—7>JxM×îoøvƒZ±ÏPg—ö¥ 1s7„WŠ\\¯¯F•{^ŞhòBM\ZTî\\q»^â\\•S[~­´/\0‰™»!¼RäúÑjT¹çåº/ôaæ«ÿe£uRÕ`õNm¹ó´/\0‰™»!¼Rä:\Z¼>LxGËÿ~ü–áG\rš[»¿QûÚMúu‚i_:\03wCx¥ÈõšJZÒ$@™»!¼Rš|U%-i ‹Ìİ4)Mä‡¹Â‹SÑÒÒ+*iI“\0Ydî†ğJiòe•´¤I€,2wCx¥49£’–4	Eæn¯”&_RIKšÈ\"s7„×İİ}îÜÁ¥¥U¢’&²ÈÜ\ráõõõ½şú––¨D%Md‘¹Â\Z\Zú=÷.E/¨Öë¥™ï÷÷÷§}é\0HLš„ğvîÜ96ö\'©ç³lÕ?ß=::šö¥ 1iÂ›íïÿô¹âş¥è°j±†‡¯ŸœœLûÒ˜4	«â®K¶/EÏ«Vêß&şvdd(í‹@;¤IXÅbqpğ³ÓÓÿ\ZEÏ©æ57··¿ÿÓ…Â¾´/\Z\0í&aµÌÌÌ\\;33E‡T£Š£d»§¦¾“öå MÒ$¬¢ééé8PîÜù§QtPÕÖää7úûû¦¦ş)í@û¤IX]Åbqlltpğ3ãã57÷hP…ÂOLüÍÈÈ–ááÁx;íKÀe‘&ágajjjtôz{¥‹®®_\Z¹!”i_\0&!_<Ó€°¤IÈ—.½€ ¬+/­¤Ér›ªw¨Ûë­Q³Ú’.@™»!_’¦ÉLÔaİı>^¹b·\0¬ækÈ—Ë¿7¹â/Ù¬ØìrÆÀZcî†|iØš$¿¤Q¯Ñ±Şõvc £LÙ/—o²nW­·ªó¤c`­1wC¾$J“‰ÚÔFÃßéîò¹I€ì3_C¾´˜å¼ÊNêæÂº/ÔÊ}Ê¤ƒ`0eC¾4juï69¤6DÖ=ªÅw½İ˜È\"S6äK¢w±«îP&ê°õwºk;‘&2Ä”\rùÒ^šlŞÒ½I€<3eC¾„J“µwWM:qo »LÙ/+µª„W{Ë°ù»Ş+Ş§¬»¿õ`\nÀZcÊ†|Ô\0Ëºù\"M–uòEš ,ë\nä‹4	@XÖÈi€°¬+/Ò$\0aYW _¤I\0Â²®@¾H“\0„e]|‘&Ëºù\"M–uòEš ,ë\nä‹4	@XÖè|qˆìîîˆ7z{{ã¯¾úê™™™´‡@æI“Ğù|ğÁ®\Z›7oœœL{h\0d4	¯X,^uÕU•Qòºë®ëíí-\ni\r€Ì“&!n¿ıö+®¸¢œ&o½õÖ±±±´@\'&!/Ö­[·%·nİÚ××W,Ó\0@š„¼xâ‰\'®¼òÊ8M\r\rùÄ$\0¡H“#×_ıršL{ \0tirdnn.N“@@Ò$ä‹§—–u~ŠÅâÄÄÄÈÈÈàà`___íÓs\">÷ø\'0<<<>>îùD\0Aš„U·gÏ8EÅQòşûïlïŞ×½°°ÏŠÏ=ş	ìŞ½{Û¶mñÏ$Î”i_\0.—4	«¨P(ŒnÙ²åØÇ.,\\P•uâq¦Œ8sssi_(\0Ú\'MÂj‰£äÀÀÀwïûÎ……yÕ¨zø¡\r6ÌÎÎ¦}¹\0h“4	«ett´%Ï«æõØŞG7mú´/\0m’&aUìÙ³gË–‹ª•úÊWÿ|Ç¯¥}Ñ\0h‡4	á‹Å¾¾¾7Ï.,S­Ôé3ï­_ad‘4	á.,-×æ¡ßoñ:•Gåªvìøë±±±´/\0‰I“Şğğğîşı£(yÃ–ŸFÑ/F¯.D/ÎGÏÍGûO/îzàñÿéÑÿ£§‹Ñ¾³Ñ£ç£ØwøÛoI=Ø¥RÏ˜HûÒ˜4	áõ÷÷9rpañÌruuu¢3KÑû‹Ñ»¢³Qôgqg×ÏıâÆ†/DÇæ£cç£ÙbôÚbô½>Wº=y&‡uúÌÉîîî´/\0‰I“^OOÏ;\'/,^®8 ½Í_¼ô­Å¥Kÿ~ÿ‘ÿüõßøÍ¿¼ûë‹Qtj1z!zw!*DÑ£Ï<_J“§óY]şê#@™»!¼R\"<U®øË3‹ÑÉsÑ…‹4(\nÿÍoíï¾yìÍKî^XŠ.”RæSÏ>Wul®JšÈ\"s7„WJ„ÿW®KiòbtâlôÖéh!Š.ÌÏ÷_{mW×\'ºººoú£m•î?p°êØ\\•4	Eæn¯”ß/×ò;İ\'ÏEoŠŞ>í?ò£uëÖ}âŠŸÿ…O~jä?–&Ÿyö@Õ±¹*i ‹Ìİ^)Êyn)z·xéŞä‰óÑŞgf~kıg>õ«¿öÉ_şö¿|ï|ÎÎ_:pßô3UÇæª¤I€,2wCxq*Z\\|¯\\Ë!)”ï/Dï]ˆŞ<µğÔáÙõ¿ıÙÍ¿û{oÏGo£·‹ÑÉù(Î“û~¦êØ\\•4	Eæn¯*nŞôüK¯î?<3}hæÉ3O|å©çş×Ó/şğğëOxå¼üäÁ—§Ÿ{åğ«?¹çï»yëÍ©§:i€Ö™»!¼Rš|·²¾øÅ[ZùC8xÓMUæª¤I€,2wCx¥4yR%-i ‹ÌİŞ¥4yñ•´¤I€,2wCx¥4yB%-i ‹Ìİ^)M¾­’–4	Eæn¯”&ßRIKšÈ\"s7„WJ“s*iI“\0Ydî†ğ¤Ii ?Ìİ^)Mş´n5úVyíFÕüØÊ—¨Õb\'U6é\'Ñ°Ó¾t\0$fî†ğâTtñâ›ËµâËËÍ\ZmÔ­ºÔİß¨Y£nk·\r¸ò%š¾ÑPë¾zÚ—€ÄÌİ^)3_®ÊíÚ*·•ª+òYÃşWì\'Qãª­¹ÅÑJ“\0Ydî†ğJ™éºU÷[Ië£µiÔ¢›R÷¨ÊfµZpU›´/\0‰™»!¼Rf:V®ºaëÃhõQ›ÚÆ•û«ªêğªoUuXÕO£+×^íy­¸Ñâ˜Ë\rÒ¾t\0$fî†ğJ™é\'åªürÅíÊª~ªú¬ınãÌÚğuk{h2¤ÚáUu^÷æc®jö¥ 1s7„W›&›ä¼ª¤Õ<µÌšçÔËiÜ(ø6:5i ³™»!¼Rfúq¹*¿¬»ıaÌªŞYÙIUUR»¿\"ÒÕé°IÏåCªz¨ÚÓ¨ŸöÆ\\Ù íK@bænïRfZš-Wİ[wD«Š66êVmµG-o\'ê9Ñ·*;lrjÍ\\Õ&íK@bæn¯”™^/Wå—+n/o|¼ª›U¶¯ÈgÍ^«¶YİëŞü¨æ¯ŞÊhk›¥}é\0HÌÜ\rá•2ÓêV£o•÷¹>¶§nûG´†ûk_qxU}Ö=ª•6Í‡Z·eÚ—€ÄÌİ^)3­[u¿õaÌªnP‘Àê÷Ö¼ÿåíÚÃ›Œ¡nãZ+6H4æÊ®Ò¾t\0$fî†ğJYê5•´¤I€,2wCx¥4ùªJZÒ$@™»!<iRšÈs7„§¢¥¥WTÒ’&²ÈÜ\rá•ÒäË*iI“\0Ydî†ğJirF%-i ‹Ìİ^)M¾¤’–4	Eæn¯»»ûÜ¹ƒKK/ªD%Md‘¹Âëëë{ıõ,-Q‰JšÈ\"s7„744ô{î]Š^P­×K3ßïïïOûÒ˜4	áíÜ¹slìORÏgÙª¿{tt4íK@bÒ$„7;;ÛßÿésÅıKÑaÕb\r_?99™ö¥ 1iVÅ]—l_ŠW­Ô¿MüíÈÈPÚ\r€vH“°*ŠÅâààg§§ÿ5ŠSÍknnoÿ§…}i_4\0Ú!MÂj™™™¸vff2Š©FGÉ8vOM}\'íË@›¤IXEÓÓÓq Ü¹óO£è ª­ÉÉoô÷÷MMıSÚ\n€öI“°ºŠÅâØØèààgÆÇÿjnîÑ(: \n…ÿ˜ø›‘‘-ÃÃƒñvÚ—€Ë\"MÂÏÂÔÔÔèèôöşJ]]==¿42rC(Ó¾,\0 MB¾x¦#\0aI“/]şz!\0AYW _VL“åµíu@g³@¾\\~š¬íA È3k\0äËå¤ÉïV+–È—ß¶^µv“²ÖêŒ\Z€µËÔù’èŞdİpÙFŸ\0t0k\0äK{ïtWås“\0T²@¾´’&½Óİ¨i Ï¬/­|n²ªe£C|n€Hš„¼	ş¼ÉV\Z\0ĞÁ¬/IÓd+w+¥I€<³@¾$ıî¨^¾LÚ\'\0Ì\Z\0ùÒÆç&£ŠHÖîñÑI€œ3ïC¾H{\0„e]|‘&Ëºù\"M–uòEš ,ë\nä‹4	@XÖÈi€°¬+/Ò$\0aYW _¤I\0Â²®@¾H“\0„e]|‘&Ëºù\"M–uòEš ,ë\nä‹4	@XÖÈi€°¬+/Ò$\0aYW óMLLÄ!²»»{`` Şèííÿ½úê«gffÒ\Z\0™\'MBç{ğÁ»jlŞ¼yrr2í¡yÒ$t¾b±xÕUWUFÉë®»®···P(¤=4\02Oš„\\¸ıöÛ¯¸âŠrš¼õÖ[ÇÆÆÒ\0@š„¼X·nİr”Üºuk___±XL{D\0tiòâ‰\'¸òÊ+ã4944ä“\0„\"MB\\ıõËi2í\0Ğ9¤IÈ‘¹¹¹8Mz0\0I“/^@XÖøY(‹###ƒƒƒ}}}µOÌ‰øÜãŸÀğğğøø¸çtiVİ={âGÉûï¿ÿ±½{_;zôÂÂB>+>÷ø\'°{÷îmÛ¶Å?“8S¦}q\0¸\\Ò$¬¢B¡0::ºeË–co»°pAUÖ‰wNÄ™2şáÌÍÍ¥}¡\0hŸ4	«%’ß½ï;æU£zèá‡6lØ0;;›öå MÒ$¬–ÑÑÑR”<¯š×c{İ´éwÒ¾\\\0´Iš„U±gÏ-[nXX,ªVê+_ıó;¾–öE Ò$„W,ûúúŞ8>»°xNµR§Ï¼·~ıu„	EÒ$„7>>>::º°x¶\\›‡~¿ÅgèT•«Ú±ã¯ÇÆÆÒ¾t\0$&MBxÃÃÃ»ø÷¢ä\r[~\ZE?¾½º½8=7í?½¸ëÇpüı§/Dÿ[Œ.FûÎFşaßá/l¿%õ`—J={`z`` íK@bÒ$„×ßßäÈÁ…Å3ËÕÕÕu:ŠÎ,Eï/Fï^ˆÎFÑŸıÅ]?÷‹o>¾›f‹Ñk‹Ñ÷~ø\\éöä™Öé3\'»»»Ó¾t\0$&MBx===ïœ<¾°xz¹â€xöb4ñÒ·—.ıûıGşó×ã7ÿòî¯/FÑ©Åèı…èİ…¨E>ó|)MÎguù«\0dî†ğJ‰ğT¹â/Ï,F\'ÏE.~Ğ P(üı7¿ıµ¿ûæ±7/=¸{a)ºPJ™O=û\\Õ±¹*i ‹Ìİ^)ş_¹.¥É‹Ñ‰³Ñ[§£…(º0?ßíµ]]Ÿèêê¾é¶U¸ÿÀÁªcsUÒ$@™»!¼R\"|¿\\ËïtŸ<½y*zû|´ÿÈÖ­[÷‰+~ş>ù©‘?şXš|æÙUÇæª¤I€,2wCx¥DX(Wüå¹¥èİâ¥{“\'ÎG{Ÿ™ù­õŸùÔ¯şÚ\'{~ùÛÿò½óQtz>:;éÀ}ÓÏT›«’&²ÈÜ\ráÅ©hqñ½r-‡¤8P¾¿½w!zóÔÂS‡g×ÿög7ÿîï½=½UŒŞ.F\'ç£8Oî{ú™ªcsUÒ$@™»!¼ªD8¸yÓó/½ºÿğÌô¡™\'Ì<yğ•§?ú_O¿øÃÃ¯?qà•ÿ9ğò“_~î•Ã¯şä¼ïæ­7§ê¤I\0Zgî†ğJiòİÊúâoiåáüáM7U˜«’&²ÈÜ\rá•ÒäI•´¤I€,2wCx—ÒäÅwTÒ’&²ÈÜ\rá•Òä	•´¤I€,2wCx¥4ù¶JZÒ$@™»!¼Rš|K%-i ‹Ìİ^)MÎ©¤%Md‘¹Â“&¥I€ü0wCx¥4ùÓåZñ“å–•‡Ôî¬Ü_»‘´jleO“ŞZ9¯VúIûÒ˜¹Â‹SÑÅ‹oÖ­ºßZ1qV[»Ñèµj;©;’F£jÒOå—ÍÖ|U¯˜ö¥ 1s7„WÊLÇËÕ4&~Ğ ²}UÕ6k²Ñèu§I‡IÖ|$µı§}é\0HÌÜ\rá•2Óåªü²Ñv£ö•;?Lc5¨İhtÈŠı¯Øm“~\ZÓ–SÕ&íK@bæn¯”™•«òË&ÛïV·¯únÕËUõYw£öUıW}«Ñy5Ùhe<•\rÒ¾t\0$fî†ğJ™é\'åjš?jÓúvåFÕkÕ¾nİıÚ×ı²ÑÊı×Xëã©lö¥ 1s7„×(–5ßn%q6JoIÓdëé¶¶‡F¡¶QWÒ$@g3wCx¥ÌôãrU~Ùöö‡Q¬zgåUUå!‰êã¡ğc_6\ZgñH“\0Ydî†ğ.e¦¥Ùåjr#ğƒtµR³Ê®\ZmÔ­Úê¶©»İ¼eí0š;Ñ`Ò¾t\0$fî†ğJ™éõrU}Yw¢íåÃYÃ—øx¶«~İºÇVm7úVİÍÏ´îHj›¥}é\0HÌÜ\rá•2ÓÊUõååïÿ0–}lOİöqë§î ËÿÖvXÛ~Å6Í‡Q·eÚ—€ÄÌİ^)3-WÕ—Ë{>ŒVGk«îşÊö•\ršwÕ¼óšœW¿}­´>ª®Ò¾t\0$fî†ğJYê5•´¤I€,2wCx¥4ùªJZÒ$@™»!<iRšÈs7„§¢¥¥WTÒ’&²ÈÜ\rá•ÒäË*iI“\0Ydî†ğJirF%-i ‹Ìİ^)M¾¤’–4	Eæn¯»»ûÜ¹ƒKK/ªD%Md‘¹Âëëë{ıõ,-Q‰JšÈ\"s7„744ô{î]Š^P­×K3ßïïïOûÒ˜4	áíÜ¹slìORÏgÙª¿{tt4íK@bÒ$„7;;ÛßÿésÅıKÑaÕb\r_?99™ö¥ 1iVÅ]—l_ŠW­Ô¿MüíÈÈPÚ\r€vH“°*ŠÅâààg§§ÿ5ŠSÍknnoÿ§…}i_4\0Ú!MÂj™™™¸vff2Š©FGÉ8vOM}\'íË@›¤IXEÓÓÓq Ü¹óO£è ª­ÉÉoô÷÷MMıSÚ\n€öI“°ºŠÅâØØèààgÆÇÿjnîÑ(: \n…ÿ˜ø›‘‘-ÃÃƒñvÚ—€Ë\"MÂÏÂÔÔÔèèôöşJ]]==¿42rC(Ó¾,\0 MB¾x¦#\0aI“/]şz!\0AYW _VL“åµíu@g³@¾\\~š¬íA È3k\0äËå¤ÉïV+–È—ß¶^µv“²ÖêŒ\Z€µËÔù’èŞdİpÙFŸ\0t0k\0äK{ïtWås“\0T²@¾´’&½Óİ¨i Ï¬/­|n²ªe£C|n€Hš„¼	ş¼ÉV\Z\0ĞÁ¬/IÓd+w+¥I€<³@¾$ıî¨^¾LÚ\'\0Ì\Z\0ùÒÆç&£ŠHÖîñÑI€œ3ïC¾H{\0„e]|‘&Ëºù\"M–uòEš ,ë\nä‹4	@XÖÈi€°¬+/Ò$\0aYW _¤I\0Â²®@¾H“\0„e]|‘&Ëºù\"M–uòEš ,ë\nä‹4	@XÖÈi€°¬+/Ò$\0aYW _¤I\0Â²®@¾H“\0„e]|‘&Ëºù\"M–u:ßÄÄD\"»»»âŞŞŞøß«¯¾zff&í¡yÒ$t¾|°«ÆæÍ›\'\'\'Ó\Z\0™\'MBç+‹W]uUe”¼îºëz{{…BÚC ó¤IÈ…Ûo¿ıŠ+®(§É[o½ull,íAĞ	¤IÈ‹uëÖ-GÉ­[·öõõ‹Å´G@\'&!/xâ‰+¯¼2N“CCC>1	@(Ò$äÈõ×_¿œ&Ó\0Cš„™››‹Ó¤4	ùâéå\0„e]W,\'\'\'ïºë®áááÁ\r\r\rÅ{ÆÇÇçææÒ \0Ù&MBÇŠCdœ kŸ[^e``àŞ{ïõ+Ş\0´Gš„455µqãÆsd¥¾¾>¿è\r@¤Iè(Åbqtt´öîãW¾òÕİ»xlïãåºã;·lÙRÕrxxØÈ i:ÇÜÜ\\Õ-ÉÛnûÒkG^XXlT\'Ş9ù­{îéíí­¼IyèĞ¡´O€Ì&¡CÌÎÎÆA°\n‡††šçÈªLyÇw–íîîNû„\0Èi:A±X¬¼+y÷-æÈÊºÿşÿçÈòJ¿î\r@+¤Iè###å(¹{÷mDÉåÚÿìå~Ó>-\02@š„Ì›œœ¼Ì»’•õĞÃ”{ÛµkWÚ\'ÀZ\'MBæ\r”?+y™Qr¹ÊŸ¡ìííõJ\0š“&!Û&&&Ê¿:sìãAÒä©ÓgÊ¿åıå/9íS`M“&!ÛË\n%—ë»÷İ·ÜmOOOÚ§Àš&MB†\n…ògCİ˜,×5×|ğ¼¡©©©´O€µKš„/ÿşuØ(×¾pËrçccciŸ(\0k—4	¶}ûöP¿Ê][í}|¹ó7¦}¢\0¬]Ò$dØĞĞĞrà{èáG‚§É×-?É<í`í’&!ÃÊÏÚÿìài2®ò‡2Ó>Q\0Ö.‹dXù9>­ÿIîDUî?í`í²H@†õ÷÷/§½Y4Yş³İiŸ(\0k—E2¬ü°ÉÇö><Jxç¤GN°\"i2lttt9ğ}ë{‚§ÉYî|`` í`í’&!ÃvîÜ¹ø¶mû|ğ4y÷ËŒŒ¤}¢\0¬]Ò$dØÌÌLùÍèS§Ï„M“›6mZî|||<í`í’&!Ûúú>øû‡»w?0J–6+\niŸ%\0k—4	Ù666¶œùÖ¯_ğöäçn¼q¹Ûááá´O€5Mš„l+\nå§B†úûŠû|ª|còĞ¡CiŸ\"\0kš4	™·k×®åä×İİ}ù\nzíèÑr<İ¾}{Ú\'ÀZ\'MB\'Ø¸qãrş‹ƒàåü]œS§Ï¬_¿¾ÜÕÜÜ\\ÚgÀZ\'MB\'˜íéé)§Àöşl÷±7—£dww÷ÔÔTÚ§@H“Ğ!âğWş°cœ“>Ï|ß“O•ßàíÚµ+í ¤Iè“““å;”Ë¿åıĞÃ´rKòæ­[»*ˆ’\0´Nš„233Óßß_\rãLyÇw¾päHmˆüÖ=÷lÙ²¥²qF½Á\r@\"Ò$tšB¡p×]wuwwwÕ³aÃ†Fß\Zñk7\0$%MBgŠsáèèhİÔXkpppzz:í!IÒ$t²b±811ÇÊªÙ××7<<|ï½÷º	Àå&\0hŸ4	\0@û¤I\0\0Ú\'M\0Ğ>i\0€öı¹@õ¸gó·\0\0\0\0IEND®B`‚',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('3',1,'LeaveBill.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0¤\0\0Â\0\0\0¶aL$\0\0&dIDATxœíİolS×ıÇñh…á¡MÍ´nD{RW{€lÄZ+Á£aF2i[-­*Ş0K“ZPµ®š¦.lj™Ö²hÚ:4uİZmâ7OUÀRÿ,+ĞehÆŸ ´.â6Ğºü«	\\;9¿»\\ŒÿÅÆçæàsŞ/}…nœsïÍÕ—;-\0\0­E÷\0\0\0oö\0\0°\0Àp„=\0\0†#ì\00a\0€á{\0\0GØ\0`8Â\0\0Ãö\0\0°\0Àp„=\0\0†#ì\00a\0€á{\0\0GØ\0`8Â\0\0Ãö\0\0°\0Àp„=\0\0†#ì\00a\0€á{\0\0GØ\0`8Â\0\0Ãö\0\0°\0Àp„=\0\0†#ì\00a\0€á{\0\0GØ\0`8Â\0\0Ãö\0\0°\0Àp„=\0\0†#ì\00a\0€á{\0\0GØ\0`8Â\0\0Ãö\0\0°\0Àp„=\0\0†#ì\00a\0€á{\0\0GØ\0`8Â\0\0Ãö\0\0°\0Àp„=\0\0†#ì\00a\0€á{\0\0GØ\0`8Â\0\0Ãö\0\0°\0Àp„=`8ÇqâñøºuëÂápèšÎÎNyK,K§Óº€ç{ÀX2ãe¨û|>ó2Ú{{·lßñZ¾^zù•Ç{<‰´¶¶.Y²¤§§G÷ÁğahhhH.ßeÆËPŸÈd«×®İ{V­ú~0ìïï×}à\0<AØ¦éîî–É-—ï3Æ|aí?0¸téÒÕ«W;£û\0(FØæ9‰DºººêŠùÂúÃ3Ï„B¡T*¥ûT\0¨DØ†I¿dÉ’X,vÓIï>«/çI&“ºO€2„=`¹¦o<éİ§ôeŞó|>`Â0Awww#ÏŞ—Voï–p8¬û´\0¨AØMohh(*Lú|=ğÀƒ7nÔ}r\0 ì¦\'“~ÿAåa?rêôwúy20\0a4·x<‡•\'}¾~øG6lĞ}Š\0\ZEØÍ-\nÕû–úº÷mmmºO@£{ ‰¥ÓéÖÖV’>_‹/Ğ}¢\0\ZBØM¬§§\'\Zz\ZöO®_ßÕÕ¥ûD4„°šØêÕ«7nÜèiØoßñZ(Ò}¢\0\ZBØM¬³³³–?uÓH¾óN¿îĞÂhb½é®°.ù|>İ\'\n !„=ĞÄÚÚÚFNö4ìeµ´ğĞÜèa ‰7%ìTGMÌÓ7Ùóš=`ÂhbÑhôùM›<\rû]»÷,^¼X÷‰ha4±\r6<üğ<\r{ù`bÕªïë>Q\0\r!ì&–L&ı~¿§aßÑÑÑ××§ûD4„°š›§¿£wit¬µµ•?|4;Âhn>“ÿÛ§’“ë>E\0\"ìæ&—İ~¿ß‹wÛËeıwúS©”îSĞ(Âhz±Xìş•+YÖ¨„°Lğí{ïííİ¢0éß8z´½½].îuŸ\0{ÀétzñâÅª~Sïì¹ó2éOë>-\0jö€!‰„Ì{™Ğ\'ı·ï½÷¥—_Ñ}B\0”!ìs\r\rÉù®İ{\Zyö^>b éÃö€QÒéôÒ¥K{ìq¹@¯+æ/ıö©§ò¯è>	\0Šö€iÇ‘a¿pa@†·ŒğZ’şùM›äø‡ş‘|ˆ ûğ¨GØfJ¥R<òHkkë·ï½WfùşƒE/oÙ¼ùÿî_¹RYµêûÉdR÷!ğ\na˜L®òãñx4\Zmooo¹‘¼E&},K§Óº€·{À.2øu€ÙFØv‘kzİ‡\0`¶Ñö€]{ÀB´=`Â°mØ…°,DÛv!ìÑö€]{ÀB´=`Â°mØ…°,DÛv!ìÑö€]{ÀB´=`Â°mØ…°,DÛv!ìÑö€]{ÀB´=`Â°mØ…°,DÛv!ìÑö€]{ÀB´=`Â°mØ…°,DÛv!ìÑö€]{ÀB´=`Â°mØ…°,DÛv!ìÑö€ùb±˜ÌxŸÏåF[[›üwşüù‰DB÷¡˜\r„=`¾­[·¶”X¶lY<×}h\0fa˜Ïqœyóæ&ı¢E‹äú>Në>4\0³°¬°víÚ9sæ¸a¿fÍš®®.İ`–ö€-,XOú•+Wúı~¹Ü×}D\0f	aØbçÎsçÎ•aßÙÙÉ«õ€U{À\"Ë—/Ï‡½î0«{À\"©TJ†=ï¸lCØváCu\0ÑöÀlp\'‹E\"‘P(ä÷ûKßõn	yîò\'‡{zzxã0k{Às}}}2ädÒoŞ¼yû\'†‡\'2;K»ü	ôöö®ZµJşLdäë¾8€{ÀCrñ\ZF;::FNLd&¨Â:{î¬Œ|ùÃI¥Rº/`8ÂğŠLú`0øü¦ç&2ãT¥zéå—/^œL&u_.Àd„=à¹¦Ï%ıUªzmß±méÒ¯é¾\\€É{À}}}+2Y‡ª¥ıéOÖ¯B÷EŒEØê9ã÷ûONf²W¨Zjtì£ööE|\0\0àÂP¯§§\'\Zf²—İZÖùÍ\ZßœV¸—Uµ~ı/ùÛ<€G{@½p8Ü»åï×“~EÇB¼;)gÄ›ãâĞ¸Ø?šİ°åµWO_Ü;!şëˆ½ØuYl»*~¿ëÈ«Ô»ZêÀà@0Ô}é\03ö€z@àèÑƒ™ìX¾äz}Tˆ±)q1+.LˆËBüøg·|âÓKV„OgÄÈ¸¹*’8‘/¼~(·¸³°FÇÎû|>İ—0a¨×ÚÚzîüéLv4_2¿/OŠñÉéoe§¦ÿ}ñ•~ñK_şù“¿Í\nq)+.fÄ…ŒH±mßá\\ØÚY-|”/à\rZP/Ø—Ü’_eÅù+bbòãétúwO?ûÄoyúód2Sb\"÷ `ÏCEûZU„=àZP/Øÿsk:ì\'ÅÙËâÃQ‘bb|<°paKËm--¾û¾»ªpÇıƒ‹öµª{À#´ ^.°/º•\Z_®ìß¿$Î\\û¾³`Á‚Ûæ|òS·ßùŞ\ra¿ïÀ`Ñ¾Vax„ÖÔËvÚ-ùå•)qÁ™^ÙŸ½*vìK|¥ıî;>ÿ…Û[?ûì_^¸*Äè¸¸<>½ã®}EûZU„=àZPO†V6û‘[ù“y1#>šëûÌ#Éö¯Ş³ìëß83.>tÄGœ2îwíİW´¯UEØ¡µ\0õŠ;´léá·ï?’JìLì>xlÏááí}óõ#\'wûÏàÛ»¾=pèØ‘ãï=óÇM÷¯¼_{èö€ah-@½\\Ø_(¬‡z°–ÏûÎ}÷íhUö€Gh-@½\\ØŸ§ê-Âğ­¨7ö“ç¨z‹°<BkêåÂş,Uoö€Gh-@½\\ØŸ¡ê-Âğ­¨—û©z‹°<BkêåÂ>EÕ[„=àZP°\'ì[\n­¨—û¼(wæ¢7èWYã„ÕoôîŒŠîE÷¥ÌDkêÉĞšœ|ß‹rg.¼‹JwWËaTß·Ò‡ÿxwvº/`&ZP/‡§½(wæ’ô-sc¹aØŒ÷ëiö€Gh-@½\\4R[å‚ùú·êjÆíZî×‹sÔ}é\03ÑZ€z¹Dñ¢Ü™K¸ü°¢íêß-š¼Ò.Şax„ÖÔËEã{^T-3—)º¥êÓø7ì2ã0åg§ûÒf¢µ\0õ<ÃJ1\\Ò¥±]6ûgÜ.} àÑ©ö€wh-@½\\\"¾«¶\nBı†«Œ¯4 ğÆ·Ë=ªP|j…wªûÒf¢µ\0õ¦q*éE¹3ç7®pÕÁ¥·W|~¾ÂÍ8§ª³Ó}é\03ÑZ€z¹D<éE¹3ç7ªÜQ•…7Î¸]î\'§–¿/İ—0­¨—KÄw¼(wæüFÙ;ºÉå¿¬4a¥IŠxwjùÉu_:ÀL´ ^.‡•×µ\0vÿ½qÁ}}@•}Ko¯4¾t@•ùU îK˜‰ÖÔË%â	ªŞ\"ìĞZ€z¹°?NÕ[„=àZP°\'ì[\n­¨\'CkjêUoö€Gh-@½\\Ø¿MÕ[„=àZP/ö	ªŞ\"ìĞZ€z¹°‹ª·{À#´ Ïç»råàÔÔ›T]EØ¡µ\0õü~ÿÉ“¯NM¥ê*Âğ­¨×ÙÙù¾Sâ\rªöz+ñb Ğ}é\03ö€zİİİ]]?ĞŸÍUîy2\Zê¾t€™{@½d2ÜuÅÙ?%P5V8¼<ë¾t€™{Àë¦­‡©Zêo±_G\"º/\Z`,Âğ„ã8¡Ğ=âU½R©À]éô.İ\r0ax%‘Hƒ‰¸CT¥’I/õ÷?§ûr&#ì\rÈ¼ïîş¡©ÒŠÇŸ\nüııÒ}¡\0Ãö€·ÇéêŠ†Bw÷ôü\"•Ú&Ä •Nÿ;ûU$Ò‡ä¶îK˜°fC4ú­¶¶Ïµ ¥¥µõ3‘È\n™÷º/`Â°ïe,DØviá#iûĞö€]j	{wLÑÓï77[¥a¥7ò@ğ­Ø¥Ş°ŸqÇº&,{{¥—ögœ@h\'À.¯ìgüı»‡5rl\0n­Ø¥z V	æz“¸Ò¾•ÒgYx‡ìÒøÊ¾ìTµ·hòz\rÀM µ\0»Ôöu)MîŸÆoá5{`VĞN€]jòJ1\\8IÙØ.{Gµ¬òë=H\0µ££\0»TÏÑ²«ê*»”f|Ù½j|JŸe=à:\n°K]OÑ­ïëš°ö§ñK\'!ìµè(À.7öÕG²²nqt`Ua_ºFŸñ1A•IXÙ¢£\0»Ì˜£E\\ºà®ş”şŒ«ü²·×ş¸ÀM £\0»£€…h{À.„=`!Ú°aXˆ¶ìBØ¢í»ö€…h{À.„=`!Ú°aXˆ¶ìBØ¢í»ö€…h{À.„=`!Ú°aXˆ¶ìBØ¢íóÅb1™ñ>Ÿ/Ê¶¶6ùïüùó‰„îC0{À|[·n-ıƒñË–-‹Çãº\rÀl ìó93oŞ¼Â¤_´h‘\\ß§Óiİ‡`6ö€Ö®];gÎ7ì×¬YÓÕÕ¥û \0ÌÂ°Å‚òI¿råJ¿ß/—ûºÀ,!ì[ìÜ¹sîÜ¹2ì;;;yµ°\naXdùòåù°×} \0faX$•JÉ°çw€m{À.|¨`!Ú˜\rãÄb±H$\n…ü~é»Ş-!Ï]şÂápOOoüf\rax®¯¯O†œLúÍ›7oß±ãÄğğD&cgÉs—?ŞŞŞU«VÉŸ‰Œ|İ°axH.^£ÑhGGÇÈ©‘‰ÌUXgÏ•‘/8©TJ÷…GØ^‘IŸßôÜDfœªT/½üÒâÅ‹“É¤îË˜Œ°¼\"×ô¹¤¿JU¯í;¶-]ú5İ—0ax¢¯¯¯£cE&ëPµÔ£?ıÉúõOè¾h€±{@=Çqü~ÿ©ÓÉLö\nUK}ÔŞ¾ˆ\0\0<BØêõôôD£ÑLö²[Ë:¿Yã›Ó\n÷²ªÖ¯ÿ%›ğa¨‡{·üızÒ¯èø@ˆw\'ÅñŒxs\\\ZûG³¶¼öêé‹{\'Ä±×».‹mWÅïwy`õƒÚsWKƒº/`&ÂP/=z0“Ë—\\¯\n16%.fÅ…	qYˆÿìñ–O|zÉŠğéŒ#WEÒ\'²â…×å÷cÖèØyŸÏ§ûÒf\"ìõZ[[Ï?ÉæKæ÷åI1>9ı­ìÔô¿/¾òÏ/~éË?ò·Y!.eÅÅŒ¸i!¶í;œûQ;«…ò¼Akêåû’[òË±¬8ELL~< NÿîégŸøÍÓ#ïOLfJLäì9p¨h_«Š°<BkêåûnM‡ı¤8{Y|8*2BLŒ.li¹­¥ÅwßwWî¸ğ`Ñ¾Vax„ÖÔËöE·òOãË•ıû—Ä™«bÿÑw,XpÛœO~êö;\"ß»!ì÷,Ú×ª\"ìĞZ€z¹ÀN»%¿¼2%.8Ó+û³WÅ}‰¯´ß}Çç¿p{ëgŸıËW…—Ç§wÜ5°¯h_«Š°<BkêÉĞÊf?r+Ÿa2ï/fÄGr}ŸÙs$ÙşÕ{–}ıgÆÅ‡8ãˆóãBÆı®½ûŠöµª{À#´ ^Q`‡–-=üÖñıGC‰İƒ‰İí9<ü¯½o¾~ääÎÁcÿ|{÷Á·;rü½gş¸éş•÷k]Â0­¨—û…õĞCÖòñyß¹ï¾¢­*Âğ­¨—ûóT½EØ¡µ\0õ¦Ã~òUoö€Gh-@½\\ØŸ¥ê-Âğ­¨—û3T½EØ¡µ\0õraÿ!Uoö€Gh-@½\\Ø§¨z‹°<Bkêö„=pK¡µ\0õraÿAÙªô-÷öÒ›¨êûŞE©\Z\')š°Ê<u¶îK˜‰ÖÔ“¡59ù~¾fü wX¥²Uv’²·W\ZViÚÒíJ\\xU¾Ò¡–½wİ—0­¨—‹´Óù*Ü.-÷»µlíXŸçŸqºİXû1×x´„=àZP/i§ÊVÙoáõ¥•v©4]Vß¥ì^…ÃJÕxÀEct_:ÀL´ ^.ÒFÜ*›…×’ïú˜ÒÁ…·UÑîEß*š°hJ;.{x¥ç5ãFÇìĞ}é\03ÑZ€z¹H{Ï­Â/gÜ.Ü(š§hÎÒïV~HQñ~Kg¨rH¥‡W4yÙ]ªsÑ\0İ—0­¨W\ZöUb¸(«çeíÁYıaD#ƒ+=.©tj„= ­¨—‹´wİ*ü²ìöµ,¾±p’¢*Ü¥ôö‚Ä-3a•™İ]Šf(º¥Ò<7wÌ…t_:ÀL´ Şt¤M%İ*»ğı8ù\nÆTÚ([¥3”î•ß®kæº¾U8a•S«~ÀEct_:ÀL´ ^.ÒNºUøåŒÛùk¹X<¬p|A|V»¯Òae\',»{õ½ªß{-G[:L÷¥ÌDkêå\"í²Ué[îí×ñ†[Ê¿1A+Ş^ºûŒ‡W4gÙ½jSıPËÔ}é\03ÑZ€z¹H.[e¿u-‹dùÙªÏŸß.İ½Ê1”\\jÆusáTº/`&ZP/u\'¨z‹°<BkêåÂş8Uoö€Gh-@=Â°n)´ ­©©cT½EØ¡µ\0õraÿ6Uoö€Gh-@½\\Ø\'¨z‹°<BkêåÂş-ªŞ\"ìĞZ€z>ŸïÊ•ƒSSoRuax„ÖÔóûı\'O¾:5u”ª«{À#´ ^ggç?ú6N‰7¨Úë­Ä‹@@÷¥ÌDØêuwwwuı@{|6Wı¹çÉh4ªûÒf\"ìõ’Éd p×gÿ”8BÕXáğòx<®ûÒf\"ìO¬›¶zJ¦j©¿Å~‰tê¾h€±{Àã„B÷üUˆCTõJ¥vw¥Ó»t_4ÀX„=à•D\".L$âBQ•J&½|TÔßÿœîË˜Œ°<400 ó¾»û‡B¤J+*ğ÷÷ÿI÷…GØŞr§«+\Z\nİİÓó‹Tj›ƒT:ıïXìW‘HG8’Ûº/`>Â˜\rıııÑè·ÚÚ>×‚––ÖÖÏD\"+dŞë¾,€-{À.¼—°aØ¥…¤ìCÛv™1ìİ¥77!\0íèRÀ.‡}éä=p‹£E»4ö5®õÜjèXÀ.3>\'Ÿ\'j[â—òæ¨4„ÎìR×Ê¾lößÄœ\0ô¢E»ÜÜÓø…{ñš=ĞthQÀ.µ„}¥§ñ+MBØ·8Z°K-¯Ù¬´¯ÙÍ‚Îì¢ü}öµ\0 -\nØ¥Ş°¯e­OØ·8Z°K½¿/ÊÅ½sĞ‹ìr¯Ù‹‚—çKoáe{àÖG[v!ŒÑö€]{ÀB´=`Â°mØ…°,DÛv!ìÑö€]{ÀB´=`Â°mØ…°,DÛv!ìÑö€]{ÀB´=`Â°mØ…°,DÛv!ìÑö€]{ÀB´=`Â°m˜/‹ÉŒ÷ù|Á`Pn´µµÉçÏŸŸH$t\Z€Ù@ØæÛºukK‰eË–Åãqİ‡`6ö€ùÇ™7o^aÒ/Z´H®ïÓé´îC0{À\nk×®3gökÖ¬éêêÒ}P\0f	aØbÁ‚ù¤_¹r¥ßï—Ë}İG`–ö€-vîÜ9wî\\ö¼ZX…°,²|ùò|Øë>\0³Š°,’J¥dØó;À6„=`>T°mÌÇqb±X$	…B~¿¿ô]ï–ç.áp¸§§‡7ş³†°<×××\'CN&ıæÍ›·ïØqbxx\"“±³ä¹ËŸ@ooïªU«äÏDF¾î‹X°<$¯Ñh´££cäÔÈDf‚*¬³çÎÊÈ—?œT*¥ûB†#ì¯È¤ƒÏozn\"3NUª—^~iñâÅÉdR÷åLFØ^‘kú\\Ò_¥ª×öÛ–.ıšîË˜Œ°<Ñ×××Ñ±\"“u¨ZêÑŸşdıú\'t_4ÀX„= ã8~¿ÿÔéd&{…ª¥FÇ>jo_Ä\0\0!ìõzzz¢Ñh&{Ù­eß¬ñÍi…{YUë×ÿ’¿Íx„°Ô‡Ã½[ş~=éWt| Ä»“âxF¼9.‹ı£Ù\r[^{õôÅ½â¿Øëˆ]—Å¶«â÷»<°úAí¹«¥ƒAİ—0a¨=˜ÉåK®×G…›³âÂ„¸,ÄöxË\'>½dEøtFŒŒ‹‘«\"éˆYñÂë‡r‹û1ktì¼ÏçÓ}é\03ö€z­­­çÎŸÎdGó%óûò¤ŸœşVvjúß_ùç¿ôåŸ?ùÛ¬—²âbF\\Èˆ´ÛöÎ…ı¨ÕÂGùŞ µ\0õr}É-ùåXVœ¿\"&&?N§÷ô³Oüæé‘÷§?O&3%&rö8T´¯UEØ¡µ\0õrı?·¦Ã~Rœ½,>!&ÆÇ¶´ÜÖÒâ»ï»«\nwÜ?x°h_«Š°<Bkêåû¢[ù§ñåÊşıKâÌU±ÿè;,¸mÎ\'?uû‘ïİöûíkUö€Gh-@½\\`§İ’_^™œé•ıÙ«bÇ¾ÄWÚï¾ãó_¸½õ³Ïşå…«BŒ‹ËãÓ;î\ZØW´¯UEØ¡µ\0õdhe³¹•Ï0™÷3â£	¹¾Ïì9’lÿê=Ë¾ş3ãâCGœqÄùq!ã~×Ş}EûZU„=àZP¯(°CË–~ëøş#‰¡ÄîÁÄîƒÇöş×Ş7_?rrçà±ÿ¾½ûàÛ‡9şŞ3ÜtÿÊûµ‡.a†ÖÔË…ı…Âzè¡kùø¼ïÜw_ÑVax„ÖÔË…ıyªŞ\"ìĞZ€zÓa?yª·{À#´ ^.ìÏRõax„ÖÔË…ıªŞ\"ìĞZ€z¹°ÿª·{À#´ ^.ìST½EØ¡µ\0õ{Â¸¥ĞZ€z¹°ÿ Æª4Ø½½t£Ş*İ±–[ªÌVêæ¬tfİ—0­¨\'CkròıJ5ãGë¸Ã*mÔ2méwËn—ŞXé`Ü/«XõÃ¨^„=àZP/r§+Uß­e£hÇ‚ˆ-{IW;¤Òyj<JG2cö€Gh-@½\\Èª±Ê.ËëJ7*í2ãü3N[e\nj:˜º/`&ZP/r#Uªêjûú˜ÒÁ…·—³ìí•ÆÍ_ô­¢ÇWÚ¨åxªÿXt_:ÀL´ ^.äŞ«R…fÜ.Ü¨2s¥ïVÚ¥èöÒ»+½ëü—e¬öã©şcÑ}é\03ÑZ€zµ„}å•}qXVÏÔZÂ¾–ûªt•sTšŠ°nA´ ^.äŞ­R…Ên_KÊâ«Ï9ãıVÙÑİ½$ÅË§GÇCØ¡µ\0õ¦Cn*Y¥ª­¶ÆTÚ¨>gõ1e·«,=Œ*‡]ûÁ”½Sİ—0­¨—¹“UªpÀŒÛùkÙY<¬p|AÄßWÙ}‹¶+}«ì€J‡QåHf,Âğ­¨—¹wj¬JƒİÛ¯¥æ\r·”cÊŞ0OÑ.…7/{µŒ©~5ş(t_:ÀL´ ^.ä†k¬²ƒ¯%eñ€‚­{ò’.?¾ÔŒê:ßêG«ûÒf¢µ\0õráw‚ª·{À#´ ^.ìSõax„ÖÔ#ì	{à–BkêÉĞšš:FÕ[„=àZP/öoSõax„ÖÔË…}‚ª·{À#´ ^.ìß¢ê-Âğ­¨çóù®\\985õ&UWö€Gh-@=¿ßòä«SSG©ºŠ°<Bkêuvvş£oã”xƒª½ŞJ¼t_:ÀL„= ^wwwW×´ÇgsÕŸ{ŒF£º/`&ÂP/™Lw]qöO‰#T/Çãº/`&ÂğÄºi«§Äaª–ú[ì×‘H§î‹‹°<á8N(tÏÀÀ_…8DU¯TjG pW:½K÷EŒEØ^I$ÁàÂD\".ÄU©dÒËGEııÏé¾\\€É{ÀC2ï»»(ÄAª´âñ§ÿŸt_(Àp„=à-Çqºº¢¡Ğİ==¿H¥¶	1H¥ÓÿÅ~‰t„Ã!¹­ûæ#ìÙĞßß~«­ís-hiimıL$²Bæ½îËØ‚°ìÂ{Ùö€]ZøHZÀ>´=`—ÃŞPºqsĞ.ìÒxØ—Î@Ş·8Z°K#a_ãZÀ­†ì2ãsòy¢¶%~)o\Z@CèLÀ.u­ìËfÿMÌ	@/Z°ËÍ=_¸¯ÙM‡ìRKØWz\Z¿Ò$„=p‹£E»Ôòš}ÑÈJ»ğš=Ğ,èLÀ.Êßg_Ë\0\0zÑ¢€]ê\rûZÖú„=p‹£E»ÔûÛø¢\\ü×;\'\0½hQÀ.7ñš½(xy¾ô^¶n}´%`Â°mØ…°,DÛv!ìÑö€]{ÀB´=`Â°mØ…°,DÛv!ìÑö€]{ÀB´=`Â°mØ…°,DÛv!ìÑö€]{ÀB´=`Â°mØ…°,DÛv!ìÑö€]{ÀB´=`Â°mØ…°,DÛv!ìÑö€ùb±˜ÌxŸÏåF[[›üwşüù‰DB÷¡˜\r„=`¾­[·¶”X¶lY<×}h\0fa˜Ïqœyóæ&ı¢E‹äú>Në>4\0³°¬°víÚ9sæ¸a¿fÍš®®.İ`–ö€-,XOú•+Wúı~¹Ü×}D\0f	aØbçÎsçÎ•aßÙÙÉ«õ€U{À\"Ë—/Ï‡½î0«{À\"©TJ†=ï¸lCØváCu\0Ñö€áÇ‰ÇãëÖ­‡Ã¡k:;;å-===r­¯û\0x°Œ%3^|éÇé	ƒ7nä—óƒö€úûû—,Y2cÌòûıüŠ>`*Â0Š\\ G£ÑÒµû£ş´·wËö¯¹õØcwtt‡Ã|¬`Â0G*•*ZĞ?üğNOd²•êì¹óxæ™üŸÆq—øCCCºO€J„=`ˆd2)sÚÍìÎÎÎê1_ùr¡ïîëóùtŸ\0e{Àã®éŸ\\¿¾Æ˜/¬Í›ÿOÆ¼»¾çõcö€	\"‘ˆ›ô½½[n\"éóµÿÀ`kkk~P(¤û´\0¨AØM/7¸¦/¬—^~ÅmÃ†\rºO€„=Ğô‚Á û:}ƒIŸ/÷õû¶¶6Ş€°š[,s«näÔi%aitÌııüGyD÷)ha4·P(ä¾ËNIÒçëùM›òÓ¶¶¶ê>E\0\"ì&–N§İ××U-ëİºóÎßÈ×ßß¯ûD4„°šXOOû›ój“^Ö<˜Ÿ¼««K÷‰ha4±Õ«W«ú%üÒÚ¾ãµüäK–,Ñ}¢\0\ZBØM¬³³3ŸÇ/½üŠò°?1<ì~ÀîĞÂhbî›îöTö²Ü_Ğ}¢\0\ZBMÌ}ƒ\\íƒ_W¹óë>Q\0\r¡‡&òaüÆÑ£^„½ûQùºO@Cèa ‰¹o²ß¾ã5åIöÜyŞj˜°šX4\ZÍçñyFyØ¿qôh~ò`0¨ûD4„°šXwww>W­ú¾ò°rıúüä‘HD÷‰ha4±D\"á>Ó~itLmØ/]º4?yOOîĞÂhn~ÿÇjÛÈŸ±/-÷MöR:Ö}–\0\ZBØÍ­««+Éííí\n÷ß¾÷Şü´ápX÷)ha47¹ìvß\r¯êCswíŞã.ë‡††tŸ\"€Fö@ÓÛ°aC>˜}>_ãïÁ;1<ì>zX½zµî“ \0a˜`É’%ùx–9İÈ§é]\Zkoow§J¥RºÏ€„=`‚d2ÙÚÚê†ôÍ}TşÈ©ÓnÒû|>şŒ=`Â0„Ìf÷…vÕõ~ÌÎ®İ{Ügï¥\r6è>!\0Êö€9âñ¸»¾Ïÿ~~-úV.èï_¹²¥\0I†°Œ’H$Ü¿ãFşc=^ú—rdÆËÕGGGá`ùXgïóö€iÒéôºuëÜ?XWdñâÅ•¾‰Dø<ÀH„=`&ÛîŸÉ™Q(\ZĞ}È\0¼BØ&s\'‹ÉÔƒEï÷ûÃáğÆYÍÆ#ì\00a\0€á{\0\0GØ\0`8Â\0\0Ãı?dÁ.^¹\"Y\0\0\0\0IEND®B`‚',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('502',1,'LeaveBill.bpmn','501','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"LeaveBill\" name=\"LeaveBillprocess\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\"></startEvent>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <userTask id=\"usertask1\" name=\"æäº¤ç”³è¯·\" activiti:assignee=\"#{userId}\" activiti:formKey=\"workflowAction_audit.action\"></userTask>\n    <userTask id=\"usertask2\" name=\"å®¡æ‰¹ã€éƒ¨é—¨ç»ç†ã€‘\" activiti:formKey=\"workflowAction_audit.action\">\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"com.oa.listener.ManagerTask\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"usertask3\" name=\"å†å®¡æ‰¹ã€æ€»ç»ç†ã€‘\" activiti:formKey=\"workflowAction_audit.action\">\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"com.oa.listener.TopManagerTask\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"></sequenceFlow>\n    <sequenceFlow id=\"flow2\" name=\"æäº¤ç”³è¯·\" sourceRef=\"usertask1\" targetRef=\"usertask2\"></sequenceFlow>\n    <sequenceFlow id=\"flow3\" name=\"æ‰¹æ³¨\" sourceRef=\"usertask2\" targetRef=\"usertask3\"></sequenceFlow>\n    <sequenceFlow id=\"flow4\" name=\"æ‰¹æ³¨\" sourceRef=\"usertask3\" targetRef=\"endevent1\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_LeaveBill\">\n    <bpmndi:BPMNPlane bpmnElement=\"LeaveBill\" id=\"BPMNPlane_LeaveBill\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"320.0\" y=\"60.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"320.0\" y=\"410.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"BPMNShape_usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"285.0\" y=\"130.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"BPMNShape_usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"285.0\" y=\"220.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"BPMNShape_usertask3\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"285.0\" y=\"313.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"337.0\" y=\"95.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"337.0\" y=\"130.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"337.0\" y=\"185.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"337.0\" y=\"220.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"48.0\" x=\"347.0\" y=\"185.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"337.0\" y=\"275.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"337.0\" y=\"313.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"347.0\" y=\"275.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"337.0\" y=\"368.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"337.0\" y=\"410.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"347.0\" y=\"368.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('503',1,'LeaveBill.png','501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0Â\0\0\0Å¤\0\0*;IDATxœíİoŒõ}?ğSåŠZåª¦õ©O¸¨¸->5‘låA}F*¾Jm8©_ûÀ=©E%QU%G+ jp­ªI*A¤Mè©¿^N\n!nÀôJ\r¹‚±\rá\0;\\bLŒa©Ïöúşøæ7·‹×ëı¿ŞYÏìÍë¥œÙÙ™ïÎì—|î­Ù½¹®\0\0€ÆtÅ}\0\0\0Cr\0h”ä\0Ğ(É	\0 Q’\0@£$\'\0€FIN\0\0’œ\0\0\ZÕhrê\"Úú_\0tºú?)ãşQN®Ây\0Ğ‰êüŒô£4mÌ8\0ÔĞPrº:‡BB˜t\0¨¦ÖH?AÓÉ¼@5’¥Ì;\0T#9QÊ¼@5’¥Ì;\0T#9QÊ¼@5’¥Ì;\0T#9QÊ¼@5’¥Ì;\0T#9QÊ¼@5’¥Ì;\0T#9µÕ÷ïX}ïø~¸xôkŸ©¸œ<æ\0ªi19å“Á%ŸùÚÑh¯5ù„rJéûpñ5%\'\0XS\"NN	‹ñ%§òW•œ\0 óE’œ>J\0—òÀÅÄ’{:ÿlq¶(NEë/»Nsù¬Z[]zÁ²+^Õ’SùK|tìÅë*œÛeÏï~Ù¶¹ùg\Z¸ætqäï_<‚Æ¼êïa3ó\0)ÕÎäô™Ï\\|\\~I¦<\nä×•n¹º®8ÕTYÓLrªô¥+/­+K¹åFv/HÃÉ©|÷«ş63ï\0R‘ZWôS¿äŠLù£ËrWÑsù5¹A\n›]–ŠÊ×TV)9U|‰Òç‹®]ŠKEÁ©t÷*ïCÉé²Ë@«;Ç÷JN\0PM´ÉéòÏ¾.ş8/¹ TxXk*\\)¹ˆRöyYÍ\0U!9Uy‰’ÕùA»_ŠH5ğâ]zÔÄ§uÅïÜ¥äÇ{˜_WsŞ ¥¢ü´î’’ŸçUrEù÷¤«|èV´[ù°•^¿ÊqT}‰âkOÅ×b>Úÿk«ÿSt§ü«|jÙô5§¢ñ½‡’\0TsU’Ó•G§ÊwÊÖÔüS‘KŸo]ö·+û®QyÖ¨~\"—†¸²ï9­¿Šïa3ó\0)uu’Spùî²+$Å«/Ke?õ‹¿>T´¦™äTé%\n#~æk_»ìû?7­úyXåäTáwîê}Z÷µ;.ßõª¿‡ÍÌ;\0¤”{ˆÇ­Ö§kñ0ï\0Pä7É	\0:‡ä7É	\0:‡äD)ó\0ÕHN”2ï\0PäD)ó\0ÕHN”2ï\0PäD)ó\0ÕHN”2ï\0PäD)ó\0ÕHN”2ï\0PäD)ó\0ÕÔùé‡h\n™t\0¨¦¡äD\n]ÿş\0 ³Ôÿ÷OpbpşË€Näg$\0@£$\'\0€FIN\0\0’œ\0\0\Z%9\04Jr\0h”ä\0Ğ(É	\0 Q’\0@£$\'\0€FIN\0\0’œ\0\0\Z%9Á\Z—Íf\'\'\'ï¿ÿşáááÁ‹†††Â5™L&îè$’¬Ya`\nRwww˜™Âœ´{÷£Oí}:_ï‰{ï½odd¤§§gãÆãããq,@gœ`\r:tèĞàà`˜Â„´¸´\\»ö=ûÜ¶m200055÷$äkÍÎ;ÃôÔŞ§ëf¦âÚÿâM›6mß¾=›ÍÆ}\0É%9ÁÚ†‘‘‘±±±¦2Sq}ãÁçææâ>€„’œ`cÓÆ\'&&®86>¼Ç™û„\0’Hr‚5bdd¤õØTøä.O>¶(\'9ÁZ°sçÎV>¤+¯İ»û´\0Gr‚wèĞ¡cS¾î¸ãÎ‡z(î“HÉ	:^›ö¿x òätü­7ÜĞç3;€b’t¶ÉÉÉáááÈcS¾î¾ûó»víŠûDr‚Î688Øì­›šºìÔÛÛ÷)$ˆä,“Éôôô´)6åkÃ†\rÓÓÓqŸ(@RHNĞÁÆÇÇGGGÛšœØ±cll,îH\nÉ	:ØöíÛzè¡¶&§§ö>=88÷‰$…älhh¨‘¿éÛJ=vì†úâ>Q€¤œ ƒµé~ÅuzşLwwwÜ\'\n’t°ŞŞŞãohkr\n««K£\0øˆ†¬¿¿ÿGGHN\0W†¬­7sò=\'€r’t°ÑÑÑo?üp[“Ó¾gŸÛ°aCÜ\'\n’t°]»vİ}÷çÛšœÂd¶mÛŸÄ}¢\0I!9A›íëëkkrÚ²eË={â>Q€¤œ ³µõKâ§çÏôôôd³Ù¸Ï )$\'èlmıÀî+_ıj8xÜ§ ’t¶l6Û×××»:?sÃ\r}sssqŸ\"@‚HNĞñ&&&nßºÕ\'€«@r‚µà³·Şº{÷£Æ¦9²~ıúÓógâ>3€d‘œ`-Èd26lˆê«â\'ß;Æ¦£ÇÅ}Z\0‰#9Á\Z133†§0î´›>{ë­ï‰¸O ‰$\'X;:´~ıú}Ï>×Ê‡taü›\0ª‘œ`MÉd2›6mº÷ŞûN¾wª©ÌtzşÌW¾úÕüG~qŸ@rIN°Öd³Ù09İxc˜„Â<ÔHlúöÃ‡Ûß}÷çÃ¼÷á$šäkÓÜÜÜ¾ğ…ÏŞzkŒö¿x $-…kyäÿİ¾uk¸Í¶m2;;÷!t\0É	Ö²l6;999::º~ıú®Ë…kÂØ411‘Édâ>L€!9Aº„)*îC\0è`’¤KW—ÿ×\\9=ÒErh…\né\"9´B…t‘œ\0Z¡‡BºHN\0­ĞC!]$\'€Vè¡.’@+ôPHÉ	 z(¤‹äĞ\n=ÒErh…\né\"9´B…t‘œ\0Z¡‡BºHN\0­ĞC!]$\'€Vè¡.’@+ôPHÉ	 z(¤‹äĞ\n=ÒErh…\né\"9´B…t‘œ\0Z¡‡BºHN\0­ĞC!]$\'€Vè¡.’@+ôPHÉ	 z(¤‹äĞ\n=Ö¾‰‰‰00uww„½½½á¿×_ıÌÌLÜ‡Ğa$\'Xû{ì±®2›7oœœŒûĞ\0:Œäk_6›½îºëŠcÓM7İÔÛÛ›Édâ>4€#9A*ÜsÏ=×\\sM!9İu×]cccq@ç‘œ -Ö­[—M[·níëëËf³q@ç‘œ -yæ™k¯½6LNCCC¾ápe$\'H‘›o¾9Ÿœâ>€N%9AŠÌÍÍ…ÉÉÍ\0®˜äéâN˜\0­ĞCájÈf³###ƒƒƒ}}}åwWJ‰ğÜÃw`xxx||Ü=€N$9AÛíÙ³\'Lalzä‘GÚ»÷è±c‹KKé¬ğÜÃw`÷îİÛ¶mß“0?Å=9\0Í‘œ 2™Ìèèè–-[¿u|qiQ×É÷N†ù)|sæææâ(€FINĞ.al\ZøöÃßZ\\ZPÕêñï=¾aÃ†ÙÙÙ¸§ !’´Ëèèh.6Wµë©½OnÚô;qO@C$\'h‹={ölÙrËÒrV5R_üÒ_ìØñå¸\'\r >É	¢—ÍfûúúŞ:1»´|N5Róg>X¿ş&7š’Or‚è.-Ÿ-Ôæ¡ßoğ÷ö‹÷JUíØñ7ş1|’Doxxx÷£ÿq)6İ²ågAğ“ÁKÁ+ÁKÁşùå]>ıƒ>¿üo6x>ì;<y>øÇ}‡ïØ~gì!&–zñÀôÀÀ@ÜSP‡äÑëïï?räàÒò™|uuuÍÁ™•àÃåàıÅàlüù_Ş×õs¿¸ñ–áKÁñ…àøù`6]¾óÃ—r—Î¤°æÏœêîî{ê\0êœ z===ï:±´<Ÿ¯0½,\\X}jyeõßï>ñŸ¿ş¿ùW|e9N/.ï/™ xò…—sÉi>Õå/Ã\0‰§OAôréçt¡Â‡g–ƒSç‚ÅmÉdşáëßüòßıøÛ«7\\Z	s‰ê¹_*Ù7U%9É§OAôréçÿ\nµšœ.\'ÏïÌKA°¸°Ğã]]ëêê¾í¶ï¸ÿÀÁ’}SU’|úD/—~>,TşÓºSç‚·Oïöùñºuë>vÍÏÿÂÇ?1òÇ—%§^<P²oªJr’OŸ‚èåÒO¦PáÃs+ÁûÙÕkN\'Ï{_˜ù­õŸúÄ¯şÚÇ{~ù›ÿúóA0¿œ]Xİqßô%û¦ª$\' ùô)ˆ^˜\0–—?(T>„áéÃ¥àƒÅàíÓKÏ]ÿÛŸŞü»¿÷îBğN6x7œZÂì´ïùJöMUIN@òéS½’ô3¸yÓË¯¾±ÿğÌô¡™gÌ<{ğõç^>ö_Ï¿òÃÃo>sàõÿ9ğÚ³_›~éõÃoüôÁzøö­·Ç`$\'€jô)ˆ^.9½_\\ŸûÜÜ@üo»­dÇT•ä$Ÿ>ÑË%§SªÙ’œ€äÓ§ z«ÉéÂ{ªÙ’œ€äÓ§ z¹ätR5[’|úD/—œŞUÍ–ä$Ÿ>ÑË%§wT³%9É§OAôrÉiN5[’|úDOr’œ€µJŸ‚èå’ÓÏÚQ…‘KnUcË¬½²}gTò*qO@úD/L\0.¼İ*Œ\\üÕ^®‘Ã¨½oµ;v¶ïìâ:€:ô)ˆ^.[œhGF.‹2VVJ<u6«ûºm-É	H>}\n¢—ËoE[•RÎ¥§šªîr#¯ÛsŒ{ê\0êĞ§ z¹xq¼U¹,ÍTŞ¬d¹ö³%ƒWÛ¥}%9É§OAôr9ã§í¨FF.ß¦dMÍOë.Û¥îf‘Ÿ]ÜSP‡>Ñkk¶¨–iJOyª¤ê.—§®6šät}\n¢—‹?‰¶ŠÒe+kl_mƒâ•u—+E´ˆO­øEã:€:ô)ˆŞj¼X™mGFÎ/\\J357.__õc¸*/TwÌ¨Î.î©¨CŸ‚èåâÅ›í¨ÂÈù…\Z/Tcƒâ•u—+¥«¶œZşµâ:€:ô)ˆ^.^ü¸U9¿Pñ….æ›Ê«\rXm’\rÚwjùÁã:€:ô)ˆ^.^‹¼.¦™c…/¿tiƒ\Zû–¯¯¶}ù5Æêã:€:ô)ˆ^.^UÍ–ä$Ÿ>ÑË%§7T³%9É§OAô$\'É	X«ô)ˆ^˜\0VV^WÍ–ä$Ÿ>ÑË%§×T³%9É§OAôrÉiF5[’|úD/—œ^UÍ–ä$Ÿ>Ñëîî>wîàÊÊ+ª©’œ€äÓ§ z}}}o¾ùƒ••#ª©’œ€äÓ§ zCCCßßóĞJğ#Õx½:óİşşş¸§ É	¢·sçÎ±±?=‹tVıËø£££qO@’Dovv¶¿ÿ“ç²ûW‚ÃªÁ\Z¾yrr2î©¨Cr‚¶¸Õö•àeÕHıûÄßŒÅ=i\0õINĞÙlvpğÓÓÓÿ/©Ú57··¿ÿ“™Ì¾¸\'\r >É	Úefff`àÆ™™É 8¤ªU›Âˆ95õ­¸§ !’´Ñôôtvîü³ 8¨Êkrò«ıı}SSÿ÷D4Jr‚öÊf³cc£ƒƒŸ\Zÿë¹¹\'ƒà€Êdş{bâoGF¶†ËqO@$\'¸\Z¦¦¦FGÿ ·÷Wºèêêéù¥‘‘[Âğ÷´\04Mr‚tqÏ$€VHN.]şÂ	@ôPH—F’Sa›’OÙ®l´j›•¯”ê€äÓ§ ]šMNuwljÀŠë«}ªî°\0WŸŞéÒú5§º_\0¯»Y+Ç/}\nÒ¥v:©‘rš5Õö­öÉN@GĞ ]Z¿æTq¨ÆŸ-¼Ùcˆ—>éÒTrjj›òT÷Óº.ßs:ŞéÒ`*ª–iŠ©˜*¾P#×Ÿš=H€XhO.µCIÅë=5v)L÷jğ“;œ€äÓ ]šú$®äÊSS6şi]ù ’XÚ¤Ë•%§Ú[ºæ¤‡öéUr*¿zT7`ÕÄ5\' ShO.uCIIš)¿Tû“»º×Ÿ*®o<„ÄK{‚tJ\0Z¡‡BºHN\0­ĞC!]$\'€Vè¡.’@+ôPHÉ	 z(¤‹äĞ\n=ÒErh…\né\"9´B…t‘œ\0Z¡‡BºHN\0­ĞC!]$\'€Vè¡.’@+ôPXû&&&ÂÀÔİİ=00.ôöö†ÿ^ıõ333q\Z@‡‘œ`í{ì±ÇºÊlŞ¼yrr2îCè0’¬}Ùlöºë®+M7İtSooo&“‰ûĞ\0:Œä©pÏ=÷\\sÍ5…ät×]wÅ}P\0Gr‚´X·n]>6mİºµ¯¯/›ÍÆ}D\0Gr‚´xæ™g®½öÚ09\r\r\rù†À•‘œ En¾ùæ|rŠû@\0:•ä)277&\'7#\0¸b’¤‹;a´B…«!›ÍNLLŒŒŒöõõ•ß])%Âsßáááññq÷D\0:‘äm·gÏ01„±é‘GyjïŞ£Ç-.-¥³Âsßİ»woÛ¶-|OÂü÷ä\04Gr‚6Êd2£££[¶l9şÖñÅ¥EU\\\'ß;æ§ğÍ™››‹{¢\0\Z%9A»„±i``àÛkqiAU«Ç¿÷ø†\rfggã.€†HNĞ.£££¹Øt^Õ®§ö>¹iÓïÄ=]\0\r‘œ -öìÙ³eË-KËYÕH}ñK±cÇ—ã4€ú$\'ˆ^6›íëë{ëÄìÒò9ÕHÍŸù`ıú›Üh\nH>É	¢7>>>::º´|¶P›‡~¿ÁßÛ/Ş+UµcÇßø#Ä@òIN½áááİşÇ¥ØtË–ŸÁO.o,¯,/-ûç—w=úôN|øübğ¿Ùàùl°ïlğäùà÷¾cû±‡˜XêÅÓqO@’D¯¿¿ÿÈ‘ƒKËgòÕÕÕ5gV‚—ƒ÷ƒ³Ağçy_×ÏıâÆ[†O,Ç‚ãçƒÙlpt9øÎ_Ê]v:“Âš?sª»»;î©¨Cr‚èõôô¼wêÄÒò|¾Â0töB°paõ©å•Õ¿ûÄşúoüæ_=ğ•å 8½|¸¼¿d‚àÉ^Î%§ùtV—¿$>ÑË¥ŸÓ…\nYN/|´A&“ù‡¯óËÿõão¯Şri%XÌ%ªç^|©dßT•ä$Ÿ>ÑË¥Ÿÿ+Ôjrºœ<¼3,ÁâÂBÿ7vu}¬««û¶?ÚV¼ãşKöMUIN@òéS½\\úù°PùOëNŞ>¼{>ØäÇëÖ­ûØ5?ÿÿÄÈ_–œ^xñ@É¾©*É	H>}\n¢—K?™B…Ï­ïgW¯9<ì}aæ·Öê¿úkïùåoşëwÎÁüBpvauÇ}Ó/”ì›ª’œ€äÓ§ zaX^ş Pù@†§—‚ƒ·O/=wxvıozóïşŞ»Á;Ùàİlpj!³Ó¾ç_(Ù7U%9É§OAôJÒÏàæM/¿úÆşÃ3Ó‡f=0óìÁ×Ÿ{ùØ=ÿÊ¿ùÌ×ÿçÀkÏ|mú¥×¿ñÓÿéáÛ·Ş{‚‘œ\0ªÑ§ z¹äô~q}îsw6rñ?¼í¶’SU’|úD/—œN©fKr’OŸ‚è­&§ï©fKr’OŸ‚èå’ÓIÕlIN@òéS½\\rzW5[’|úD/—œŞQÍ–ä$Ÿ>ÑË%§9ÕlIN@òéS=ÉIrÖ*}\n¢—KN?«XÕ*¬/_¸‚ª½oñK”kp’kŒÓÔaÇ=u\0uèS½0\\¸ğv¾êŞı²°Yµ…ŠUqŠë«mVmØòåj\\ü5¾Ú¡V|õ¸§ }\n¢—Ë\'òU¼\\^…gY(Ù±(‹T¿î8Mm\\²²ñcnğh%\' ùô)ˆ^.¼U±*>U”*.mP¾Pm—jã75`í]*îU¼Y¹¸d›¸§ }\n¢—ËÇU1X\\Œ—¶)ß¸x}I•ì^òTÉ€%ãTÛ±xãŠ‡W~^u\Z<æÂqO@úD/—~Z¨â‡u—‹JÆ)³üÙêù¬êë–PãÊ¯dğŠ»Ô>æ’\râ:€:ô)ˆ^yrª‘iJREíğÑx\n©ÉZÙ¸ZÈ«vj’°–èS½\\>øI¡ŠV\\¾)JWRRÅ»”¯/Š/¬1ra—’JÖTçÊ¹xƒ¸§ }\n¢·šVfUñ’ÌG1¢h›j«|„ò½òËMÜÔSÅÖ8µÚ\\²MÜSP‡>ÑËåƒ7Uü°îr~ábÈ(İ¬xû¢,RëµÊ7«8`ÅİkïUûÕ9ÚòÍâ:€:ô)ˆ^.ü¸bU{ª°şb¼¸lMÅí/#U×—ï^÷ğJÆ¬¸W#ÛÔ>ÔŠ[Æ=u\0uèS½\\>8V±*>u1R”nP”6*V{üürùî5¡âÆåênĞÔ1÷ÔÔ¡OAôr¹á¨j¶$\' ùô)ˆ^.9½¡š-É	H>}\n¢\'9INÀZ¥OAôÂ°²òºj¶$\' ùô)ˆ^.9½¦š-É	H>}\n¢—KN3ªÙ’œ€äÓ§ z¹äôªj¶$\' ùô)ˆ^ww÷¹sWV^QM•ä$Ÿ>Ñëëë{óÍ¬¬QM•ä$Ÿ>Ñ\Z\Zúş‡V‚©ÆëÕ™ïö÷÷Ç=u\0uHN½;wıiìY¤³ê_Æ{ê\0êœ z³³³ııŸ<—İ¿V\rÖğğÍ“““qO@’´Åı«¶¯/«Fêß\'şndd(îI¨Or‚¶Èf³ƒƒŸş· xIÕ®¹¹½ııŸÌdöÅ=i\0õINĞ.3337ÎÌLÁ!U­ÂØFÌ©©oÅ=]\0\r‘œ ¦§§Ãğ´sçŸÁAU^““_íïï›šúç¸\'\n Q’´W6›üÔøø_ÏÍ=T&óß;2²exx0\\{Š\0š 9ÁÕ0555:ú½½¿ÒEWWOÏ/ŒÜ†§¸§ i’¤‹{&´Br‚téòN\0Z ‡BºÔMN…\rÊ®l@€µDËƒti=9• <é¡ßAº´’œ\Z¼\n°†i.u?zË\Z»øT®=G\rÚ¤KS×œ*©+`ÍĞï ]®ìÓºâ½|Ï	H3ıÒ¥‘äTíÓºjƒHN@zèw.|Ï©dËj»øBÚ¤Kä÷sjd€5C¿ƒti695rJrÒC¿ƒtiöwë‚JYªÙ1ÖıÒå\n¾ç}¥©|¯:©¢ÇAºH6\0­ĞC!]$\'€Vè¡.’@+ôPHÉ	 z(¤‹äĞ\n=ÒErh…\né\"9´B…t‘œ\0Z¡‡BºHN\0­ĞC!]$\'€Vè¡.’@+ôPHÉ	 z(¤‹äĞ\n=ÒErh…\né\"9´B…µobb\"LİİİáBoooøïõ×_?33÷¡tÉ	Ö¾Ç{¬«ÌæÍ›\'\'\'ã>4€#9ÁÚ—Íf¯»îºâØtÓM7õööf2™¸\r ÃHN\n÷ÜsÏ5×\\SHNwİu×ØØXÜĞy$\'H‹uëÖåcÓÖ­[ûúú²ÙlÜGĞy$\'H‹gyæÚk¯\r“ÓĞĞo8\\É	Räæ›oÎ\'§¸ SIN\"sssarr3€+&9Aº¸&@+ôP¸\Z²ÙìÄÄÄÈÈÈàà`___ùİ•R\"<÷ğwO INĞv{öì	C›yä‘§öî=zìØâÒR:+<÷ğØ½{÷¶mÛÂ÷$ÌOqO@s$\'h£L&3::ºeË–ão_\\ZTÅuò½“a~\nßœ¹¹¹¸\'\n Q’´K›¾ığ·—Tµzü{oØ°avv6îéhˆäí2::š‹MçUízjï“›6ıNÜÓĞÉ	ÚbÏ=[¶Ü²´œUÔ¿ô;v|9îI¨Or‚èe³Ù¾¾¾·NÌ.-ŸSÔü™Ö¯¿É¦€ä“œ zããã£££KËgµyè÷ü½ıâ½RU;vü?B$ŸäÑŞıè\\ŠM·lùYüäBğÆRğÊBğÒB°~y×£OÿàÄ‡Ï/ÿ›\rÏûÎOşqßá;¶ß{ˆ‰¥^<0=00÷ÔÔ!9Aôúûû9¸´|&_]]]óApf%øp9x18ş—÷uıÜ/n¼eøÄRp|!8~>˜ÍG—ƒïüğ¥Üe§3)¬ù3§º»»ã:€:$\'ˆ^OOÏ{§N,-Ïç+Cg/VŸZ^Yı÷»Oüç¯ÿÆoşÕ_Y‚ÓËÁ‡KÁûKA&|áå\\ršOguùË0@âéS½\\ú9]¨ğá™åàÔ¹`ñÂGd2™øú7¿ü÷_?şöêM —V‚Å\\¢zîÅ—JöMUIN@òéS½\\úù¿B­&§ÁÉ³Á;óÁR,.,ôßxcW×Çºººoû£mÅ;î?p°dßT•ä$Ÿ>ÑË¥Ÿ•ÿ´îÔ¹àíÓÁ»çƒıG~¼nİº]óó¿ğñOŒüñeÉé…”ì›ª’œ€äÓ§ z¹ô“)TøğÜJğ~võšÓÉóÁŞf~kı§>ñ«¿öñ_şæ¿~ç|Ì/gVwÜ7ıBÉ¾©*É	H>}\n¢&€åå\n•axúp)ø`1xûôÒs‡g×ÿö§7ÿîï½»¼“\rŞÍ§‚0;í{ş…’}SU’|úD¯$ınŞôò«oì?<3}hæÙ3Ï|ı¹—ı×ó¯üğğ›Ïxı¼öìÁ×¦_zığ?}ğŸ¾}ëí±\'É	 \Z}\n¢—KNï×ç>wg#7ÿÃÛn+Ù1U%9É§OAôrÉé”j¶$\' ùô)ˆŞjrºğj¶$\' ùô)ˆ^.9TÍ–ä$Ÿ>ÑË%§wU³%9É§OAôrÉéÕlIN@òéS½\\ršSÍ–ä$Ÿ>Ñ“œ$\'`­Ò§ z¹äô³|Õ½‡SaËâ]ÊW¯/_h¶ÊwldMÑ\Z9¯FÆ‰{ê\0êĞ§ za¸páíŠUñ©ºéªdßò…j¯U>HÅ#©vT5Æ)~XûÀjFÉ+Æ=u\0uèS½\\>8Q¨š‘è£\rŠ·/©òÍj,T{İ¦§Æ€ÍXí#)?î©¨CŸ‚èåòÁ[…*~Xm¹ÚöÅ+/&K”/TÛ¥îøu‡­1N•ÖĞÁ”l÷ÔÔ¡OAôrùàx¡ŠÖX®~¨tû’gK^®dÌŠë«m_2~ÉSÕÎ«ÆB#ÇS¼AÜSP‡>ÑËåƒŸªf*º´MãËÅ%¯Uşº×WÛ¾âÃjÇP¿â5~<ÅÄ=u\0uèS½j¤ör#éªZRi695äÊG¨àª\r%9k‰>ÑËåƒŸªøá/_Œ¥+‹_¨¤Šwiª.@—=¬vœ‘ä$Ÿ>Ñ[Í+³ùªqç£$Qo³â¡ª-T¬ò*nSq¹ö–å‡Qã°›:˜¸§ }\n¢—ËoªäaÅõM-ç.‘ª/qy)}İŠû–,W{ªâµÏ´â‘”o÷ÔÔ¡OAôrùàÇ…*yØúú‹ä²5·¿<²\\6NÅƒ,ü[>`ùöu·©}·Œ{ê\0êĞ§ z¹|p¬P%ók.ÆˆcåUq}ñöÅÔªöàe™¦òöåênĞøñ”÷ÔÔ¡OAôr¹á¨j¶$\' ùô)ˆ^.9½¡š-É	H>}\n¢\'9INÀZ¥OAôÂ°²òºj¶$\' ùô)ˆ^.9½¦š-É	H>}\n¢—KN3ªÙ’œ€äÓ§ z¹äôªj¶$\' ùô)ˆ^ww÷¹sWV^QM•ä$Ÿ>Ñëëë{óÍ¬¬QM•ä$Ÿ>Ñ\Z\Zúş‡V‚©ÆëÕ™ïö÷÷Ç=u\0uHN½;wıiìY¤³ê_Æ{ê\0êœ z³³³ııŸ<—İ¿V\rÖğğÍ“““qO@’´Åı«¶¯/«Fêß\'şndd(îI¨Or‚¶Èf³ƒƒŸş· xIÕ®¹¹½ııŸÌdöÅ=i\0õINĞ.3337ÎÌLÁ!U­ÂØFÌ©©oÅ=]\0\r‘œ ¦§§Ãğ´sçŸÁAU^““_íïï›šúç¸\'\n Q’´W6›üÔøø_ÏÍ=T&óß;2²exx0\\{Š\0š 9ÁÕ0555:ú½½¿ÒEWWOÏ/ŒÜ†§¸§ i’¤‹{&´Br‚téòN\0Z ‡BºÔMN…\rÊ®l@€µDËƒti=9• <é¡ßAº´’œ\Z¼\n°†i.u?zË\Z»øT®=G\rÚ¤KS×œ*©+`ÍĞï ]®ìÓºâ½|Ï	H3ıÒ¥‘äTíÓºjƒHN@zèw.|Ï©dËj»øBÚ¤Kä÷sjd€5C¿ƒti695rJrÒC¿ƒtiöwë‚JYªÙ1ÖıÒå\n¾ç}¥©|¯:©¢ÇAºH6\0­ĞC!]$\'€Vè¡.’@+ôPHÉ	 z(¤‹äĞ\n=ÒErh…\né\"9´B…t‘œ\0Z¡‡BºHN\0­ĞC!]$\'€Vè¡.’@+ôPHÉ	 z(¤‹äĞ\n=ÒErh…\né\"9´B…t‘œ\0Z¡‡BºHN\0­ĞC!]$\'€Vè¡.’@+ôPXû&&&ÂÀÔİİ=00.ôöö†ÿ^ıõ333q\Z@‡‘œ`í{ì±ÇºÊlŞ¼yrr2îCè0’¬}Ùlöºë®+M7İtSooo&“‰ûĞ\0:Œä©pÏ=÷\\sÍ5…ät×]wÅ}P\0Gr‚´X·n]>6mİºµ¯¯/›ÍÆ}D\0Gr‚´xæ™g®½öÚ09\r\r\rù†À•‘œ En¾ùæ|rŠû@\0:•ä)277&\'7#\0¸b’¤‹;a´B…5.›ÍNNNŞÿıÃÃÃƒ\r\r\r…kÆÇÇçææâ>@€N\"9Áš¦0-•ß³ÄÀÀÀC=äWí\0\Z!9Á\Z455µqãÆº™©X__Ÿ_¸¨Kr‚5%›Í–_Uúâ¿´{÷£Oí}ºP÷Ş{ß–-[J¶vcq€\Z$\'X;æææJ.5İ}÷ç;¶¸´\\­N¾wê>˜ÿÀ…‹O‡ŠûT\0Jr‚5bvv6=…\0444T;3•ä§{ï½¯°oww÷ôôtÜ\'D’¬Ùl¶øjÓ;v4˜™Šë‘Gş_˜™\nWüÚ@9É	Ö‚‘‘‘BlÚ½ûÑ+ˆMùÚÿâü8ƒƒƒqŸ@âHNĞñ&\'\'[¼ÚT\\ï‰Âh»víŠûä\0’Er‚700PønS‹±)_…ï<õööºÏ@1É	:ÛÄÄDákİÇß:Ir:=¦ğÛv_øÂâ>E€‘œ ³\rn@IlÊ×·~8?lOOOÜ§ ’t°L&SøNRTœ\nuÃ\rİã`jj*îH\nÉ	:Øøøxá÷à¢MaİqÇùÁÇÆÆâ>Q€¤œ ƒmß¾=ª_©+¯§ö>|ãÆqŸ(@RHNĞÁ†††òáæñï=yr:zìXá®˜qŸ(@RHNĞÁ\n÷#ØÿâÈ“SX…/QÅ}¢\0I¡!B+Ü; ñ?Q×TÆûD’BC„ÖßßŸO6?:r¤É©ğgìâ>Q€¤Ğ¡ƒnæôÔŞ§#M\'ß;å–N\0%$\'è`£££ùpóŒ<9ıèÈ‘üàqŸ(@RHNĞÁvîÜ™7Û¶ıIäÉé;òƒŒŒÄ}¢\0I!9A›™™)| vzşL´ÉiÓ¦MùÁÇÇÇã>Q€¤œ ³õõ}ô7Rvï~4ÂØT¸™S(“ÉÄ}–\0I!9AgËç›õë×GxÙé³·Şšvxx8îSHÉ	:[&“)Üu)ª¿Á²ïÙç\nœ:÷)$ˆäo×®]ù”Óİİİúí	;VˆbÛ·oûä\0’Er‚µ`ãÆù¬†Vî\'~zşÌúõëCÍÍÍÅ}f\0É\"9ÁZ0;;ÛÓÓSH<Wögì¿u¢›º»»§¦¦â>-€Ä‘œ`ƒNáËIaîiöŞ˜û}®ğ!]h×®]qŸ@IN°vLNN®<åÛîñï=ÑÈ¥¦Û·ní*\"6T#9Áš233Sø3À…ütï½÷•ÿIà00}ãÁ·lÙR¼q¼|HPƒäkM&“¹ÿşû»»»»*Ù°aCµ§FFF|% 6É	Ö¦0şp]ƒƒƒÓÓÓq2@œ`-Ëf³a„\Z(IK}}}ÃÃÃ=ôëL\0“œ\0\0\Z%9\04Jr\0h”ä\0Ğ(É	\0 Qÿ:Êãrå7	Ó\0\0\0\0IEND®B`‚',0);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('next.dbid','2701',28);
insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('schema.history','create(5.12)',1);
insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('schema.version','5.12',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2402','LeaveBill:3:2204','2401','2401','startevent1',NULL,NULL,'Start','startEvent',NULL,'2015-04-25 19:17:44','2015-04-25 19:17:44',29);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2404','LeaveBill:3:2204','2401','2401','usertask1','2405',NULL,'æäº¤ç”³è¯·','userTask','user1','2015-04-25 19:17:44','2015-04-25 19:17:44',347);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2407','LeaveBill:3:2204','2401','2401','usertask2','2408',NULL,'å®¡æ‰¹ã€éƒ¨é—¨ç»ç†ã€‘','userTask','test1','2015-04-25 19:17:44','2015-04-25 19:20:01',137358);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2411','LeaveBill:3:2204','2401','2401','usertask3','2412',NULL,'å†å®¡æ‰¹ã€æ€»ç»ç†ã€‘','userTask','admin','2015-04-25 19:20:01','2015-04-25 19:20:33',32240);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2415','LeaveBill:3:2204','2401','2401','endevent1',NULL,NULL,'End','endEvent',NULL,'2015-04-25 19:20:33','2015-04-25 19:20:33',0);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2417','LeaveBill:3:2204','2416','2416','startevent1',NULL,NULL,'Start','startEvent',NULL,'2015-04-25 19:29:10','2015-04-25 19:29:10',0);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2419','LeaveBill:3:2204','2416','2416','usertask1','2420',NULL,'æäº¤ç”³è¯·','userTask','user1','2015-04-25 19:29:10','2015-04-25 19:29:10',888);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2422','LeaveBill:3:2204','2416','2416','usertask2','2423',NULL,'å®¡æ‰¹ã€éƒ¨é—¨ç»ç†ã€‘','userTask','test1','2015-04-25 19:29:10',NULL,NULL);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2502','LeaveBill:3:2204','2501','2501','startevent1',NULL,NULL,'Start','startEvent',NULL,'2015-05-03 17:06:02','2015-05-03 17:06:02',32);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2504','LeaveBill:3:2204','2501','2501','usertask1','2505',NULL,'æäº¤ç”³è¯·','userTask','user1','2015-05-03 17:06:02','2015-05-03 17:06:03',1176);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2507','LeaveBill:3:2204','2501','2501','usertask2','2508',NULL,'å®¡æ‰¹ã€éƒ¨é—¨ç»ç†ã€‘','userTask','test1','2015-05-03 17:06:03','2015-05-03 17:07:05',62290);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2511','LeaveBill:3:2204','2501','2501','usertask3','2512',NULL,'å†å®¡æ‰¹ã€æ€»ç»ç†ã€‘','userTask','admin','2015-05-03 17:07:05',NULL,NULL);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2602','LeaveBill:3:2204','2601','2601','startevent1',NULL,NULL,'Start','startEvent',NULL,'2015-05-03 22:33:23','2015-05-03 22:33:23',28);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2604','LeaveBill:3:2204','2601','2601','usertask1','2605',NULL,'æäº¤ç”³è¯·','userTask','user1','2015-05-03 22:33:23','2015-05-03 22:33:23',761);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2607','LeaveBill:3:2204','2601','2601','usertask2','2608',NULL,'å®¡æ‰¹ã€éƒ¨é—¨ç»ç†ã€‘','userTask','test1','2015-05-03 22:33:23','2015-05-03 22:34:06',43523);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2611','LeaveBill:3:2204','2601','2601','usertask3','2612',NULL,'å†å®¡æ‰¹ã€æ€»ç»ç†ã€‘','userTask','admin','2015-05-03 22:34:06','2015-05-03 22:34:35',29814);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2615','LeaveBill:3:2204','2601','2601','endevent1',NULL,NULL,'End','endEvent',NULL,'2015-05-03 22:34:35','2015-05-03 22:34:35',1);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2617','LeaveBill:3:2204','2616','2616','startevent1',NULL,NULL,'Start','startEvent',NULL,'2015-05-03 22:54:41','2015-05-03 22:54:41',0);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2619','LeaveBill:3:2204','2616','2616','usertask1','2620',NULL,'æäº¤ç”³è¯·','userTask','user1','2015-05-03 22:54:41','2015-05-03 22:54:41',638);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2622','LeaveBill:3:2204','2616','2616','usertask2','2623',NULL,'å®¡æ‰¹ã€éƒ¨é—¨ç»ç†ã€‘','userTask','test1','2015-05-03 22:54:41','2015-05-03 22:55:59',78470);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2626','LeaveBill:3:2204','2616','2616','usertask3','2627',NULL,'å†å®¡æ‰¹ã€æ€»ç»ç†ã€‘','userTask','admin','2015-05-03 22:55:59','2015-05-03 22:56:37',38285);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2630','LeaveBill:3:2204','2616','2616','endevent1',NULL,NULL,'End','endEvent',NULL,'2015-05-03 22:56:37','2015-05-03 22:56:37',0);

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('2410','comment','2015-04-25 19:20:01',NULL,'2408','2401','AddComment','å¥½çš„','ºÃµÄ');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('2414','comment','2015-04-25 19:20:32',NULL,'2412','2401','AddComment','æ‰¹å‡†','Åú×¼');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('2510','comment','2015-05-03 17:07:05',NULL,'2508','2501','AddComment','æ‰¹å‡†ï¼Œæ³¨æ„å®‰å…¨','Åú×¼£¬×¢Òâ°²È«');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('2610','comment','2015-05-03 22:34:06',NULL,'2608','2601','AddComment','å¯ä»¥','¿ÉÒÔ');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('2614','comment','2015-05-03 22:34:35',NULL,'2612','2601','AddComment','å…è®¸','ÔÊĞí');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('2625','comment','2015-05-03 22:55:59',NULL,'2623','2616','AddComment','å¯ä»¥å§','¿ÉÒÔ°É');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('2629','comment','2015-05-03 22:56:37',NULL,'2627','2616','AddComment','æ‰¹å‡†','Åú×¼');

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  UNIQUE KEY `ACT_UNIQ_HI_BUS_KEY` (`PROC_DEF_ID_`,`BUSINESS_KEY_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`) values ('2401','2401','LeaveBill.621','LeaveBill:3:2204','2015-04-25 19:17:44','2015-04-25 19:20:33',169241,NULL,'startevent1','endevent1',NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`) values ('2416','2416','LeaveBill.622','LeaveBill:3:2204','2015-04-25 19:29:10',NULL,NULL,NULL,'startevent1',NULL,NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`) values ('2501','2501','LeaveBill.624','LeaveBill:3:2204','2015-05-03 17:06:02',NULL,NULL,NULL,'startevent1',NULL,NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`) values ('2601','2601','LeaveBill.625','LeaveBill:3:2204','2015-05-03 22:33:23','2015-05-03 22:34:35',72816,NULL,'startevent1','endevent1',NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`) values ('2616','2616','LeaveBill.626','LeaveBill:3:2204','2015-05-03 22:54:41','2015-05-03 22:56:37',116287,NULL,'startevent1','endevent1',NULL,NULL);

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2405','LeaveBill:3:2204','usertask1','2401','2401','æäº¤ç”³è¯·',NULL,NULL,NULL,'user1','2015-04-25 19:17:44',NULL,'2015-04-25 19:17:44',294,'completed',50,NULL,'workflowAction_audit.action');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2408','LeaveBill:3:2204','usertask2','2401','2401','å®¡æ‰¹ã€éƒ¨é—¨ç»ç†ã€‘',NULL,NULL,NULL,'test1','2015-04-25 19:17:44',NULL,'2015-04-25 19:20:01',137350,'completed',50,NULL,'workflowAction_audit.action');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2412','LeaveBill:3:2204','usertask3','2401','2401','å†å®¡æ‰¹ã€æ€»ç»ç†ã€‘',NULL,NULL,NULL,'admin','2015-04-25 19:20:01',NULL,'2015-04-25 19:20:33',32233,'completed',50,NULL,'workflowAction_audit.action');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2420','LeaveBill:3:2204','usertask1','2416','2416','æäº¤ç”³è¯·',NULL,NULL,NULL,'user1','2015-04-25 19:29:10',NULL,'2015-04-25 19:29:10',883,'completed',50,NULL,'workflowAction_audit.action');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2423','LeaveBill:3:2204','usertask2','2416','2416','å®¡æ‰¹ã€éƒ¨é—¨ç»ç†ã€‘',NULL,NULL,NULL,'test1','2015-04-25 19:29:10',NULL,NULL,NULL,NULL,50,NULL,'workflowAction_audit.action');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2505','LeaveBill:3:2204','usertask1','2501','2501','æäº¤ç”³è¯·',NULL,NULL,NULL,'user1','2015-05-03 17:06:02',NULL,'2015-05-03 17:06:03',1134,'completed',50,NULL,'workflowAction_audit.action');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2508','LeaveBill:3:2204','usertask2','2501','2501','å®¡æ‰¹ã€éƒ¨é—¨ç»ç†ã€‘',NULL,NULL,NULL,'test1','2015-05-03 17:06:03',NULL,'2015-05-03 17:07:05',62286,'completed',50,NULL,'workflowAction_audit.action');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2512','LeaveBill:3:2204','usertask3','2501','2501','å†å®¡æ‰¹ã€æ€»ç»ç†ã€‘',NULL,NULL,NULL,'admin','2015-05-03 17:07:05',NULL,NULL,NULL,NULL,50,NULL,'workflowAction_audit.action');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2605','LeaveBill:3:2204','usertask1','2601','2601','æäº¤ç”³è¯·',NULL,NULL,NULL,'user1','2015-05-03 22:33:23',NULL,'2015-05-03 22:33:23',738,'completed',50,NULL,'workflowAction_audit.action');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2608','LeaveBill:3:2204','usertask2','2601','2601','å®¡æ‰¹ã€éƒ¨é—¨ç»ç†ã€‘',NULL,NULL,NULL,'test1','2015-05-03 22:33:23',NULL,'2015-05-03 22:34:06',43519,'completed',50,NULL,'workflowAction_audit.action');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2612','LeaveBill:3:2204','usertask3','2601','2601','å†å®¡æ‰¹ã€æ€»ç»ç†ã€‘',NULL,NULL,NULL,'admin','2015-05-03 22:34:06',NULL,'2015-05-03 22:34:35',29810,'completed',50,NULL,'workflowAction_audit.action');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2620','LeaveBill:3:2204','usertask1','2616','2616','æäº¤ç”³è¯·',NULL,NULL,NULL,'user1','2015-05-03 22:54:41',NULL,'2015-05-03 22:54:41',628,'completed',50,NULL,'workflowAction_audit.action');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2623','LeaveBill:3:2204','usertask2','2616','2616','å®¡æ‰¹ã€éƒ¨é—¨ç»ç†ã€‘',NULL,NULL,NULL,'test1','2015-05-03 22:54:41',NULL,'2015-05-03 22:55:59',78465,'completed',50,NULL,'workflowAction_audit.action');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2627','LeaveBill:3:2204','usertask3','2616','2616','å†å®¡æ‰¹ã€æ€»ç»ç†ã€‘',NULL,NULL,NULL,'admin','2015-05-03 22:55:59',NULL,'2015-05-03 22:56:37',38274,'completed',50,NULL,'workflowAction_audit.action');

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('2403','2401','2401',NULL,'userId','string',0,NULL,NULL,NULL,'user1',NULL);
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('2418','2416','2416',NULL,'userId','string',0,NULL,NULL,NULL,'user1',NULL);
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('2503','2501','2501',NULL,'userId','string',0,NULL,NULL,NULL,'user1',NULL);
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('2603','2601','2601',NULL,'userId','string',0,NULL,NULL,NULL,'user1',NULL);
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('2618','2616','2616',NULL,'userId','string',0,NULL,NULL,NULL,'user1',NULL);

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOY_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`DEPLOY_TIME_`) values ('1',NULL,NULL,'2015-03-26 23:37:54');
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`DEPLOY_TIME_`) values ('2201',NULL,NULL,'2015-04-25 19:02:37');
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`DEPLOY_TIME_`) values ('501',NULL,NULL,'2015-03-31 01:29:18');

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`SUSPENSION_STATE_`) values ('LeaveBill:1:4',1,'http://www.activiti.org/test','LeaveBillprocess','LeaveBill',1,'1','LeaveBill.bpmn','LeaveBill.png',NULL,0,1);
insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`SUSPENSION_STATE_`) values ('LeaveBill:2:504',1,'http://www.activiti.org/test','LeaveBillprocess','LeaveBill',2,'501','LeaveBill.bpmn','LeaveBill.png',NULL,0,1);
insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`SUSPENSION_STATE_`) values ('LeaveBill:3:2204',1,'http://www.activiti.org/test','LeaveBillprocess','LeaveBill',3,'2201','LeaveBill.bpmn','LeaveBill.png',NULL,0,1);

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_RU_BUS_KEY` (`PROC_DEF_ID_`,`BUSINESS_KEY_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`) values ('2416',2,'2416','LeaveBill.622',NULL,'LeaveBill:3:2204',NULL,'usertask2',1,0,1,0,1,2);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`) values ('2501',3,'2501','LeaveBill.624',NULL,'LeaveBill:3:2204',NULL,'usertask3',1,0,1,0,1,2);

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`) values ('2421',1,NULL,'participant','user1',NULL,'2416',NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`) values ('2424',1,NULL,'participant','test1',NULL,'2416',NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`) values ('2506',1,NULL,'participant','user1',NULL,'2501',NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`) values ('2509',1,NULL,'participant','test1',NULL,'2501',NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`) values ('2513',1,NULL,'participant','admin',NULL,'2501',NULL);

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DUE_DATE_` datetime DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`SUSPENSION_STATE_`) values ('2423',1,'2416','2416','LeaveBill:3:2204','å®¡æ‰¹ã€éƒ¨é—¨ç»ç†ã€‘',NULL,NULL,'usertask2',NULL,'test1',NULL,50,'2015-04-25 19:29:10',NULL,1);
insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`SUSPENSION_STATE_`) values ('2512',1,'2501','2501','LeaveBill:3:2204','å†å®¡æ‰¹ã€æ€»ç»ç†ã€‘',NULL,NULL,'usertask3',NULL,'admin',NULL,50,'2015-05-03 17:07:05',NULL,1);

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('2418',1,'string','userId','2416','2416',NULL,NULL,NULL,NULL,'user1',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('2503',1,'string','userId','2501','2501',NULL,NULL,NULL,NULL,'user1',NULL);

/*Table structure for table `calendar` */

DROP TABLE IF EXISTS `calendar`;

CREATE TABLE `calendar` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `START` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `END` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ALLDAY` int(11) DEFAULT NULL,
  `COLOR` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_9sxd8mfm69gffsjv40uu4qgwo` (`userId`),
  CONSTRAINT `FK_9sxd8mfm69gffsjv40uu4qgwo` FOREIGN KEY (`userId`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `calendar` */

insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (1,'å¥½å¥½','2015-04-03','2015-04-04',1,'#06c',1);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (3,'å•Šå•Šå•Šå•Šå•Š','2015-04-01','',1,'#360',1);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (4,'nih','2015-03-31','',1,'#360',1);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (5,'fff','2015-04-22 08:00:00','2015-04-22 12:00:00',0,'#f30',1);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (6,'aaaaå•Šå•Š','2015-04-08','2015-04-10',1,'#360',1);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (8,'aaaaabbbbb','2015-04-08','',1,'#f30',NULL);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (9,'aaaaaaaaaaaaaaaaaaa11','2015-04-10','',1,'#06c',NULL);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (12,'fffffff','2015-04-25 08:30:00','',0,'#360',1);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (13,'å†™å®Œé¡¹ç›®äº†','2015-04-25','',1,'#360',19);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (14,'å†™è®ºæ–‡','2015-04-26','',1,'#f30',19);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (15,'å­¦ä¹ ','2015-04-10','',1,'#f30',18);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (16,'æ¯•ä¸šç­”è¾©','2015-05-20','',1,'#06c',1);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (17,'åœ¨å®¶å†™è®ºæ–‡ï¼Œå¾ˆç´¯','2015-05-01','2015-05-03',1,'#360',1);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (18,'å¥½å¥½å­¦ä¹ ,å¤©å¤©å­¦ä¹ ','2015-04-28','2015-04-29',1,'#06c',1);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (19,'å¾ˆç´¯å•Š','2015-05-06','',1,'#06c',1);

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `NOTE` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `MANAGERID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_b343xwqpse9ro4gpvfj3rggvp` (`MANAGERID`),
  CONSTRAINT `FK_b343xwqpse9ro4gpvfj3rggvp` FOREIGN KEY (`MANAGERID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `department` */

insert  into `department`(`ID`,`NAME`,`NOTE`,`MANAGERID`) values (1,'æŠ€æœ¯éƒ¨','è´Ÿè´£æ–°æŠ€æœ¯çš„ç ”å‘',13);
insert  into `department`(`ID`,`NAME`,`NOTE`,`MANAGERID`) values (2,'å¸‚åœºéƒ¨','è´Ÿè´£å¼€æ‹“å¸‚åœº',14);
insert  into `department`(`ID`,`NAME`,`NOTE`,`MANAGERID`) values (3,'è¿è¥éƒ¨','è´Ÿè´£äº§å“è¿è¥',15);

/*Table structure for table `forum` */

DROP TABLE IF EXISTS `forum`;

CREATE TABLE `forum` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `NOTE` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `IMAGENAME` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `POSITION` int(11) DEFAULT NULL,
  `TOPICCOUNT` int(11) DEFAULT NULL,
  `ARTICLECOUNT` int(11) DEFAULT NULL,
  `LASTTOPICID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_5lmdo2auescrekpoilefwmqpc` (`LASTTOPICID`),
  CONSTRAINT `FK_5lmdo2auescrekpoilefwmqpc` FOREIGN KEY (`LASTTOPICID`) REFERENCES `topic` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `forum` */

insert  into `forum`(`ID`,`NAME`,`NOTE`,`IMAGENAME`,`POSITION`,`TOPICCOUNT`,`ARTICLECOUNT`,`LASTTOPICID`) values (1,'java','javaæŠ€æœ¯äº¤æµ','d:/oarun/image/forum/java_102.jpg',1,3,16,3);
insert  into `forum`(`ID`,`NAME`,`NOTE`,`IMAGENAME`,`POSITION`,`TOPICCOUNT`,`ARTICLECOUNT`,`LASTTOPICID`) values (3,'ç§»åŠ¨appå¼€å‘','androidï¼Œioså¼€å‘äº¤æµ','d:/oarun/image/forum/ç§»åŠ¨appå¼€å‘_103.jpg',3,0,0,NULL);
insert  into `forum`(`ID`,`NAME`,`NOTE`,`IMAGENAME`,`POSITION`,`TOPICCOUNT`,`ARTICLECOUNT`,`LASTTOPICID`) values (4,'å¨±ä¹ä¸“åŒº','å¨±ä¹äº¤æµï¼Œç•…æ‰€æ¬²è¨€','d:/oarun/image/forum/å¨±ä¹ä¸“åŒº_104.jpg',4,0,0,NULL);
insert  into `forum`(`ID`,`NAME`,`NOTE`,`IMAGENAME`,`POSITION`,`TOPICCOUNT`,`ARTICLECOUNT`,`LASTTOPICID`) values (5,'æ¸¸æˆäº¤æµ','æ¸¸æˆå¤–æŒ‚ï¼Œç ´è§£','d:/oarun/image/forum/æ¸¸æˆäº¤æµ_101.jpg',5,0,0,NULL);
insert  into `forum`(`ID`,`NAME`,`NOTE`,`IMAGENAME`,`POSITION`,`TOPICCOUNT`,`ARTICLECOUNT`,`LASTTOPICID`) values (6,'ç”Ÿæ´»','è®°å½•ç”Ÿæ´»çš„ç‚¹ç‚¹æ»´æ»´','d:/oarun/image/forum/ç”Ÿæ´»_105.jpg',6,0,0,NULL);

/*Table structure for table `leavebill` */

DROP TABLE IF EXISTS `leavebill`;

CREATE TABLE `leavebill` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DAYS` int(11) DEFAULT NULL,
  `CONTENT` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `LEAVEDATE` datetime DEFAULT NULL,
  `NOTE` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_hoknlijd7gi6wwb17qftd2t5w` (`userId`),
  CONSTRAINT `FK_hoknlijd7gi6wwb17qftd2t5w` FOREIGN KEY (`userId`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=627 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `leavebill` */

insert  into `leavebill`(`ID`,`DAYS`,`CONTENT`,`LEAVEDATE`,`NOTE`,`STATE`,`userId`) values (621,3,'å†™è®ºæ–‡','2015-04-25 00:00:00',NULL,2,18);
insert  into `leavebill`(`ID`,`DAYS`,`CONTENT`,`LEAVEDATE`,`NOTE`,`STATE`,`userId`) values (622,5,'æ—…æ¸¸','2015-05-01 00:00:00',NULL,1,18);
insert  into `leavebill`(`ID`,`DAYS`,`CONTENT`,`LEAVEDATE`,`NOTE`,`STATE`,`userId`) values (624,7,'å‡ºå»åŸ¹è®­','2015-05-03 00:00:00',NULL,1,18);
insert  into `leavebill`(`ID`,`DAYS`,`CONTENT`,`LEAVEDATE`,`NOTE`,`STATE`,`userId`) values (625,7,'æ¯•ä¸šç­”è¾©','2015-05-03 00:00:00',NULL,2,18);
insert  into `leavebill`(`ID`,`DAYS`,`CONTENT`,`LEAVEDATE`,`NOTE`,`STATE`,`userId`) values (626,10,'å›å­¦æ ¡ç­”è¾©','2015-05-19 00:00:00',NULL,2,18);

/*Table structure for table `mymail` */

DROP TABLE IF EXISTS `mymail`;

CREATE TABLE `mymail` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `SERVER` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `MAILFROM` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `MAILTO` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `SUBJECT` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `DATE` datetime DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_77gawxf1nd223cqsflqbnhe4w` (`userId`),
  CONSTRAINT `FK_77gawxf1nd223cqsflqbnhe4w` FOREIGN KEY (`userId`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `mymail` */

insert  into `mymail`(`ID`,`USERNAME`,`PASSWORD`,`SERVER`,`MAILFROM`,`MAILTO`,`SUBJECT`,`CONTENT`,`DATE`,`userId`) values (2,'79712553','911004zzl',NULL,'79712553@qq.com','zzlabc@foxmail.com','ä½ å¥½','å¤ªç´¯äº†','2015-04-19 23:07:21',18);
insert  into `mymail`(`ID`,`USERNAME`,`PASSWORD`,`SERVER`,`MAILFROM`,`MAILTO`,`SUBJECT`,`CONTENT`,`DATE`,`userId`) values (3,'79712553','911004zzl','smtp.qq.com','79712553@qq.com','zzlabc@foxmail.com','æ¯•ä¸šè®¾è®¡','å¥½å¥½å†™è®ºæ–‡','2015-04-25 16:53:35',19);
insert  into `mymail`(`ID`,`USERNAME`,`PASSWORD`,`SERVER`,`MAILFROM`,`MAILTO`,`SUBJECT`,`CONTENT`,`DATE`,`userId`) values (4,'79712553','911004zzl','smtp.qq.com','79712553@qq.com','zzlabc@foxmail.com','ä½ å¥½','åœ¨å—','2015-05-03 22:35:33',1);
insert  into `mymail`(`ID`,`USERNAME`,`PASSWORD`,`SERVER`,`MAILFROM`,`MAILTO`,`SUBJECT`,`CONTENT`,`DATE`,`userId`) values (5,'79712553','911004zzl','smtp.qq.com','79712553@qq.com','zzlabc@foxmail.com','ä½ å¥½','åœ¨å®¶é‡Œå—','2015-05-03 22:53:39',1);

/*Table structure for table `privilege` */

DROP TABLE IF EXISTS `privilege`;

CREATE TABLE `privilege` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `URL` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `NAME` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ICON` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `PARENTID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_nk8vxc180qag0lkklspt44ekf` (`PARENTID`),
  CONSTRAINT `FK_nk8vxc180qag0lkklspt44ekf` FOREIGN KEY (`PARENTID`) REFERENCES `privilege` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `privilege` */

insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (0,'','ä¸ªäººåŠå…¬','FUNC20001.gif',NULL);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (1,NULL,'ç³»ç»Ÿç®¡ç†','FUNC20082.gif',NULL);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (2,'role_list','å²—ä½ç®¡ç†',NULL,1);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (3,'department_list','éƒ¨é—¨ç®¡ç†',NULL,1);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (4,'user_getUsersByPage?pageInfo.currentPage=1&name=&age1=0&age2=99','ç”¨æˆ·ç®¡ç†',NULL,1);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (5,'role_list','å²—ä½åˆ—è¡¨',NULL,2);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (6,'role_delete','å²—ä½åˆ é™¤',NULL,2);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (7,'role_add','å²—ä½æ·»åŠ ',NULL,2);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (8,'role_edit','å²—ä½ä¿®æ”¹',NULL,2);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (9,'department_list','éƒ¨é—¨åˆ—è¡¨',NULL,3);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (10,'department_delete','éƒ¨é—¨åˆ é™¤',NULL,3);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (11,'department_add','éƒ¨é—¨æ·»åŠ ',NULL,3);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (12,'department_edit','éƒ¨é—¨ä¿®æ”¹',NULL,3);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (13,'user_getUsersByPage?pageInfo.currentPage=1&name=&age1=0&age2=99','ç”¨æˆ·åˆ—è¡¨',NULL,4);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (14,'user_delete','ç”¨æˆ·åˆ é™¤',NULL,4);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (15,'user_add','ç”¨æˆ·æ·»åŠ ',NULL,4);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (16,'user_edit','ç”¨æˆ·ä¿®æ”¹',NULL,4);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (18,NULL,'ç½‘ä¸Šäº¤æµ','FUNC20064.gif',NULL);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (19,'forumManage_list','è®ºå›ç®¡ç†',NULL,18);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (20,'forum_list','è®ºå›',NULL,18);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (21,NULL,'å®¡æ‰¹æµè½¬','FUNC20057.gif',NULL);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (22,'leaveApply_apply','æˆ‘è¦ç”³è¯·',NULL,21);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (23,'leaveApply_applyList','æˆ‘çš„ç”³è¯·è®°å½•',NULL,21);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (24,'leaveApply_taskList','å¾…åŠä»»åŠ¡',NULL,21);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (25,'leaveApply_hisTaskList','ä»»åŠ¡æŸ¥è¯¢',NULL,21);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (26,'sendMail_add','å‘é€é‚®ä»¶',NULL,18);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (27,'sendMail_mailList','å·²å‘é‚®ä»¶',NULL,18);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (29,'calendar_index','æ—¥ç¨‹ç®¡ç†',NULL,0);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (31,'role_setPrivilege','è®¾ç½®æƒé™',NULL,2);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (32,'userManage_list','åœ¨çº¿ç”¨æˆ·ç®¡ç†',NULL,1);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (33,'topic_delete','åˆ é™¤ä¸»é¢˜',NULL,20);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (34,'topic_setType','è®¾ç½®ä¸»é¢˜ç±»å‹',NULL,20);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (35,'reply_delete','åˆ é™¤å›å¤',NULL,20);

/*Table structure for table `reply` */

DROP TABLE IF EXISTS `reply`;

CREATE TABLE `reply` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT` longtext COLLATE utf8_bin,
  `FACEICON` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `POSTTIME` datetime DEFAULT NULL,
  `IPADDR` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `AUTHORID` bigint(20) DEFAULT NULL,
  `TOPICID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_nf8jehmnt1or2ueejyfyy2not` (`AUTHORID`),
  KEY `FK_h5701hoyxpl9grvmmib3e7401` (`TOPICID`),
  CONSTRAINT `FK_h5701hoyxpl9grvmmib3e7401` FOREIGN KEY (`TOPICID`) REFERENCES `topic` (`ID`),
  CONSTRAINT `FK_nf8jehmnt1or2ueejyfyy2not` FOREIGN KEY (`AUTHORID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `reply` */

insert  into `reply`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`AUTHORID`,`TOPICID`) values (1,NULL,'<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/0.gif\" alt=\"\" />å¥½å­¦å—ï¼Ÿ<br />',NULL,'2015-05-03 15:23:58','127.0.0.1',18,1);
insert  into `reply`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`AUTHORID`,`TOPICID`) values (2,NULL,'<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/15.gif\" alt=\"\" /><br />',NULL,'2015-05-03 15:25:31','127.0.0.1',18,1);
insert  into `reply`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`AUTHORID`,`TOPICID`) values (3,NULL,'<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/23.gif\" alt=\"\" /><img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/27.gif\" alt=\"\" /><span style=\"font-size: 36px;\"><strong><em><span style=\"color: rgb(153, 204, 0);\">å¤šæ•²ä»£ç äº†</span></em></strong></span><br />',NULL,'2015-05-03 16:56:29','127.0.0.1',1,1);
insert  into `reply`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`AUTHORID`,`TOPICID`) values (4,NULL,'<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/12.gif\" alt=\"\" /><img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/12.gif\" alt=\"\" /><img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/12.gif\" alt=\"\" /><br />',NULL,'2015-05-03 18:35:14','127.0.0.1',13,1);
insert  into `reply`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`AUTHORID`,`TOPICID`) values (5,NULL,'<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/15.gif\" alt=\"\" /><br />',NULL,'2015-05-03 18:35:28','127.0.0.1',13,1);
insert  into `reply`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`AUTHORID`,`TOPICID`) values (6,NULL,'<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/7.gif\" alt=\"\" /><br />',NULL,'2015-05-03 18:35:34','127.0.0.1',13,1);
insert  into `reply`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`AUTHORID`,`TOPICID`) values (7,NULL,'<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/10.gif\" alt=\"\" /><br />',NULL,'2015-05-03 18:36:11','127.0.0.1',19,1);
insert  into `reply`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`AUTHORID`,`TOPICID`) values (8,NULL,'<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/10.gif\" alt=\"\" /><br />',NULL,'2015-05-03 18:36:30','127.0.0.1',19,1);
insert  into `reply`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`AUTHORID`,`TOPICID`) values (9,NULL,'<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/15.gif\" alt=\"\" /><br />',NULL,'2015-05-03 18:36:36','127.0.0.1',19,1);
insert  into `reply`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`AUTHORID`,`TOPICID`) values (10,NULL,'<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/6.gif\" alt=\"\" /><br />',NULL,'2015-05-03 18:36:42','127.0.0.1',19,1);
insert  into `reply`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`AUTHORID`,`TOPICID`) values (11,NULL,'<font color=\'red\'>æ­¤å›å¸–å·²è¢«ç®¡ç†å‘˜åˆ é™¤</font>',NULL,'2015-05-03 18:36:48','127.0.0.1',19,1);
insert  into `reply`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`AUTHORID`,`TOPICID`) values (12,NULL,'<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/1.gif\" alt=\"\" /><br />',NULL,'2015-05-03 18:36:53','127.0.0.1',19,1);
insert  into `reply`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`AUTHORID`,`TOPICID`) values (13,NULL,'<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/44.gif\" alt=\"\" /><br />',NULL,'2015-05-03 18:38:26','127.0.0.1',19,2);
insert  into `reply`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`AUTHORID`,`TOPICID`) values (14,NULL,'<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/11.gif\" alt=\"\" /><img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/13.gif\" alt=\"\" /><img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/14.gif\" alt=\"\" /><br />',NULL,'2015-05-03 18:38:38','127.0.0.1',19,2);
insert  into `reply`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`AUTHORID`,`TOPICID`) values (15,NULL,'<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/11.gif\" alt=\"\" /><br />',NULL,'2015-05-03 22:32:30','127.0.0.1',1,2);
insert  into `reply`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`AUTHORID`,`TOPICID`) values (16,NULL,'<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/9.gif\" alt=\"\" /><img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/17.gif\" alt=\"\" /><br />',NULL,'2015-05-03 22:50:16','127.0.0.1',1,3);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `NOTE` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `role` */

insert  into `role`(`ID`,`NAME`,`NOTE`) values (1,'æ€»ç»ç†','ä¸»æŒå…¨é¢å·¥ä½œ');
insert  into `role`(`ID`,`NAME`,`NOTE`) values (3,'éƒ¨é—¨ç»ç†','è´Ÿè´£éƒ¨é—¨å·¥ä½œ');
insert  into `role`(`ID`,`NAME`,`NOTE`) values (4,'å‘˜å·¥','åšå¥½æœ¬èŒå·¥ä½œ');

/*Table structure for table `role_privilege` */

DROP TABLE IF EXISTS `role_privilege`;

CREATE TABLE `role_privilege` (
  `PRIVILEGEID` bigint(20) NOT NULL,
  `ROLEID` bigint(20) NOT NULL,
  PRIMARY KEY (`ROLEID`,`PRIVILEGEID`),
  KEY `FK_ly7yjw4jcn10wcn69tt078hr8` (`PRIVILEGEID`),
  CONSTRAINT `FK_ly7yjw4jcn10wcn69tt078hr8` FOREIGN KEY (`PRIVILEGEID`) REFERENCES `privilege` (`ID`),
  CONSTRAINT `FK_mj0txg37prfd4ji4r8dksgdu4` FOREIGN KEY (`ROLEID`) REFERENCES `role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `role_privilege` */

insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (0,3);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (1,3);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (1,4);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (2,3);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (2,4);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (3,3);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (3,4);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (4,3);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (4,4);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (5,3);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (5,4);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (9,3);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (9,4);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (13,3);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (13,4);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (18,3);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (18,4);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (20,3);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (20,4);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (21,3);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (21,4);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (22,4);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (23,4);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (24,3);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (25,3);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (26,3);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (26,4);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (27,3);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (27,4);
insert  into `role_privilege`(`PRIVILEGEID`,`ROLEID`) values (29,3);

/*Table structure for table `topic` */

DROP TABLE IF EXISTS `topic`;

CREATE TABLE `topic` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT` longtext COLLATE utf8_bin,
  `FACEICON` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `POSTTIME` datetime DEFAULT NULL,
  `IPADDR` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `REPLYCOUNT` int(11) DEFAULT NULL,
  `LASTUPDATETIME` datetime DEFAULT NULL,
  `authorId` bigint(20) DEFAULT NULL,
  `FORUMID` bigint(20) DEFAULT NULL,
  `LASTREPLYID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_qqgpn21ccxppju6b9wsg8wdl1` (`LASTREPLYID`),
  KEY `FK_hod0brmcn4vf791108lc54mk4` (`authorId`),
  KEY `FK_7k338rxg0on1e5onsikadbb1u` (`FORUMID`),
  CONSTRAINT `FK_7k338rxg0on1e5onsikadbb1u` FOREIGN KEY (`FORUMID`) REFERENCES `forum` (`ID`),
  CONSTRAINT `FK_hod0brmcn4vf791108lc54mk4` FOREIGN KEY (`authorId`) REFERENCES `user` (`ID`),
  CONSTRAINT `FK_qqgpn21ccxppju6b9wsg8wdl1` FOREIGN KEY (`LASTREPLYID`) REFERENCES `reply` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `topic` */

insert  into `topic`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`TYPE`,`REPLYCOUNT`,`LASTUPDATETIME`,`authorId`,`FORUMID`,`LASTREPLYID`) values (1,'javaå¥½å­¦å—','<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/0.gif\" alt=\"\" />å¥½å­¦å—ï¼Ÿ<br />','14','2015-05-03 15:23:58','127.0.0.1',2,11,'2015-05-03 18:36:53',18,1,12);
insert  into `topic`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`TYPE`,`REPLYCOUNT`,`LASTUPDATETIME`,`authorId`,`FORUMID`,`LASTREPLYID`) values (2,'å‹åŠ›å¥½å¤§å•Š','<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/44.gif\" alt=\"\" /><br />','10','2015-05-03 18:38:26','127.0.0.1',0,2,'2015-05-03 22:32:30',19,1,15);
insert  into `topic`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`TYPE`,`REPLYCOUNT`,`LASTUPDATETIME`,`authorId`,`FORUMID`,`LASTREPLYID`) values (3,'5.1','<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/9.gif\" alt=\"\" /><img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/17.gif\" alt=\"\" /><br />','8','2015-05-03 22:50:16','127.0.0.1',1,0,'2015-05-03 22:50:16',1,1,NULL);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LOGINNAME` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REALNAME` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `GENDER` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `PHONENUMBER` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `AGE` int(11) DEFAULT NULL,
  `IMAGEADDRESS` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `EDUCATION` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `NOTE` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `DEPARTMENTID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_63ctwa7e96gl83p5xkibcbvv2` (`DEPARTMENTID`),
  CONSTRAINT `FK_63ctwa7e96gl83p5xkibcbvv2` FOREIGN KEY (`DEPARTMENTID`) REFERENCES `department` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `user` */

insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (1,'admin','21232f297a57a5a743894a0e4a801fc3','è¶…çº§ç®¡ç†å‘˜','ç”·','17710267357','79712553@qq.com',24,'d:/oarun/image/user/admin_å›¾ç‰‡1.jpg','æœ¬ç§‘',NULL,NULL);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (13,'test1','e10adc3949ba59abbe56e057f20f883e','å¼ ä¸‰','ç”·','15512234455','444444@qq.com',22,'d:/oarun/image/user/test1_001.jpg','ç¡•å£«',NULL,1);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (14,'test2','e10adc3949ba59abbe56e057f20f883e','æå››','å¥³','18805328888','22222211@qq.com',27,'d:/oarun/image/user/test2_002.jpg','æœ¬ç§‘',NULL,2);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (15,'test3','e10adc3949ba59abbe56e057f20f883e','é©¬äº”','ç”·','11712345678','79874654@qq.com',33,'d:/oarun/image/user/test3_002.jpg','ç¡•å£«',NULL,3);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (16,'test4','e10adc3949ba59abbe56e057f20f883e','ç«ç‹','ç”·','11712345644','464654@qq.com',26,'d:/oarun/image/user/test4_004.jpg','ç¡•å£«',NULL,1);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (17,'test5','e10adc3949ba59abbe56e057f20f883e','å‘µå‘µ','ç”·','15678947894','123456@qq.com',35,'d:/oarun/image/user/test5_006.jpg','æœ¬ç§‘',NULL,1);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (18,'user1','e10adc3949ba59abbe56e057f20f883e','åˆ˜ç•…','ç”·','15644445555','46487485@qq.com',32,'d:/oarun/image/user/user1_007.jpg','å¤§ä¸“',NULL,1);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (19,'user2','e10adc3949ba59abbe56e057f20f883e','å°é©¬','å¥³','17878787878','797453465@qq.com',18,'d:/oarun/image/user/user2_008.jpg','å¤§ä¸“',NULL,1);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (20,'user3','e10adc3949ba59abbe56e057f20f883e','å°å¦¹','å¥³','16546845','64664654@qq.com',24,'d:/oarun/image/user/user3_009.jpg','å¤§ä¸“',NULL,1);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (21,'user4','e10adc3949ba59abbe56e057f20f883e','ç•™è¨€','å¥³','4565465','464654@qq.com',27,'d:/oarun/image/user/user4_010.jpg','é«˜ä¸­',NULL,2);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (22,'user5','e10adc3949ba59abbe56e057f20f883e','å¾ˆç´¯','å¥³','465465415','4654151651@qq.com',44,'d:/oarun/image/user/user5_002.jpg','åšå£«',NULL,2);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (25,'user8','e10adc3949ba59abbe56e057f20f883e','é˜¿é‡Œ','å¥³','4565465','545641@qq.com',28,'d:/oarun/image/user/user8_006.jpg','ç¡•å£«',NULL,3);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (26,'baidu','e10adc3949ba59abbe56e057f20f883e','ç™¾åº¦','å¥³','45666','456456456@qq.com',33,'d:/oarun/image/user/baidu_007.jpg','åšå£«',NULL,3);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (27,'taobao','e10adc3949ba59abbe56e057f20f883e','æ·˜å®','å¥³','11712345644','123456@qq.com',26,'d:/oarun/image/user/taobao_004.jpg','ç¡•å£«',NULL,3);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (28,'tencent','e10adc3949ba59abbe56e057f20f883e','è…¾è®¯','å¥³','15644445555','123456@qq.com',25,'d:/oarun/image/user/tencent_009.jpg','åšå£«',NULL,3);

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `ROLEID` bigint(20) NOT NULL,
  `USERID` bigint(20) NOT NULL,
  PRIMARY KEY (`USERID`,`ROLEID`),
  KEY `FK_8d8gxobeojjuioajgvad121ns` (`ROLEID`),
  CONSTRAINT `FK_8d8gxobeojjuioajgvad121ns` FOREIGN KEY (`ROLEID`) REFERENCES `role` (`ID`),
  CONSTRAINT `FK_l7n5esrvx2q2x4ug894jo8umk` FOREIGN KEY (`USERID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `user_role` */

insert  into `user_role`(`ROLEID`,`USERID`) values (3,13);
insert  into `user_role`(`ROLEID`,`USERID`) values (3,14);
insert  into `user_role`(`ROLEID`,`USERID`) values (3,15);
insert  into `user_role`(`ROLEID`,`USERID`) values (4,16);
insert  into `user_role`(`ROLEID`,`USERID`) values (4,17);
insert  into `user_role`(`ROLEID`,`USERID`) values (4,18);
insert  into `user_role`(`ROLEID`,`USERID`) values (4,19);
insert  into `user_role`(`ROLEID`,`USERID`) values (4,20);
insert  into `user_role`(`ROLEID`,`USERID`) values (4,21);
insert  into `user_role`(`ROLEID`,`USERID`) values (4,22);
insert  into `user_role`(`ROLEID`,`USERID`) values (4,25);
insert  into `user_role`(`ROLEID`,`USERID`) values (4,26);
insert  into `user_role`(`ROLEID`,`USERID`) values (4,27);
insert  into `user_role`(`ROLEID`,`USERID`) values (4,28);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
