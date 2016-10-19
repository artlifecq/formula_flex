package org.mokylin.skin.app.crown
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_close_3;
	import org.mokylin.skin.component.button.ButtonSkin_getequip;
	import org.mokylin.skin.component.text.TextInput4Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CrownJunFeiPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn:feathers.controls.Button;

		public var btn0:feathers.controls.Button;

		public var btn1:feathers.controls.Button;

		public var closeBtn:feathers.controls.Button;

		public var des:feathers.controls.Label;

		public var des0:feathers.controls.Label;

		public var des1:feathers.controls.Label;

		public var junFeiGroup:feathers.controls.Group;

		public var junfei:feathers.controls.Label;

		public var junfeiLbl:feathers.controls.TextInput;

		public var max:feathers.controls.Label;

		public var maxGroup:feathers.controls.Group;

		public var maxLbl:feathers.controls.TextInput;

		public var newMax:feathers.controls.Label;

		public var newjunfei:feathers.controls.Label;

		public var newrate:feathers.controls.Label;

		public var rate:feathers.controls.Label;

		public var rateGroup:feathers.controls.Group;

		public var rateLbl:feathers.controls.TextInput;

		public var title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CrownJunFeiPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 484;
			this.elementsContent = [__CrownJunFeiPanelSkin_UIAsset1_i(),__CrownJunFeiPanelSkin_UIAsset2_i(),__CrownJunFeiPanelSkin_UIAsset3_i(),__CrownJunFeiPanelSkin_UIAsset4_i(),__CrownJunFeiPanelSkin_UIAsset5_i(),closeBtn_i(),title_i(),__CrownJunFeiPanelSkin_UIAsset6_i(),__CrownJunFeiPanelSkin_UIAsset7_i(),__CrownJunFeiPanelSkin_UIAsset8_i(),__CrownJunFeiPanelSkin_Label1_i(),__CrownJunFeiPanelSkin_Label2_i(),rate_i(),max_i(),btn1_i(),btn0_i(),junFeiGroup_i(),maxGroup_i(),rateGroup_i(),__CrownJunFeiPanelSkin_Label3_i(),__CrownJunFeiPanelSkin_Label4_i(),newrate_i(),newMax_i(),__CrownJunFeiPanelSkin_Label5_i(),junfei_i(),btn_i(),__CrownJunFeiPanelSkin_Label6_i(),newjunfei_i(),des_i(),des0_i(),des1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CrownJunFeiPanelSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 10;
			return temp;
		}

		private function __CrownJunFeiPanelSkin_HorizontalLayout2_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 10;
			return temp;
		}

		private function __CrownJunFeiPanelSkin_HorizontalLayout3_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 10;
			return temp;
		}

		private function __CrownJunFeiPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "当前补贴上限：";
			temp.color = 0xEAA849;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 121;
			temp.x = 33;
			temp.y = 339;
			return temp;
		}

		private function __CrownJunFeiPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "当前补贴比例：";
			temp.color = 0xEAA849;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 121;
			temp.x = 33;
			temp.y = 192;
			return temp;
		}

		private function __CrownJunFeiPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "额度调整：";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 79;
			temp.x = 49;
			temp.y = 372;
			return temp;
		}

		private function __CrownJunFeiPanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "比例调整：";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 79;
			temp.x = 49;
			temp.y = 225;
			return temp;
		}

		private function __CrownJunFeiPanelSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "当前军费额度：";
			temp.color = 0xEAA849;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 121;
			temp.x = 33;
			temp.y = 45;
			return temp;
		}

		private function __CrownJunFeiPanelSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "额度调整：";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 79;
			temp.x = 49;
			temp.y = 78;
			return temp;
		}

		private function __CrownJunFeiPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 484;
			temp.styleName = "ui/common/backgound/dikuang.png";
			temp.width = 364;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __CrownJunFeiPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 141;
			temp.styleName = "ui/common/kang/neikuang1.png";
			temp.width = 325;
			temp.x = 19;
			temp.y = 39;
			return temp;
		}

		private function __CrownJunFeiPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 138;
			temp.styleName = "ui/common/kang/neikuang1.png";
			temp.width = 325;
			temp.x = 19;
			temp.y = 188;
			return temp;
		}

		private function __CrownJunFeiPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 141;
			temp.styleName = "ui/common/kang/neikuang1.png";
			temp.width = 325;
			temp.x = 19;
			temp.y = 335;
			return temp;
		}

		private function __CrownJunFeiPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/kang/taitougaoliang.png";
			temp.width = 310;
			temp.x = 12;
			temp.y = 8;
			return temp;
		}

		private function __CrownJunFeiPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 100;
			temp.styleName = "ui/common/liebiao/liebiaotiao.png";
			temp.width = 309;
			temp.x = 27;
			temp.y = 368;
			return temp;
		}

		private function __CrownJunFeiPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 100;
			temp.styleName = "ui/common/liebiao/liebiaotiao.png";
			temp.width = 309;
			temp.x = 27;
			temp.y = 221;
			return temp;
		}

		private function __CrownJunFeiPanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 100;
			temp.styleName = "ui/common/liebiao/liebiaotiao.png";
			temp.width = 309;
			temp.x = 27;
			temp.y = 77;
			return temp;
		}

		private function btn0_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn0 = temp;
			temp.name = "btn0";
			temp.height = 31;
			temp.label = "设  定";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_getequip);
			temp.width = 76;
			temp.x = 137;
			temp.y = 284;
			return temp;
		}

		private function btn1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn1 = temp;
			temp.name = "btn1";
			temp.height = 31;
			temp.label = "设  定";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_getequip);
			temp.width = 76;
			temp.x = 137;
			temp.y = 434;
			return temp;
		}

		private function btn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn = temp;
			temp.name = "btn";
			temp.height = 31;
			temp.label = "设  定";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_getequip);
			temp.width = 76;
			temp.x = 137;
			temp.y = 140;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close_3);
			temp.x = 327;
			temp.y = 5;
			return temp;
		}

		private function des0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			des0 = temp;
			temp.name = "des0";
			temp.fontSize = 14;
			temp.text = "比例说明";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = true;
			temp.width = 70;
			temp.x = 269;
			temp.y = 193;
			return temp;
		}

		private function des1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			des1 = temp;
			temp.name = "des1";
			temp.fontSize = 14;
			temp.text = "上限说明";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = true;
			temp.width = 70;
			temp.x = 269;
			temp.y = 342;
			return temp;
		}

		private function des_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			des = temp;
			temp.name = "des";
			temp.fontSize = 14;
			temp.text = "军费说明";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = true;
			temp.width = 70;
			temp.x = 269;
			temp.y = 47;
			return temp;
		}

		private function junFeiGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			junFeiGroup = temp;
			temp.name = "junFeiGroup";
			temp.x = 53;
			temp.y = 111;
			temp.layout = __CrownJunFeiPanelSkin_HorizontalLayout1_i();
			temp.elementsContent = [junfeiLbl_i()];
			return temp;
		}

		private function junfeiLbl_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			junfeiLbl = temp;
			temp.name = "junfeiLbl";
			temp.height = 22;
			temp.maxChars = 9;
			temp.restrict = "0123456789";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput4Skin);
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 48;
			temp.x = 151;
			temp.y = 120;
			return temp;
		}

		private function junfei_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			junfei = temp;
			temp.name = "junfei";
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "10";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 108;
			temp.x = 132;
			temp.y = 45;
			return temp;
		}

		private function maxGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			maxGroup = temp;
			temp.name = "maxGroup";
			temp.x = 53;
			temp.y = 406;
			temp.layout = __CrownJunFeiPanelSkin_HorizontalLayout2_i();
			temp.elementsContent = [maxLbl_i()];
			return temp;
		}

		private function maxLbl_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			maxLbl = temp;
			temp.name = "maxLbl";
			temp.height = 22;
			temp.maxChars = 3;
			temp.restrict = "0123456789";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput4Skin);
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 48;
			temp.x = 151;
			temp.y = 120;
			return temp;
		}

		private function max_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			max = temp;
			temp.name = "max";
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "10";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 108;
			temp.x = 132;
			temp.y = 339;
			return temp;
		}

		private function newMax_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			newMax = temp;
			temp.name = "newMax";
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "20";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 116;
			temp.x = 120;
			temp.y = 372;
			return temp;
		}

		private function newjunfei_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			newjunfei = temp;
			temp.name = "newjunfei";
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "20";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 116;
			temp.x = 120;
			temp.y = 78;
			return temp;
		}

		private function newrate_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			newrate = temp;
			temp.name = "newrate";
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "20%";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 116;
			temp.x = 120;
			temp.y = 226;
			return temp;
		}

		private function rateGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			rateGroup = temp;
			temp.name = "rateGroup";
			temp.x = 53;
			temp.y = 259;
			temp.layout = __CrownJunFeiPanelSkin_HorizontalLayout3_i();
			temp.elementsContent = [rateLbl_i()];
			return temp;
		}

		private function rateLbl_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			rateLbl = temp;
			temp.name = "rateLbl";
			temp.height = 22;
			temp.maxChars = 9;
			temp.restrict = "0123456789";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput4Skin);
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 48;
			temp.x = 151;
			temp.y = 120;
			return temp;
		}

		private function rate_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			rate = temp;
			temp.name = "rate";
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "10";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 108;
			temp.x = 132;
			temp.y = 192;
			return temp;
		}

		private function title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			title = temp;
			temp.name = "title";
			temp.height = 25;
			temp.touchGroup = false;
			temp.touchable = false;
			temp.fontSize = 18;
			temp.text = "军  费";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 175;
			temp.x = 94;
			temp.y = 4;
			return temp;
		}

	}
}