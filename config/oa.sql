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

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('2',1,'LeaveBill.bpmn','1','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"LeaveBill\" name=\"LeaveBillprocess\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\"></startEvent>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <userTask id=\"usertask1\" name=\"提交申请\" activiti:assignee=\"#{userId}\" activiti:formKey=\"workflowAction_audit.action\"></userTask>\n    <userTask id=\"usertask2\" name=\"审批【部门经理】\" activiti:formKey=\"workflowAction_audit.action\">\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"com.oa.listener.ManagerTask\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"usertask3\" name=\"审批【总经理】\" activiti:formKey=\"workflowAction_audit.action\">\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"com.oa.listener.TopManagerTask\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"></sequenceFlow>\n    <sequenceFlow id=\"flow2\" name=\"提交申请\" sourceRef=\"usertask1\" targetRef=\"usertask2\"></sequenceFlow>\n    <sequenceFlow id=\"flow3\" name=\"批注\" sourceRef=\"usertask2\" targetRef=\"usertask3\"></sequenceFlow>\n    <sequenceFlow id=\"flow4\" name=\"批注\" sourceRef=\"usertask3\" targetRef=\"endevent1\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_LeaveBill\">\n    <bpmndi:BPMNPlane bpmnElement=\"LeaveBill\" id=\"BPMNPlane_LeaveBill\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"320.0\" y=\"60.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"320.0\" y=\"410.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"BPMNShape_usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"285.0\" y=\"130.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"BPMNShape_usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"285.0\" y=\"220.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"BPMNShape_usertask3\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"285.0\" y=\"313.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"337.0\" y=\"95.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"337.0\" y=\"130.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"337.0\" y=\"185.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"337.0\" y=\"220.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"48.0\" x=\"347.0\" y=\"185.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"337.0\" y=\"275.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"337.0\" y=\"313.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"347.0\" y=\"275.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"337.0\" y=\"368.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"337.0\" y=\"410.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"347.0\" y=\"368.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('2202',1,'LeaveBill.bpmn','2201','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"LeaveBill\" name=\"LeaveBillprocess\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\"></startEvent>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <userTask id=\"usertask1\" name=\"提交申请\" activiti:assignee=\"#{userId}\" activiti:formKey=\"workflowAction_audit.action\"></userTask>\n    <userTask id=\"usertask2\" name=\"审批【部门经理】\" activiti:formKey=\"workflowAction_audit.action\">\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"com.oa.listener.ManagerTask\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"usertask3\" name=\"再审批【总经理】\" activiti:formKey=\"workflowAction_audit.action\">\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"com.oa.listener.TopManagerTask\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"></sequenceFlow>\n    <sequenceFlow id=\"flow2\" name=\"提交申请\" sourceRef=\"usertask1\" targetRef=\"usertask2\"></sequenceFlow>\n    <sequenceFlow id=\"flow3\" name=\"批注\" sourceRef=\"usertask2\" targetRef=\"usertask3\"></sequenceFlow>\n    <sequenceFlow id=\"flow4\" name=\"批注\" sourceRef=\"usertask3\" targetRef=\"endevent1\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_LeaveBill\">\n    <bpmndi:BPMNPlane bpmnElement=\"LeaveBill\" id=\"BPMNPlane_LeaveBill\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"320.0\" y=\"60.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"320.0\" y=\"410.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"BPMNShape_usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"285.0\" y=\"130.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"BPMNShape_usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"285.0\" y=\"220.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"BPMNShape_usertask3\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"285.0\" y=\"313.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"337.0\" y=\"95.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"337.0\" y=\"130.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"337.0\" y=\"185.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"337.0\" y=\"220.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"48.0\" x=\"347.0\" y=\"185.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"337.0\" y=\"275.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"337.0\" y=\"313.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"347.0\" y=\"275.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"337.0\" y=\"368.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"337.0\" y=\"410.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"347.0\" y=\"368.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('2203',1,'LeaveBill.png','2201','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0o\0\0�\0\0\0��f�\0\0(mIDATx���l]�}?pk��M��n�����c#�Z)�kq�F<i+����?RK�JP5ZMSk6�JMkM-�[ˬM|�\nX*���@=I ̏�!���׍c��{r\r����{n����z����9�}���<o�{}�\0@���\0\0\0&M\0�>i\0��I�\0\0�O�\0�}�$\0\0�&\0h�4	\0@��I\0\0�\'M\0�>i\0��I�\0\0�O�\0�}�$\0\0�&\0h�4	\0@��I\0\0�\'M\0�>i\0��I�\0\0�O�\0�}�$\0\0�&\0h�4	\0@��I\0\0�\'M\0�>i\0��I�\0\0�O�\0�}�$\0\0�&\0h�4	\0@��I\0\0�\'M\0�>i\0��I�\0\0�O�\0�}�$\0\0�&\0h�4	\0@��I\0\0�\'M\0�>i\0��I�\0\0�O�\0�}�$\0\0�&\0h�4	\0@��I\0\0�\'M\0�>i\0��I�\0\0�O�\0�}�$\0\0�&\0h�4	\0@��I\0\0�\'M\0�>i\0��I��������]w�5<<<�����x���D�PH{�\0d�4	+�qj���sd�w�~౽�/�C?r�w������lܸq||<���U�$t�C�\r�!2N��׾\'�ڶ��SSSi��&���ܹ3����}|�YY��=�iӦ�۷�Ŵ�\0�,�&�s�Apdddll,Q���o�s������\\ڧ@fH��!�(�q�Ɖ����d��︟��ٴO�l�&�C���\\~�,��Joy�\ni:�Ν;/�\r��ڽ�����O��&!�:4000J.��p˽�ޛ����I��yq�����i��ǯ�����\04\'MB�MNN���u�m_ڵkWڧ��&MB�\r&}�d�ۓ���i�\"\0k�4	V(zzzV)J.׆\r����>Q\0�.i2l|||tttU���;v����}�\0�]�$d�������UM���}|pp0�`�&!Æ��z��UM��=z�5}i�(\0k�4	�J���S��tww�}�\0�]�$dXoo�7��j�����D@C	Ȱ�����&H�E2lU6�s�\0�B����}��j����S6lH�DX��IȰ]�v�vۗV5M�iu۶ϧ}�\0�]�$d���l__ߪ��-[��ٳ\'�`�&!�V�qN�>���S,�>K\0�.i�mU����7�w��)��I��m�b���o5�:y���k�雛�K�XӤIȼ�����nuc�TH��	>w㍻w?0J�p�����O�>�����I��	\n�\rB�:ΉwN�Q�G�>-\02@��133�8^~��܍7>��#i�\0� MB�8t������=����GRQ��I��Q\n�¦M�����L�#O�>��o|c���O�,�&����8M^{m���J���}���o��KqM{�\0d�4	�inn��_�rOO��n�1���=P� �=����n޺5n�m��ggg�2\0�$MB\'+��������ׯ���xO%\'&&\n�B�� äIȗ8Y�=\0:�4	����=\0!YW _�I\0²�@�H�\0�e]�|�&˺�\"M�u�E� ,�\n�4	@X��i���+�/�$\0aYW _�I\0²�@�H�\0�e]�|�&˺�\"M�u�E� ,�\n�4	@X��i���+�/�$\0aYW _�I\0²�@�H�\0�e]�|�&˺�\"M�u�E� ,�\n�4	@X��i���+�/�$\0aYW��MLL�!���{`` ��������gff�\Z\0�\'MB�{���jl޼yrr2��y�$t�b�x�UWUF�뮻����P(�=4\02O��\\���ۯ��r����[����\0�@���X�n�r�ܺuk___�XL{D\0ti��\'����+�4944��\0�\"MB�\\���i2�\0�9�Iȑ���8Mz0\0I��/�^@X��Y(�###���}}}�O̉�����������tiVݞ={�G������{_;z���B>+>��\'�{��m۶�?�8S�}q\0�\\�$��B�0::�e˖co��pAU։wNę2����ͥ}�\0h�4	�%��߽�;�U�z��6l�0;;����M�$�����R�<���c{ݴ�wҾ\\\0�I��U�gϞ-[nXX,�V�+_��;���E��$�W,����8>��xN�R�ϼ�~�u�	�E�$�7>>>::��x�\\��~��g�T��ڱ����Ҿt\0$&MBx��û�����\r[~\ZE?����8=7�?����p���/D�[��.F��F����a��/l�%�`�J={`z`` �K@b�$���������3����u:��,E�/F�^��Fџ�ŝ]?��o>������f��k���~�\\�����3\'���Ӿt\0$&MBx===�<��xz��x�b4�ҷ�.���G����7���/Fѩ�����݅�E�>�|)M��gu���\0d��J��T��/�,F\'�E.~РP(��7������7/=�{a)�PJ�O=�\\ձ�*i ���^)�_�.�ɋщ��[���(�0?��]]����鏶U�����csU�$@��!�R\"|�\\��t�<�y*z�|��ȏ֭[��+~�>���?�X�|��U�檤I�,2wCx�DX(W�幥���{�\'�G{�������ԯ��\'{~�����Qtz>:;��}��T���&���\r�ũhq�r-��8P���w!z���S�g���g7���=�U��.F\'�8O�{���csU�$@��!��D8�y��/��������\'�<y𕧞?�_O���ï?q���9��_�~�ï�����7���I\0Zg��Ji�����oi����M7U���&���\r���I���I�,2wCx����wTҒ&���\r���	���I�,2wCx�4��JZ�$@��!�R�|K%-i ���^)MΩ�%Md��&�I��0wCx�4��ըr�U�lҲ���\\�3�z��/\0���!�8]���jT��ʗh�r��������zg��� 1s7�W�[�W��=�Ļ:;�������Z�$@��!�R�z#l�K~}+iW+n��q�i_:\03wCx��ul5��sM«߬j��w�:ot��4	�E�n���~�\Z�Jϵm��4}��c���,�٥}�\0H��\r�j�j��R`m.�.WܮM��tj�$@F��!�R��qتH��٤}��;Wܮ[�Z勦}�\0H��\r�]�\\K��Q垗7>JxM��o�v�Z��Pg��� 1s7�W�\\��F�{^�h�BM\ZT�\\q�^�\\�S[~��/\0���!�R���jT��卺/�a��e�uR�`�Nm��/\0���!�R�:\Z�>LxG��~���G\r�[��Q��M�u�i_:\03wCx����JZ�$@��!�R�|U%-i ����4)M䇹S���+*iI�\0Yd��Ji�e���I�,2wCx�49���4	�E�n��&_RIK��\"s7����}�����U��&���\r�����������D%Md���\Z\Z��=�.E/��륙�����}�\0HL���v��96�\'��l�?��=::��� 1i�����������j�������L����4	��K�/EϫV��&�vdd(�@;�IX�bqp����\ZEϩ�57����Ӆ¾�/\Z\0�&a����\\;33E�T���d��������M�$�����8P����QtP����7������)�@��IX]�bqlltp�3��57�hP��OL���Ȗ���x;�K�e�&�gajjjt�z{������_\Z�!�i_\0�&!_<����Iȗ.����+�/���r��w���Q�ڝ�.@��!_���L�a���>^�b�\0��kȗ˿7��/٬��r��Zc�|i�ؚ$��Q�ѱ���vc �Lِ/�o�nW����c`�1wC�$J����F�����I��3_C�����N��º/��}ʤ�`�0eC�4ju�69�6D�=��w�ݘ�\"S6�K�w���P&��w�k;�&2Ĕ\r��^�l�ҽI�<3eC��J��wW�M:qo �Lِ/+���W{˰���+ާ����`\n�Zcʆ|�\0˺�\"M�u�E� ,�\n�4	@X��i���+�/�$\0aYW _�I\0²�@�H�\0�e]�|�&˺�\"M�u�E� ,�\n�4	@X��|q�����7z{{����ꙙ���@�I���|���\Z�7o���L{h\0d�4	��X,^u�U�Q�����-\ni\r�̓&!n���+����&o��ֱ���@\'�&!/֭[�%�n����W,�\0�@���x�\'����8M\r\r��$\0�H��#�_�r�L{ \0tirdnn.N�@@�$䋧��u~�����������`___��s\">��\'0<<<>>��D\0�A��U�gϞ8E�Q����l��׎����ϊ�=�	�޽{۶m��$Δi_\0.�4	��P(���nٲ���.,\\P�u�q��8sssi_(\0�\'M�j������w��΅�yըz��\r6��Φ}�\0h�4	�ett�%ϫ����G7m���/\0m�&aU�ٳg˖�����W�|ǎ��}�\0h�4	��ž��7��.,�S���3�_�ad�4	ፏ����.,�-���o�:�G�v��뱱��/\0�I���������(yÖ�Fя/F�.D/�G��G�O/�z���������Ѿ�ѣ��w��oI=إR��H����4	����9rpa��ruuu���3K���ѻ��Q�gqg�������/D��c��b��b��>W�=y&�u������/\0�I�^OO�;\'�/,�^�8 ���_���ťK�~�������Ϳ���Qtj1z!zw!*Dѣ�<_J���Y]��#@��!�R\"<U���3���sх�4(\n��o��y��K�^X�.�R�S�>Wul�J��\"s7�WJ��W�Ki�bt�l���h!�.���_{mW�\'���o��m��?p���\\�4	�E�n���/��;�\'�Eo���>�?�u��}⊟��O~j�?�&�y�@ձ�*i ���^)�yn)z�x������gf~k�g>����ɞ_���|�|�����_:p��3U�檤I�,2wCxq*Z\\|�\\�!)��/D�]��<���������Ϳ�{o�Go������(Γ��~���\\�4	�E�n�*n���K��?<3}h��3O|�����/����Ox��������{��?���y�ͩ�:i�֙�!�R�|�����[Z�C8x�MU檤I�,2wCx�4yR%-i ���ޥ4y����I�,2wCx�4yB%-i ���^)M����4	�E�n��&�RIK��\"s7�WJ�s*iI�\0Yd��Ii ?��^)M��n5�Vy�F���ʗ��b\'U6�\'ѰӾt\0$f���Tt��˵����\Zmԭ����ߨY�nk�\r��%���P�zڗ����^)3_����*����+�Y��W�\'Q㪝�����J�\0Yd��J�鍺U�[I���i���R���f�ZpU��/\0���!�Rf:V��a��h�Q��ƕ�����oUuX�O�+�^�y�����\rҾt\0$f��J��\'��r��ʍ�~����n����uk{h2���Uu^���c�j��� 1s7�W�&�伪��<���̚���i�(�6:5i����!�Rf�q�*����a̪�Y�IUUR��\"���I��C�z��Ө���\\� �K@b�n�RfZ�-W�[wD��6�6�Vm�G-o\'�9ѷ*;lrj�\\�&�K@b�n���^/W�+n/o|���U���g�^��Y��������hk��}�\0H��\r�2ӏ�V�o���>��n��G���k_qxU}�=��6͇Z�eڗ����^)3�[u��a̪nP����ּ����Û��n�Z+6H4�ʮҾt\0$f��JY�5���I�,2wCx�4��JZ�$@��!<iR��s7�����WTҒ&���\r����*iI�\0Yd��JirF%-i ���^)M����4	�E�n����ܹ�KK/�D%Md������{��,-Q�J��\"s7�744�{�]�^P��K3����O����4	��ܹsl�OR�g٪�{tt4�K@b�$�7;;����s��K�a�b\r_?99��� 1iV�]�l_��W�ԿM����P�\r�vH��*�����g���5��S�knno���}i_4\0�!M�j����vff2��FG�8vOM}\'��@��IXE���q�ܹ�O�蠪���o���MM�S�\n��I�����������g���jn��(:�\n��������-�Ã�vڗ��\"M�����������J]]==�42rC(Ӿ,\0 MB�x�#\0aI��/]�z!\0AYW _VL����u@g�@�\\~���A��3k\0�����V�+�ȗ߶^�v����\Z��������d�p�F�\0t0k\0�K{�tW�s�\0T�@���&��ݨi Ϭ�/�|n��e�C|n�H���	���V\Z\0����/I�d+w+�I�<�@�$���^�L�\'\0�\Z\0����&���H����I��3�C�H{\0�e]�|�&˺�\"M�u�E� ,�\n�4	@X��i���+�/�$\0aYW _�I\0²�@�H�\0�e]�|�&˺�\"M�u�E� ,�\n�4	@X��i���+�/�$\0aYW��MLL�!���{`` ��������gff�\Z\0�\'MB�{���jl޼yrr2��y�$t�b�x�UWUF�뮻����P(�=4\02O��\\���ۯ��r����[����\0�@���X�n�r�ܺuk___�XL{D\0ti��\'����+�4944��\0�\"MB�\\���i2�\0�9�Iȑ���8Mz0\0I��/�^@X��Y(�###���}}}�O̉�����������tiVݞ={�G������{_;z���B>+>��\'�{��m۶�?�8S�}q\0�\\�$��B�0::�e˖co��pAU։wNę2����ͥ}�\0h�4	�%��߽�;�U�z��6l�0;;����M�$�����R�<���c{ݴ�wҾ\\\0�I��U�gϞ-[nXX,�V�+_��;���E��$�W,����8>��xN�R�ϼ�~�u�	�E�$�7>>>::��x�\\��~��g�T��ڱ����Ҿt\0$&MBx��û�����\r[~\ZE?����8=7�?����p���/D�[��.F��F����a��/l�%�`�J={`z`` �K@b�$���������3����u:��,E�/F�^��Fџ�ŝ]?��o>������f��k���~�\\�����3\'���Ӿt\0$&MBx===�<��xz��x�b4�ҷ�.���G����7���/Fѩ�����݅�E�>�|)M��gu���\0d��J��T��/�,F\'�E.~РP(��7������7/=�{a)�PJ�O=�\\ձ�*i ���^)�_�.�ɋщ��[���(�0?��]]����鏶U�����csU�$@��!�R\"|�\\��t�<�y*z�|��ȏ֭[��+~�>���?�X�|��U�檤I�,2wCx�DX(W�幥���{�\'�G{�������ԯ��\'{~�����Qtz>:;��}��T���&���\r�ũhq�r-��8P���w!z���S�g���g7���=�U��.F\'�8O�{���csU�$@��!��D8�y��/��������\'�<y𕧞?�_O���ï?q���9��_�~�ï�����7���I\0Zg��Ji�����oi����M7U���&���\r���I���I�,2wCx����wTҒ&���\r���	���I�,2wCx�4��JZ�$@��!�R�|K%-i ���^)MΩ�%Md��&�I��0wCx�4���Z��喕����_���jleO��Z9�V�I�����S�ŋo֭��Z1qV[���j;�;�F�j�O���|U���� 1s7�W�L���4&~Р�}U�6k���u��I�I�|$���}�\0H��\r�2�����v���;?Lc5��htȊ���m�~\ZӖS�&�K@b�n��������&ۍ�V���n��U�Yw��U�W}��y5�he<�\rҾt\0$f��J��\'�j�?j��v�F�kվn�����������X��l��� 1s7��(�5�n%q6JoI�d�鶶�F��QW�$@g3wCx����rU~����Q�zg�UU�!����c_6\Zg��H�\0Yd��.e����jr#��t�R�ʮ\Zmԭ�궩�ݼe�0�;�`Ҿt\0$f��J���rU}Yw����Y×�x��~ݺ�Vm7�V��ϴ�Hj��}�\0H��\r�2ӏ�U�����0�}lO���q�� ���vX�~�6͇Q�eڗ����^)3-W՗�{>�VGk������\r�wռ�W�}��>���Ҿt\0$f��JY�5���I�,2wCx�4��JZ�$@��!<iR��s7�����WTҒ&���\r����*iI�\0Yd��JirF%-i ���^)M����4	�E�n����ܹ�KK/�D%Md������{��,-Q�J��\"s7�744�{�]�^P��K3����O����4	��ܹsl�OR�g٪�{tt4�K@b�$�7;;����s��K�a�b\r_?99��� 1iV�]�l_��W�ԿM����P�\r�vH��*�����g���5��S�knno���}i_4\0�!M�j����vff2��FG�8vOM}\'��@��IXE���q�ܹ�O�蠪���o���MM�S�\n��I�����������g���jn��(:�\n��������-�Ã�vڗ��\"M�����������J]]==�42rC(Ӿ,\0 MB�x�#\0aI��/]�z!\0AYW _VL����u@g�@�\\~���A��3k\0�����V�+�ȗ߶^�v����\Z��������d�p�F�\0t0k\0�K{�tW�s�\0T�@���&��ݨi Ϭ�/�|n��e�C|n�H���	���V\Z\0����/I�d+w+�I�<�@�$���^�L�\'\0�\Z\0����&���H����I��3�C�H{\0�e]�|�&˺�\"M�u�E� ,�\n�4	@X��i���+�/�$\0aYW _�I\0²�@�H�\0�e]�|�&˺�\"M�u�E� ,�\n�4	@X��i���+�/�$\0aYW _�I\0²�@�H�\0�e]�|�&˺�\"M�u:���D\"��������߫��zff&��y�$t�|����͛\'\'\'�\Z\0�\'MB�+�W]uUe����z{{�B�C �Iȅ�o���+�(��[o�ull,�A�	�Iȋu��-Gɭ[�����ŴG@\'�&!/�x�+��2N�CCC>1	@(�$����_��&�\0�C������Ӥ�4	����\0�e]�W,\'\'\'������\r\r\r�{������� \0�&MBǊCd� k�[^e``��{��+�\0�G��455�q��sd���>��\r@�I�(�bqtt����W���ݻxl����;�l�R�rxx�� i:���\\�-��n��kG�^XXlT\'�9��{����Iy�С�O�̐&�C����A�\n�����ȪLy�w�����N��\0�i:A�X��+y��-��ʺ������J��\r@+�I�###�(�{�mD����쁞���~�>-\02@��̛���̻����Ï�{۵kW�\'�Z\'MB�\r�?+y�Qr�ʟ�����J\0��&!�&&&ʿ:s��A���gʿ���/9�S`M�&!��\n%���ݷ�mOOOڧ��&MB�\n��gCݘ,�5�|𼡩���O��K��/��u�(��p�r�ccci�(\0k�4	�}��P��][��}|��7�}�\0�]�$d����r�{��G���׎-?�<�`�&!�������i2��2�>Q\0�.�dX�9>��I�DU�?�`�H@����/���Y�4Y���i�(\0k�E2������><J�x�GN�\"i2lttt9�}�{����Y�|`` �`�&!�v�ܹ��m�|�4y��˝����}�\0�]�$d���L���S�τM��6mZ�|||<�`�&!���>����w?0J�6+\ni�%\0k�4	�666���֯_����n�q�����O�5M��l+\n�B������|�|c�СCi�\"\0k�4	��k׮�����}��\nz���r<ݾ}{�\'�Z\'MB\'ظq�r������]�S�Ϭ_������\\�g�Z\'MB\'������)����l��7���dww���Tڧ@H��!��W��c��>�|ߓO�����ڵ+� �I�����;�˿���Ï�rK��[�*��\0�N���233���_\r�Ly�w�p�Hm���=�lٲ��qF��\r@\"�$t�B�p�]wuwwwճaÆF�\Z�k7\0$%MBg�s���h��Xkpppzz:�!�I�$t�b�811�ʁ������7<<|���	��&\0h�4	\0@��I\0\0�\'M\0�>i\0����@��g�\0\0\0\0IEND�B`�',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('3',1,'LeaveBill.png','1','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0�\0\0\0�aL$\0\0&dIDATx���olS����h��MʹnD{RW{�l�Z+��a�F2i[-�*�0K�ZP����.lj�ֲh�:4u�Zm�7OU�R�,+�ehƟ��.��6к��	\\;9��\\�������s�/}�n�s���՗��;-\0\0�E�\0\0\0o�\0\0��\0�p�=\0\0�#�\00a\0��{\0\0G�\0`8�\0\0��\0\0��\0�p�=\0\0�#�\00a\0��{\0\0G�\0`8�\0\0��\0\0��\0�p�=\0\0�#�\00a\0��{\0\0G�\0`8�\0\0��\0\0��\0�p�=\0\0�#�\00a\0��{\0\0G�\0`8�\0\0��\0\0��\0�p�=\0\0�#�\00a\0��{\0\0G�\0`8�\0\0��\0\0��\0�p�=\0\0�#�\00a\0��{\0\0G�\0`8�\0\0��\0\0��\0�p�=\0\0�#�\00a\0��{\0\0G�\0`8�\0\0��\0\0��\0�p�=`8�q����u���p���NyK,K�Ӻ��{�X2�e��|>�2�{{�l��Z�^z���{<����.Y����G���ahhhH.�e��P��d�׮�{V��~0����}�\0<A������-��3�|a�?0�t��իW;���\0(F��9�D��������3τB�T*��T\0�D���I�dɒX,v�I�>�/�I&��O�2�=`��o<�ݧ�e��|>`�0Awww#�ޗVo�p8���\0�A�Mohh(*L�|=���7n�}r\0 쁦\'�~��A�a?r���w�y20\0a4�x<��\'}�~�G6l�}�\0\ZE��-\n������mmm�O@�{�������V��>_�/�}�\0\ZB�M���\'\Z�z\Z�O�_��ե�D4�����ի7n��i�o��Z(�}�\0\ZB�M�����?u�H���N����hb�鮰.���|>�\'\n�!�=�����FN��4�e������a���7�%�TGM��7��=`�hb�h��M�<\r�]��,^�X��ha4�\r6<���<\r{�`bժ��>Q\0\r!�&�L&�~��a�����ק�D4�������wit����?|4;�hn�>��ۧ����>E\0�\"��&��~�ߋw��e��w�S���S�(�hz�X���+Y����L��{���ݢ0��8z���].�u�\0{��tz��Ū~S���2�O�>-\0j��!���{�Ѝ\'������_�}B\0�!�s\r\r����{\Zy�^>b ����Q���ҥK{�q�@�+�/��������>	\0���iǑa�pa@����Z���M������|�����G�fJ�R�<�Hkk��Wf���E/oټ���_�R�Y����dR�!�\na�L����x4\Zmooo���E&},K�Ӻ��{�.2�u��F�v�kz݇\0`����]{�B�=`��m؅�,D�v!����]{�B�=`��m؅�,D�v!����]{�B�=`��m؅�,D�v!����]{�B�=`��m؅�,D�v!����]{�B�=`��m؅�,D�v!����]{�B�=`��m؅�,D�v!�����b���x���F[[��w����DB���\r�=`��[���X�lY<�}h\0fa��q�y��&��E���>�N�>4\0�����v��9s�a�f͚��.�`���-,X�O��+W��~���}D\0f	a�b�Νs�Εa���ɫ��U{�\"˗/χ��0�{�\"�TJ�=�lC�v�Cu\0���lp\'�E\"�P(���K��n	y��\'�{zzx�0k{�s}}}2�d�o޼y��\'��\'2;K���	����Z�J�Ld��8�{�Cr�\Z�F;::FN�Ld&��:{|��I�R�/`8���L�`0����&2�T�z��/^�L&u_.�d�=����%�U�zm߱m�ү�\\��{�}}}+2Y�����O֯B�E�E��9����O�Nf�W�Zjt���E|\0\0��P���\'\Z�f���Z���\ZߜV��U�~�/��<�G{@�p8ܻ��ד~E�B�;)�gě��и�?�ݰ�WO_�;!�눽��uYl�*~����Ԟ�Z���@0�}�\03��z�@��у��X��z}T��)q1+.L��B��g��|��KV�Og�ȸ�*��8�/�~(����F���|>ݗ0a����z���Lv4_2�/O����oe���}�~�K_�����\nq)+.fą�H�m��\\؏�Y-|�/�\rZP/ؗܒ_�e��+bb���t�wO?��o�y��d2Sb\"� `ρCE�ZU�=�ZP/��sk:�\'�����Q�bb|<�paK�m--�����p�������{�#��^.�/��\Z_��߿$�\\����`����|�S����\ra���`ѾVax����v�-��)q��^ٟ�*v�K|���;>���[?��_^�*�踸<>�㮁}E�ZU�=�ZPO�V6��[��y1#>����̞#���޳���83.>t�G�2�w��W��UE���\0��;�l�᷎�?�J�L�>xl����}��#\'w���ۻ�=p�ؑ��=��M���_{���ah-@�\\�_(��z������}��hU��Gh-@�\\؟��-����7���z��<Bk����,Uo��Gh-@�\\؟��-�������z��<Bk���>E�[�=�ZP��\'�[\n�����(w�7�WY��o��E���Dk��К�|ߋrg.��JwW�aT߷҇�xwv�/`&ZP/���(w��-sc���a،��i��Gh-@�\\4�R[�����j��Z�׋s�}�\03�Z�z�D�ܙK�������-���.�ax����E�{^T-3��)�����7�2�0�g���f��\0�<��J1\\ҥ�]6�g�.}��ѩ��wh-@�\\\"���\nB�����4�����=�P|j�w���f��\0��q*�E�3�7�p����W|~���8����}�\03�Z�z�D<�E�3�7��Q��7θ]��\'���/ݗ0���K�w�(w��F�;��忬4a�I�xwj��u_:�L��^.��׵\0v��q�}}@�}Ko�4�t@��U���K�����%�	��\"���Z�z��?N�[�=�ZP��\'�[\n��\'Ckj�Uo��Gh-@�\\ؿM�[�=�ZP/�	��\"���Z�z�����{�#�����r���ԛT]E���\0��~�ɓ�NM��*�����������S�\r��z+�b �}�\03��z���]]?���U�y2\Z��t��{@�d2�u��?%�P5V8�<��t��{�릭���Z�o�_G\"��/\Z`,����8��=�U�R���]��.�\r0ax%�H���CT��I/��?��r&#�\rȼ�����Ҋǟ\n����}�\0������ꊆBw���\"��&� �N�;�U$����K���fC4����ϵ�����3��\n���/`���e,D�vi�#i����]j	{wL���77[�a�7�@��إް�qǺ&,{{���g�@�h\'�.���g����5rl\0n�إz�V	�z��Ҿ���gYx�����ʾ�T��h�z�\r�M��\0���u�)M���o�5{`V�N�]j�J1\\8I��.{G����=H\0���\0�T�Ѳ��*��f|ٽj|J�e=�:\n�K]O���뚰���K\'!���(�.7��G��nqt`Ua_�F��1A�IX����\0�̘�E\\��������������M��\0�����h{�.�=`!��aX���B�������h{�.�=`!��aX���B�������h{�.�=`!��aX���B�����b1��>�/ʍ��6��������C0{�|[�n-���˖-���\r�l ��9�3o޼¤_�h�\\ߧ�i݇`6��֮];g�7�׬Y��ե��\0���ł�I�r�J��/�����,!�[�ܹs�ܹ2�;;;y��\naXd������} \0faX$�Jɰ�w�m{�.|�`!��\r���b�H$\n��~��-!�]���pOOo�f\rax���O��L�͛7o߱����D&cg�s�?����U�Vɟ��|��axH.^��hGG�ȩ���UXgϝ��/8�TJ��G�^�I����Df��T/����ŋ�ɤ������\"�����JU��;�-]�5ݗ0ax�����cE&�P�ԣ?����O�h��{@=�q�~����L�\nUK��}�޾�\0\0<B�����D��L��[�:�Y��\n���֯�%��a��{���zү��@�w\'��xs\\\Z�G������{\'����.�mW��wy`���sWK��/`&�P/=z0�˗\\��\n16%.fŅ	qY����O|zɊ��#WE�\'�����c���y�ϧ��f\"��Z[[ϝ?�Ɏ�K���I1>9������/���/~��?�Y!.e�Ō��i!��;��Q;�����Ak����[�˱�8ELL~< �N���g����#�O�LfJL��9p�h_���<Bk���nM���8{Y|8*2BL��.li����w�wW��`ѾVax�����E��O�˕���ę�b��w,XpۜO~��;\"߻!��,�ת\"���Z�z��N�%��2%.8�+��WŎ}����}��p{�g���W��ǧw�5��h_���<Bk����f?r+�a2�/f�Gr}��s$���{�}�g�Ň�8���B���������{�#��^Q`��-=����GC�݃����9<���o�~����c�|{���;r��g������k]�0�������C���y߹ﾢ�*�������T�E���\0���~�Uo��Gh-@�\\؟��-������3T�E���\0�ra�!Uo��Gh-@�\\ا�z��<Bk���=pK��\0�ra�A٪�-��ҍ�����E�\Z\')���<u��K���ԓ�59�~�f� wX���Uv���W\ZVi���J\\xU�ҡ��wݗ0�������*�.-���l�X��q���X�1�x��=�ZP/i��V�o����v�4]Vߥ�^��J�x�Ect_:�L��^.�F�*��ג�������U��E�*��h�J;.{x��5�F����}�\03�Z�z�H{ϭ�/g�.�(��h���V~HQ�~Kg�rH��W4y�]�s�\0ݗ0��W\Z�Ub�(��e��Y�aD#�+=.�tj�=������w�*�����,��p��*ܥ����-3a���]�f(���<7w̅t_:�L���t�M%�*���8�\n�T�([�3��߮k溾U8a�S�~�Ect_:�L��^.�N�U�����k�X<�p|A|V���ae\',�{����{-G[:L���Dk��\"흲U�[����[ʎ�1A+�^����W4gٽjS�Pˎ�}�\03�Z�z�H.[e�u-�d�٪ϟ�.ݽ�1�\\j�us�T�/`&ZP/u\'�z��<Bk����8Uo��Gh-@=�n)������cT�E���\0�ra�6Uo��Gh-@�\\�\'�z��<Bk����-��\"���Z�z>��ʕ�SSoRuax������\'O�:5u���{�#��^gg�?�6N�7���ċ�@@���D��uwwwu�@{|6W����h4���f\"����d p�g��8B�X���x<���f\"�O���zJ�j���~�t�h��{���B��U�CT�J�vw�ӻt_4�X�=��D\".L$�BQ�J&�|T���������<400 ���B�J+*����I��G��r��+\Z\n����Tj��T:��X�W�HG8�ۺ/`>��\r�������>ׂ�����D\"+d��,�-{�.���aإ����C�v�1���77!\0��R�.��}��=p��E�4�5���j�X�.3>\'�\'j[���4���R�ʾl��Ĝ\0��E������{�=�thQ�.��}���+MB��8Z�K-�������͂���}��\0�-\nإް�e�O��8Z�K���/���sЋ�r�ً���Ko�e{��G[v!����]{�B�=`��m؅�,D�v!����]{�B�=`��m؅�,D�v!����]{�B�=`��m؅�,D�v!����]{�B�=`��m�/�Ɍ��|�`Pn�����ϟ�H$t\Z��@��ۺukK�e˖��q݇`6���Ǚ7o^a�/Z�H�����C0{�\nk׮�3g��k֬����}P\0f	a�b����_�r����}�G`���-v��9w�\\�����ZX��,�|��|��>\0���,�J�d��;�6�=`>T�m��qb�X$	�B~���]�.�p����7����<���\'CN&��͛���qbxx\"����˟@oo�U���DF��X��<$��h���c���Df�*�����ȗ?�T*��B�#��Ȥ��ozn\"3NU��^~i����dR��LF�^�k�\\�_����ۖ.�������<����ѱ\"�u�Z�џ�d��\'t_4�X�=���8~����d&{���F�>jo_�\0\0!��zzz��h&{٭e�߬��i�{YU������x����ý[�~=�Wt| Ļ��xF�9.�����\r[^{��Ž⿎��]�Ŷ�����<��A���Aݗ0a��=�Ɏ�K��G�����,ď�x�\'>�dE�tF�����\"�Y���r��1kt����}�\03��z����Ο�dG�%������Vvj��_�����?�۬���bF\\Ȉ���΅�����G�ޠ�\0�r�}�-��XV��\"&&?�N����O�����?O&3%&r�8T��UE���\0�r��?���~R��,>!&��������ﻫ\nw�?x�h_���<Bk����[�������K��U���;,�m�\'?u�������kU��Gh-@�\\`�ݒ_^����٫bǾ�W����_������八B������;�\Z�W��UE���\0�dhe����0��3�	����9�l��=˾��3��CG�q��q!�~��}E�ZU�=�ZP�(�C˖~���#�������������7_?rr����������9��3�t�����.a���˅���z�k�����w_юVax���˅�y��\"���Z�z�a?y���{�#��^.��R�ax���˅���\"���Z�z������{�#��^.�ST�E���\0�{����Z�z����ƪ4ؽ�t��*ݱ�[��V���tfݗ0��\'Ckr��J5�G��*m�2m�w�n��X�`�/�X�è^�=�ZP/r�+U�߭e�hǂ�-{IW;��yj<�JG2c��Gh-@�\\ȝ���.��J7*�2��3N[e�\n�j:��/`&ZP/r#U��j��������������_����Wڨ�x��Xt_:�L��^.�ޫR�f�.ܨ2s��Vڥ��һ+����e����c�}�\03�Z�z��}�}qXV��Z¾���t�sT���nA��^.�ޭR��n_K����9��V��ݽ$���G�C���\0��Cn*Y�����Tڨ>g�1e���,=�*�]����Sݗ0�����U�p�����k�Y<�p|A��W�}��+}��J�Q�Hf,������wj�J��ۯ��\r��c��0O�.�7�/{���~5�(t_:�L��^.�k����%e��{�.?�Ԍ�:��G���f��\0�r�w���{�#��^.�S�ax���#�	{��Bk��К�:F�[�=�ZP/�oS�ax���˅}���{�#��^.�ߢ�-��������\\985�&UW��Gh-@=����SSG����<Bk�uvv��o�x����J�t_:�L�=�^wwwW���gs՟{��F��/`&�P/�Lw]q�O�#T�/���/`&��ĺi���a���[�בH����<�8N(t���_�8DU�TjG pW:�K�E�E�^I$���D\".�U�d��GE����\\��{�C2ﻻ(�A������t_(�p�=�-�q������==�H��	1H�����~�t��!����#������~���s-hiim�L$�B���؂���{���]Z�HZ�>�=`���P�qsЎ.��xؗ�@��8Z�K#a_�Z�����2�s�y��%~)o�\Z@C�L�.u���f�M�	@/Z���=�_���M��RK�Wz\Z��$�=p��E���}��J��=�,�L�.��g_�\0\0zѢ�]�\r�Z���=p��E������\\��;\'\0�hQ�.7�(xy��^�n}�%`��m؅�,D�v!����]{�B�=`��m؅�,D�v!����]{�B�=`��m؅�,D�v!����]{�B�=`��m؅�,D�v!����]{�B�=`��m؅�,D�v!�����b���x���F[[��w����DB���\r�=`��[���X�lY<�}h\0fa��q�y��&��E���>�N�>4\0�����v��9s�a�f͚��.�`���-,X�O��+W��~���}D\0f	a�b�Νs�Εa���ɫ��U{�\"˗/χ��0�{�\"�TJ�=�lC�v�Cu\0����ǉ���֭�ák:;;�-===r���\0x���%3^|���	�7n����������,Y2c������>`*�0�\\�G��ҵ������w������c�wtt���|�`�0G*�*Z�?���NOd�����x����q��CCC�O�J�=`�d2)s�������1_�r������t�\0e{�����\\��Ƙ/�͛�OƼ����c��	\"������[n\"����`kkk~�P(���\0�A�M/�7��/��^~ŝmÆ\r�O��=�����:}�I�/�����6����[,s�n��i%ait����GyD�)ha4�P(��NI����M��Ӷ���>E\0�\"�&�N����U-�ݺ�Ώ����߯�D4���XOO����j�^�<�����K��ha4�իW��%��ھ���K�,�}�\0\ZB�M���3��/����?1<�~�����hb���T���_�}�\0\ZBM�}�\\��_W���>Q\0\r���&�a��ѣ^���Q��O@C�a���o�߾�5�I��y�j����X4\Z����yFyؿq�h~�`0��D4���Xwww>�W����r����HD��ha4�D\"�>�~itLm�/]�4?yOO����hn~��j�ȟ�/-�M�R:��}�\0\ZB�ͭ��+����\n�߾�����pX�)ha47��v�\r��Csw���.뇆�t�\"�F�@�۰aC>�}>_���;1<�>zX�z���\0a�`ɒ%�x�9�ȧ�]\Zkoow�J�R����=`�d2������}T�ȩ�n��|>��=`�0��f��v��~�ή�{�g�\r6�>!\0���9�񸻾��~~-�V.��_���\0I����H$ܿ��F�c�=^��rd���GGG�`�X�g����i����u��?XWd��ŕ��D��<�H�=`&��əQ(\Z�}�\0�B�&s\'����E������ƍY��#�\00a\0��{\0\0G�\0`8�\0\0��?d�.^�\"Y\0\0\0\0IEND�B`�',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('502',1,'LeaveBill.bpmn','501','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"LeaveBill\" name=\"LeaveBillprocess\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\"></startEvent>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <userTask id=\"usertask1\" name=\"提交申请\" activiti:assignee=\"#{userId}\" activiti:formKey=\"workflowAction_audit.action\"></userTask>\n    <userTask id=\"usertask2\" name=\"审批【部门经理】\" activiti:formKey=\"workflowAction_audit.action\">\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"com.oa.listener.ManagerTask\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"usertask3\" name=\"再审批【总经理】\" activiti:formKey=\"workflowAction_audit.action\">\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"com.oa.listener.TopManagerTask\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"></sequenceFlow>\n    <sequenceFlow id=\"flow2\" name=\"提交申请\" sourceRef=\"usertask1\" targetRef=\"usertask2\"></sequenceFlow>\n    <sequenceFlow id=\"flow3\" name=\"批注\" sourceRef=\"usertask2\" targetRef=\"usertask3\"></sequenceFlow>\n    <sequenceFlow id=\"flow4\" name=\"批注\" sourceRef=\"usertask3\" targetRef=\"endevent1\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_LeaveBill\">\n    <bpmndi:BPMNPlane bpmnElement=\"LeaveBill\" id=\"BPMNPlane_LeaveBill\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"320.0\" y=\"60.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"320.0\" y=\"410.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"BPMNShape_usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"285.0\" y=\"130.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"BPMNShape_usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"285.0\" y=\"220.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"BPMNShape_usertask3\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"285.0\" y=\"313.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"337.0\" y=\"95.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"337.0\" y=\"130.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"337.0\" y=\"185.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"337.0\" y=\"220.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"48.0\" x=\"347.0\" y=\"185.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"337.0\" y=\"275.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"337.0\" y=\"313.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"347.0\" y=\"275.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"337.0\" y=\"368.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"337.0\" y=\"410.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"347.0\" y=\"368.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('503',1,'LeaveBill.png','501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0�\0\0\0��\0\0*;IDATx���o��}?�S�Z媦��O���->5�l�A}F*�Jm8�_��=�E%QU%G+�jp��I�*A�M��^N\n!n��J\r���\r��\0;\\bL�a�������7�������Y���륏��ٙ���|�ٽ��\0\0��t�}\0\0\0Cr\0h��\0�(�	\0�Q�\0@�$\'\0�FIN\0\0���\0\0\Z�hr�\"��_\0t��?)��QN��y\0Љ�����4m�8\0��Pr�:�BB�t\0���H?A�ɼ@5���;\0T#9Qʼ@5���;\0T#9Qʼ@5���;\0T#9Qʼ@5���;\0T#9Qʼ@5���;\0T#9����X}��~�x�k����<�\0�i19��%����h��5��rJ��p�5%\'\0XS\"NN	��%��W��\0��E��>J\0����Ē{:�lq�(NE�/�Ns��Z[]z��+^ՒS�K|t���*��e��~ٶ��g\Z��tq��_<��Ƽ��a3�\0)������\\|\\~I�<\n�וn���8�TY�Lr���+/�+K��Fv/H�ɩ|���63�\0�R�ZW�S��L���rW�s�5�A\n�]����TV)9U|��狮]�KE��t�*�C���@�;��JN\0PM����Ͼ.�8/� TxX�k*\\)��R�yY�\0U!9Uy����A�_�H5���]z�ħu��ܥ��{�_Ws� ������UrE����|�V�[���^��qT}��kO��b>��k��St���|j��5��񽇒\0TsU�ӕG��w������S�K�o]��+���Qy֨~\"�����9����a3�\0)uu�Sp���+$ū/Ke?���>T����T�%\n#~�k_���?7��yX��T�w��}Z��;.�������;\0��{�ǭ֧k�0�\0P��7�	\0:��7�	\0:��D)�\0�HN�2�\0P��D)�\0�HN�2�\0P��D)�\0�HN�2�\0P��D)�\0�HN�2�\0P��D)�\0����h\n�t\0����D\n]���\0�����Opbp���N�g$\0@�$\'\0�FIN\0\0���\0\0\Z%9\04Jr\0h��\0�(�	\0�Q�\0@�$\'\0�FIN\0\0���\0\0\Z%9�\Z��f\'\'\'������������5�L&��$��Ya`\nRwww���{��O�}:_��{�odd���g�ƍ���q,@g��`\r:t����`����\\��=�ܶm200055��$��k�Ν;���ާ�f�����M�6m߾=���}\0�%9�����������2Sq}������>����`�c�ƍ\'&&�86>�Ǚ�����\0�Hr�5bdd���T��.O>�(\'9�Z�s��V>�+�ݻ���\0Gr��w�С���cS���·z(�H�	:^���x ��t��7���3;�b�t��������cS����v��Dr��688�쭛�������)$��,������)6�kÆ\r���q�(@RHN�����GGGۚ�رcll,�H\n�	:����z衶&���>=88��$��lhh�����J=v���>Q��������~�uz�Lwww�\'\n��t�����o�hkr\n��K�\0�������GG�HN\0W����7s�=\'�r�t����o?�p[�Ӿg�۰aC�\'\n��t�]�v�}��ۚ��d�m۟�}�\0I!9A������kkrڲe˞={�>Q��������K������d�ٸ� )$\'�lm���+_�j8xܧ� �t�l6���׎�:��?s�\r}sssq�\"@�HN��&&&nߺ�\'��@r��೷޺{��Ʀ9�~����g�>3�d��`-�d26l���\'�;Ʀ�ǎ�}Z\0�#9�\Z133��0��>{뭏O �$\'X;:�~��}�>�ʇta��\0���`M�d2�6m����N�w���tz��W����G~q�@rIN��d��09�xc���<�Hl������}��ü��$��k������������zk���x�$-�ky��ݾuk�Ͷm2;;�!t\0�	ֲl6;999::�~���˅k��411��d�>L��!9A��)*�C\0�`��KW���\\9=�Erh�\n�\"9�B�t��\0Z��B�HN\0��C!]$\'�V衐.�@+�PH�	�z(����\n=�Erh�\n�\"9�B�t��\0Z��B�HN\0��C!]$\'�V衐.�@+�PH�	�z(����\n=�Erh�\n�\"9�B�t��\0Z��B�HN\0��C!]$\'�V衐.�@+�PH�	�z(����\n=־���00uww������_���L܇�a$\'X�{챮2�7o������\0:��k_6����c�M7���ۛ�d�>4�#9A*�s�=�\\sM!9�u�]cccq@瑜 -֭[��M[�n����f�q@瑜 -�y�k��6LNCCC��pe$\'H��o�9���>�N%9A���ͅ���\0�����N�\0��C�j�f�###���}}}�wWJ����w`xxx||�=�N$9A��ٳ\'Lalz�G�ڻ��c�KK����w`���۶mߓ0?�=9\0͑���2�����-[��u|qiQ���N��)|s����(�FIN�.al\Z����Z\\ZP����=�aÆ��ٸ��!�����h.6�W�멽On��;qO@C$\'h�={�l�r��rV5R_��_����\'\r�>�	���f����:1��|N5R�g>X��&7��Or�荏����.-�-���o�����JU���7�1�|�Doxxx���q)6ݲ�gA��K�+�K����]�>��>��o6x>�;<y>��}���~g�!&�z�����@�SP������?r����|uuu�����������l��_���s����K�����`6]��×r��Τ��Ϝ���{�\0ꐜ z===�:��<��0��,\\X}jye���>����W|e9N/.�/� x�s�i>���/�\0��OA�r��t�g��S��m��d���������۫7�\\Z	s��_*�7U%9ɧOA�r���\n���.\'���KA�����]]���폶�����}SU��|�D/�~>,T�ӺS炷O����u�>v�����?1�Ǘ%�^<P�o�Jr�O�����O�P��s+����kN\'�{_������į���{~������A0��]X�q��%���$\' ��)�^�\0��?(T>���å������K��]�۟������B�N6x7�Z����J�MUIN@��S���3�y�˯��������g�<{���^>�_Ͽ���o>s���9�ڳ_�~���o���z����Ǟ`$\'�j�)�^.9�_\\��ܝ��@�o��d�T��$�>��%�S�ْ���ӧ z����{�ْ���ӧ z��tR5[��|�D/���U͖�$�>��%�wT�%9ɧOA�r�iN5[��|�DOr����J�������Q��KnUc����}gT�*qO@�D/L\0.�ݎ*�\\��^��è�o�;v����:�:�)�^.[�hGF.�2VVJ<u6���m-�	H>}\n���oE[�RΥ����r#�ێs�{�\0�Ч z�xq�U�,�Tެd���%�Wۥ}%9ɧOA�r9��FF.ߦdM�O�.ۥ�f��]�SP�>�kk���iJOy���.���6���t}\n���?����e+kl_m��u�+E��O��E�:�:�)��j�X�mGF�/\\J357.__�c�*/Tw̨�.��C�����ś�����\Z/Tc��u�+����Z���:�:�)�^.^��U9�P�.���\rXm��\r�wj���:�:�)�^.^��.��c�/�ti�\Z�����}�5Ə��:�:�)�^.^U͖�$�>��%�7T�%9ɧOA�$\'�	X��)�^�\0VV^W͖�$�>��%��T�%9ɧOA�r�iF5[��|�D/��^U͖�$�>����>w����+������ӧ z}}}o�����#������ӧ zCCC����J�#�x�:���������	��s�α�?�=�tV������qO@�Dovv������W�ê�\Z�yrr2��Cr�������e�H���ߍ��=i\0�IN��lvp�����/��57������̾�\'\r�>�	�efff`�ƙ�� 8��U�95�����!�����t�v��� 8��kr���}SS��D4Jr���f�cc����\Z�빹\'����d�{b�oGF���qO@$\'�\Z���FG����W���������[����\04Mr�tq�$�VHN�.]��	@�PH�F�Sa��Oٮl�j������ӧ ]�MNuwlj���}��\0W�����5��_\0��Y+�/}\nҥv:��r��5����ɝN@GО ]Z��Tq�Ɵ-��c��>��Trjj��T�Ӻ.�s:����`*��i����*�P#ן�=H�XhO�.�CI��=5v)L�j�;���Ӟ ]��$���SS6�i]� ��X��˕%��[������Ur*�zT7`��5\'�ShO�.uCII�)�T����ן*�o<��K{�tJ\0Z��B�HN\0��C!]$\'�V衐.�@+�PH�	�z(����\n=�Erh�\n�\"9�B�t��\0Z��B�HN\0��C!]$\'�V衐.�@+�PX�&&&�����=00.�����^��333q\Z@���`�{�Ǻ�l޼yrr2�C�0��}�l���+�M7�tSooo&����\0:���p�=�\\s�5��t�]w����}P\0�Gr��X�n]>6mݺ���/���}D\0�Gr��x�g����09\r\r\r������ En���|r��@\0:��)277&\'7#\0�b���;a�B��!��NLL��������])%�s߁�����q�D\0:��m�gϞ01���Gyj�ޣǎ-.-���s߁ݻwo۶-|O����\04Gr�6�d2���[�l9���ťEU\\\'�;��͙���{�\0\Z%9A���i``��kqiAU�ǿ���\rfgg�.��HN�.�����t^ծ��>�i���=]\0\r���-��ٳe�-K�Y�H}�K�cǗ�4��$\'�^6����{�����9�H͟�`����h\nH>�	�7>>>::��|�P��~����/�+U�c���#�@�IN����ݏ�ǥ�t˖��O.o,�,/-��w=��N|��b����l��l������c�����X���qO@�D����ȑ�K�g����5gV������A��y_�����[�O,�����lpt9��_�]v:�?s���;��Cr������w����|��0t�B�pa���������o��_=�� 8�|���d���^�%��tV��$�>�˥�Ӆ\n�YN�/|�A&���������o��ri%X�%��^|�d�T��$�>�˥��+�jr��<�3,���B��7vu}�����?�V���K�MUIN@��S�\\���P�O�N��>�{>����֭��5?����_��^x�@ɾ�*�	H>}\n��K?�B�ϭ�gW�9�<�}a�����k���o��w���Bpvau�}�/�웪����ӧ zaX^��P�@������O/=wxv�oz���޻�;���lpj!�Ӿ�_(�7U%9ɧOA�J����M/�����3Ӈf�=0���ן{��=����́����k�|m���������۷�{���\0�ѧ z���~q}�sw6r�?��SU��|�D/��N�fKr�O���&��fKr�O�����I�lIN@��S�\\rzW5[��|�D/���Q͖�$�>��%�9�lIN@��S=�Ir�*}\n��KN?�X՞*�/_����o�K�kp��k���a�=u\0u�S�0\\��v������Y���Uq���mVm���j\\�5�ڡV|����}\n���\'�U�\\^�gY(ٱ(�T��8Mm\\���cn�h%\' ��)�^.�U�*>U�*.mP�Pm�j�75`�]*�U�Y��d����}\n����U1X\\���)߸x}I��^�Tɀ%�T۱x㊇W~^u\Z<��qO@�D/�~Z��u��J�)�������떏P���d����>�\r�:�:�)�^yr��iJRE���x\n���ZٸZȫvj����S�\\>�I��V\\�)JWRRŻ��/�/�1ra��J�T�ʎ�x����}\n���VfU��G1�h�j�|����M���S��8��\\�M�SP�>���7U���r~�b�(ݬx��,R��7�8`��k�U��9����:�:�)�^.��bU{���b��lM��/�#Uח�^��JƬ�W#��>Ԋ[�=u\0u�S�\\>8V�*>u1R�nP�6*�V{��r��5������n��1��ԡOA�r��j�$\' ��)�^.9���-�	H>}\n�\'9IN�Z�OA�����j�$\' ��)�^.9���-�	H>}\n��KN3�ْ���ӧ z����j�$\' ��)�^ww��sWV^QM��$�>����{����QM��$�>�\Z\Z����V����ՙ�����=u\0uHN��;w���i�Y���_��{�\0ꐜ z������<�ݿV\r���͓��qO@�������/�F��\'�ndd(�I�Or���f�������� xIծ�������d��=i\0�IN�.3337��L�!U���F̩�o�=]\0\r���������s��AU^��_����\'\n�Q��W6�����_��=T&��;2�exx0\\�{�\0� 9��0555:�����EWWO�/��������i���{&�Br�t��N\0Z��B��MN�\r��l@��D˃ti=9�� <��A����\Z�\n��i�.u?z�\Z��T�=G\r���KSל*�+`��� ]��Ӻ�|�	H3�ҥ��T�Ӻj�HN@z�w�.�|ϩd�j����B��K��sjd�5C��ti695rJr�C��ti�w�JY��1����\n��}��|��:���A�H6\0��C!]$\'�V衐.�@+�PH�	�z(����\n=�Erh�\n�\"9�B�t��\0Z��B�HN\0��C!]$\'�V衐.�@+�PH�	�z(����\n=�Erh�\n�\"9�B��obb\"L����Booo����_?33��t�	־�{����͛\'\'\'�>4�#9�ڗ�f�����t�M7���f2��\r��HN�\n��s�5�\\SHNw�u���X��y$\'H�u���c�֭[�����l�G�y$\'H�g�y��k�\r���Аo8\\�	R��o�\'���SIN�\"sssarr3�+&9A��&@+�P�\Z�����������`___�ݕR\"<��wO�IN�v{��	C�y䑧��=z����R:+<��ؽ{��m���$�OqO@s$\'h�L&3::�e˖�o_\\ZT�u�a~\nߜ����\'\n�Q��K�����T�z�{�oذavv6��h���2::��M�U�zj6�N����	�bϞ=[�ܲ��U����;v|9�I�Or��e�پ���N�.-�S����֯�ɍ��䓜 z��㣣�K�g�y������RU;v��?B$������\\�M�l�Y��B��R��B��B�~yףO��ć�/��\r����O��q��;��{���^<0=00���!9A�����9��|&_]]]�Apf%�p9x18���u��/n�e��Rp|!8~>��G������e�3)��3�����:�:$\'�^OO�{�N,-��+Cg/V�Z^Y���O����o��_Y�����K��KA&�|��\\r�Ogu��0@��S�\\�9]�����Թ`��Gd2���7���_?���M �V��\\�z�ŗJ�MUIN@��S�\\���B�&��ɳ�;��R,.,��xcW�Ǻ��o��m�;�?p�d�T��$�>�˥�����Թ�������G~�nݺ�]����O���e���웪����ӧ z���)T���J�~v�������f~k��>���_��~�|�/gVw�7�Bɾ�*�	H>}\n�&���\n�ax�p)�`1x���s�g����7��ｻ��\r����0;�{���}SU��|�D�$�n���o�?<3}h��3�|�����������x�����צ_z��?}��}��\'�	�\Z}\n��KN���>wg#7���n+�1U%9ɧOA�r��j�$\' ��)��jr��j�$\' ��)�^.9�T͖�$�>��%�wU�%9ɧOA�r���lIN@��S�\\r�S͖�$�>ѓ�$\'`�ҧ z����|ս�Sa��]�W�/_h��wldM��\Z9�FƉ{�\0�Ч za�p��U��d��j�U>H�#�vT5�)~X��jF�+�=u\0u�S�\\>8Q����\r��/���j,T{ݦ��ƀ�X�#)?��C������[�*~Xm����+/&�K�/Tۥ��u��1N�����l��ԡOA�r��x���X�~�t��gK^�d̊�m_2~�S�Ϋ�B#�S�A�SP�>��僟�f*��M���%�U���W۾��j�P��5~<��=u\0u�S�j��r#�ZRi695���G��\r%9k�>��僟���/_��+�_���wi�.@�=�v����$�>�[�+���q��$Qo�⡪-T��*nSq����Q㰛:����}\n���o��a��M-�.��/qy�)}݊��,W{���ϴ⑔o��ԡOA�r��ǅ*y�����5��<�\\6NŃ,�[>`��u��}��{�\0�Ч z�|p�P%�k.ƈc�Uq}�������e������n�����ԡOA�r��j�$\' ��)�^.9���-�	H>}\n�\'9IN�Z�OA�����j�$\' ��)�^.9���-�	H>}\n��KN3�ْ���ӧ z����j�$\' ��)�^ww��sWV^QM��$�>����{����QM��$�>�\Z\Z����V����ՙ�����=u\0uHN��;w���i�Y���_��{�\0ꐜ z������<�ݿV\r���͓��qO@�������/�F��\'�ndd(�I�Or���f�������� xIծ�������d��=i\0�IN�.3337��L�!U���F̩�o�=]\0\r���������s��AU^��_����\'\n�Q��W6�����_��=T&��;2�exx0\\�{�\0� 9��0555:�����EWWO�/��������i���{&�Br�t��N\0Z��B��MN�\r��l@��D˃ti=9�� <��A����\Z�\n��i�.u?z�\Z��T�=G\r���KSל*�+`��� ]��Ӻ�|�	H3�ҥ��T�Ӻj�HN@z�w�.�|ϩd�j����B��K��sjd�5C��ti695rJr�C��ti�w�JY��1����\n��}��|��:���A�H6\0��C!]$\'�V衐.�@+�PH�	�z(����\n=�Erh�\n�\"9�B�t��\0Z��B�HN\0��C!]$\'�V衐.�@+�PH�	�z(����\n=�Erh�\n�\"9�B�t��\0Z��B�HN\0��C!]$\'�V衐.�@+�PX�&&&�����=00.�����^��333q\Z@���`�{�Ǻ�l޼yrr2�C�0��}�l���+�M7�tSooo&����\0:���p�=�\\s�5��t�]w����}P\0�Gr��X�n]>6mݺ���/���}D\0�Gr��x�g����09\r\r\r������ En���|r��@\0:��)277&\'7#\0�b���;a�B�5.��NNN�����Ã\r\r\r�k�������>@�N\"9���0-�������C=�W�\0\Z!9�\Z455�q�ƺ��X__�_��Kr�5%�͎���_U����{��O�}�P��{ߖ-[J�vcq�\Z$\'X;���J.5�}��;���\\�N�w�>�����O���T\0Jr�5bvv6=�\0444T;3��{ｯ�oww���t�\'�D���l��j�;v4����G�_��\nW���@9�	ւ���Blڽ��+�M���⁞���8���q�@�HN��&\'\'[��T\\���h�v���\0�Er��700P�nS��)_��<�����@1�	:���D�k���:Ir:=���v_���>E�����\rn@Il�׷~8?lOOOܧ� �t�L&S�NRT�\nu�\r��`jj*�H\n�	:���x��ࢍMa�qǝ������>Q������m߾=�_�+���>�|�ƍq�(@RHN����������=yr:z�Xᮘq�(@RHN��\n�#���ȓSX�/Q�}�\0I�!B+�;��?Q�TƏ�D�BC���ߟO6?:r�ɩ�g��>Q�����n���ާ#�M\'�;�N\0%$\'�`����p��<9��ȑ��q�(@RHN��v�ܙ7۶�I���;򃏌��}�\0I!9A���)|�vz�L��iӦM������>Q��������}�7Rv�~4��T��S(���}�\0I!9Ag�����Gx�鳷ޚvxx8�SH�	:[&�)�u)�������\n�:�)$��o׮]��������	�;V�b۷o���\0�Er��`�ƍ����V�\'~z�����C����}f\0�\"9�Z0;;���SH<W�g쎿u���������>-�đ�`��N��Ia�i�ޘ��}��!]h׮]q�@IN�vLNN�<�����=�ȥ�۷n�*\"6T#9��233S�3���t����I�00}���l�R�q�|HP��kM&���������*ٰaC��FFF|%�6�	֦0�p]������q2@��`-�f�a�\Z(IK}}}���=���L\0���\0\0\Z%9\04Jr\0h��\0�(�	\0�Q�:��r�7	�\0\0\0\0IEND�B`�',0);

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
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2404','LeaveBill:3:2204','2401','2401','usertask1','2405',NULL,'提交申请','userTask','user1','2015-04-25 19:17:44','2015-04-25 19:17:44',347);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2407','LeaveBill:3:2204','2401','2401','usertask2','2408',NULL,'审批【部门经理】','userTask','test1','2015-04-25 19:17:44','2015-04-25 19:20:01',137358);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2411','LeaveBill:3:2204','2401','2401','usertask3','2412',NULL,'再审批【总经理】','userTask','admin','2015-04-25 19:20:01','2015-04-25 19:20:33',32240);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2415','LeaveBill:3:2204','2401','2401','endevent1',NULL,NULL,'End','endEvent',NULL,'2015-04-25 19:20:33','2015-04-25 19:20:33',0);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2417','LeaveBill:3:2204','2416','2416','startevent1',NULL,NULL,'Start','startEvent',NULL,'2015-04-25 19:29:10','2015-04-25 19:29:10',0);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2419','LeaveBill:3:2204','2416','2416','usertask1','2420',NULL,'提交申请','userTask','user1','2015-04-25 19:29:10','2015-04-25 19:29:10',888);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2422','LeaveBill:3:2204','2416','2416','usertask2','2423',NULL,'审批【部门经理】','userTask','test1','2015-04-25 19:29:10',NULL,NULL);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2502','LeaveBill:3:2204','2501','2501','startevent1',NULL,NULL,'Start','startEvent',NULL,'2015-05-03 17:06:02','2015-05-03 17:06:02',32);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2504','LeaveBill:3:2204','2501','2501','usertask1','2505',NULL,'提交申请','userTask','user1','2015-05-03 17:06:02','2015-05-03 17:06:03',1176);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2507','LeaveBill:3:2204','2501','2501','usertask2','2508',NULL,'审批【部门经理】','userTask','test1','2015-05-03 17:06:03','2015-05-03 17:07:05',62290);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2511','LeaveBill:3:2204','2501','2501','usertask3','2512',NULL,'再审批【总经理】','userTask','admin','2015-05-03 17:07:05',NULL,NULL);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2602','LeaveBill:3:2204','2601','2601','startevent1',NULL,NULL,'Start','startEvent',NULL,'2015-05-03 22:33:23','2015-05-03 22:33:23',28);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2604','LeaveBill:3:2204','2601','2601','usertask1','2605',NULL,'提交申请','userTask','user1','2015-05-03 22:33:23','2015-05-03 22:33:23',761);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2607','LeaveBill:3:2204','2601','2601','usertask2','2608',NULL,'审批【部门经理】','userTask','test1','2015-05-03 22:33:23','2015-05-03 22:34:06',43523);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2611','LeaveBill:3:2204','2601','2601','usertask3','2612',NULL,'再审批【总经理】','userTask','admin','2015-05-03 22:34:06','2015-05-03 22:34:35',29814);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2615','LeaveBill:3:2204','2601','2601','endevent1',NULL,NULL,'End','endEvent',NULL,'2015-05-03 22:34:35','2015-05-03 22:34:35',1);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2617','LeaveBill:3:2204','2616','2616','startevent1',NULL,NULL,'Start','startEvent',NULL,'2015-05-03 22:54:41','2015-05-03 22:54:41',0);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2619','LeaveBill:3:2204','2616','2616','usertask1','2620',NULL,'提交申请','userTask','user1','2015-05-03 22:54:41','2015-05-03 22:54:41',638);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2622','LeaveBill:3:2204','2616','2616','usertask2','2623',NULL,'审批【部门经理】','userTask','test1','2015-05-03 22:54:41','2015-05-03 22:55:59',78470);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('2626','LeaveBill:3:2204','2616','2616','usertask3','2627',NULL,'再审批【总经理】','userTask','admin','2015-05-03 22:55:59','2015-05-03 22:56:37',38285);
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

insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('2410','comment','2015-04-25 19:20:01',NULL,'2408','2401','AddComment','好的','�õ�');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('2414','comment','2015-04-25 19:20:32',NULL,'2412','2401','AddComment','批准','��׼');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('2510','comment','2015-05-03 17:07:05',NULL,'2508','2501','AddComment','批准，注意安全','��׼��ע�ⰲȫ');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('2610','comment','2015-05-03 22:34:06',NULL,'2608','2601','AddComment','可以','����');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('2614','comment','2015-05-03 22:34:35',NULL,'2612','2601','AddComment','允许','����');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('2625','comment','2015-05-03 22:55:59',NULL,'2623','2616','AddComment','可以吧','���԰�');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('2629','comment','2015-05-03 22:56:37',NULL,'2627','2616','AddComment','批准','��׼');

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

insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2405','LeaveBill:3:2204','usertask1','2401','2401','提交申请',NULL,NULL,NULL,'user1','2015-04-25 19:17:44',NULL,'2015-04-25 19:17:44',294,'completed',50,NULL,'workflowAction_audit.action');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2408','LeaveBill:3:2204','usertask2','2401','2401','审批【部门经理】',NULL,NULL,NULL,'test1','2015-04-25 19:17:44',NULL,'2015-04-25 19:20:01',137350,'completed',50,NULL,'workflowAction_audit.action');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2412','LeaveBill:3:2204','usertask3','2401','2401','再审批【总经理】',NULL,NULL,NULL,'admin','2015-04-25 19:20:01',NULL,'2015-04-25 19:20:33',32233,'completed',50,NULL,'workflowAction_audit.action');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2420','LeaveBill:3:2204','usertask1','2416','2416','提交申请',NULL,NULL,NULL,'user1','2015-04-25 19:29:10',NULL,'2015-04-25 19:29:10',883,'completed',50,NULL,'workflowAction_audit.action');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2423','LeaveBill:3:2204','usertask2','2416','2416','审批【部门经理】',NULL,NULL,NULL,'test1','2015-04-25 19:29:10',NULL,NULL,NULL,NULL,50,NULL,'workflowAction_audit.action');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2505','LeaveBill:3:2204','usertask1','2501','2501','提交申请',NULL,NULL,NULL,'user1','2015-05-03 17:06:02',NULL,'2015-05-03 17:06:03',1134,'completed',50,NULL,'workflowAction_audit.action');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2508','LeaveBill:3:2204','usertask2','2501','2501','审批【部门经理】',NULL,NULL,NULL,'test1','2015-05-03 17:06:03',NULL,'2015-05-03 17:07:05',62286,'completed',50,NULL,'workflowAction_audit.action');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2512','LeaveBill:3:2204','usertask3','2501','2501','再审批【总经理】',NULL,NULL,NULL,'admin','2015-05-03 17:07:05',NULL,NULL,NULL,NULL,50,NULL,'workflowAction_audit.action');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2605','LeaveBill:3:2204','usertask1','2601','2601','提交申请',NULL,NULL,NULL,'user1','2015-05-03 22:33:23',NULL,'2015-05-03 22:33:23',738,'completed',50,NULL,'workflowAction_audit.action');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2608','LeaveBill:3:2204','usertask2','2601','2601','审批【部门经理】',NULL,NULL,NULL,'test1','2015-05-03 22:33:23',NULL,'2015-05-03 22:34:06',43519,'completed',50,NULL,'workflowAction_audit.action');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2612','LeaveBill:3:2204','usertask3','2601','2601','再审批【总经理】',NULL,NULL,NULL,'admin','2015-05-03 22:34:06',NULL,'2015-05-03 22:34:35',29810,'completed',50,NULL,'workflowAction_audit.action');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2620','LeaveBill:3:2204','usertask1','2616','2616','提交申请',NULL,NULL,NULL,'user1','2015-05-03 22:54:41',NULL,'2015-05-03 22:54:41',628,'completed',50,NULL,'workflowAction_audit.action');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2623','LeaveBill:3:2204','usertask2','2616','2616','审批【部门经理】',NULL,NULL,NULL,'test1','2015-05-03 22:54:41',NULL,'2015-05-03 22:55:59',78465,'completed',50,NULL,'workflowAction_audit.action');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('2627','LeaveBill:3:2204','usertask3','2616','2616','再审批【总经理】',NULL,NULL,NULL,'admin','2015-05-03 22:55:59',NULL,'2015-05-03 22:56:37',38274,'completed',50,NULL,'workflowAction_audit.action');

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

insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`SUSPENSION_STATE_`) values ('2423',1,'2416','2416','LeaveBill:3:2204','审批【部门经理】',NULL,NULL,'usertask2',NULL,'test1',NULL,50,'2015-04-25 19:29:10',NULL,1);
insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`SUSPENSION_STATE_`) values ('2512',1,'2501','2501','LeaveBill:3:2204','再审批【总经理】',NULL,NULL,'usertask3',NULL,'admin',NULL,50,'2015-05-03 17:07:05',NULL,1);

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

insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (1,'好好','2015-04-03','2015-04-04',1,'#06c',1);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (3,'啊啊啊啊啊','2015-04-01','',1,'#360',1);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (4,'nih','2015-03-31','',1,'#360',1);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (5,'fff','2015-04-22 08:00:00','2015-04-22 12:00:00',0,'#f30',1);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (6,'aaaa啊啊','2015-04-08','2015-04-10',1,'#360',1);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (8,'aaaaabbbbb','2015-04-08','',1,'#f30',NULL);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (9,'aaaaaaaaaaaaaaaaaaa11','2015-04-10','',1,'#06c',NULL);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (12,'fffffff','2015-04-25 08:30:00','',0,'#360',1);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (13,'写完项目了','2015-04-25','',1,'#360',19);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (14,'写论文','2015-04-26','',1,'#f30',19);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (15,'学习','2015-04-10','',1,'#f30',18);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (16,'毕业答辩','2015-05-20','',1,'#06c',1);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (17,'在家写论文，很累','2015-05-01','2015-05-03',1,'#360',1);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (18,'好好学习,天天学习','2015-04-28','2015-04-29',1,'#06c',1);
insert  into `calendar`(`ID`,`TITLE`,`START`,`END`,`ALLDAY`,`COLOR`,`userId`) values (19,'很累啊','2015-05-06','',1,'#06c',1);

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

