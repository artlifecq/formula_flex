package org.mokylin.skin.component.scrollbar.skin_pack.button
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ScrollBarSkin_track extends feathers.controls.StateSkin
	{
		public var __ScrollBarSkin_track_UIAsset1:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ScrollBarSkin_track()
		{
			super();
			
			this.currentState = "track";
			this.elementsContent = [];
			__ScrollBarSkin_track_UIAsset1_i();
			
			
			states = {
			};
			skinNames={"track":"ui/component/scrollbar/skin_pack/button/skin_track/track.png"};
		}


		private function __ScrollBarSkin_track_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ScrollBarSkin_track_UIAsset1 = temp;
			temp.bottom = 0;
			temp.styleName = "ui/component/scrollbar/skin_pack/button/skin_track/track.png";
			temp.top = 0;
			return temp;
		}

	}
}