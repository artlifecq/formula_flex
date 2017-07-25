package org.mokylin.skin.app.banghui.huangcheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.banghui.button.ButtonJinruzhanchang;
	import org.mokylin.skin.app.banghui.button.ButtonZhengbabaoming;
	import org.mokylin.skin.app.banghui.wangcheng.WangChengPaiMing_Item;
	import org.mokylin.skin.app.banghui.wangcheng.WangCheng_BaoXiang;
	import org.mokylin.skin.app.banghui.wangcheng.ZhengBaVsNameItemSkin;
	import org.mokylin.skin.component.button.ButtonSkin_info;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.list.ListSkin1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HuangChengZhengBa extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var List:feathers.controls.List;

		public var btnBaoming:feathers.controls.Button;

		public var btnInfo:feathers.controls.Button;

		public var btnJiangli:feathers.controls.Button;

		public var btnJinPai:feathers.controls.Button;

		public var btnJinru:feathers.controls.Button;

		public var btnShuoMing:feathers.controls.Button;

		public var grpCheng:feathers.controls.Group;

		public var grpCheng1:feathers.controls.Group;

		public var grpCheng2:feathers.controls.Group;

		public var grpCheng3:feathers.controls.Group;

		public var grpList:feathers.controls.Group;

		public var grpTo:feathers.controls.Group;

		public var grpWangCheng:feathers.controls.Group;

		public var lbDate:feathers.controls.Label;

		public var lbHead:feathers.controls.Label;

		public var lbHuoYue:feathers.controls.Label;

		public var lbName1:feathers.controls.Label;

		public var lbName2:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;

		public var lbVs:feathers.controls.Label;

		public var skinBaoXiang:feathers.controls.SkinnableContainer;

		public var skinName:feathers.controls.SkinnableContainer;

		public var skinName1:feathers.controls.SkinnableContainer;

		public var skinName2:feathers.controls.SkinnableContainer;

		public var skinName3:feathers.controls.SkinnableContainer;

		public var uiCh1:feathers.controls.UIAsset;

		public var uiCh2:feathers.controls.UIAsset;

		public var uiCh3:feathers.controls.UIAsset;

		public var uiCheng:feathers.controls.UIAsset;

		public var uiFlag:feathers.controls.UIAsset;

		public var uiFlag1:feathers.controls.UIAsset;

		public var uiFlag2:feathers.controls.UIAsset;

		public var uiFlag3:feathers.controls.UIAsset;

		public var uiMyFlag:feathers.controls.UIAsset;

		public var uiWangCheng:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HuangChengZhengBa()
		{
			super();
			
			this.currentState = "normal";
			this.height = 600;
			this.width = 956;
			this.elementsContent = [__HuangChengZhengBa_UIAsset3_i(),__HuangChengZhengBa_UIAsset4_i(),__HuangChengZhengBa_UIAsset5_i(),__HuangChengZhengBa_UIAsset6_i(),__HuangChengZhengBa_UIAsset7_i(),__HuangChengZhengBa_UIAsset8_i(),__HuangChengZhengBa_UIAsset9_i(),lbHead_i(),grpCheng_i(),__HuangChengZhengBa_UIAsset11_i(),__HuangChengZhengBa_UIAsset12_i(),grpList_i(),grpWangCheng_i(),grpCheng1_i(),grpCheng2_i(),grpCheng3_i(),btnInfo_i(),btnJiangli_i(),__HuangChengZhengBa_Label3_i(),lbHuoYue_i(),__HuangChengZhengBa_Label4_i(),lbDate_i(),btnBaoming_i(),btnJinru_i(),btnShuoMing_i(),__HuangChengZhengBa_UIAsset14_i(),__HuangChengZhengBa_UIAsset15_i(),__HuangChengZhengBa_UIAsset16_i(),skinBaoXiang_i(),grpTo_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function List_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			List = temp;
			temp.name = "List";
			temp.height = 218;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 273;
			temp.x = 1;
			temp.y = 26;
			return temp;
		}

		private function __HuangChengZhengBa_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "排名";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 35;
			temp.y = 4;
			return temp;
		}

		private function __HuangChengZhengBa_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "帮派名称";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 150;
			temp.y = 4;
			return temp;
		}

		private function __HuangChengZhengBa_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "帮派活跃：";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 58;
			temp.y = 559;
			return temp;
		}

		private function __HuangChengZhengBa_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "帮帮派下次开战时间：";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 745;
			temp.y = 548;
			return temp;
		}

		private function __HuangChengZhengBa_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "当前无竞拍";
			temp.textAlign = "center";
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 116;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __HuangChengZhengBa_SkinnableContainer1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			temp.height = 27;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.wangcheng.WangChengPaiMing_Item()
			temp.skin = skin
			temp.width = 271;
			temp.x = 1;
			temp.y = 26;
			return temp;
		}

		private function __HuangChengZhengBa_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 0;
			temp.y = 90;
			return temp;
		}

		private function __HuangChengZhengBa_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/tiao.png";
			temp.x = 23;
			temp.y = 270;
			return temp;
		}

		private function __HuangChengZhengBa_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/zhanlipaiming.png";
			temp.x = 119;
			temp.y = 274;
			return temp;
		}

		private function __HuangChengZhengBa_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/yeqian.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __HuangChengZhengBa_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/zuo.png";
			temp.x = 449;
			temp.y = 242;
			return temp;
		}

		private function __HuangChengZhengBa_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/zhong.png";
			temp.x = 601;
			temp.y = 287;
			return temp;
		}

		private function __HuangChengZhengBa_UIAsset16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/you.png";
			temp.x = 793;
			temp.y = 243;
			return temp;
		}

		private function __HuangChengZhengBa_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/banghui/wczb_bg.jpg";
			temp.x = 300;
			temp.y = 86;
			return temp;
		}

		private function __HuangChengZhengBa_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 457;
			temp.styleName = "ui/common/background/neikuang_3.png";
			temp.width = 279;
			temp.x = 21;
			temp.y = 85;
			return temp;
		}

		private function __HuangChengZhengBa_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/xiaban.png";
			temp.x = 21;
			temp.y = 541;
			return temp;
		}

		private function __HuangChengZhengBa_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/bg1.jpg";
			temp.x = 23;
			temp.y = 117;
			return temp;
		}

		private function __HuangChengZhengBa_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/tiao.png";
			temp.x = 23;
			temp.y = 89;
			return temp;
		}

		private function __HuangChengZhengBa_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/xiaodiandi.png";
			temp.x = 102;
			temp.y = 119;
			return temp;
		}

		private function __HuangChengZhengBa_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/benbangzhanshi.png";
			temp.x = 119;
			temp.y = 94;
			return temp;
		}

		private function btnBaoming_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnBaoming = temp;
			temp.name = "btnBaoming";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.styleClass = org.mokylin.skin.app.banghui.button.ButtonZhengbabaoming;
			temp.color = 0xCFC6AE;
			temp.width = 135;
			temp.x = 221;
			temp.y = 550;
			return temp;
		}

		private function btnInfo_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnInfo = temp;
			temp.name = "btnInfo";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "战报信息";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xFFFFFF;
			temp.width = 90;
			temp.x = 834;
			temp.y = 95;
			return temp;
		}

		private function btnJiangli_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJiangli = temp;
			temp.name = "btnJiangli";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "奖励一览";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xFFFFFF;
			temp.width = 90;
			temp.x = 834;
			temp.y = 134;
			return temp;
		}

		private function btnJinPai_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJinPai = temp;
			temp.name = "btnJinPai";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "前往报名";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xFFFFFF;
			temp.width = 90;
			temp.x = 10;
			temp.y = 42;
			return temp;
		}

		private function btnJinru_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJinru = temp;
			temp.name = "btnJinru";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.styleClass = org.mokylin.skin.app.banghui.button.ButtonJinruzhanchang;
			temp.color = 0xCFC6AE;
			temp.width = 125;
			temp.x = 616;
			temp.y = 550;
			return temp;
		}

		private function btnShuoMing_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnShuoMing = temp;
			temp.name = "btnShuoMing";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_info;
			temp.x = 185;
			temp.y = 553;
			return temp;
		}

		private function grpCheng1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpCheng1 = temp;
			temp.name = "grpCheng1";
			temp.height = 190;
			temp.x = 337;
			temp.y = 331;
			temp.elementsContent = [uiCh1_i(),uiFlag1_i(),skinName1_i()];
			return temp;
		}

		private function grpCheng2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpCheng2 = temp;
			temp.name = "grpCheng2";
			temp.height = 189;
			temp.x = 528;
			temp.y = 331;
			temp.elementsContent = [uiCh2_i(),uiFlag2_i(),skinName2_i()];
			return temp;
		}

		private function grpCheng3_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpCheng3 = temp;
			temp.name = "grpCheng3";
			temp.height = 188;
			temp.x = 716;
			temp.y = 331;
			temp.elementsContent = [uiCh3_i(),uiFlag3_i(),skinName3_i()];
			return temp;
		}

		private function grpCheng_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpCheng = temp;
			temp.name = "grpCheng";
			temp.x = 29;
			temp.y = 148;
			temp.elementsContent = [uiCheng_i(),uiMyFlag_i(),__HuangChengZhengBa_UIAsset10_i(),lbName1_i(),lbName2_i(),lbVs_i(),lbTime_i()];
			return temp;
		}

		private function grpList_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpList = temp;
			temp.name = "grpList";
			temp.x = 23;
			temp.y = 297;
			temp.elementsContent = [__HuangChengZhengBa_SkinnableContainer1_i(),__HuangChengZhengBa_UIAsset13_i(),__HuangChengZhengBa_Label1_i(),__HuangChengZhengBa_Label2_i(),List_i()];
			return temp;
		}

		private function grpTo_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpTo = temp;
			temp.name = "grpTo";
			temp.x = 104;
			temp.y = 157;
			temp.elementsContent = [btnJinPai_i(),__HuangChengZhengBa_Label5_i()];
			return temp;
		}

		private function grpWangCheng_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpWangCheng = temp;
			temp.name = "grpWangCheng";
			temp.height = 214;
			temp.x = 531;
			temp.y = 100;
			temp.elementsContent = [uiWangCheng_i(),uiFlag_i(),skinName_i()];
			return temp;
		}

		private function lbDate_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDate = temp;
			temp.name = "lbDate";
			temp.text = "2017年05月22日20：00";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 156;
			temp.x = 746;
			temp.y = 568;
			return temp;
		}

		private function lbHead_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHead = temp;
			temp.name = "lbHead";
			temp.text = "进攻皇城";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 132;
			temp.y = 120;
			return temp;
		}

		private function lbHuoYue_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHuoYue = temp;
			temp.name = "lbHuoYue";
			temp.text = "999999";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 63;
			temp.x = 128;
			temp.y = 559;
			return temp;
		}

		private function lbName1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName1 = temp;
			temp.name = "lbName1";
			temp.text = "帮会名称七个字";
			temp.textAlign = "center";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 140;
			temp.x = 110;
			temp.y = 7;
			return temp;
		}

		private function lbName2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName2 = temp;
			temp.name = "lbName2";
			temp.text = "帮会名称七个字";
			temp.textAlign = "center";
			temp.color = 0xD02525;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 140;
			temp.x = 110;
			temp.y = 60;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "距离开展还剩：60：55：20";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 176;
			temp.x = 46;
			temp.y = 98;
			return temp;
		}

		private function lbVs_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbVs = temp;
			temp.name = "lbVs";
			temp.text = "VS";
			temp.textAlign = "center";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 140;
			temp.x = 110;
			temp.y = 36;
			return temp;
		}

		private function skinBaoXiang_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinBaoXiang = temp;
			temp.name = "skinBaoXiang";
			temp.height = 59;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.wangcheng.WangCheng_BaoXiang()
			temp.skin = skin
			temp.width = 154;
			temp.x = 749;
			temp.y = 361;
			return temp;
		}

		private function skinName1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinName1 = temp;
			temp.name = "skinName1";
			temp.height = 49;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.wangcheng.ZhengBaVsNameItemSkin()
			temp.skin = skin
			temp.width = 187;
			temp.x = 0;
			temp.y = 138;
			return temp;
		}

		private function skinName2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinName2 = temp;
			temp.name = "skinName2";
			temp.height = 47;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.wangcheng.ZhengBaVsNameItemSkin()
			temp.skin = skin
			temp.width = 187;
			temp.x = 0;
			temp.y = 138;
			return temp;
		}

		private function skinName3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinName3 = temp;
			temp.name = "skinName3";
			temp.height = 45;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.wangcheng.ZhengBaVsNameItemSkin()
			temp.skin = skin
			temp.width = 187;
			temp.x = 0;
			temp.y = 138;
			return temp;
		}

		private function skinName_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinName = temp;
			temp.name = "skinName";
			temp.height = 24;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.wangcheng.ZhengBaVsNameItemSkin()
			temp.skin = skin
			temp.width = 187;
			temp.x = 0;
			temp.y = 159;
			return temp;
		}

		private function uiCh1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiCh1 = temp;
			temp.name = "uiCh1";
			temp.styleName = "ui/app/banghui/wangcheng/wangcheng3.png";
			temp.x = 20;
			temp.y = 42;
			return temp;
		}

		private function uiCh2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiCh2 = temp;
			temp.name = "uiCh2";
			temp.styleName = "ui/app/banghui/wangcheng/wangcheng1.png";
			temp.x = 17;
			temp.y = 42;
			return temp;
		}

		private function uiCh3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiCh3 = temp;
			temp.name = "uiCh3";
			temp.styleName = "ui/app/banghui/wangcheng/wangcheng2.png";
			temp.x = 24;
			temp.y = 43;
			return temp;
		}

		private function uiCheng_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiCheng = temp;
			temp.name = "uiCheng";
			temp.styleName = "ui/app/banghui/huangcheng/huangchengxiao.png";
			temp.x = 21;
			temp.y = 33;
			return temp;
		}

		private function uiFlag1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiFlag1 = temp;
			temp.name = "uiFlag1";
			temp.styleName = "ui/app/banghui/huangcheng/qinglongcheng.png";
			temp.x = 86;
			temp.y = 0;
			return temp;
		}

		private function uiFlag2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiFlag2 = temp;
			temp.name = "uiFlag2";
			temp.styleName = "ui/app/banghui/huangcheng/xuanwucheng.png";
			temp.x = 84;
			temp.y = 0;
			return temp;
		}

		private function uiFlag3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiFlag3 = temp;
			temp.name = "uiFlag3";
			temp.styleName = "ui/app/banghui/huangcheng/zhuquecheng.png";
			temp.x = 93;
			temp.y = 0;
			return temp;
		}

		private function uiFlag_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiFlag = temp;
			temp.name = "uiFlag";
			temp.styleName = "ui/app/banghui/huangcheng/huangcheng.png";
			temp.x = 91;
			temp.y = 0;
			return temp;
		}

		private function uiMyFlag_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiMyFlag = temp;
			temp.name = "uiMyFlag";
			temp.styleName = "ui/app/banghui/huangcheng/huangcheng.png";
			temp.x = 57;
			temp.y = 0;
			return temp;
		}

		private function uiWangCheng_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiWangCheng = temp;
			temp.name = "uiWangCheng";
			temp.styleName = "ui/app/banghui/huangcheng/huangchengda.png";
			temp.x = 8;
			temp.y = 30;
			return temp;
		}

	}
}