insert  into `department`(`ID`,`NAME`,`NOTE`,`MANAGERID`) values (1,'技术部','负责新技术的研发',13);
insert  into `department`(`ID`,`NAME`,`NOTE`,`MANAGERID`) values (2,'市场部','负责开拓市场',14);
insert  into `department`(`ID`,`NAME`,`NOTE`,`MANAGERID`) values (3,'运营部','负责产品运营',15);

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

insert  into `forum`(`ID`,`NAME`,`NOTE`,`IMAGENAME`,`POSITION`,`TOPICCOUNT`,`ARTICLECOUNT`,`LASTTOPICID`) values (1,'java','java技术交流','d:/oarun/image/forum/java_102.jpg',1,3,16,3);
insert  into `forum`(`ID`,`NAME`,`NOTE`,`IMAGENAME`,`POSITION`,`TOPICCOUNT`,`ARTICLECOUNT`,`LASTTOPICID`) values (3,'移动app开发','android，ios开发交流','d:/oarun/image/forum/移动app开发_103.jpg',3,0,0,NULL);
insert  into `forum`(`ID`,`NAME`,`NOTE`,`IMAGENAME`,`POSITION`,`TOPICCOUNT`,`ARTICLECOUNT`,`LASTTOPICID`) values (4,'娱乐专区','娱乐交流，畅所欲言','d:/oarun/image/forum/娱乐专区_104.jpg',4,0,0,NULL);
insert  into `forum`(`ID`,`NAME`,`NOTE`,`IMAGENAME`,`POSITION`,`TOPICCOUNT`,`ARTICLECOUNT`,`LASTTOPICID`) values (5,'游戏交流','游戏外挂，破解','d:/oarun/image/forum/游戏交流_101.jpg',5,0,0,NULL);
insert  into `forum`(`ID`,`NAME`,`NOTE`,`IMAGENAME`,`POSITION`,`TOPICCOUNT`,`ARTICLECOUNT`,`LASTTOPICID`) values (6,'生活','记录生活的点点滴滴','d:/oarun/image/forum/生活_105.jpg',6,0,0,NULL);

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

