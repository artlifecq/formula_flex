package org.mokylin.skin.loginui
{
	import feathers.controls.Group;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.loginui.button.ButtonSkin_kuang;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class select_mojia_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_sk1:feathers.controls.Radio;

		public var btn_sk2:feathers.controls.Radio;

		public var btn_sk3:feathers.controls.Radio;

		public var grp_hui:feathers.controls.Group;

		public var icon_sk1:feathers.controls.UIAsset;

		public var icon_sk2:feathers.controls.UIAsset;

		public var icon_sk3:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function select_mojia_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 667;
			this.width = 305;
			this.elementsContent = [__select_mojia_Skin_Group1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __select_mojia_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__select_mojia_Skin_UIAsset2_i(),__select_mojia_Skin_UIAsset3_i(),__select_mojia_Skin_UIAsset4_i(),grp_hui_i(),__select_mojia_Skin_UIAsset10_i(),__select_mojia_Skin_UIAsset11_i(),btn_sk1_i(),btn_sk2_i(),btn_sk3_i(),icon_sk1_i(),icon_sk2_i(),icon_sk3_i()];
			return temp;
		}

		private function __select_mojia_Skin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/loginui/mojiamiaoshuzi.png";
			temp.x = 71;
			temp.y = 141;
			return temp;
		}

		private function __select_mojia_Skin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/loginui/shangshounandu.png";
			temp.x = 195;
			temp.y = 181;
			return temp;
		}

		private function __select_mojia_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/loginui/di.png";
			temp.x = 34;
			temp.y = 0;
			return temp;
		}

		private function __select_mojia_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/loginui/mojia.png";
			temp.x = 93;
			temp.y = 25;
			return temp;
		}

		private function __select_mojia_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/loginui/yuanchengsheji.png";
			temp.x = 232;
			temp.y = 174;
			return temp;
		}

		private function __select_mojia_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/loginui/xingxing_heibai.png";
			temp.x = 0;
			temp.y = 107.5;
			return temp;
		}

		private function __select_mojia_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/loginui/xingxing_heibai.png";
			temp.x = 0;
			temp.y = 143;
			return temp;
		}

		private function __select_mojia_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/loginui/xingxing.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __select_mojia_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/loginui/xingxing.png";
			temp.x = 0;
			temp.y = 35;
			return temp;
		}

		private function __select_mojia_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/loginui/xingxing.png";
			temp.x = 0;
			temp.y = 72;
			return temp;
		}

		private function btn_sk1_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_sk1 = temp;
			temp.name = "btn_sk1";
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_kuang;
			temp.x = 0;
			temp.y = 458;
			return temp;
		}

		private function btn_sk2_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_sk2 = temp;
			temp.name = "btn_sk2";
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_kuang;
			temp.x = 85;
			temp.y = 458;
			return temp;
		}

		private function btn_sk3_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_sk3 = temp;
			temp.name = "btn_sk3";
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_kuang;
			temp.x = 171;
			temp.y = 458;
			return temp;
		}

		private function grp_hui_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_hui = temp;
			temp.name = "grp_hui";
			temp.x = 190;
			temp.y = 259;
			temp.elementsContent = [__select_mojia_Skin_UIAsset5_i(),__select_mojia_Skin_UIAsset6_i(),__select_mojia_Skin_UIAsset7_i(),__select_mojia_Skin_UIAsset8_i(),__select_mojia_Skin_UIAsset9_i()];
			return temp;
		}

		private function icon_sk1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon_sk1 = temp;
			temp.name = "icon_sk1";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/loginui/skillIcons/mojia/1_chuanxinnu/48.png";
			temp.x = 22;
			temp.y = 480;
			return temp;
		}

		private function icon_sk2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon_sk2 = temp;
			temp.name = "icon_sk2";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/loginui/skillIcons/mojia/2_qianjibian/48.png";
			temp.x = 107;
			temp.y = 480;
			return temp;
		}

		private function icon_sk3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon_sk3 = temp;
			temp.name = "icon_sk3";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/loginui/skillIcons/mojia/3_jiguanxianjing/48.png";
			temp.x = 193;
			temp.y = 480;
			return temp;
		}

	}
}