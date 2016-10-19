package org.mokylin.skin.app.toujing
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_close;
	import org.mokylin.skin.component.list.ListSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TouJingCountryBookStateSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var labMyCountry:feathers.controls.Label;

		public var labTittle:feathers.controls.Label;

		public var list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TouJingCountryBookStateSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 260;
			this.width = 280;
			this.elementsContent = [__TouJingCountryBookStateSkin_UIAsset1_i(),__TouJingCountryBookStateSkin_UIAsset2_i(),labTittle_i(),labMyCountry_i(),__TouJingCountryBookStateSkin_UIAsset3_i(),list_i(),btnClose_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TouJingCountryBookStateSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 260;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/di_ban.png";
			temp.width = 274;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __TouJingCountryBookStateSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 205;
			temp.styleName = "ui/common/version_3/D_di/di_4.png";
			temp.width = 245;
			temp.x = 15;
			temp.y = 35;
			return temp;
		}

		private function __TouJingCountryBookStateSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/backgound/gao_guang.png";
			temp.width = 266;
			temp.x = 4;
			temp.y = 3;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_close);
			temp.x = 250;
			temp.y = 0;
			return temp;
		}

		private function labMyCountry_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labMyCountry = temp;
			temp.name = "labMyCountry";
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "本国（$）经书数量：$";
			temp.textAlign = "center";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 243;
			temp.x = 15;
			temp.y = 45;
			return temp;
		}

		private function labTittle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTittle = temp;
			temp.name = "labTittle";
			temp.bold = true;
			temp.height = 25;
			temp.fontSize = 16;
			temp.text = "各国经书数量";
			temp.textAlign = "center";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 82;
			temp.y = 4;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 167;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListSkin);
			temp.width = 200;
			temp.x = 45;
			temp.y = 70;
			return temp;
		}

	}
}