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
	public class PKModeTipSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var imgBG:feathers.controls.UIAsset;

		public var modeName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PKModeTipSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [imgBG_i(),__PKModeTipSkin_UIAsset1_i(),__PKModeTipSkin_Label1_i(),__PKModeTipSkin_Label2_i(),modeName_i(),__PKModeTipSkin_Label3_i(),__PKModeTipSkin_Label4_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __PKModeTipSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "点击可更改攻击模式";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 14;
			temp.y = 7;
			return temp;
		}

		private function __PKModeTipSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "当前攻击模式：";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 12;
			temp.y = 44;
			return temp;
		}

		private function __PKModeTipSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "ctrl+H";
			temp.color = 0xE0D470;
			temp.nativeFilters = Fontter.filterObj["textFilterBlack"];
			temp.width = 96;
			temp.x = 138;
			temp.y = 68;
			return temp;
		}

		private function __PKModeTipSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "模式切换快捷键：";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 13;
			temp.y = 67;
			return temp;
		}

		private function __PKModeTipSkin_UIAsset1_i():feathers.controls.UIAsset
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
			temp.height = 105;
			temp.styleName = "ui/common/tip/tips_di.png";
			temp.width = 245;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function modeName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			modeName = temp;
			temp.name = "modeName";
			temp.fontSize = 16;
			temp.text = "和平模式";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 112;
			temp.x = 122;
			temp.y = 45;
			return temp;
		}

	}
}