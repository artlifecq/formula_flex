package org.mokylin.skin.component.text
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
	public class textInput1_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var textDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function textInput1_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),textDisplay_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/background/xiaobiaotibeijing.png";
			temp.y = 0;
			return temp;
		}

		private function textDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			textDisplay = temp;
			temp.name = "textDisplay";
			temp.text = "标签";
			temp.color = 0x5cb006;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 38;
			temp.x = 5;
			temp.y = 3;
			return temp;
		}

	}
}