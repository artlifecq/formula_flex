package org.mokylin.skin.mainui.map
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_shouhui;
	import org.mokylin.skin.component.button.ButtonSkin_zhankai;
	import org.mokylin.skin.mainui.map.button.ButtonSkin_jia;
	import org.mokylin.skin.mainui.map.button.ButtonSkin_jian;
	import org.mokylin.skin.mainui.map.button.ButtonSkin_m;
	import org.mokylin.skin.mainui.map.button.ButtonSkin_shi;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class map_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var UIMap:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var btnDecrease:feathers.controls.Button;

		public var btnIncrease:feathers.controls.Button;

		public var btnM:feathers.controls.Button;

		public var btnOpen:feathers.controls.Button;

		public var btnWord:feathers.controls.Button;

		public var grp_cont:feathers.controls.Group;

		public var lbLocation:feathers.controls.Label;

		public var lbName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function map_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 243;
			this.width = 244;
			this.elementsContent = [grp_cont_i(),btnClose_i(),btnOpen_i(),btnWord_i(),btnM_i(),btnIncrease_i(),btnDecrease_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function UIMap_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			UIMap = temp;
			temp.name = "UIMap";
			temp.height = 209;
			temp.width = 239;
			temp.x = 2;
			temp.y = 30;
			return temp;
		}

		private function __map_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 243;
			temp.styleName = "ui/mainui/map/di.png";
			temp.width = 244;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __map_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/map/kuang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.height = 32;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_shouhui;
			temp.width = 20;
			temp.x = 216;
			temp.y = 0;
			return temp;
		}

		private function btnDecrease_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnDecrease = temp;
			temp.name = "btnDecrease";
			temp.height = 24;
			temp.styleClass = org.mokylin.skin.mainui.map.button.ButtonSkin_jian;
			temp.width = 24;
			temp.x = 211;
			temp.y = 211;
			return temp;
		}

		private function btnIncrease_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnIncrease = temp;
			temp.name = "btnIncrease";
			temp.height = 24;
			temp.styleClass = org.mokylin.skin.mainui.map.button.ButtonSkin_jia;
			temp.width = 24;
			temp.x = 211;
			temp.y = 187;
			return temp;
		}

		private function btnM_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnM = temp;
			temp.name = "btnM";
			temp.height = 24;
			temp.styleClass = org.mokylin.skin.mainui.map.button.ButtonSkin_m;
			temp.width = 24;
			temp.x = 211;
			temp.y = 163;
			return temp;
		}

		private function btnOpen_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOpen = temp;
			temp.name = "btnOpen";
			temp.height = 32;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_zhankai;
			temp.width = 20;
			temp.x = 216;
			temp.y = 0;
			return temp;
		}

		private function btnWord_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnWord = temp;
			temp.name = "btnWord";
			temp.height = 22;
			temp.styleClass = org.mokylin.skin.mainui.map.button.ButtonSkin_shi;
			temp.width = 22;
			temp.x = 211;
			temp.y = 139;
			return temp;
		}

		private function grp_cont_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_cont = temp;
			temp.name = "grp_cont";
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [UIMap_i(),__map_Skin_UIAsset1_i(),__map_Skin_UIAsset2_i(),lbName_i(),lbLocation_i()];
			return temp;
		}

		private function lbLocation_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLocation = temp;
			temp.name = "lbLocation";
			temp.fontSize = 16;
			temp.text = "(294,145)";
			temp.color = 0x989772;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack2"];
			temp.width = 84;
			temp.x = 107;
			temp.y = 6;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.leading = 1;
			temp.letterSpacing = 0;
			temp.fontSize = 16;
			temp.text = "野外副本";
			temp.color = 0xC3C198;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack2"];
			temp.width = 69;
			temp.x = 36;
			temp.y = 6;
			return temp;
		}

	}
}