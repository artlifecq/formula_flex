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
	public class Head_Juese extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var barBlue:feathers.controls.UIAsset;

		public var barGreen:feathers.controls.UIAsset;

		public var barRed:feathers.controls.UIAsset;

		public var lbLevel:feathers.controls.Label;

		public var uiQuan:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Head_Juese()
		{
			super();
			
			this.currentState = "normal";
			this.height = 31;
			this.width = 123;
			this.elementsContent = [__Head_Juese_UIAsset1_i(),barGreen_i(),barBlue_i(),barRed_i(),__Head_Juese_UIAsset2_i(),__Head_Juese_UIAsset3_i(),__Head_Juese_UIAsset4_i(),__Head_Juese_UIAsset5_i(),uiQuan_i(),lbLevel_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Head_Juese_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/head/juese/juesexuetiaobg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Head_Juese_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/head/juese/xuetiaofenge.png";
			temp.x = 44;
			temp.y = 11;
			return temp;
		}

		private function __Head_Juese_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/head/juese/xuetiaofenge.png";
			temp.x = 60;
			temp.y = 11;
			return temp;
		}

		private function __Head_Juese_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/head/juese/xuetiaofenge.png";
			temp.x = 76;
			temp.y = 11;
			return temp;
		}

		private function __Head_Juese_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/head/juese/xuetiaofenge.png";
			temp.x = 92;
			temp.y = 11;
			return temp;
		}

		private function barBlue_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			barBlue = temp;
			temp.name = "barBlue";
			temp.styleName = "ui/mainui/head/juese/juesexuetiao2.png";
			temp.x = 29;
			temp.y = 11;
			return temp;
		}

		private function barGreen_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			barGreen = temp;
			temp.name = "barGreen";
			temp.styleName = "ui/mainui/head/juese/juesexuetiao.png";
			temp.x = 29;
			temp.y = 11;
			return temp;
		}

		private function barRed_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			barRed = temp;
			temp.name = "barRed";
			temp.styleName = "ui/mainui/head/juese/juesexuetiao3.png";
			temp.x = 29;
			temp.y = 11;
			return temp;
		}

		private function lbLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLevel = temp;
			temp.name = "lbLevel";
			temp.bold = false;
			temp.height = 16;
			temp.fontSize = 12;
			temp.text = "100";
			temp.textAlign = "left";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 22;
			temp.x = 3;
			temp.y = 8;
			return temp;
		}

		private function uiQuan_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiQuan = temp;
			temp.name = "uiQuan";
			temp.height = 26;
			temp.styleName = "ui/mainui/head/juese/q_lv.png";
			temp.width = 26;
			temp.x = 2;
			temp.y = 3;
			return temp;
		}

	}
}