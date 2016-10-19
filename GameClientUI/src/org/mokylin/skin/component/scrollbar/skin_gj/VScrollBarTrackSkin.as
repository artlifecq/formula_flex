package org.mokylin.skin.component.scrollbar.skin_gj
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class VScrollBarTrackSkin extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function VScrollBarTrackSkin()
		{
			super();
			
			this.currentState = "down";
			this.height = 13;
			this.width = 12;
			this.elementsContent = [__VScrollBarTrackSkin_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		private function __VScrollBarTrackSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/component/scrollbar/skin_gj/track.png";
			temp.top = 0;
			return temp;
		}

	}
}