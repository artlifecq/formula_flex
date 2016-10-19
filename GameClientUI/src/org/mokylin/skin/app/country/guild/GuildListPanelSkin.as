package org.mokylin.skin.app.country.guild
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.country.button.ButtonChazhao;
	import org.mokylin.skin.component.button.ButtonSkin_shouRed;
	import org.mokylin.skin.component.button.ButtonSkin_weiRed;
	import org.mokylin.skin.component.button.ButtonSkin_youRed;
	import org.mokylin.skin.component.button.ButtonSkin_zuoRed;
	import org.mokylin.skin.component.check.CheckBoxSkin_3;
	import org.mokylin.skin.component.list.ListRedSkin;
	import org.mokylin.skin.component.text.TextInput3Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class GuildListPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var autoRefine:feathers.controls.Check;

		public var emptyTips:feathers.controls.UIAsset;

		public var firstBtn:feathers.controls.Button;

		public var lastBtn:feathers.controls.Button;

		public var list:feathers.controls.List;

		public var nextBtn:feathers.controls.Button;

		public var pageText:feathers.controls.Label;

		public var prevBtn:feathers.controls.Button;

		public var searchBtn:feathers.controls.Button;

		public var selectGuildName:feathers.controls.TextInput;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function GuildListPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__GuildListPanelSkin_UIAsset1_i(),emptyTips_i(),__GuildListPanelSkin_UIAsset2_i(),__GuildListPanelSkin_UIAsset3_i(),list_i(),__GuildListPanelSkin_Label1_i(),__GuildListPanelSkin_UIAsset4_i(),__GuildListPanelSkin_Label2_i(),__GuildListPanelSkin_UIAsset5_i(),__GuildListPanelSkin_UIAsset6_i(),__GuildListPanelSkin_UIAsset7_i(),__GuildListPanelSkin_Label3_i(),__GuildListPanelSkin_Label4_i(),__GuildListPanelSkin_Label5_i(),__GuildListPanelSkin_Label6_i(),__GuildListPanelSkin_UIAsset8_i(),autoRefine_i(),__GuildListPanelSkin_UIAsset9_i(),pageText_i(),prevBtn_i(),nextBtn_i(),firstBtn_i(),lastBtn_i(),searchBtn_i(),selectGuildName_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __GuildListPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "帮主名称";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 80;
			temp.x = 227;
			temp.y = 21;
			return temp;
		}

		private function __GuildListPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "帮派等级";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 80;
			temp.x = 376;
			temp.y = 21;
			return temp;
		}

		private function __GuildListPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "帮派繁荣度";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 80;
			temp.x = 634;
			temp.y = 21;
			return temp;
		}

		private function __GuildListPanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "家族人数";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 80;
			temp.x = 498;
			temp.y = 21;
			return temp;
		}

		private function __GuildListPanelSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "操作";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 80;
			temp.x = 767;
			temp.y = 21;
			return temp;
		}

		private function __GuildListPanelSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "帮派名称";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 108;
			temp.x = 54;
			temp.y = 21;
			return temp;
		}

		private function __GuildListPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 442;
			temp.styleName = "ui/app/country/niupizhi/di.png";
			temp.width = 870;
			temp.x = 7;
			temp.y = 5;
			return temp;
		}

		private function __GuildListPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 51;
			temp.styleName = "ui/app/country/niupizhi/liebiaodi_da.png";
			temp.width = 867;
			temp.x = 8;
			temp.y = 6;
			return temp;
		}

		private function __GuildListPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 58;
			temp.y = 19;
			return temp;
		}

		private function __GuildListPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 203;
			temp.y = 19;
			return temp;
		}

		private function __GuildListPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 467;
			temp.y = 19;
			return temp;
		}

		private function __GuildListPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 329;
			temp.y = 19;
			return temp;
		}

		private function __GuildListPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 603;
			temp.y = 19;
			return temp;
		}

		private function __GuildListPanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/heng.png";
			temp.width = 870;
			temp.x = 6;
			temp.y = 447;
			return temp;
		}

		private function __GuildListPanelSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 28;
			temp.styleName = "ui/common/version_3/S_shurukuang/shu_ru_kuang_1.png";
			temp.width = 178;
			temp.x = 364;
			temp.y = 453;
			return temp;
		}

		private function autoRefine_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			autoRefine = temp;
			temp.name = "autoRefine";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "只显示帮主或副帮主在线的帮派";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.check.CheckBoxSkin_3);
			temp.textAlign = "left";
			temp.color = 0xF6D621;
			temp.width = 254;
			temp.x = 31;
			temp.y = 456;
			return temp;
		}

		private function emptyTips_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			emptyTips = temp;
			temp.name = "emptyTips";
			temp.styleName = "ui/app/country/bangpai/weijianbang.png";
			temp.x = 142;
			temp.y = 110;
			return temp;
		}

		private function firstBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			firstBtn = temp;
			temp.name = "firstBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_shouRed);
			temp.x = 367;
			temp.y = 456;
			return temp;
		}

		private function lastBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			lastBtn = temp;
			temp.name = "lastBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_weiRed);
			temp.x = 517;
			temp.y = 456;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 396;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListRedSkin);
			temp.width = 862;
			temp.x = 10;
			temp.y = 44;
			return temp;
		}

		private function nextBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			nextBtn = temp;
			temp.name = "nextBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_youRed);
			temp.x = 495;
			temp.y = 456;
			return temp;
		}

		private function pageText_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			pageText = temp;
			temp.name = "pageText";
			temp.bold = false;
			temp.fontSize = 16;
			temp.text = "1/10";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.width = 108;
			temp.x = 398;
			temp.y = 457;
			return temp;
		}

		private function prevBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			prevBtn = temp;
			temp.name = "prevBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_zuoRed);
			temp.x = 389;
			temp.y = 456;
			return temp;
		}

		private function searchBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			searchBtn = temp;
			temp.name = "searchBtn";
			temp.height = 29;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.country.button.ButtonChazhao);
			temp.width = 29;
			temp.x = 844;
			temp.y = 455;
			return temp;
		}

		private function selectGuildName_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			selectGuildName = temp;
			temp.name = "selectGuildName";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput3Skin);
			temp.width = 212;
			temp.x = 631;
			temp.y = 457;
			return temp;
		}

	}
}