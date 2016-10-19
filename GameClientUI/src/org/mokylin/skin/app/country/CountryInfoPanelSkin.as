package org.mokylin.skin.app.country
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.Rect;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.country.guojia.button.ButtonGuowang;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CountryInfoPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var chengXiangMask:feathers.controls.Rect;

		public var daDuDuMask:feathers.controls.Rect;

		public var guoJiaNameTxt:feathers.controls.Label;

		public var guoKuTxt:feathers.controls.Label;

		public var guoWangMask:feathers.controls.Rect;

		public var guoWangNameTxt:feathers.controls.Label;

		public var kingBtn:feathers.controls.Button;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var mengGuoNameTxt:feathers.controls.Label;

		public var nameTxt_chengXiang:feathers.controls.Label;

		public var nameTxt_chengXiang_none:feathers.controls.UIAsset;

		public var nameTxt_daDuDu:feathers.controls.Label;

		public var nameTxt_daDuDu_none:feathers.controls.UIAsset;

		public var nameTxt_king:feathers.controls.Label;

		public var nameTxt_king_none:feathers.controls.UIAsset;

		public var nameTxt_queen:feathers.controls.Label;

		public var nameTxt_queen_none:feathers.controls.UIAsset;

		public var nameTxt_taiShi:feathers.controls.Label;

		public var nameTxt_taiShi_none:feathers.controls.UIAsset;

		public var nameTxt_taiWei:feathers.controls.Label;

		public var nameTxt_taiWei_none:feathers.controls.UIAsset;

		public var notifyTxt:feathers.controls.Label;

		public var taiShiMask:feathers.controls.Rect;

		public var taiWeiMask:feathers.controls.Rect;

		public var tongZhiLiTxt:feathers.controls.Label;

		public var wangHouMask:feathers.controls.Rect;

		public var zongHeGuoLiTxt:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CountryInfoPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			labelFilterBlack_i();
			this.elementsContent = [bg_i(),__CountryInfoPanelSkin_UIAsset1_i(),__CountryInfoPanelSkin_UIAsset2_i(),__CountryInfoPanelSkin_UIAsset3_i(),notifyTxt_i(),guoJiaNameTxt_i(),guoWangNameTxt_i(),tongZhiLiTxt_i(),zongHeGuoLiTxt_i(),guoKuTxt_i(),mengGuoNameTxt_i(),__CountryInfoPanelSkin_Group1_i(),__CountryInfoPanelSkin_Group2_i(),__CountryInfoPanelSkin_Group3_i(),__CountryInfoPanelSkin_Group4_i(),__CountryInfoPanelSkin_Group5_i(),__CountryInfoPanelSkin_Group6_i(),chengXiangMask_i(),taiShiMask_i(),wangHouMask_i(),guoWangMask_i(),daDuDuMask_i(),taiWeiMask_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CountryInfoPanelSkin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 49;
			temp.y = 170;
			temp.elementsContent = [nameTxt_chengXiang_i(),__CountryInfoPanelSkin_UIAsset4_i(),nameTxt_chengXiang_none_i()];
			return temp;
		}

		private function __CountryInfoPanelSkin_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 659;
			temp.y = 170;
			temp.elementsContent = [nameTxt_taiWei_i(),__CountryInfoPanelSkin_UIAsset5_i(),nameTxt_taiWei_none_i()];
			return temp;
		}

		private function __CountryInfoPanelSkin_Group3_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 184;
			temp.y = 150;
			temp.elementsContent = [nameTxt_taiShi_i(),__CountryInfoPanelSkin_UIAsset6_i(),nameTxt_taiShi_none_i()];
			return temp;
		}

		private function __CountryInfoPanelSkin_Group4_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 262;
			temp.y = 50;
			temp.elementsContent = [nameTxt_queen_i(),__CountryInfoPanelSkin_UIAsset7_i(),nameTxt_queen_none_i()];
			return temp;
		}

		private function __CountryInfoPanelSkin_Group5_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 541;
			temp.y = 150;
			temp.elementsContent = [nameTxt_daDuDu_i(),__CountryInfoPanelSkin_UIAsset8_i(),nameTxt_daDuDu_none_i()];
			return temp;
		}

		private function __CountryInfoPanelSkin_Group6_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 373;
			temp.y = 50;
			temp.elementsContent = [nameTxt_king_i(),nameTxt_king_none_i(),kingBtn_i()];
			return temp;
		}

		private function __CountryInfoPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/guojia/gong_gao_di1.png";
			temp.width = 864;
			temp.x = 9;
			temp.y = 6;
			return temp;
		}

		private function __CountryInfoPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/guojia/gonggao_di.png";
			temp.x = 9;
			temp.y = 452;
			return temp;
		}

		private function __CountryInfoPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/guojia/gonggao_laba.png";
			temp.x = 9;
			temp.y = 463;
			return temp;
		}

		private function __CountryInfoPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/guojia/chengxiang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __CountryInfoPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/guojia/taiwei.png";
			temp.x = 2;
			temp.y = 0;
			return temp;
		}

		private function __CountryInfoPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/guojia/taishi.png";
			temp.x = 2;
			temp.y = 0;
			return temp;
		}

		private function __CountryInfoPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/guojia/wanghou.png";
			temp.x = 1;
			temp.y = 0;
			return temp;
		}

		private function __CountryInfoPanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/guojia/dadudu.png";
			temp.x = 4;
			temp.y = 0;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 496;
			temp.styleName = "ui/big_bg/guoji_di.png";
			temp.width = 883;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function chengXiangMask_i():feathers.controls.Rect
		{
			var temp:feathers.controls.Rect = new feathers.controls.Rect();
			chengXiangMask = temp;
			temp.name = "chengXiangMask";
			temp.alpha = 0.001;
			temp.height = 225;
			temp.width = 122;
			temp.x = 52;
			temp.y = 232;
			return temp;
		}

		private function daDuDuMask_i():feathers.controls.Rect
		{
			var temp:feathers.controls.Rect = new feathers.controls.Rect();
			daDuDuMask = temp;
			temp.name = "daDuDuMask";
			temp.alpha = 0.001;
			temp.height = 255;
			temp.width = 95;
			temp.x = 570;
			temp.y = 195;
			return temp;
		}

		private function guoJiaNameTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			guoJiaNameTxt = temp;
			temp.name = "guoJiaNameTxt";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"LEFT\"><FONT FACE=\"微软雅黑\" SIZE=\"12\" COLOR=\"#F9F0CC\" LETTERSPACING=\"0\" KERNING=\"0\">时间：2015-11-25</FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "国家：青州";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 120;
			temp.x = 34;
			temp.y = 10;
			return temp;
		}

		private function guoKuTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			guoKuTxt = temp;
			temp.name = "guoKuTxt";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"LEFT\"><FONT FACE=\"微软雅黑\" SIZE=\"12\" COLOR=\"#F9F0CC\" LETTERSPACING=\"0\" KERNING=\"0\">时间：2015-11-25</FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "国库：300";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 140;
			temp.x = 586;
			temp.y = 10;
			return temp;
		}

		private function guoWangMask_i():feathers.controls.Rect
		{
			var temp:feathers.controls.Rect = new feathers.controls.Rect();
			guoWangMask = temp;
			temp.name = "guoWangMask";
			temp.alpha = 0.001;
			temp.height = 224;
			temp.width = 141;
			temp.x = 380;
			temp.y = 95;
			return temp;
		}

		private function guoWangNameTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			guoWangNameTxt = temp;
			temp.name = "guoWangNameTxt";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"LEFT\"><FONT FACE=\"微软雅黑\" SIZE=\"12\" COLOR=\"#F9F0CC\" LETTERSPACING=\"0\" KERNING=\"0\">时间：2015-11-25</FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "国王：花花";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 140;
			temp.x = 142;
			temp.y = 10;
			return temp;
		}

		private function kingBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			kingBtn = temp;
			temp.name = "kingBtn";
			temp.height = 35;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.country.guojia.button.ButtonGuowang);
			temp.width = 138;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labelFilterBlack_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterBlack = temp;
			temp.alpha = 1;
			temp.blurX = 4;
			temp.blurY = 4;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 10;
			return temp;
		}

		private function mengGuoNameTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			mengGuoNameTxt = temp;
			temp.name = "mengGuoNameTxt";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"LEFT\"><FONT FACE=\"微软雅黑\" SIZE=\"12\" COLOR=\"#F9F0CC\" LETTERSPACING=\"0\" KERNING=\"0\">时间：2015-11-25</FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "盟国：益州";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 120;
			temp.x = 730;
			temp.y = 10;
			return temp;
		}

		private function nameTxt_chengXiang_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nameTxt_chengXiang = temp;
			temp.name = "nameTxt_chengXiang";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "虚位以待";
			temp.textAlign = "center";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 140;
			temp.x = 1;
			temp.y = 30;
			return temp;
		}

		private function nameTxt_chengXiang_none_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			nameTxt_chengXiang_none = temp;
			temp.name = "nameTxt_chengXiang_none";
			temp.styleName = "ui/app/country/guojia/xu_wei_yi_dai.png";
			temp.x = 37;
			temp.y = 29;
			return temp;
		}

		private function nameTxt_daDuDu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nameTxt_daDuDu = temp;
			temp.name = "nameTxt_daDuDu";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "虚位以待";
			temp.textAlign = "center";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 140;
			temp.x = 0;
			temp.y = 30;
			return temp;
		}

		private function nameTxt_daDuDu_none_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			nameTxt_daDuDu_none = temp;
			temp.name = "nameTxt_daDuDu_none";
			temp.styleName = "ui/app/country/guojia/xu_wei_yi_dai.png";
			temp.x = 36;
			temp.y = 29;
			return temp;
		}

		private function nameTxt_king_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nameTxt_king = temp;
			temp.name = "nameTxt_king";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "虚位以待";
			temp.textAlign = "center";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 140;
			temp.x = 1;
			temp.y = 30;
			return temp;
		}

		private function nameTxt_king_none_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			nameTxt_king_none = temp;
			temp.name = "nameTxt_king_none";
			temp.styleName = "ui/app/country/guojia/xu_wei_yi_dai.png";
			temp.x = 37;
			temp.y = 29;
			return temp;
		}

		private function nameTxt_queen_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nameTxt_queen = temp;
			temp.name = "nameTxt_queen";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "虚位以待";
			temp.textAlign = "center";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 140;
			temp.x = 0;
			temp.y = 30;
			return temp;
		}

		private function nameTxt_queen_none_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			nameTxt_queen_none = temp;
			temp.name = "nameTxt_queen_none";
			temp.styleName = "ui/app/country/guojia/xu_wei_yi_dai.png";
			temp.x = 36;
			temp.y = 29;
			return temp;
		}

		private function nameTxt_taiShi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nameTxt_taiShi = temp;
			temp.name = "nameTxt_taiShi";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "虚位以待";
			temp.textAlign = "center";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 140;
			temp.x = 0;
			temp.y = 30;
			return temp;
		}

		private function nameTxt_taiShi_none_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			nameTxt_taiShi_none = temp;
			temp.name = "nameTxt_taiShi_none";
			temp.styleName = "ui/app/country/guojia/xu_wei_yi_dai.png";
			temp.x = 36;
			temp.y = 29;
			return temp;
		}

		private function nameTxt_taiWei_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nameTxt_taiWei = temp;
			temp.name = "nameTxt_taiWei";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "虚位以待";
			temp.textAlign = "center";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 140;
			temp.x = 0;
			temp.y = 30;
			return temp;
		}

		private function nameTxt_taiWei_none_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			nameTxt_taiWei_none = temp;
			temp.name = "nameTxt_taiWei_none";
			temp.styleName = "ui/app/country/guojia/xu_wei_yi_dai.png";
			temp.x = 36;
			temp.y = 29;
			return temp;
		}

		private function notifyTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			notifyTxt = temp;
			temp.name = "notifyTxt";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "公告内容";
			temp.textAlign = "left";
			temp.color = 0xFFE258;
			temp.width = 723;
			temp.x = 138;
			temp.y = 465;
			return temp;
		}

		private function taiShiMask_i():feathers.controls.Rect
		{
			var temp:feathers.controls.Rect = new feathers.controls.Rect();
			taiShiMask = temp;
			temp.name = "taiShiMask";
			temp.alpha = 0.001;
			temp.height = 242;
			temp.width = 108;
			temp.x = 192;
			temp.y = 205;
			return temp;
		}

		private function taiWeiMask_i():feathers.controls.Rect
		{
			var temp:feathers.controls.Rect = new feathers.controls.Rect();
			taiWeiMask = temp;
			temp.name = "taiWeiMask";
			temp.alpha = 0.001;
			temp.height = 250;
			temp.width = 133;
			temp.x = 680;
			temp.y = 225;
			return temp;
		}

		private function tongZhiLiTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			tongZhiLiTxt = temp;
			temp.name = "tongZhiLiTxt";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"LEFT\"><FONT FACE=\"微软雅黑\" SIZE=\"12\" COLOR=\"#F9F0CC\" LETTERSPACING=\"0\" KERNING=\"0\">时间：2015-11-25</FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "统治力：300";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 140;
			temp.x = 290;
			temp.y = 10;
			return temp;
		}

		private function wangHouMask_i():feathers.controls.Rect
		{
			var temp:feathers.controls.Rect = new feathers.controls.Rect();
			wangHouMask = temp;
			temp.name = "wangHouMask";
			temp.alpha = 0.001;
			temp.height = 224;
			temp.width = 67;
			temp.x = 300;
			temp.y = 95;
			return temp;
		}

		private function zongHeGuoLiTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			zongHeGuoLiTxt = temp;
			temp.name = "zongHeGuoLiTxt";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"LEFT\"><FONT FACE=\"微软雅黑\" SIZE=\"12\" COLOR=\"#F9F0CC\" LETTERSPACING=\"0\" KERNING=\"0\">时间：2015-11-25</FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "综合国力：300";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 140;
			temp.x = 436;
			temp.y = 10;
			return temp;
		}

	}
}