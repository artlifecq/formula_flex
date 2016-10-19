package org.mokylin.skin.app.country
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.ComboBox;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.country.button.ButtonChazhao;
	import org.mokylin.skin.app.country.button.shiji.ButtonJingZhouSkin;
	import org.mokylin.skin.app.country.button.shiji.ButtonQingZhouSkin;
	import org.mokylin.skin.app.country.button.shiji.ButtonYangZhouSkin;
	import org.mokylin.skin.app.country.button.shiji.ButtonYiZhouSkin;
	import org.mokylin.skin.app.country.button.shiji.ButtonYouZhouSkin;
	import org.mokylin.skin.component.button.ButtonSkin_shouRed;
	import org.mokylin.skin.component.button.ButtonSkin_weiRed;
	import org.mokylin.skin.component.button.ButtonSkin_xiao_red;
	import org.mokylin.skin.component.button.ButtonSkin_youRed;
	import org.mokylin.skin.component.button.ButtonSkin_zuoRed;
	import org.mokylin.skin.component.combobox.ComboBoxSkin_2Skin;
	import org.mokylin.skin.component.list.ListSkin;
	import org.mokylin.skin.component.text.TextInput3Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShiJiPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var firstBtn:feathers.controls.Button;

		public var keyWordText:feathers.controls.TextInput;

		public var kindBox:feathers.controls.ComboBox;

		public var lastBtn:feathers.controls.Button;

		public var list:feathers.controls.List;

		public var nextBtn:feathers.controls.Button;

		public var pageText:feathers.controls.Label;

		public var prevBtn:feathers.controls.Button;

		public var rangeBox:feathers.controls.ComboBox;

		public var searchBtn:feathers.controls.Button;

		public var searchPanel:feathers.controls.Group;

		public var sureBtn:feathers.controls.Button;

		public var tabGroup:feathers.controls.Group;

		public var tabJingZhouBtn:feathers.controls.SkinnableContainer;

		public var tabQingZhouBtn:feathers.controls.SkinnableContainer;

		public var tabYangZhouBtn:feathers.controls.SkinnableContainer;

		public var tabYiZhouBtn:feathers.controls.SkinnableContainer;

		public var tabYouZhouBtn:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShiJiPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 496;
			this.width = 883;
			this.elementsContent = [__ShiJiPanelSkin_UIAsset1_i(),__ShiJiPanelSkin_UIAsset2_i(),__ShiJiPanelSkin_UIAsset3_i(),__ShiJiPanelSkin_UIAsset4_i(),__ShiJiPanelSkin_UIAsset5_i(),__ShiJiPanelSkin_Label1_i(),__ShiJiPanelSkin_Label2_i(),__ShiJiPanelSkin_Label3_i(),list_i(),tabGroup_i(),__ShiJiPanelSkin_UIAsset6_i(),pageText_i(),prevBtn_i(),nextBtn_i(),firstBtn_i(),lastBtn_i(),searchBtn_i(),searchPanel_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ShiJiPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 28;
			temp.fontSize = 14;
			temp.text = "国史";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 60;
			temp.x = 84;
			temp.y = 14;
			return temp;
		}

		private function __ShiJiPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "时间";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 108;
			temp.x = 262;
			temp.y = 16;
			return temp;
		}

		private function __ShiJiPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "事件";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 108;
			temp.x = 566;
			temp.y = 16;
			return temp;
		}

		private function __ShiJiPanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "关键字：";
			temp.textAlign = "right";
			temp.color = 0xF9F0CC;
			temp.width = 71;
			temp.x = 10;
			temp.y = 12;
			return temp;
		}

		private function __ShiJiPanelSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "范围：";
			temp.textAlign = "right";
			temp.color = 0xF9F0CC;
			temp.width = 71;
			temp.x = 194;
			temp.y = 12;
			return temp;
		}

		private function __ShiJiPanelSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "类别：";
			temp.textAlign = "right";
			temp.color = 0xF9F0CC;
			temp.width = 71;
			temp.x = 364;
			temp.y = 12;
			return temp;
		}

		private function __ShiJiPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 483;
			temp.styleName = "ui/app/country/shu.png";
			temp.width = 3;
			temp.x = 215;
			temp.y = 6;
			return temp;
		}

		private function __ShiJiPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/shiji/di.jpg";
			temp.x = 6;
			temp.y = 6;
			return temp;
		}

		private function __ShiJiPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 485;
			temp.styleName = "ui/app/country/niupizhi/di.png";
			temp.width = 658;
			temp.x = 220;
			temp.y = 6;
			return temp;
		}

		private function __ShiJiPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiaodi.png";
			temp.x = 221;
			temp.y = 8;
			return temp;
		}

		private function __ShiJiPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 272;
			temp.y = 19;
			return temp;
		}

		private function __ShiJiPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/text/textInput2.png";
			temp.width = 176;
			temp.x = 440;
			temp.y = 460;
			return temp;
		}

		private function __ShiJiPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 50;
			temp.styleName = "ui/app/country/xiaodikuang/di.png";
			temp.width = 646;
			return temp;
		}

		private function firstBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			firstBtn = temp;
			temp.name = "firstBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_shouRed);
			temp.x = 442;
			temp.y = 460;
			return temp;
		}

		private function keyWordText_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			keyWordText = temp;
			temp.name = "keyWordText";
			temp.height = 23;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput3Skin);
			temp.width = 100;
			temp.x = 78;
			temp.y = 14;
			return temp;
		}

		private function kindBox_i():feathers.controls.ComboBox
		{
			var temp:feathers.controls.ComboBox = new feathers.controls.ComboBox();
			kindBox = temp;
			temp.name = "kindBox";
			temp.height = 23;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.combobox.ComboBoxSkin_2Skin);
			temp.width = 80;
			temp.x = 432;
			temp.y = 14;
			return temp;
		}

		private function lastBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			lastBtn = temp;
			temp.name = "lastBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_weiRed);
			temp.x = 592;
			temp.y = 460;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 406;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListSkin);
			temp.width = 650;
			temp.x = 222;
			temp.y = 44;
			return temp;
		}

		private function nextBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			nextBtn = temp;
			temp.name = "nextBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_youRed);
			temp.x = 570;
			temp.y = 460;
			return temp;
		}

		private function pageText_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			pageText = temp;
			temp.name = "pageText";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "1/10";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.width = 108;
			temp.x = 473;
			temp.y = 458;
			return temp;
		}

		private function prevBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			prevBtn = temp;
			temp.name = "prevBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_zuoRed);
			temp.x = 464;
			temp.y = 460;
			return temp;
		}

		private function rangeBox_i():feathers.controls.ComboBox
		{
			var temp:feathers.controls.ComboBox = new feathers.controls.ComboBox();
			rangeBox = temp;
			temp.name = "rangeBox";
			temp.height = 23;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.combobox.ComboBoxSkin_2Skin);
			temp.width = 80;
			temp.x = 262;
			temp.y = 14;
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
			temp.x = 836;
			temp.y = 453;
			return temp;
		}

		private function searchPanel_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			searchPanel = temp;
			temp.name = "searchPanel";
			temp.x = 226;
			temp.y = 401;
			temp.elementsContent = [__ShiJiPanelSkin_UIAsset7_i(),sureBtn_i(),__ShiJiPanelSkin_Label4_i(),__ShiJiPanelSkin_Label5_i(),__ShiJiPanelSkin_Label6_i(),rangeBox_i(),kindBox_i(),keyWordText_i()];
			return temp;
		}

		private function sureBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sureBtn = temp;
			temp.name = "sureBtn";
			temp.height = 24;
			temp.label = "确定";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_xiao_red);
			temp.width = 57;
			temp.x = 560;
			temp.y = 14;
			return temp;
		}

		private function tabGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			tabGroup = temp;
			temp.name = "tabGroup";
			temp.x = 7;
			temp.y = 47;
			temp.elementsContent = [tabYiZhouBtn_i(),tabJingZhouBtn_i(),tabYangZhouBtn_i(),tabQingZhouBtn_i(),tabYouZhouBtn_i()];
			return temp;
		}

		private function tabJingZhouBtn_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			tabJingZhouBtn = temp;
			temp.name = "tabJingZhouBtn";
			temp.height = 35;
			var skin:StateSkin = new org.mokylin.skin.app.country.button.shiji.ButtonJingZhouSkin()
			temp.skin = skin
			temp.width = 210;
			temp.x = 0;
			temp.y = 36;
			return temp;
		}

		private function tabQingZhouBtn_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			tabQingZhouBtn = temp;
			temp.name = "tabQingZhouBtn";
			temp.height = 35;
			var skin:StateSkin = new org.mokylin.skin.app.country.button.shiji.ButtonQingZhouSkin()
			temp.skin = skin
			temp.width = 210;
			temp.x = 0;
			temp.y = 108;
			return temp;
		}

		private function tabYangZhouBtn_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			tabYangZhouBtn = temp;
			temp.name = "tabYangZhouBtn";
			temp.height = 35;
			var skin:StateSkin = new org.mokylin.skin.app.country.button.shiji.ButtonYangZhouSkin()
			temp.skin = skin
			temp.width = 210;
			temp.x = 0;
			temp.y = 72;
			return temp;
		}

		private function tabYiZhouBtn_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			tabYiZhouBtn = temp;
			temp.name = "tabYiZhouBtn";
			temp.height = 35;
			var skin:StateSkin = new org.mokylin.skin.app.country.button.shiji.ButtonYiZhouSkin()
			temp.skin = skin
			temp.width = 210;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function tabYouZhouBtn_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			tabYouZhouBtn = temp;
			temp.name = "tabYouZhouBtn";
			temp.height = 35;
			var skin:StateSkin = new org.mokylin.skin.app.country.button.shiji.ButtonYouZhouSkin()
			temp.skin = skin
			temp.width = 210;
			temp.x = 0;
			temp.y = 145;
			return temp;
		}

	}
}