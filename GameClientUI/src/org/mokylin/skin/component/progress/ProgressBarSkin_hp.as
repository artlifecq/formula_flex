package org.mokylin.skin.component.progress
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ProgressBarSkin_hp extends feathers.controls.StateSkin
	{
		public var thumb:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ProgressBarSkin_hp()
		{
			super();
			
			this.currentState = "normal";
			this.height = 8;
			this.width = 151;
			this.elementsContent = [thumb_i()];
			
			states = {
			};
			skinNames={};
		}


		private function thumb_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			thumb = temp;
			temp.name = "thumb";
			temp.styleName = "ui/component/progress/skin_hp/thumb.png";
			return temp;
		}

	}
}