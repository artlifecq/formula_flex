package org.mokylin.skin.common
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.check.CheckBoxSkin_3;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class AlertSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnCancel:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var btnOk:feathers.controls.Button;

		public var cboxTip:feathers.controls.Check;

		public var lbTip:feathers.controls.Label;

		public var title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function AlertSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__AlertSkin_UIAsset1_i(),__AlertSkin_UIAsset2_i(),btnOk_i(),btnClose_i(),cboxTip_i(),lbTip_i(),title_i(),btnCancel_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __AlertSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 222;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/er_ji_mian_ban.png";
			temp.width = 375;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __AlertSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 128;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/nei_kuang.png";
			temp.width = 349;
			temp.x = 14;
			temp.y = 37;
			return temp;
		}

		private function btnCancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCancel = temp;
			temp.name = "btnCancel";
			temp.height = 31;
			temp.label = "取消";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_e_erjianniu);
			temp.width = 70;
			temp.x = 208;
			temp.y = 173;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_g_guanbi);
			temp.x = 339;
			temp.y = 5;
			return temp;
		}

		private function btnOk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOk = temp;
			temp.name = "btnOk";
			temp.height = 31;
			temp.label = "确 定";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_e_erjianniu);
			temp.width = 76;
			temp.x = 99;
			temp.y = 173;
			return temp;
		}

		private function cboxTip_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			cboxTip = temp;
			temp.name = "cboxTip";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 27;
			temp.label = "下次不再提示";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.check.CheckBoxSkin_3);
			temp.textAlign = "left";
			temp.color = 0x76726D;
			temp.width = 147;
			temp.x = 134;
			temp.y = 137;
			return temp;
		}

		private function lbTip_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTip = temp;
			temp.name = "lbTip";
			temp.height = 91;
			temp.touchable = false;
			temp.text = "dfasdfasdf";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.verticalAlign = "middle";
			temp.width = 340;
			temp.x = 16;
			temp.y = 47;
			return temp;
		}

		private function title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			title = temp;
			temp.name = "title";
			temp.touchGroup = false;
			temp.touchable = false;
			temp.fontSize = 16;
			temp.text = "编辑心情";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 276;
			temp.x = 50;
			temp.y = 13;
			return temp;
		}

	}
}