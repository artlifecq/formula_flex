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
	public class Head_Select extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icon_banghui:feathers.controls.UIAsset;

		public var Icon_duiwu:feathers.controls.UIAsset;

		public var Icon_heping:feathers.controls.UIAsset;

		public var Icon_quanti:feathers.controls.UIAsset;

		public var btn_Select:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Head_Select()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [btn_Select_i(),__Head_Select_Label1_i(),Icon_heping_i(),Icon_duiwu_i(),Icon_banghui_i(),Icon_quanti_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icon_banghui_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon_banghui = temp;
			temp.name = "Icon_banghui";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/mainui/head/button/skin_banghui/up.png";
			temp.visible = false;
			temp.x = 4;
			temp.y = 2;
			return temp;
		}

		private function Icon_duiwu_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon_duiwu = temp;
			temp.name = "Icon_duiwu";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/mainui/head/button/skin_duiwu/up.png";
			temp.visible = false;
			temp.x = 4;
			temp.y = 2;
			return temp;
		}

		private function Icon_heping_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon_heping = temp;
			temp.name = "Icon_heping";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/mainui/head/button/skin_heping/up.png";
			temp.x = 4;
			temp.y = 2;
			return temp;
		}

		private function Icon_quanti_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon_quanti = temp;
			temp.name = "Icon_quanti";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/mainui/head/button/skin_quanti/up.png";
			temp.visible = false;
			temp.x = 4;
			temp.y = 2;
			return temp;
		}

		private function __Head_Select_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.letterSpacing = 0;
			temp.text = "【和平模式】您的攻击不会对任何玩家招财伤害";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 27;
			temp.y = 3;
			return temp;
		}

		private function btn_Select_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_Select = temp;
			temp.name = "btn_Select";
			temp.styleClass = org.mokylin.skin.mainui.head.button.ButtonSelect;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}