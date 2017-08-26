package org.mokylin.skin.app.msg
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Grid_Kuang extends feathers.controls.StateSkin
	{
		public var ui_bg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Grid_Kuang()
		{
			super();
			
			this.currentState = "normal";
			this.height = 123;
			this.width = 168;
			this.elementsContent = [ui_bg_i()];
			
			states = {
			};
			skinNames={};
		}


		private function ui_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_bg = temp;
			temp.name = "ui_bg";
			temp.styleName = "ui/app/msg/beibaogezi.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}