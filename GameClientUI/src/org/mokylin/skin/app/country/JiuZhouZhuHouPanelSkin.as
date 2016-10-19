package org.mokylin.skin.app.country
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import flash.filters.GlowFilter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import org.mokylin.skin.app.country.jiuzhouzhuhou.mc.UIMovieClipKing_name;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JiuZhouZhuHouPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var bg_no_has_huang_di:feathers.controls.UIAsset;

		public var kingName_1:feathers.controls.UIMovieClip;

		public var kingName_2:feathers.controls.UIMovieClip;

		public var kingName_3:feathers.controls.UIMovieClip;

		public var kingName_4:feathers.controls.UIMovieClip;

		public var kingName_huangdi:feathers.controls.UIMovieClip;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var nameTxt_huangDi:feathers.controls.Label;

		public var nameTxt_huangdi_none:feathers.controls.UIAsset;

		public var nameTxt_king1:feathers.controls.Label;

		public var nameTxt_king2:feathers.controls.Label;

		public var nameTxt_king3:feathers.controls.Label;

		public var nameTxt_king4:feathers.controls.Label;

		public var nameTxt_king_none_1:feathers.controls.UIAsset;

		public var nameTxt_king_none_2:feathers.controls.UIAsset;

		public var nameTxt_king_none_3:feathers.controls.UIAsset;

		public var nameTxt_king_none_4:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JiuZhouZhuHouPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			labelFilterBlack_i();
			this.elementsContent = [bg_i(),nameTxt_king4_i(),nameTxt_king1_i(),nameTxt_king3_i(),nameTxt_huangDi_i(),nameTxt_king2_i(),kingName_1_i(),kingName_4_i(),kingName_huangdi_i(),kingName_2_i(),kingName_3_i(),nameTxt_king_none_1_i(),nameTxt_king_none_2_i(),nameTxt_king_none_3_i(),nameTxt_king_none_4_i(),nameTxt_huangdi_none_i(),bg_no_has_huang_di_i()];
			
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
			temp.height = 496;
			temp.styleName = "ui/big_bg/jiuzhouzhuhou_di.png";
			temp.width = 883;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_no_has_huang_di_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_no_has_huang_di = temp;
			temp.name = "bg_no_has_huang_di";
			temp.height = 496;
			temp.styleName = "ui/big_bg/di_2.png";
			temp.width = 883;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function kingName_1_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			kingName_1 = temp;
			temp.name = "kingName_1";
			temp.height = 34;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.country.jiuzhouzhuhou.mc.UIMovieClipKing_name);
			temp.width = 68;
			temp.x = 106;
			temp.y = 116;
			return temp;
		}

		private function kingName_2_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			kingName_2 = temp;
			temp.name = "kingName_2";
			temp.height = 34;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.country.jiuzhouzhuhou.mc.UIMovieClipKing_name);
			temp.width = 68;
			temp.x = 264;
			temp.y = 126;
			return temp;
		}

		private function kingName_3_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			kingName_3 = temp;
			temp.name = "kingName_3";
			temp.height = 34;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.country.jiuzhouzhuhou.mc.UIMovieClipKing_name);
			temp.width = 68;
			temp.x = 534;
			temp.y = 126;
			return temp;
		}

		private function kingName_4_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			kingName_4 = temp;
			temp.name = "kingName_4";
			temp.height = 34;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.country.jiuzhouzhuhou.mc.UIMovieClipKing_name);
			temp.width = 68;
			temp.x = 698;
			temp.y = 116;
			return temp;
		}

		private function kingName_huangdi_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			kingName_huangdi = temp;
			temp.name = "kingName_huangdi";
			temp.height = 34;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.country.jiuzhouzhuhou.mc.UIMovieClipKing_name);
			temp.width = 68;
			temp.x = 416;
			temp.y = 31;
			return temp;
		}

		private function labelFilterBlack_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterBlack = temp;
			temp.alpha = 1.00;
			temp.blurX = 4;
			temp.blurY = 4;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 10;
			return temp;
		}

		private function nameTxt_huangDi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nameTxt_huangDi = temp;
			temp.name = "nameTxt_huangDi";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 28;
			temp.fontSize = 14;
			temp.text = "皇帝名字";
			temp.textAlign = "center";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 200;
			temp.x = 350;
			temp.y = 65;
			return temp;
		}

		private function nameTxt_huangdi_none_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			nameTxt_huangdi_none = temp;
			temp.name = "nameTxt_huangdi_none";
			temp.styleName = "ui/app/country/guojia/xu_wei_yi_dai.png";
			temp.x = 416;
			temp.y = 64;
			return temp;
		}

		private function nameTxt_king1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nameTxt_king1 = temp;
			temp.name = "nameTxt_king1";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 28;
			temp.fontSize = 14;
			temp.text = "荆州王名字";
			temp.textAlign = "center";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 200;
			temp.x = 41;
			temp.y = 150;
			return temp;
		}

		private function nameTxt_king2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nameTxt_king2 = temp;
			temp.name = "nameTxt_king2";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 28;
			temp.fontSize = 14;
			temp.text = "幽州王名字";
			temp.textAlign = "center";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 200;
			temp.x = 198;
			temp.y = 160;
			return temp;
		}

		private function nameTxt_king3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nameTxt_king3 = temp;
			temp.name = "nameTxt_king3";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 28;
			temp.fontSize = 14;
			temp.text = "扬州王名字";
			temp.textAlign = "center";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 200;
			temp.x = 468;
			temp.y = 160;
			return temp;
		}

		private function nameTxt_king4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nameTxt_king4 = temp;
			temp.name = "nameTxt_king4";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 28;
			temp.fontSize = 14;
			temp.text = "益州王名字";
			temp.textAlign = "center";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 200;
			temp.x = 632;
			temp.y = 150;
			return temp;
		}

		private function nameTxt_king_none_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			nameTxt_king_none_1 = temp;
			temp.name = "nameTxt_king_none_1";
			temp.styleName = "ui/app/country/guojia/xu_wei_yi_dai.png";
			temp.x = 108;
			temp.y = 149;
			return temp;
		}

		private function nameTxt_king_none_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			nameTxt_king_none_2 = temp;
			temp.name = "nameTxt_king_none_2";
			temp.styleName = "ui/app/country/guojia/xu_wei_yi_dai.png";
			temp.x = 264;
			temp.y = 159;
			return temp;
		}

		private function nameTxt_king_none_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			nameTxt_king_none_3 = temp;
			temp.name = "nameTxt_king_none_3";
			temp.styleName = "ui/app/country/guojia/xu_wei_yi_dai.png";
			temp.x = 534;
			temp.y = 159;
			return temp;
		}

		private function nameTxt_king_none_4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			nameTxt_king_none_4 = temp;
			temp.name = "nameTxt_king_none_4";
			temp.styleName = "ui/app/country/guojia/xu_wei_yi_dai.png";
			temp.x = 698;
			temp.y = 149;
			return temp;
		}

	}
}