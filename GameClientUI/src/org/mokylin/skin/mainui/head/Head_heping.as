package org.mokylin.skin.mainui.head
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.mainui.head.button.ButtonSelect;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Head_heping extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icon_heping:feathers.controls.UIAsset;

		public var btn_Select:feathers.controls.Button;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Head_heping()
		{
			super();
			
			this.currentState = "normal";
			this.height = 34;
			this.width = 332;
			this.elementsContent = [btn_Select_i(),labelDisplay_i(),Icon_heping_i()];
			
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

		private function btn_Select_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_Select = temp;
			temp.name = "btn_Select";
			temp.height = 34;
			temp.styleClass = org.mokylin.skin.mainui.head.button.ButtonSelect;
			temp.width = 332;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.letterSpacing = 0;
			temp.text = "【和平模式】您的攻击不会对任何玩家招财伤害";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 33;
			temp.y = 9;
			return temp;
		}

	}
}