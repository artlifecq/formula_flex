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
	public class ItemTipsSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bindImage:feathers.controls.UIAsset;

		public var imgBG:feathers.controls.UIAsset;

		public var labDecTxt:feathers.controls.Label;

		public var labName:feathers.controls.Label;

		public var unbindImage:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ItemTipsSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 253;
			this.width = 290;
			this.elementsContent = [imgBG_i(),labName_i(),labDecTxt_i(),unbindImage_i(),bindImage_i(),__ItemTipsSkin_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ItemTipsSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 5;
			temp.styleName = "ui/common/tip/taitoufengexian.png";
			temp.width = 278;
			temp.x = 6;
			temp.y = 61;
			return temp;
		}

		private function bindImage_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bindImage = temp;
			temp.name = "bindImage";
			temp.styleName = "ui/common/tip/yi_bang_ding.png";
			temp.x = 28;
			temp.y = 44;
			return temp;
		}

		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.height = 253;
			temp.styleName = "ui/common/tip/tips_di.png";
			temp.width = 290;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labDecTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labDecTxt = temp;
			temp.name = "labDecTxt";
			temp.height = 156;
			temp.text = "物品描述";
			temp.width = 240;
			temp.x = 24;
			temp.y = 74;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 16;
			temp.text = "回身斩";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 240;
			temp.x = 25;
			temp.y = 18;
			return temp;
		}

		private function unbindImage_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			unbindImage = temp;
			temp.name = "unbindImage";
			temp.styleName = "ui/common/tip/wei_bang_ding.png";
			temp.x = 28;
			temp.y = 44;
			return temp;
		}

	}
}