insert  into `leavebill`(`ID`,`DAYS`,`CONTENT`,`LEAVEDATE`,`NOTE`,`STATE`,`userId`) values (621,3,'写论文','2015-04-25 00:00:00',NULL,2,18);
insert  into `leavebill`(`ID`,`DAYS`,`CONTENT`,`LEAVEDATE`,`NOTE`,`STATE`,`userId`) values (622,5,'旅游','2015-05-01 00:00:00',NULL,1,18);
insert  into `leavebill`(`ID`,`DAYS`,`CONTENT`,`LEAVEDATE`,`NOTE`,`STATE`,`userId`) values (624,7,'出去培训','2015-05-03 00:00:00',NULL,1,18);
insert  into `leavebill`(`ID`,`DAYS`,`CONTENT`,`LEAVEDATE`,`NOTE`,`STATE`,`userId`) values (625,7,'毕业答辩','2015-05-03 00:00:00',NULL,2,18);
insert  into `leavebill`(`ID`,`DAYS`,`CONTENT`,`LEAVEDATE`,`NOTE`,`STATE`,`userId`) values (626,10,'回学校答辩','2015-05-19 00:00:00',NULL,2,18);

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

insert  into `mymail`(`ID`,`USERNAME`,`PASSWORD`,`SERVER`,`MAILFROM`,`MAILTO`,`SUBJECT`,`CONTENT`,`DATE`,`userId`) values (2,'79712553','911004zzl',NULL,'79712553@qq.com','zzlabc@foxmail.com','你好','太累了','2015-04-19 23:07:21',18);
insert  into `mymail`(`ID`,`USERNAME`,`PASSWORD`,`SERVER`,`MAILFROM`,`MAILTO`,`SUBJECT`,`CONTENT`,`DATE`,`userId`) values (3,'79712553','911004zzl','smtp.qq.com','79712553@qq.com','zzlabc@foxmail.com','毕业设计','好好写论文','2015-04-25 16:53:35',19);
insert  into `mymail`(`ID`,`USERNAME`,`PASSWORD`,`SERVER`,`MAILFROM`,`MAILTO`,`SUBJECT`,`CONTENT`,`DATE`,`userId`) values (4,'79712553','911004zzl','smtp.qq.com','79712553@qq.com','zzlabc@foxmail.com','你好','在吗','2015-05-03 22:35:33',1);
insert  into `mymail`(`ID`,`USERNAME`,`PASSWORD`,`SERVER`,`MAILFROM`,`MAILTO`,`SUBJECT`,`CONTENT`,`DATE`,`userId`) values (5,'79712553','911004zzl','smtp.qq.com','79712553@qq.com','zzlabc@foxmail.com','你好','在家里吗','2015-05-03 22:53:39',1);

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

insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (0,'','个人办公','FUNC20001.gif',NULL);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (1,NULL,'系统管理','FUNC20082.gif',NULL);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (2,'role_list','岗位管理',NULL,1);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (3,'department_list','部门管理',NULL,1);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (4,'user_getUsersByPage?pageInfo.currentPage=1&name=&age1=0&age2=99','用户管理',NULL,1);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (5,'role_list','岗位列表',NULL,2);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (6,'role_delete','岗位删除',NULL,2);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (7,'role_add','岗位添加',NULL,2);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (8,'role_edit','岗位修改',NULL,2);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (9,'department_list','部门列表',NULL,3);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (10,'department_delete','部门删除',NULL,3);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (11,'department_add','部门添加',NULL,3);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (12,'department_edit','部门修改',NULL,3);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (13,'user_getUsersByPage?pageInfo.currentPage=1&name=&age1=0&age2=99','用户列表',NULL,4);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (14,'user_delete','用户删除',NULL,4);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (15,'user_add','用户添加',NULL,4);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (16,'user_edit','用户修改',NULL,4);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (18,NULL,'网上交流','FUNC20064.gif',NULL);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (19,'forumManage_list','论坛管理',NULL,18);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (20,'forum_list','论坛',NULL,18);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (21,NULL,'审批流转','FUNC20057.gif',NULL);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (22,'leaveApply_apply','我要申请',NULL,21);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (23,'leaveApply_applyList','我的申请记录',NULL,21);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (24,'leaveApply_taskList','待办任务',NULL,21);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (25,'leaveApply_hisTaskList','任务查询',NULL,21);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (26,'sendMail_add','发送邮件',NULL,18);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (27,'sendMail_mailList','已发邮件',NULL,18);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (29,'calendar_index','日程管理',NULL,0);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (31,'role_setPrivilege','设置权限',NULL,2);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (32,'userManage_list','在线用户管理',NULL,1);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (33,'topic_delete','删除主题',NULL,20);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (34,'topic_setType','设置主题类型',NULL,20);
insert  into `privilege`(`ID`,`URL`,`NAME`,`ICON`,`PARENTID`) values (35,'reply_delete','删除回复',NULL,20);

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

