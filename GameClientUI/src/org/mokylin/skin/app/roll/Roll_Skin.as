package org.mokylin.skin.app.roll
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.ProgressBar;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.roll.Roll_Progress;
	import org.mokylin.skin.app.roll.button.ButtonRandom;
	import org.mokylin.skin.component.button.ButtonSkin_close2;
	import org.mokylin.skin.component.list.ListSkin1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Roll_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icon:feathers.controls.UIAsset;

		public var Pro_bar:feathers.controls.ProgressBar;

		public var btnClose:feathers.controls.Button;

		public var btnRandom:feathers.controls.Button;

		public var lbMost:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var lbSelf:feathers.controls.Label;

		public var lbZhuangbeiName:feathers.controls.Label;

		public var listItem:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Roll_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 283;
			this.width = 309;
			this.elementsContent = [__Roll_Skin_UIAsset1_i(),__Roll_Skin_UIAsset2_i(),__Roll_Skin_UIAsset3_i(),__Roll_Skin_UIAsset4_i(),__Roll_Skin_UIAsset5_i(),lbName_i(),Icon_i(),__Roll_Skin_UIAsset6_i(),lbZhuangbeiName_i(),btnRandom_i(),btnClose_i(),__Roll_Skin_UIAsset7_i(),Pro_bar_i(),listItem_i(),lbMost_i(),lbSelf_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon = temp;
			temp.name = "Icon";
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 13;
			temp.y = 18;
			return temp;
		}

		private function Pro_bar_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			Pro_bar = temp;
			temp.name = "Pro_bar";
			temp.styleClass = org.mokylin.skin.app.roll.Roll_Progress;
			temp.value = 100;
			temp.x = 95;
			temp.y = 72;
			return temp;
		}

		private function __Roll_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 185;
			temp.styleName = "ui/app/roll/toumingdi.png";
			temp.x = 4;
			temp.y = 98;
			return temp;
		}

		private function __Roll_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/roll/bg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Roll_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/roll/fenyexian.png";
			temp.x = 18;
			temp.y = 157;
			return temp;
		}

		private function __Roll_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/roll/fenyexian.png";
			temp.x = 18;
			temp.y = 251;
			return temp;
		}

		private function __Roll_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/roll/wphdz.png";
			temp.x = 21;
			temp.y = 258;
			return temp;
		}

		private function __Roll_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 44;
			temp.styleName = "ui/app/roll/mingzidi.png";
			temp.width = 164;
			temp.x = 89;
			temp.y = 19;
			return temp;
		}

		private function __Roll_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/roll/jdt_di.png";
			temp.width = 200;
			temp.x = 88;
			temp.y = 69;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close2;
			temp.x = 284;
			temp.y = 11;
			return temp;
		}

		private function btnRandom_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnRandom = temp;
			temp.name = "btnRandom";
			temp.styleClass = org.mokylin.skin.app.roll.button.ButtonRandom;
			temp.x = 261;
			temp.y = 29;
			return temp;
		}

		private function lbMost_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMost = temp;
			temp.name = "lbMost";
			temp.fontSize = 16;
			temp.text = "最高点数：98点";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 141;
			temp.x = 20;
			temp.y = 109;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.text = "玩家名六个字";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 120;
			temp.x = 105;
			temp.y = 257;
			return temp;
		}

		private function lbSelf_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbSelf = temp;
			temp.name = "lbSelf";
			temp.fontSize = 16;
			temp.text = "我的点数：2点";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 141;
			temp.x = 20;
			temp.y = 133;
			return temp;
		}

		private function lbZhuangbeiName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZhuangbeiName = temp;
			temp.name = "lbZhuangbeiName";
			temp.bold = false;
			temp.fontSize = 16;
			temp.text = "80级武神套装";
			temp.textAlign = "center";
			temp.color = 0x14A3F3;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 151;
			temp.x = 97;
			temp.y = 31;
			return temp;
		}

		private function listItem_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			listItem = temp;
			temp.name = "listItem";
			temp.height = 93;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 290;
			temp.x = 7;
			temp.y = 158;
			return temp;
		}

	}
}