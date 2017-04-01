package org.mokylin.skin.common
{
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Erji_panelbg_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Erji_panelbg_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),__Erji_panelbg_Skin_UIAsset1_i(),btnClose_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Erji_panelbg_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.horizontalCenter = 0;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/common/background/yiji_huawen.png";
			temp.top = 0;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/background/yiji_mianban.png";
			temp.top = 4;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.right = 6;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.top = 21;
			return temp;
		}

	}
}