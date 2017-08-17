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
	import org.mokylin.skin.component.button.ButtonSkin_info;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
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

		public var actName:feathers.controls.Label;

		public var btnBaoming:feathers.controls.Button;

		public var btnInfo:feathers.controls.Button;

		public var btnJiangli:feathers.controls.Button;

		public var btnJinPai:feathers.controls.Button;

		public var btnJinru:feathers.controls.Button;

		public var btnJone:feathers.controls.Button;

		public var btnShuoMing:feathers.controls.Button;

		public var grpCheng:feathers.controls.Group;

		public var grpList:feathers.controls.Group;

		public var grpTo:feathers.controls.Group;

		public var lbDate:feathers.controls.Label;

		public var lbHead:feathers.controls.Label;

		public var lbHuoYue:feathers.controls.Label;

		public var lbName1:feathers.controls.Label;

		public var lbName2:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;

		public var lbTitle:feathers.controls.Label;

		public var lbVs:feathers.controls.Label;

		public var mapGrp:feathers.controls.Group;

		public var nextTitle:feathers.controls.Label;

		public var uiCheng:feathers.controls.UIAsset;

		public var uiMyFlag:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function WangCheng_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 600;
			this.width = 956;
			this.elementsContent = [__WangCheng_Skin_UIAsset2_i(),__WangCheng_Skin_UIAsset3_i(),__WangCheng_Skin_UIAsset4_i(),__WangCheng_Skin_UIAsset5_i(),__WangCheng_Skin_UIAsset6_i(),__WangCheng_Skin_UIAsset7_i(),lbHead_i(),__WangCheng_Skin_UIAsset8_i(),__WangCheng_Skin_UIAsset9_i(),grpList_i(),mapGrp_i(),btnJiangli_i(),btnInfo_i(),actName_i(),lbHuoYue_i(),nextTitle_i(),lbDate_i(),btnBaoming_i(),btnJinru_i(),btnShuoMing_i(),grpCheng_i(),grpTo_i()];
			
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
			temp.text = "排名";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 35;
			temp.y = 4;
			return temp;
		}

		private function __WangCheng_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "帮派名称";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 150;
			temp.y = 4;
			return temp;
		}

		private function __WangCheng_Skin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 96;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __WangCheng_Skin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 179;
			temp.x = 96;
			temp.y = 0;
			return temp;
		}

		private function __WangCheng_Skin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 0;
			temp.y = 90;
			return temp;
		}

		private function __WangCheng_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 457;
			temp.styleName = "ui/common/background/neikuang_3.png";
			temp.width = 279;
			temp.x = 21;
			temp.y = 85;
			return temp;
		}

		private function __WangCheng_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/xiaban.png";
			temp.x = 21;
			temp.y = 541;
			return temp;
		}

		private function __WangCheng_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/bg1.jpg";
			temp.x = 23;
			temp.y = 117;
			return temp;
		}

		private function __WangCheng_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/tiao.png";
			temp.x = 23;
			temp.y = 89;
			return temp;
		}

		private function __WangCheng_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/xiaodiandi.png";
			temp.x = 102;
			temp.y = 119;
			return temp;
		}

		private function __WangCheng_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/benbangzhanshi.png";
			temp.x = 119;
			temp.y = 94;
			return temp;
		}

		private function __WangCheng_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/tiao.png";
			temp.x = 23;
			temp.y = 270;
			return temp;
		}

		private function __WangCheng_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/zhanlipaiming.png";
			temp.x = 119;
			temp.y = 274;
			return temp;
		}

		private function actName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			actName = temp;
			temp.name = "actName";
			temp.text = "帮派活跃：";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 58;
			temp.y = 559;
			return temp;
		}

		private function btnBaoming_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnBaoming = temp;
			temp.name = "btnBaoming";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "争霸报名";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 90;
			temp.x = 221;
			temp.y = 548;
			return temp;
		}

		private function btnInfo_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnInfo = temp;
			temp.name = "btnInfo";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "王城战报";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xEAEABC;
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
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xEAEABC;
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
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
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
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "进入战场";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 90;
			temp.x = 646;
			temp.y = 548;
			return temp;
		}

		private function btnJone_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJone = temp;
			temp.name = "btnJone";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "加入帮派";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xFFFFFF;
			temp.width = 90;
			temp.x = 10;
			temp.y = 42;
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

		private function grpCheng_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpCheng = temp;
			temp.name = "grpCheng";
			temp.x = 29;
			temp.y = 148;
			temp.elementsContent = [uiCheng_i(),uiMyFlag_i(),__WangCheng_Skin_UIAsset12_i(),lbName1_i(),lbName2_i(),lbVs_i(),lbTime_i()];
			return temp;
		}

		private function grpList_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpList = temp;
			temp.name = "grpList";
			temp.x = 23;
			temp.y = 297;
			temp.elementsContent = [__WangCheng_Skin_UIAsset10_i(),__WangCheng_Skin_UIAsset11_i(),__WangCheng_Skin_Label1_i(),__WangCheng_Skin_Label2_i(),List_i()];
			return temp;
		}

		private function grpTo_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpTo = temp;
			temp.name = "grpTo";
			temp.x = 104;
			temp.y = 157;
			temp.elementsContent = [btnJinPai_i(),btnJone_i(),lbTitle_i()];
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
			temp.text = "进攻西卫";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 262;
			temp.x = 31;
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
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 254;
			temp.x = 8;
			temp.y = 98;
			return temp;
		}

		private function lbTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTitle = temp;
			temp.name = "lbTitle";
			temp.text = "当前无竞拍";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 116;
			temp.x = 0;
			temp.y = 0;
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

		private function mapGrp_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			mapGrp = temp;
			temp.name = "mapGrp";
			temp.height = 455;
			temp.width = 634;
			temp.x = 307;
			temp.y = 87;
			return temp;
		}

		private function nextTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nextTitle = temp;
			temp.name = "nextTitle";
			temp.text = "帮派下次开战时间：";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 745;
			temp.y = 548;
			return temp;
		}

		private function uiCheng_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiCheng = temp;
			temp.name = "uiCheng";
			temp.styleName = "ui/app/banghui/wangcheng/xiaocheng/weicheng1.png";
			temp.x = 28;
			temp.y = 36;
			return temp;
		}

		private function uiMyFlag_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiMyFlag = temp;
			temp.name = "uiMyFlag";
			temp.styleName = "ui/app/banghui/wangcheng/kuaiji.png";
			temp.x = 46;
			temp.y = 12;
			return temp;
		}

	}
}