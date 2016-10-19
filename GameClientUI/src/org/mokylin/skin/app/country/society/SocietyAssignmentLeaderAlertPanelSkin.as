package org.mokylin.skin.app.country.society
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close_3;
	import org.mokylin.skin.component.button.ButtonSkin_getequip;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class SocietyAssignmentLeaderAlertPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var cancelBtn:feathers.controls.Button;

		public var closeBtn:feathers.controls.Button;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var leaderNameTxt:feathers.controls.Label;

		public var okBtn:feathers.controls.Button;

		public var playerLevelTxt:feathers.controls.Label;

		public var playerNameTxt:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SocietyAssignmentLeaderAlertPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			labelFilterBlack_i();
			this.elementsContent = [__SocietyAssignmentLeaderAlertPanelSkin_UIAsset1_i(),__SocietyAssignmentLeaderAlertPanelSkin_UIAsset2_i(),cancelBtn_i(),__SocietyAssignmentLeaderAlertPanelSkin_UIAsset3_i(),okBtn_i(),closeBtn_i(),__SocietyAssignmentLeaderAlertPanelSkin_Label1_i(),leaderNameTxt_i(),playerNameTxt_i(),playerLevelTxt_i(),__SocietyAssignmentLeaderAlertPanelSkin_Label2_i(),__SocietyAssignmentLeaderAlertPanelSkin_Label3_i(),__SocietyAssignmentLeaderAlertPanelSkin_UIAsset4_i(),__SocietyAssignmentLeaderAlertPanelSkin_UIAsset5_i(),__SocietyAssignmentLeaderAlertPanelSkin_UIAsset6_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __SocietyAssignmentLeaderAlertPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "转让族长";
			temp.textAlign = "center";
			temp.color = 0xE9C099;
			temp.width = 100;
			temp.x = 128;
			temp.y = 6;
			return temp;
		}

		private function __SocietyAssignmentLeaderAlertPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "您的职务将变为【族员】";
			temp.color = 0xCAAF94;
			temp.width = 240;
			temp.x = 30;
			temp.y = 128;
			return temp;
		}

		private function __SocietyAssignmentLeaderAlertPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "转让族长有风险，请慎重考虑！";
			temp.color = 0xC21515;
			temp.width = 240;
			temp.x = 30;
			temp.y = 148;
			return temp;
		}

		private function __SocietyAssignmentLeaderAlertPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 230;
			temp.styleName = "ui/common/backgound/dikuang.png";
			temp.width = 350;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __SocietyAssignmentLeaderAlertPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 136;
			temp.styleName = "ui/common/backgound/neikuang.png";
			temp.width = 320;
			temp.x = 15;
			temp.y = 42;
			return temp;
		}

		private function __SocietyAssignmentLeaderAlertPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/kang/taitougaoliang.png";
			temp.width = 324;
			temp.x = 12;
			temp.y = 4;
			return temp;
		}

		private function __SocietyAssignmentLeaderAlertPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 1;
			temp.styleName = "ui/common/tip/equipTips/dikuang/fengexian.png";
			temp.width = 290;
			temp.x = 29;
			temp.y = 120;
			return temp;
		}

		private function __SocietyAssignmentLeaderAlertPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tip/equipTips/dian.png";
			temp.x = 35;
			temp.y = 76;
			return temp;
		}

		private function __SocietyAssignmentLeaderAlertPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tip/equipTips/dian.png";
			temp.x = 35;
			temp.y = 96;
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
			temp.x = 212;
			temp.y = 186;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close_3);
			temp.x = 315;
			temp.y = 4;
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

		private function leaderNameTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			leaderNameTxt = temp;
			temp.name = "leaderNameTxt";
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "【族长】职务将让给";
			temp.color = 0xCAAF94;
			temp.width = 290;
			temp.x = 20;
			temp.y = 46;
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
			temp.x = 62;
			temp.y = 187;
			return temp;
		}

		private function playerLevelTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			playerLevelTxt = temp;
			temp.name = "playerLevelTxt";
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "等级：99";
			temp.color = 0xCAAF94;
			temp.width = 200;
			temp.x = 50;
			temp.y = 91;
			return temp;
		}

		private function playerNameTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			playerNameTxt = temp;
			temp.name = "playerNameTxt";
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "名称：玩家名字";
			temp.color = 0xCAAF94;
			temp.width = 200;
			temp.x = 50;
			temp.y = 70;
			return temp;
		}

	}
}