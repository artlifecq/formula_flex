package org.mokylin.skin.app.daTi
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_red_3;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class DaTiPropListItemRenderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var button:feathers.controls.Button;

		public var lbDesc:feathers.controls.Label;

		public var lbNameCount:feathers.controls.Label;

		public var lbValueCount:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function DaTiPropListItemRenderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.width = 151;
			this.elementsContent = [bg_i(),button_i(),lbNameCount_i(),lbValueCount_i(),lbDesc_i()];
			
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
			temp.height = 123;
			temp.styleName = "ui/app/daTi/an-niu-bg.png";
			temp.width = 146;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function button_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			button = temp;
			temp.name = "button";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "双倍积分";
			temp.fontSize = 16;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_red_3);
			temp.color = 0xF9F0CC;
			temp.x = 10;
			temp.y = 19;
			return temp;
		}

		private function lbDesc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDesc = temp;
			temp.name = "lbDesc";
			temp.height = 23;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "答对本题得分翻倍";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 128;
			temp.x = 10;
			temp.y = 87;
			return temp;
		}

		private function lbNameCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNameCount = temp;
			temp.name = "lbNameCount";
			temp.height = 23;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "剩余次数:";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 74;
			temp.x = 10;
			temp.y = 67;
			return temp;
		}

		private function lbValueCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbValueCount = temp;
			temp.name = "lbValueCount";
			temp.height = 23;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "3/3";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 39;
			temp.x = 77;
			temp.y = 67;
			return temp;
		}

	}
}