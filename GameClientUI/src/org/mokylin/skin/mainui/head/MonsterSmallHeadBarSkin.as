package org.mokylin.skin.mainui.head
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import flash.filters.GlowFilter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.component.uinumber.UINumberSkin_yellow_min;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MonsterSmallHeadBarSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var flag:feathers.controls.UIAsset;

		public var icon:feathers.controls.UIAsset;

		public var imgLife:feathers.controls.UIAsset;

		public var labHP:feathers.controls.Label;

		public var labLevel:feathers.controls.UINumber;

		public var labName:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MonsterSmallHeadBarSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 100;
			this.width = 385;
			labelFilterBlack_i();
			this.elementsContent = [bg_i(),imgLife_i(),labHP_i(),labName_i(),labLevel_i(),icon_i(),flag_i()];
			
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
			temp.height = 62;
			temp.styleName = "ui/mainui/head/small/bg.png";
			temp.width = 385;
			temp.x = 0;
			temp.y = 15;
			return temp;
		}

		private function flag_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			flag = temp;
			temp.name = "flag";
			temp.height = 32;
			temp.styleName = "ui/mainui/head/small/flag.png";
			temp.width = 49;
			temp.x = 337;
			temp.y = 27;
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.height = 71;
			temp.styleName = "ui/mainui/head/small/head_icon.png";
			temp.width = 64;
			temp.x = 4;
			temp.y = 5;
			return temp;
		}

		private function imgLife_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLife = temp;
			temp.name = "imgLife";
			temp.height = 13;
			temp.styleName = "ui/mainui/head/small/bar.png";
			temp.width = 301;
			temp.x = 72;
			temp.y = 39;
			return temp;
		}

		private function labHP_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labHP = temp;
			temp.name = "labHP";
			temp.bold = false;
			temp.height = 16;
			temp.text = "1000/1000";
			temp.textAlign = "center";
			temp.color = 0xFFFFFF;
			temp.width = 182;
			temp.x = 120;
			temp.y = 38;
			return temp;
		}

		private function labLevel_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			labLevel = temp;
			temp.name = "labLevel";
			temp.gap = -5;
			temp.height = 21;
			temp.label = "100";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.uinumber.UINumberSkin_yellow_min);
			temp.width = 73;
			temp.x = 81;
			temp.y = 16;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.bold = true;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.fontName = "SimHei";
			temp.height = 18;
			temp.fontSize = 14;
			temp.text = "名字";
			temp.color = 0xDFB777;
			temp.width = 214;
			temp.x = 159;
			temp.y = 17;
			return temp;
		}

		private function labelFilterBlack_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterBlack = temp;
			temp.alpha = 1.00;
			temp.blurX = 2;
			temp.blurY = 2;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 4;
			return temp;
		}

	}
}