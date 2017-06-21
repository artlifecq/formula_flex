package org.mokylin.skin.app.banghui.wangcheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.banghui.wangcheng.WangChengPaiMing_Item;
	import org.mokylin.skin.app.zhanchang.wangchengzhengba.WangChengInfo_Item;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.button.ButtonSkin_shuoming2;
	import org.mokylin.skin.component.list.ListSkin1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class WangCheng_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var List:feathers.controls.List;

		public var btnBaoming:feathers.controls.Button;

		public var btnInfo:feathers.controls.Button;

		public var btnJiangli:feathers.controls.Button;

		public var btnJinru:feathers.controls.Button;

		public var btnShuoMing:feathers.controls.Button;

		public var grpCheng1:feathers.controls.Group;

		public var grpCheng2:feathers.controls.Group;

		public var grpCheng3:feathers.controls.Group;

		public var grpList:feathers.controls.Group;

		public var grpWangCheng:feathers.controls.Group;

		public var lbDate:feathers.controls.Label;

		public var lbHead:feathers.controls.Label;

		public var lbHuoYue:feathers.controls.Label;

		public var lbName1:feathers.controls.Label;

		public var lbName2:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;

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

		public var uiWangCheng:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function WangCheng_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 600;
			this.width = 947;
			this.elementsContent = [__WangCheng_Skin_UIAsset2_i(),__WangCheng_Skin_UIAsset3_i(),__WangCheng_Skin_UIAsset4_i(),__WangCheng_Skin_UIAsset5_i(),__WangCheng_Skin_UIAsset6_i(),__WangCheng_Skin_UIAsset7_i(),__WangCheng_Skin_UIAsset8_i(),lbHead_i(),uiCheng_i(),__WangCheng_Skin_UIAsset9_i(),__WangCheng_Skin_UIAsset10_i(),lbName1_i(),lbName2_i(),__WangCheng_Skin_Label1_i(),lbTime_i(),__WangCheng_Skin_UIAsset11_i(),__WangCheng_Skin_UIAsset12_i(),grpList_i(),grpWangCheng_i(),grpCheng1_i(),grpCheng2_i(),grpCheng3_i(),btnInfo_i(),btnJiangli_i(),__WangCheng_Skin_Label4_i(),lbHuoYue_i(),__WangCheng_Skin_Label5_i(),lbDate_i(),btnBaoming_i(),btnJinru_i(),btnShuoMing_i(),__WangCheng_Skin_UIAsset15_i(),__WangCheng_Skin_UIAsset16_i(),__WangCheng_Skin_UIAsset17_i()];
			
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

		private function __WangCheng_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "VS";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 196;
			temp.y = 178;
			return temp;
		}

		private function __WangCheng_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "排名";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 35;
			temp.y = 4;
			return temp;
		}

		private function __WangCheng_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "帮派名称";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 150;
			temp.y = 4;
			return temp;
		}

		private function __WangCheng_Skin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "帮派活跃：";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 54;
			temp.y = 553;
			return temp;
		}

		private function __WangCheng_Skin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "帮帮派下次开战时间：";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 741;
			temp.y = 542;
			return temp;
		}

		private function __WangCheng_Skin_SkinnableContainer1_i():feathers.controls.SkinnableContainer
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

		private function __WangCheng_Skin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 25;
			temp.y = 232;
			return temp;
		}

		private function __WangCheng_Skin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/tiao.png";
			temp.x = 19;
			temp.y = 264;
			return temp;
		}

		private function __WangCheng_Skin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/zhanlipaiming.png";
			temp.x = 115;
			temp.y = 268;
			return temp;
		}

		private function __WangCheng_Skin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/yeqian.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __WangCheng_Skin_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/zuo.png";
			temp.x = 445;
			temp.y = 236;
			return temp;
		}

		private function __WangCheng_Skin_UIAsset16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/zhong.png";
			temp.x = 597;
			temp.y = 281;
			return temp;
		}

		private function __WangCheng_Skin_UIAsset17_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/you.png";
			temp.x = 789;
			temp.y = 237;
			return temp;
		}

		private function __WangCheng_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/banghui/wczb_bg.jpg";
			temp.x = 296;
			temp.y = 80;
			return temp;
		}

		private function __WangCheng_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 457;
			temp.styleName = "ui/common/background/neikuang_3.png";
			temp.width = 279;
			temp.x = 17;
			temp.y = 79;
			return temp;
		}

		private function __WangCheng_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/xiaban.png";
			temp.x = 17;
			temp.y = 535;
			return temp;
		}

		private function __WangCheng_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/bg1.jpg";
			temp.x = 19;
			temp.y = 111;
			return temp;
		}

		private function __WangCheng_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/tiao.png";
			temp.x = 19;
			temp.y = 83;
			return temp;
		}

		private function __WangCheng_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/xiaodiandi.png";
			temp.x = 98;
			temp.y = 113;
			return temp;
		}

		private function __WangCheng_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/benbangzhanshi.png";
			temp.x = 115;
			temp.y = 88;
			return temp;
		}

		private function __WangCheng_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/xiwei.png";
			temp.x = 81;
			temp.y = 143;
			return temp;
		}

		private function btnBaoming_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnBaoming = temp;
			temp.name = "btnBaoming";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "争霸报名";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xCFC6AE;
			temp.width = 95;
			temp.x = 189;
			temp.y = 546;
			return temp;
		}

		private function btnInfo_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnInfo = temp;
			temp.name = "btnInfo";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "战报信息";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xCFC6AE;
			temp.width = 94;
			temp.x = 830;
			temp.y = 89;
			return temp;
		}

		private function btnJiangli_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJiangli = temp;
			temp.name = "btnJiangli";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "奖励一览";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xCFC6AE;
			temp.width = 94;
			temp.x = 830;
			temp.y = 125;
			return temp;
		}

		private function btnJinru_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJinru = temp;
			temp.name = "btnJinru";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "进入战场";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xCFC6AE;
			temp.width = 95;
			temp.x = 637;
			temp.y = 546;
			return temp;
		}

		private function btnShuoMing_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnShuoMing = temp;
			temp.name = "btnShuoMing";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_shuoming2;
			temp.x = 293;
			temp.y = 547;
			return temp;
		}

		private function grpCheng1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpCheng1 = temp;
			temp.name = "grpCheng1";
			temp.x = 333;
			temp.y = 338;
			temp.elementsContent = [uiCh1_i(),uiFlag1_i(),skinName1_i()];
			return temp;
		}

		private function grpCheng2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpCheng2 = temp;
			temp.name = "grpCheng2";
			temp.x = 524;
			temp.y = 338;
			temp.elementsContent = [uiCh2_i(),uiFlag2_i(),skinName2_i()];
			return temp;
		}

		private function grpCheng3_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpCheng3 = temp;
			temp.name = "grpCheng3";
			temp.x = 712;
			temp.y = 338;
			temp.elementsContent = [uiCh3_i(),uiFlag3_i(),skinName3_i()];
			return temp;
		}

		private function grpList_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpList = temp;
			temp.name = "grpList";
			temp.x = 19;
			temp.y = 291;
			temp.elementsContent = [__WangCheng_Skin_SkinnableContainer1_i(),__WangCheng_Skin_UIAsset13_i(),__WangCheng_Skin_Label2_i(),__WangCheng_Skin_Label3_i(),List_i()];
			return temp;
		}

		private function grpWangCheng_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpWangCheng = temp;
			temp.name = "grpWangCheng";
			temp.x = 527;
			temp.y = 130;
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
			temp.x = 742;
			temp.y = 562;
			return temp;
		}

		private function lbHead_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHead = temp;
			temp.name = "lbHead";
			temp.text = "进攻西卫";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 128;
			temp.y = 114;
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
			temp.x = 124;
			temp.y = 553;
			return temp;
		}

		private function lbName1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName1 = temp;
			temp.name = "lbName1";
			temp.text = "帮会名称七个字";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 115;
			temp.x = 154;
			temp.y = 149;
			return temp;
		}

		private function lbName2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName2 = temp;
			temp.name = "lbName2";
			temp.text = "帮会名称七个字";
			temp.color = 0xD02525;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 115;
			temp.x = 154;
			temp.y = 202;
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
			temp.x = 71;
			temp.y = 240;
			return temp;
		}

		private function skinName1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinName1 = temp;
			temp.name = "skinName1";
			temp.height = 24;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.wangchengzhengba.WangChengInfo_Item()
			temp.skin = skin
			temp.width = 187;
			temp.x = 0;
			temp.y = 110;
			return temp;
		}

		private function skinName2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinName2 = temp;
			temp.name = "skinName2";
			temp.height = 24;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.wangchengzhengba.WangChengInfo_Item()
			temp.skin = skin
			temp.width = 187;
			temp.x = 0;
			temp.y = 110;
			return temp;
		}

		private function skinName3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinName3 = temp;
			temp.name = "skinName3";
			temp.height = 24;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.wangchengzhengba.WangChengInfo_Item()
			temp.skin = skin
			temp.width = 187;
			temp.x = 0;
			temp.y = 110;
			return temp;
		}

		private function skinName_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinName = temp;
			temp.name = "skinName";
			temp.height = 24;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.wangchengzhengba.WangChengInfo_Item()
			temp.skin = skin
			temp.width = 187;
			temp.x = 0;
			temp.y = 129;
			return temp;
		}

		private function uiCh1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiCh1 = temp;
			temp.name = "uiCh1";
			temp.styleName = "ui/app/banghui/wangcheng/weicheng1.png";
			temp.x = 42;
			temp.y = 36;
			return temp;
		}

		private function uiCh2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiCh2 = temp;
			temp.name = "uiCh2";
			temp.styleName = "ui/app/banghui/wangcheng/weicheng2.png";
			temp.x = 41;
			temp.y = 36;
			return temp;
		}

		private function uiCh3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiCh3 = temp;
			temp.name = "uiCh3";
			temp.styleName = "ui/app/banghui/wangcheng/weicheng3.png";
			temp.x = 43;
			temp.y = 36;
			return temp;
		}

		private function uiCheng_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiCheng = temp;
			temp.name = "uiCheng";
			temp.styleName = "ui/app/banghui/wangcheng/xiaocheng/weicheng1.png";
			temp.x = 53;
			temp.y = 178;
			return temp;
		}

		private function uiFlag1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiFlag1 = temp;
			temp.name = "uiFlag1";
			temp.styleName = "ui/app/banghui/wangcheng/xiwei.png";
			temp.x = 85;
			temp.y = 0;
			return temp;
		}

		private function uiFlag2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiFlag2 = temp;
			temp.name = "uiFlag2";
			temp.styleName = "ui/app/banghui/wangcheng/zhongwei.png";
			temp.x = 84;
			temp.y = 0;
			return temp;
		}

		private function uiFlag3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiFlag3 = temp;
			temp.name = "uiFlag3";
			temp.styleName = "ui/app/banghui/wangcheng/dongwei.png";
			temp.x = 86;
			temp.y = 0;
			return temp;
		}

		private function uiFlag_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiFlag = temp;
			temp.name = "uiFlag";
			temp.styleName = "ui/app/banghui/wangcheng/wangcheng.png";
			temp.x = 82;
			temp.y = 0;
			return temp;
		}

		private function uiWangCheng_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiWangCheng = temp;
			temp.name = "uiWangCheng";
			temp.styleName = "ui/app/banghui/wangcheng/wangcheng3.png";
			temp.x = 14;
			temp.y = 33;
			return temp;
		}

	}
}