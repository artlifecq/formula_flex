package org.mokylin.skin.app.beibao.junjie
{
	import feathers.controls.StateSkin;
	import feathers.controls.ToggleButton;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.beibao.junjie.button.Button1jie;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JunJie_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnCont:feathers.controls.ToggleButton;

		public var icons:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JunJie_Item()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [btnCont_i(),icons_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btnCont_i():feathers.controls.ToggleButton
		{
			var temp:feathers.controls.ToggleButton = new feathers.controls.ToggleButton();
			btnCont = temp;
			temp.name = "btnCont";
			temp.styleClass = org.mokylin.skin.app.beibao.junjie.button.Button1jie;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function icons_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icons = temp;
			temp.name = "icons";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/beibao/junjie/icon/icon1.png";
			temp.x = 8;
			temp.y = 4;
			return temp;
		}

	}
}