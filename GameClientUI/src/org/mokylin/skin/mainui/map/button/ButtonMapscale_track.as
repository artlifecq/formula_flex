package org.mokylin.skin.mainui.map.button
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonMapscale_track extends feathers.controls.StateSkin
	{
		public var __ButtonMapscale_track_UIAsset1:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonMapscale_track()
		{
			super();
			
			this.currentState = "up";
			this.elementsContent = [];
			__ButtonMapscale_track_UIAsset1_i();
			
			
			states = {
			};
			skinNames={"up":"ui/mainui/map/button/mapscale_track/up.png"};
		}


		private function __ButtonMapscale_track_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ButtonMapscale_track_UIAsset1 = temp;
			temp.styleName = "ui/mainui/map/button/mapscale_track/up.png";
			return temp;
		}

	}
}