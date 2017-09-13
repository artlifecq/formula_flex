package org.mokylin.skin.app.sevenday
{
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.sevenday.Day_Item;
	import org.mokylin.skin.app.sevenday.button.ButtonLingqu;
	import org.mokylin.skin.common.TongYongPanelbg1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class SevenDay_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnLingqu:feathers.controls.Button;

		public var icon0:feathers.controls.UIAsset;

		public var modGrp:feathers.controls.Group;

		public var skinDay1:feathers.controls.SkinnableContainer;

		public var skinDay2:feathers.controls.SkinnableContainer;

		public var skinDay3:feathers.controls.SkinnableContainer;

		public var skinDay4:feathers.controls.SkinnableContainer;

		public var skinDay5:feathers.controls.SkinnableContainer;

		public var skinDay6:feathers.controls.SkinnableContainer;

		public var skinDay7:feathers.controls.SkinnableContainer;

		public var uiMsg:feathers.controls.UIAsset;

		public var uiOk:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SevenDay_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [bg_i(),__SevenDay_Skin_UIAsset1_i(),__SevenDay_Skin_UIAsset2_i(),__SevenDay_Skin_UIAsset3_i(),uiMsg_i(),btnLingqu_i(),icon0_i(),skinDay1_i(),skinDay2_i(),skinDay3_i(),skinDay4_i(),skinDay5_i(),skinDay6_i(),skinDay7_i(),modGrp_i(),uiOk_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __SevenDay_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 512;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 922;
			temp.x = 18;
			temp.y = 82;
			return temp;
		}

		private function __SevenDay_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/sevenday/word/qrhl.png";
			temp.x = 429;
			temp.y = 19;
			return temp;
		}

		private function __SevenDay_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/sevenday/bg.jpg";
			temp.x = 23;
			temp.y = 86;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 601;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongPanelbg1()
			temp.skin = skin
			temp.width = 956;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnLingqu_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnLingqu = temp;
			temp.name = "btnLingqu";
			temp.styleClass = org.mokylin.skin.app.sevenday.button.ButtonLingqu;
			temp.x = 640;
			temp.y = 487;
			return temp;
		}

		private function icon0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon0 = temp;
			temp.name = "icon0";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.visible = false;
			temp.x = 700.5;
			temp.y = 413;
			return temp;
		}

		private function modGrp_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			modGrp = temp;
			temp.name = "modGrp";
			temp.x = 298;
			temp.y = 489;
			return temp;
		}

		private function skinDay1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinDay1 = temp;
			temp.name = "skinDay1";
			temp.height = 153;
			var skin:StateSkin = new org.mokylin.skin.app.sevenday.Day_Item()
			temp.skin = skin
			temp.width = 124;
			temp.x = 46;
			temp.y = 90;
			return temp;
		}

		private function skinDay2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinDay2 = temp;
			temp.name = "skinDay2";
			temp.height = 153;
			var skin:StateSkin = new org.mokylin.skin.app.sevenday.Day_Item()
			temp.skin = skin
			temp.width = 124;
			temp.x = 170;
			temp.y = 90;
			return temp;
		}

		private function skinDay3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinDay3 = temp;
			temp.name = "skinDay3";
			temp.height = 153;
			var skin:StateSkin = new org.mokylin.skin.app.sevenday.Day_Item()
			temp.skin = skin
			temp.width = 124;
			temp.x = 294;
			temp.y = 90;
			return temp;
		}

		private function skinDay4_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinDay4 = temp;
			temp.name = "skinDay4";
			temp.height = 153;
			var skin:StateSkin = new org.mokylin.skin.app.sevenday.Day_Item()
			temp.skin = skin
			temp.width = 124;
			temp.x = 418;
			temp.y = 90;
			return temp;
		}

		private function skinDay5_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinDay5 = temp;
			temp.name = "skinDay5";
			temp.height = 153;
			var skin:StateSkin = new org.mokylin.skin.app.sevenday.Day_Item()
			temp.skin = skin
			temp.width = 124;
			temp.x = 542;
			temp.y = 90;
			return temp;
		}

		private function skinDay6_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinDay6 = temp;
			temp.name = "skinDay6";
			temp.height = 153;
			var skin:StateSkin = new org.mokylin.skin.app.sevenday.Day_Item()
			temp.skin = skin
			temp.width = 124;
			temp.x = 666;
			temp.y = 90;
			return temp;
		}

		private function skinDay7_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinDay7 = temp;
			temp.name = "skinDay7";
			temp.height = 153;
			var skin:StateSkin = new org.mokylin.skin.app.sevenday.Day_Item()
			temp.skin = skin
			temp.width = 124;
			temp.x = 790;
			temp.y = 90;
			return temp;
		}

		private function uiMsg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiMsg = temp;
			temp.name = "uiMsg";
			temp.styleName = "ui/app/sevenday/word/ylmm.png";
			temp.x = 511;
			temp.y = 261;
			return temp;
		}

		private function uiOk_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiOk = temp;
			temp.name = "uiOk";
			temp.styleName = "ui/app/sevenday/image/yilingquda.png";
			temp.x = 642;
			temp.y = 480;
			return temp;
		}

	}
}