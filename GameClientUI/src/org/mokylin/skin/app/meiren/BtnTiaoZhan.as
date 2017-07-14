package org.mokylin.skin.app.meiren
{
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.meiren.button.ButtonTiaozhan;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BtnTiaoZhan extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnBg:feathers.controls.Button;

		public var uiNum:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BtnTiaoZhan()
		{
			super();
			
			this.currentState = "normal";
			this.height = 59;
			this.width = 176;
			this.elementsContent = [btnBg_i(),__BtnTiaoZhan_UIAsset1_i(),uiNum_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __BtnTiaoZhan_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/meiren/tiaozhan/tiaozhandierguan.png";
			temp.x = 24;
			temp.y = 14;
			return temp;
		}

		private function btnBg_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnBg = temp;
			temp.name = "btnBg";
			temp.styleClass = org.mokylin.skin.app.meiren.button.ButtonTiaozhan;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiNum_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiNum = temp;
			temp.name = "uiNum";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/meiren/tiaozhan/2.png";
			temp.x = 100;
			temp.y = 15;
			return temp;
		}

	}
}