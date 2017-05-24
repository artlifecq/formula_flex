package org.mokylin.skin.app.wuxue
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
	public class Title_Skin extends feathers.controls.StateSkin
	{
		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Title_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 27;
			this.width = 528;
			this.elementsContent = [__Title_Skin_UIAsset1_i(),labelDisplay_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Title_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/titilebg/Item_bg2.png";
			temp.y = 0;
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.bold = true;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.left = 29;
			temp.letterSpacing = -1;
			temp.text = "职业技能";
			temp.color = 0xA6A07B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.y = 4;
			return temp;
		}

	}
}