insert  into `reply`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`AUTHORID`,`TOPICID`) values (1,NULL,'<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/0.gif\" alt=\"\" />好学吗？<br />',NULL,'2015-05-03 15:23:58','127.0.0.1',18,1);
insert  into `reply`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`AUTHORID`,`TOPICID`) values (2,NULL,'<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/15.gif\" alt=\"\" /><br />',NULL,'2015-05-03 15:25:31','127.0.0.1',18,1);
insert  into `reply`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`AUTHORID`,`TOPICID`) values (3,NULL,'<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/23.gif\" alt=\"\" /><img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/27.gif\" alt=\"\" /><span style=\"font-size: 36px;\"><strong><em><span style=\"color: rgb(153, 204, 0);\">多敲代码了</span></em></strong></span><br />',NULL,'2015-05-03 16:56:29','127.0.0.1',1,1);
insert  into `reply`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`AUTHORID`,`TOPICID`) values (4,NULL,'<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/12.gif\" alt=\"\" /><img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/12.gif\" alt=\"\" /><img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/12.gif\" alt=\"\" /><br />',NULL,'2015-05-03 18:35:14','127.0.0.1',13,1);
insert  into `reply`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`AUTHORID`,`TOPICID`) values (5,NULL,'<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/15.gif\" alt=\"\" /><br />',NULL,'2015-05-03 18:35:28','127.0.0.1',13,1);
insert  into `reply`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`AUTHORID`,`TOPICID`) values (6,NULL,'<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/7.gif\" alt=\"\" /><br />',NULL,'2015-05-03 18:35:34','127.0.0.1',13,1);
insert  into `reply`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`AUTHORID`,`TOPICID`) values (7,NULL,'<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/10.gif\" alt=\"\" /><br />',NULL,'2015-05-03 18:36:11','127.0.0.1',19,1);
insert  into `reply`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`AUTHORID`,`TOPICID`) values (8,NULL,'<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/10.gif\" alt=\"\" /><br />',NULL,'2015-05-03 18:36:30','127.0.0.1',19,1);
insert  into `reply`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`AUTHORID`,`TOPICID`) values (9,NULL,'<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/15.gif\" alt=\"\" /><br />',NULL,'2015-05-03 18:36:36','127.0.0.1',19,1);
insert  into `reply`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`AUTHORID`,`TOPICID`) values (10,NULL,'<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/6.gif\" alt=\"\" /><br />',NULL,'2015-05-03 18:36:42','127.0.0.1',19,1);
insert  into `reply`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`AUTHORID`,`TOPICID`) values (11,NULL,'<font color=\'red\'>此回帖已被管理员删除</font>',NULL,'2015-05-03 18:36:48','127.0.0.1',19,1);
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

