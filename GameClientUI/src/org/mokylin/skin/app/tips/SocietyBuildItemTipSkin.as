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
	public class SocietyBuildItemTipSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var icon:feathers.controls.UIAsset;

		public var imgBG:feathers.controls.UIAsset;

		public var labDesc:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SocietyBuildItemTipSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 110;
			this.width = 390;
			this.elementsContent = [imgBG_i(),labDesc_i(),icon_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.height = 74;
			temp.styleName = "ui/common/grid/normal/60.png";
			temp.width = 76;
			temp.x = 20;
			temp.y = 16;
			return temp;
		}

		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.height = 110;
			temp.styleName = "ui/common/tip/tips_di.png";
			temp.width = 390;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labDesc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labDesc = temp;
			temp.name = "labDesc";
			temp.height = 80;
			temp.leading = 4;
			temp.fontSize = 14;
			temp.text = "描述描述描述描述描述描述描述描述描述描述描述描述描述描述";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 260;
			temp.x = 105;
			temp.y = 13;
			return temp;
		}

	}
}