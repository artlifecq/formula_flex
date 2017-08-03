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
			this.height = 279;
			this.width = 299;
			this.elementsContent = [__Roll_Skin_UIAsset1_i(),__Roll_Skin_UIAsset2_i(),__Roll_Skin_UIAsset3_i(),__Roll_Skin_UIAsset4_i(),__Roll_Skin_UIAsset5_i(),__Roll_Skin_UIAsset6_i(),__Roll_Skin_UIAsset7_i(),lbName_i(),Icon_i(),__Roll_Skin_UIAsset8_i(),lbZhuangbeiName_i(),btnRandom_i(),btnClose_i(),__Roll_Skin_UIAsset9_i(),Pro_bar_i(),listItem_i(),lbMost_i(),lbSelf_i()];
			
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
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 18;
			temp.y = 14;
			return temp;
		}

		private function Pro_bar_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			Pro_bar = temp;
			temp.name = "Pro_bar";
			temp.styleClass = org.mokylin.skin.app.roll.Roll_Progress;
			temp.value = 100;
			temp.x = 24;
			temp.y = 73;
			return temp;
		}

		private function __Roll_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 279;
			temp.styleName = "ui/common/background/sanji_kuang.png";
			temp.width = 299;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Roll_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/roll/jianbiandi.png";
			temp.width = 285;
			temp.x = 7;
			temp.y = 93;
			return temp;
		}

		private function __Roll_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/fenyexian.png";
			temp.width = 288;
			temp.x = 5;
			temp.y = 88;
			return temp;
		}

		private function __Roll_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/fenyexian.png";
			temp.width = 288;
			temp.x = 5;
			temp.y = 139;
			return temp;
		}

		private function __Roll_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/fenyexian.png";
			temp.width = 288;
			temp.x = 5;
			temp.y = 238;
			return temp;
		}

		private function __Roll_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/roll/jbd.png";
			temp.x = 2;
			temp.y = 243;
			return temp;
		}

		private function __Roll_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/roll/wphdz.png";
			temp.x = 67;
			temp.y = 249;
			return temp;
		}

		private function __Roll_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 44;
			temp.styleName = "ui/app/roll/mingzidi.png";
			temp.width = 167;
			temp.x = 73;
			temp.y = 18;
			return temp;
		}

		private function __Roll_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/roll/jdt_di.png";
			temp.width = 265;
			temp.x = 17;
			temp.y = 70;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close2;
			temp.x = 281;
			temp.y = 5;
			return temp;
		}

		private function btnRandom_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnRandom = temp;
			temp.name = "btnRandom";
			temp.styleClass = org.mokylin.skin.app.roll.button.ButtonRandom;
			temp.x = 248;
			temp.y = 23;
			return temp;
		}

		private function lbMost_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMost = temp;
			temp.name = "lbMost";
			temp.fontSize = 16;
			temp.text = "最高点数：98点";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 141;
			temp.x = 19;
			temp.y = 95;
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
			temp.x = 151;
			temp.y = 248;
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
			temp.x = 19;
			temp.y = 119;
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
			temp.color = 0x2C87B0;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 151;
			temp.x = 82;
			temp.y = 30;
			return temp;
		}

		private function listItem_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			listItem = temp;
			temp.name = "listItem";
			temp.height = 98;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 283;
			temp.x = 8;
			temp.y = 143;
			return temp;
		}

	}
}