package org.mokylin.skin.component.scrollbar
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ScrollBarSkin_red extends feathers.controls.StateSkin
	{
		public var __ScrollBarSkin_red_UIAsset1:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ScrollBarSkin_red()
		{
			super();
			
			this.currentState = "button";
			this.elementsContent = [];
			__ScrollBarSkin_red_UIAsset1_i();
			
			
			states = {
			};
			skinNames={"button":"ui/component/scrollbar/skin_red/button"};
		}


		private function __ScrollBarSkin_red_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ScrollBarSkin_red_UIAsset1 = temp;
			temp.styleName = "ui/component/scrollbar/skin_red/button";
			return temp;
		}

	}
}