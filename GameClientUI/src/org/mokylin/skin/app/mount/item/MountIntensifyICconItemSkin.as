package org.mokylin.skin.app.mount.item
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MountIntensifyICconItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var img:feathers.controls.UIAsset;

		public var imgSelect:feathers.controls.UIAsset;

		public var mainGrid0:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MountIntensifyICconItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [mainGrid0_i(),img_i(),imgSelect_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function imgSelect_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgSelect = temp;
			temp.name = "imgSelect";
			temp.styleName = "ui/common/grid/select/60.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function img_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			img = temp;
			temp.name = "img";
			temp.height = 60;
			temp.width = 60;
			temp.x = 8;
			temp.y = 7;
			return temp;
		}

		private function mainGrid0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			mainGrid0 = temp;
			temp.name = "mainGrid0";
			temp.styleName = "ui/common/grid/normal/60.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}