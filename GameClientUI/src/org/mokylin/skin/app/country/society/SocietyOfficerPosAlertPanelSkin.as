package org.mokylin.skin.app.country.society
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close_3;
	import org.mokylin.skin.component.button.ButtonSkin_getequip;
	import org.mokylin.skin.component.radio.RadioSkin_3;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class SocietyOfficerPosAlertPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bangZhu:feathers.controls.Radio;

		public var bangZhuDescTxt:feathers.controls.Label;

		public var bangZong:feathers.controls.Radio;

		public var bangZongDescTxt:feathers.controls.Label;

		public var cancelBtn:feathers.controls.Button;

		public var closeBtn:feathers.controls.Button;

		public var fuBangZhu:feathers.controls.Radio;

		public var fuBangZhuDescTxt:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var okBtn:feathers.controls.Button;

		public var playerNameTxt:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SocietyOfficerPosAlertPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 300;
			this.width = 440;
			labelFilterBlack_i();
			this.elementsContent = [__SocietyOfficerPosAlertPanelSkin_UIAsset1_i(),__SocietyOfficerPosAlertPanelSkin_UIAsset2_i(),cancelBtn_i(),__SocietyOfficerPosAlertPanelSkin_UIAsset3_i(),okBtn_i(),closeBtn_i(),__SocietyOfficerPosAlertPanelSkin_Label1_i(),playerNameTxt_i(),bangZhu_i(),fuBangZhu_i(),bangZong_i(),__SocietyOfficerPosAlertPanelSkin_UIAsset4_i(),__SocietyOfficerPosAlertPanelSkin_UIAsset5_i(),__SocietyOfficerPosAlertPanelSkin_UIAsset6_i(),bangZhuDescTxt_i(),fuBangZhuDescTxt_i(),bangZongDescTxt_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __SocietyOfficerPosAlertPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "更改职务";
			temp.textAlign = "center";
			temp.color = 0xE9C099;
			temp.width = 100;
			temp.x = 170;
			temp.y = 6;
			return temp;
		}

		private function __SocietyOfficerPosAlertPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 300;
			temp.styleName = "ui/common/backgound/dikuang.png";
			temp.width = 440;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __SocietyOfficerPosAlertPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 190;
			temp.styleName = "ui/common/backgound/neikuang.png";
			temp.width = 410;
			temp.x = 15;
			temp.y = 59;
			return temp;
		}

		private function __SocietyOfficerPosAlertPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/kang/taitougaoliang.png";
			temp.width = 414;
			temp.x = 12;
			temp.y = 4;
			return temp;
		}

		private function __SocietyOfficerPosAlertPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 56;
			temp.styleName = "ui/common/backgound/neikuang.png";
			temp.width = 310;
			temp.x = 108;
			temp.y = 64;
			return temp;
		}

		private function __SocietyOfficerPosAlertPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 56;
			temp.styleName = "ui/common/backgound/neikuang.png";
			temp.width = 310;
			temp.x = 108;
			temp.y = 126;
			return temp;
		}

		private function __SocietyOfficerPosAlertPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 56;
			temp.styleName = "ui/common/backgound/neikuang.png";
			temp.width = 310;
			temp.x = 108;
			temp.y = 188;
			return temp;
		}

		private function bangZhuDescTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			bangZhuDescTxt = temp;
			temp.name = "bangZhuDescTxt";
			temp.height = 50;
			temp.fontSize = 14;
			temp.text = "族长说明";
			temp.color = 0xD4C996;
			temp.width = 300;
			temp.x = 112;
			temp.y = 66;
			return temp;
		}

		private function bangZhu_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			bangZhu = temp;
			temp.name = "bangZhu";
			temp.groupName = "SocietyOfficerPosAlertRadio";
			temp.height = 27;
			temp.label = "族长";
			temp.isSelected = true;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.radio.RadioSkin_3);
			temp.color = 0xEAA849;
			temp.width = 65;
			temp.x = 27;
			temp.y = 79;
			return temp;
		}

		private function bangZongDescTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			bangZongDescTxt = temp;
			temp.name = "bangZongDescTxt";
			temp.height = 50;
			temp.fontSize = 14;
			temp.text = "族员说明";
			temp.color = 0xD4C996;
			temp.width = 300;
			temp.x = 112;
			temp.y = 188;
			return temp;
		}

		private function bangZong_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			bangZong = temp;
			temp.name = "bangZong";
			temp.groupName = "SocietyOfficerPosAlertRadio";
			temp.height = 27;
			temp.label = "族员";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.radio.RadioSkin_3);
			temp.color = 0x239D02;
			temp.width = 65;
			temp.x = 27;
			temp.y = 202;
			return temp;
		}

		private function cancelBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			cancelBtn = temp;
			temp.name = "cancelBtn";
			temp.height = 31;
			temp.label = "取 消";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_getequip);
			temp.width = 76;
			temp.x = 260;
			temp.y = 255;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close_3);
			temp.x = 405;
			temp.y = 4;
			return temp;
		}

		private function fuBangZhuDescTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			fuBangZhuDescTxt = temp;
			temp.name = "fuBangZhuDescTxt";
			temp.height = 50;
			temp.fontSize = 14;
			temp.text = "副族长说明";
			temp.color = 0xD4C996;
			temp.width = 300;
			temp.x = 112;
			temp.y = 128;
			return temp;
		}

		private function fuBangZhu_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			fuBangZhu = temp;
			temp.name = "fuBangZhu";
			temp.groupName = "SocietyOfficerPosAlertRadio";
			temp.height = 27;
			temp.label = "副族长";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.radio.RadioSkin_3);
			temp.color = 0xE530EC;
			temp.width = 80;
			temp.x = 27;
			temp.y = 141;
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

		private function okBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			okBtn = temp;
			temp.name = "okBtn";
			temp.height = 31;
			temp.label = "确 定";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_getequip);
			temp.width = 76;
			temp.x = 110;
			temp.y = 256;
			return temp;
		}

		private function playerNameTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			playerNameTxt = temp;
			temp.name = "playerNameTxt";
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "将XXX的家族职务更改为";
			temp.color = 0xCAAF94;
			temp.width = 380;
			temp.x = 20;
			temp.y = 36;
			return temp;
		}

	}
}