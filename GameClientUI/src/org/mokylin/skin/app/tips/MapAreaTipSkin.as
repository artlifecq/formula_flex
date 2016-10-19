package org.mokylin.skin.app.tips
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MapAreaTipSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var imgBG:feathers.controls.UIAsset;

		public var labDesc:feathers.controls.Label;

		public var labTitle:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MapAreaTipSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [imgBG_i(),__MapAreaTipSkin_UIAsset1_i(),labTitle_i(),labDesc_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MapAreaTipSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 5;
			temp.styleName = "ui/common/tip/taitoufengexian.png";
			temp.width = 231;
			temp.x = 7;
			temp.y = 35;
			return temp;
		}

		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.height = 250;
			temp.styleName = "ui/common/tip/tips_di.png";
			temp.width = 245;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labDesc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labDesc = temp;
			temp.name = "labDesc";
			temp.height = 180;
			temp.leading = 4;
			temp.fontSize = 14;
			temp.text = "当前描述当前描述当前描述当前描述当前描述当前描述当前描述当前描述当前描述当前描述当前描述当前描述当前描述当前描述";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 210;
			temp.x = 17;
			temp.y = 45;
			return temp;
		}

		private function labTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTitle = temp;
			temp.name = "labTitle";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "安全区域";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 200;
			temp.x = 20;
			temp.y = 12;
			return temp;
		}

	}
}