package org.mokylin.skin.mainui.head
{
	import feathers.controls.text.Fontter;
	import flash.filters.GlowFilter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.component.uinumber.UINumberSkin_yellow_middle;
	import org.mokylin.skin.component.uinumber.UINumberSkin_yellow_min;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MonsterBossHeadBarSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var flag:feathers.controls.UIAsset;

		public var icon:feathers.controls.UIAsset;

		public var imgLife:feathers.controls.Group;

		public var imgLife_0:feathers.controls.UIAsset;

		public var imgLife_1:feathers.controls.UIAsset;

		public var imgLife_2:feathers.controls.UIAsset;

		public var imgLife_3:feathers.controls.UIAsset;

		public var imgLife_4:feathers.controls.UIAsset;

		public var imgLife_5:feathers.controls.UIAsset;

		public var imgLife_6:feathers.controls.UIAsset;

		public var labHP:feathers.controls.Label;

		public var labLevel:feathers.controls.UINumber;

		public var labName:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var lefter:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MonsterBossHeadBarSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 120;
			this.width = 643;
			labelFilterBlack_i();
			this.elementsContent = [bg_i(),imgLife_i(),labHP_i(),labName_i(),labLevel_i(),icon_i(),flag_i(),lefter_i()];
			
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
			temp.height = 120;
			temp.styleName = "ui/mainui/head/boss/bg.png";
			temp.width = 634;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function flag_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			flag = temp;
			temp.name = "flag";
			temp.height = 88;
			temp.styleName = "ui/mainui/head/boss/flag.png";
			temp.width = 117;
			temp.x = 517;
			temp.y = 28;
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.height = 71;
			temp.styleName = "ui/mainui/head/boss/head_icon.png";
			temp.width = 64;
			temp.x = 27;
			temp.y = 36;
			return temp;
		}

		private function imgLife_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLife_0 = temp;
			temp.name = "imgLife_0";
			temp.height = 20;
			temp.styleName = "ui/mainui/head/boss/hong.png";
			temp.width = 503;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgLife_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLife_1 = temp;
			temp.name = "imgLife_1";
			temp.height = 20;
			temp.styleName = "ui/mainui/head/boss/cheng.png";
			temp.width = 503;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgLife_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLife_2 = temp;
			temp.name = "imgLife_2";
			temp.height = 20;
			temp.styleName = "ui/mainui/head/boss/huang.png";
			temp.width = 503;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgLife_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLife_3 = temp;
			temp.name = "imgLife_3";
			temp.height = 20;
			temp.styleName = "ui/mainui/head/boss/zi.png";
			temp.width = 503;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgLife_4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLife_4 = temp;
			temp.name = "imgLife_4";
			temp.height = 20;
			temp.styleName = "ui/mainui/head/boss/qing.png";
			temp.width = 503;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgLife_5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLife_5 = temp;
			temp.name = "imgLife_5";
			temp.height = 20;
			temp.styleName = "ui/mainui/head/boss/lan.png";
			temp.width = 503;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgLife_6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLife_6 = temp;
			temp.name = "imgLife_6";
			temp.height = 20;
			temp.styleName = "ui/mainui/head/boss/lv.png";
			temp.width = 503;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgLife_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			imgLife = temp;
			temp.name = "imgLife";
			temp.height = 20;
			temp.width = 503;
			temp.x = 102;
			temp.y = 66;
			temp.elementsContent = [imgLife_0_i(),imgLife_1_i(),imgLife_2_i(),imgLife_3_i(),imgLife_4_i(),imgLife_5_i(),imgLife_6_i()];
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
			temp.visible = false;
			temp.width = 182;
			temp.x = 236;
			temp.y = 68;
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
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_yellow_middle;
			temp.width = 73;
			temp.x = 127;
			temp.y = 38;
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
			temp.height = 22;
			temp.fontSize = 18;
			temp.text = "名字";
			temp.color = 0xDFB777;
			temp.width = 271;
			temp.x = 223;
			temp.y = 39;
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

		private function lefter_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			lefter = temp;
			temp.name = "lefter";
			temp.gap = -5;
			temp.height = 25;
			temp.label = "x7";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_yellow_min;
			temp.width = 29;
			temp.x = 613;
			temp.y = 70;
			return temp;
		}

	}
}