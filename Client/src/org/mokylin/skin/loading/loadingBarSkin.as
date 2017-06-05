package org.mokylin.skin.loading
{
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.loading.loadBarSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class loadingBarSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var barLine:feathers.controls.SkinnableContainer;

		public var load_bg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function loadingBarSkin()
		{
			super();
			
			this.currentState = "normal";
			this.width = 720;
			this.elementsContent = [load_bg_i(),barLine_i(),__loadingBarSkin_UIAsset2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __loadingBarSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/loading/kuang.png";
			temp.width = 720;
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

		private function barLine_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			barLine = temp;
			temp.name = "barLine";
			temp.height = 18;
			temp.left = 7;
			var skin:StateSkin = new org.mokylin.skin.loading.loadBarSkin()
			temp.skin = skin
			temp.top = 8;
			temp.width = 706;
			return temp;
		}

		private function load_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			load_bg = temp;
			temp.name = "load_bg";
			temp.left = 7;
			temp.right = 8;
			temp.styleName = "ui/loading/jindutiao_bg.png";
			temp.top = 8;
			return temp;
		}

	}
}