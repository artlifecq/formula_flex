package org.mokylin.skin.app.activety.shijieboss
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.list.ListSkin1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShiJieBoss_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var ListItem:feathers.controls.List;

		public var activeBg:feathers.controls.UIAsset;

		public var activeName:feathers.controls.UIAsset;

		public var icon1:feathers.controls.UIAsset;

		public var icon2:feathers.controls.UIAsset;

		public var icon3:feathers.controls.UIAsset;

		public var icon4:feathers.controls.UIAsset;

		public var lastSkiller:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;

		public var modeCont:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShiJieBoss_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 587;
			this.width = 956;
			this.elementsContent = [__ShiJieBoss_Skin_UIAsset2_i(),ListItem_i(),__ShiJieBoss_Skin_UIAsset3_i(),activeBg_i(),modeCont_i(),__ShiJieBoss_Skin_UIAsset4_i(),__ShiJieBoss_Skin_UIAsset5_i(),lastSkiller_i(),activeName_i(),icon1_i(),icon2_i(),icon3_i(),icon4_i(),__ShiJieBoss_Skin_Label1_i(),__ShiJieBoss_Skin_UIAsset6_i(),__ShiJieBoss_Skin_Label2_i(),lbTime_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function ListItem_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			ListItem = temp;
			temp.name = "ListItem";
			temp.height = 486;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 602;
			temp.x = 25;
			temp.y = 88;
			return temp;
		}

		private function __ShiJieBoss_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "(几率掉落)";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 83;
			temp.x = 705;
			temp.y = 448;
			return temp;
		}

		private function __ShiJieBoss_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "每日刷新时间";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 99;
			temp.x = 645;
			temp.y = 533;
			return temp;
		}

		private function __ShiJieBoss_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 498;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 313;
			temp.x = 627;
			temp.y = 82;
			return temp;
		}

		private function __ShiJieBoss_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/shijieboss/bg2.jpg";
			temp.x = 632;
			temp.y = 439;
			return temp;
		}

		private function __ShiJieBoss_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/xzt.png";
			temp.x = 632;
			temp.y = 415;
			return temp;
		}

		private function __ShiJieBoss_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/shijieboss/di.png";
			temp.x = 671;
			temp.y = 388;
			return temp;
		}

		private function __ShiJieBoss_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/shijieboss/xiedaibaowu.png";
			temp.x = 645;
			temp.y = 446;
			return temp;
		}

		private function activeBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			activeBg = temp;
			temp.name = "activeBg";
			temp.styleName = "ui/big_bg/activety/des/bosstongyong.jpg";
			temp.x = 633;
			temp.y = 88;
			return temp;
		}

		private function activeName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			activeName = temp;
			temp.name = "activeName";
			temp.styleName = "ui/app/activety/shijieboss/mingzi/14.png";
			temp.x = 751;
			temp.y = 417;
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 647;
			temp.y = 468;
			return temp;
		}

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 717;
			temp.y = 468;
			return temp;
		}

		private function icon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon3 = temp;
			temp.name = "icon3";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 787;
			temp.y = 468;
			return temp;
		}

		private function icon4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon4 = temp;
			temp.name = "icon4";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 857;
			temp.y = 468;
			return temp;
		}

		private function lastSkiller_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lastSkiller = temp;
			temp.name = "lastSkiller";
			temp.text = "最后一击$";
			temp.textAlign = "center";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 183;
			temp.x = 692;
			temp.y = 390;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "10:10";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 287;
			temp.x = 646;
			temp.y = 553;
			return temp;
		}

		private function modeCont_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			modeCont = temp;
			temp.name = "modeCont";
			temp.height = 23;
			temp.width = 151;
			temp.x = 779;
			temp.y = 388;
			return temp;
		}

	}
}