insert  into `role`(`ID`,`NAME`,`NOTE`) values (1,'总经理','主持全面工作');
insert  into `role`(`ID`,`NAME`,`NOTE`) values (3,'部门经理','负责部门工作');
insert  into `role`(`ID`,`NAME`,`NOTE`) values (4,'员工','做好本职工作');

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

insert  into `topic`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`TYPE`,`REPLYCOUNT`,`LASTUPDATETIME`,`authorId`,`FORUMID`,`LASTREPLYID`) values (1,'java好学吗','<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/0.gif\" alt=\"\" />好学吗？<br />','14','2015-05-03 15:23:58','127.0.0.1',2,11,'2015-05-03 18:36:53',18,1,12);
insert  into `topic`(`ID`,`TITLE`,`CONTENT`,`FACEICON`,`POSTTIME`,`IPADDR`,`TYPE`,`REPLYCOUNT`,`LASTUPDATETIME`,`authorId`,`FORUMID`,`LASTREPLYID`) values (2,'压力好大啊','<img src=\"http://localhost:8080/OA/fckeditor/editor/images/smiley/wangwang/44.gif\" alt=\"\" /><br />','10','2015-05-03 18:38:26','127.0.0.1',0,2,'2015-05-03 22:32:30',19,1,15);
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

insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (1,'admin','21232f297a57a5a743894a0e4a801fc3','超级管理员','男','17710267357','79712553@qq.com',24,'d:/oarun/image/user/admin_图片1.jpg','本科',NULL,NULL);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (13,'test1','e10adc3949ba59abbe56e057f20f883e','张三','男','15512234455','444444@qq.com',22,'d:/oarun/image/user/test1_001.jpg','硕士',NULL,1);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (14,'test2','e10adc3949ba59abbe56e057f20f883e','李四','女','18805328888','22222211@qq.com',27,'d:/oarun/image/user/test2_002.jpg','本科',NULL,2);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (15,'test3','e10adc3949ba59abbe56e057f20f883e','马五','男','11712345678','79874654@qq.com',33,'d:/oarun/image/user/test3_002.jpg','硕士',NULL,3);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (16,'test4','e10adc3949ba59abbe56e057f20f883e','火狐','男','11712345644','464654@qq.com',26,'d:/oarun/image/user/test4_004.jpg','硕士',NULL,1);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (17,'test5','e10adc3949ba59abbe56e057f20f883e','呵呵','男','15678947894','123456@qq.com',35,'d:/oarun/image/user/test5_006.jpg','本科',NULL,1);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (18,'user1','e10adc3949ba59abbe56e057f20f883e','刘畅','男','15644445555','46487485@qq.com',32,'d:/oarun/image/user/user1_007.jpg','大专',NULL,1);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (19,'user2','e10adc3949ba59abbe56e057f20f883e','小马','女','17878787878','797453465@qq.com',18,'d:/oarun/image/user/user2_008.jpg','大专',NULL,1);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (20,'user3','e10adc3949ba59abbe56e057f20f883e','小妹','女','16546845','64664654@qq.com',24,'d:/oarun/image/user/user3_009.jpg','大专',NULL,1);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (21,'user4','e10adc3949ba59abbe56e057f20f883e','留言','女','4565465','464654@qq.com',27,'d:/oarun/image/user/user4_010.jpg','高中',NULL,2);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (22,'user5','e10adc3949ba59abbe56e057f20f883e','很累','女','465465415','4654151651@qq.com',44,'d:/oarun/image/user/user5_002.jpg','博士',NULL,2);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (25,'user8','e10adc3949ba59abbe56e057f20f883e','阿里','女','4565465','545641@qq.com',28,'d:/oarun/image/user/user8_006.jpg','硕士',NULL,3);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (26,'baidu','e10adc3949ba59abbe56e057f20f883e','百度','女','45666','456456456@qq.com',33,'d:/oarun/image/user/baidu_007.jpg','博士',NULL,3);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (27,'taobao','e10adc3949ba59abbe56e057f20f883e','淘宝','女','11712345644','123456@qq.com',26,'d:/oarun/image/user/taobao_004.jpg','硕士',NULL,3);
insert  into `user`(`ID`,`LOGINNAME`,`PASSWORD`,`REALNAME`,`GENDER`,`PHONENUMBER`,`EMAIL`,`AGE`,`IMAGEADDRESS`,`EDUCATION`,`NOTE`,`DEPARTMENTID`) values (28,'tencent','e10adc3949ba59abbe56e057f20f883e','腾讯','女','15644445555','123456@qq.com',25,'d:/oarun/image/user/tencent_009.jpg','博士',NULL,3);

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
