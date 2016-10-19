package org.mokylin.skin.app.collect
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
	public class CollectBarSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var imgProgress:feathers.controls.UIAsset;

		public var userData:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CollectBarSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 20;
			this.width = 220;
			this.elementsContent = [__CollectBarSkin_UIAsset1_i(),imgProgress_i(),userData_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CollectBarSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 20;
			temp.styleName = "ui/common/tip/tips.png";
			temp.width = 220;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgProgress_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgProgress = temp;
			temp.name = "imgProgress";
			temp.height = 12;
			temp.styleName = "ui/common/bar/jyt.png";
			temp.width = 212;
			temp.x = 4;
			temp.y = 4;
			return temp;
		}

		private function userData_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			userData = temp;
			temp.name = "userData";
			temp.bold = false;
			temp.height = 20;
			temp.horizontalCenter = 0;
			temp.letterSpacing = 1;
			temp.fontSize = 14;
			temp.text = "标签";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 200;
			temp.y = 1;
			return temp;
		}

	}
}