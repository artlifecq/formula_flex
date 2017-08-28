package org.mokylin.skin.mainui.head
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Head_Select extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icon_heping:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.Label;

		public var ui_bg:feathers.controls.UIAsset;

		public var ui_conver:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Head_Select()
		{
			super();
			
			this.currentState = "normal";
			this.height = 28;
			this.width = 248;
			this.elementsContent = [ui_bg_i(),ui_conver_i(),labelDisplay_i(),Icon_heping_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icon_heping_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon_heping = temp;
			temp.name = "Icon_heping";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/art_txt/mainui/head/mode/he.png";
			temp.x = 4;
			temp.y = 2;
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.htmlText = "<font color='#00ff33'>【和平】</font>不会对任何玩家招财伤害</font>";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.letterSpacing = 0;
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 25;
			temp.y = 6;
			return temp;
		}

		private function ui_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_bg = temp;
			temp.name = "ui_bg";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/hover/xuanqukuang2_alpha.png";
			temp.top = 0;
			return temp;
		}

		private function ui_conver_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_conver = temp;
			temp.name = "ui_conver";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/mainui/head/mode/di.png";
			temp.top = 0;
			return temp;
		}

	}
}