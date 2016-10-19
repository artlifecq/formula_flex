package org.mokylin.skin.app.countryWar
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_close;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CountryWarProgressTextSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var lbInfo:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CountryWarProgressTextSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),btnClose_i(),lbInfo_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 115;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/san_ji_mian_ban.png";
			temp.width = 600;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_close;
			temp.x = 567;
			temp.y = 6;
			return temp;
		}

		private function lbInfo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbInfo = temp;
			temp.name = "lbInfo";
			temp.height = 74;
			temp.leading = 5;
			temp.fontSize = 20;
			temp.text = "标签";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 543;
			temp.x = 26;
			temp.y = 24;
			return temp;
		}

	}
}