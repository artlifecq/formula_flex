package org.mokylin.skin.common
{
	import feathers.controls.text.Fontter;
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
	public class AlertOkSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var btnOk:feathers.controls.Button;

		public var cboxTip:feathers.controls.Check;

		public var lbTip:feathers.controls.Label;

		public var title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function AlertOkSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__AlertOkSkin_UIAsset1_i(),__AlertOkSkin_UIAsset2_i(),btnOk_i(),btnClose_i(),cboxTip_i(),lbTip_i(),title_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __AlertOkSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 222;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/er_ji_mian_ban.png";
			temp.width = 375;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __AlertOkSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 128;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/nei_kuang.png";
			temp.width = 349;
			temp.x = 14;
			temp.y = 37;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_g_guanbi;
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
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
			temp.width = 76;
			temp.x = 149;
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
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_3;
			temp.textAlign = "left";
			temp.color = 0x76726D;
			temp.width = 147;
			temp.x = 127;
			temp.y = 132;
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
			temp.width = 345;
			temp.x = 16;
			temp.y = 39;
			return temp;
		}

		private function title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			title = temp;
			temp.name = "title";
			temp.touchGroup = false;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "编辑心情";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 276;
			temp.x = 50;
			temp.y = 14;
			return temp;
		}

	}
}