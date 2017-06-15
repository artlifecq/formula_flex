package org.mokylin.skin.loading
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.loading.LoadingUpSkin;
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

		public var grpBottom:feathers.controls.Group;

		public var inSuaxin:feathers.controls.Label;

		public var infoTxt:feathers.controls.Label;

		public var infoTxt2:feathers.controls.Label;

		public var loadingBar:feathers.controls.SkinnableContainer;

		public var progressTxt:feathers.controls.Label;

		public var skinUp:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ResLoadingViewSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 934;
			this.width = 1920;
			this.elementsContent = [bgImage_i(),grpBottom_i(),skinUp_i()];
			
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
			temp.height = 188;
			temp.styleName = "ui/big_bg/bg_2.png";
			temp.x = 0;
			temp.y = 2;
			return temp;
		}

		private function __ResLoadingViewSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 19;
			temp.styleName = "ui/loading/wenzi.png";
			temp.width = 947;
			temp.x = 486.5;
			temp.y = 160;
			return temp;
		}

		private function bgImage_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bgImage = temp;
			temp.name = "bgImage";
			temp.height = 730;
			temp.styleName = "ui/big_bg/bg_mo.png";
			temp.width = 1920;
			temp.x = 0;
			temp.y = 82;
			return temp;
		}

		private function grpBottom_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpBottom = temp;
			temp.name = "grpBottom";
			temp.x = 0;
			temp.y = 743;
			temp.elementsContent = [__ResLoadingViewSkin_UIAsset1_i(),__ResLoadingViewSkin_UIAsset2_i(),loadingBar_i(),progressTxt_i(),infoTxt_i(),infoTxt2_i(),inSuaxin_i()];
			return temp;
		}

		private function inSuaxin_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			inSuaxin = temp;
			temp.name = "inSuaxin";
			temp.height = 19;
			temp.text = "卡住了，点击刷新";
			temp.textAlign = "right";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.width = 108;
			temp.x = 1194;
			temp.y = 98;
			return temp;
		}

		private function infoTxt2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			infoTxt2 = temp;
			temp.name = "infoTxt2";
			temp.height = 19;
			temp.text = "标签";
			temp.textAlign = "center";
			temp.color = 0x2C87B0;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 687;
			temp.x = 616.5;
			temp.y = 98;
			return temp;
		}

		private function infoTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			infoTxt = temp;
			temp.name = "infoTxt";
			temp.height = 19;
			temp.text = "标签";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 687;
			temp.x = 616.5;
			temp.y = 77;
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
			temp.x = 598.5;
			temp.y = 118;
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
			temp.width = 689;
			temp.x = 615.5;
			temp.y = 122;
			return temp;
		}

		private function skinUp_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinUp = temp;
			temp.name = "skinUp";
			temp.height = 162;
			var skin:StateSkin = new org.mokylin.skin.loading.LoadingUpSkin()
			temp.skin = skin
			temp.width = 1920;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}