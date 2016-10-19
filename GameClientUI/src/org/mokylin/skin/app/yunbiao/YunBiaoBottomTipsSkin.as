package org.mokylin.skin.app.yunbiao
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
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
	public class YunBiaoBottomTipsSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var labDesc:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function YunBiaoBottomTipsSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 50;
			this.width = 500;
			this.elementsContent = [__YunBiaoBottomTipsSkin_UIAsset1_i(),btnClose_i(),labDesc_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __YunBiaoBottomTipsSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 50;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/san_ji_mian_ban.png";
			temp.width = 500;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_close);
			temp.x = 464;
			temp.y = 1;
			return temp;
		}

		private function labDesc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labDesc = temp;
			temp.name = "labDesc";
			temp.height = 22;
			temp.leading = 5;
			temp.fontSize = 18;
			temp.textAlign = "center";
			temp.color = 0xE55858;
			temp.nativeFilters = Fontter.filterObj["textFilterBlack"];
			temp.width = 459;
			temp.x = 10;
			temp.y = 13;
			return temp;
		}

	}
}