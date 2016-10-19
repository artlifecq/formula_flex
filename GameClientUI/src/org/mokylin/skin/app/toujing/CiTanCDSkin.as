package org.mokylin.skin.app.toujing
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.common.number.UINumberSkin_sz;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CiTanCDSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var imgMiXin:feathers.controls.UIAsset;

		public var uiNumber:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CiTanCDSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [imgMiXin_i(),uiNumber_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function imgMiXin_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgMiXin = temp;
			temp.name = "imgMiXin";
			temp.height = 76;
			temp.styleName = "ui/mainui/task/xin.png";
			temp.width = 76;
			temp.x = 0;
			temp.y = -3;
			return temp;
		}

		private function uiNumber_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			uiNumber = temp;
			temp.name = "uiNumber";
			temp.gap = -4;
			temp.height = 24;
			temp.label = "9";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.common.number.UINumberSkin_sz);
			temp.tween = false;
			temp.width = 24;
			temp.x = 29;
			temp.y = 23;
			return temp;
		}

	}
}