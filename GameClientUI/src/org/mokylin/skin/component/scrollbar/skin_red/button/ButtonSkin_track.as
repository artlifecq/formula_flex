package org.mokylin.skin.component.scrollbar.skin_red.button
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonSkin_track extends feathers.controls.StateSkin
	{
		public var __ButtonSkin_track_UIAsset1:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonSkin_track()
		{
			super();
			
			this.currentState = "up";
			this.elementsContent = [];
			__ButtonSkin_track_UIAsset1_i();
			
			
			states = {
			};
			skinNames={"up":"ui/component/scrollbar/skin_red/button/skin_track/up.png"};
		}


		private function __ButtonSkin_track_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ButtonSkin_track_UIAsset1 = temp;
			temp.styleName = "ui/component/scrollbar/skin_red/button/skin_track/up.png";
			return temp;
		}

	}
}