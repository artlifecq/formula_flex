package org.mokylin.skin.loading
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.loading.loadingBarSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ResLoadingViewSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bgImage:feathers.controls.UIAsset;

		public var infoTxt:feathers.controls.Label;

		public var loadingBar:feathers.controls.SkinnableContainer;

		public var progressTxt:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ResLoadingViewSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 1080;
			this.width = 1920;
			this.elementsContent = [bgImage_i(),loadingBar_i(),__ResLoadingViewSkin_UIAsset1_i(),infoTxt_i(),progressTxt_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ResLoadingViewSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 19;
			temp.styleName = "ui/loading/wenzi.png";
			temp.width = 947;
			temp.x = 487;
			temp.y = 1047;
			return temp;
		}

		private function bgImage_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bgImage = temp;
			temp.name = "bgImage";
			temp.height = 1080;
			temp.styleName = "ui/big_bg/lanch_bg.png";
			temp.width = 1920;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function infoTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			infoTxt = temp;
			temp.name = "infoTxt";
			temp.height = 19;
			temp.text = "标签";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 687;
			temp.x = 639;
			temp.y = 975;
			return temp;
		}

		private function loadingBar_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			loadingBar = temp;
			temp.name = "loadingBar";
			temp.height = 39;
			var skin:StateSkin = new org.mokylin.skin.loading.loadingBarSkin()
			temp.skin = skin
			temp.width = 723;
			temp.x = 620;
			temp.y = 999;
			return temp;
		}

		private function progressTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			progressTxt = temp;
			temp.name = "progressTxt";
			temp.height = 19;
			temp.text = "标签";
			temp.textAlign = "center";
			temp.color = 0xdedede;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 643;
			temp.x = 659;
			temp.y = 1005;
			return temp;
		}

	}
}