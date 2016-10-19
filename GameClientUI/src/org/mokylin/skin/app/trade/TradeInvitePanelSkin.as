package org.mokylin.skin.app.trade
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.layout.VerticalLayout;
	import org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.check.CheckBoxSkin_3;
	import org.mokylin.skin.mainui.chat.VScrollBarChatSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TradeInvitePanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var autoAgree:feathers.controls.Check;

		public var cancelAll:feathers.controls.Button;

		public var closeBtn:feathers.controls.Button;

		public var targetList:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TradeInvitePanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__TradeInvitePanelSkin_UIAsset1_i(),__TradeInvitePanelSkin_UIAsset2_i(),__TradeInvitePanelSkin_UIAsset3_i(),closeBtn_i(),cancelAll_i(),targetList_i(),autoAgree_i(),__TradeInvitePanelSkin_UIAsset4_i(),__TradeInvitePanelSkin_Label1_i(),__TradeInvitePanelSkin_Label2_i(),__TradeInvitePanelSkin_Label3_i(),__TradeInvitePanelSkin_UIAsset5_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TradeInvitePanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "申请人";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 96;
			temp.y = 47;
			return temp;
		}

		private function __TradeInvitePanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "等级";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 284;
			temp.y = 47;
			return temp;
		}

		private function __TradeInvitePanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "操作";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 475;
			temp.y = 47;
			return temp;
		}

		private function __TradeInvitePanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 310;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/di_ban.png";
			temp.width = 600;
			return temp;
		}

		private function __TradeInvitePanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 207;
			temp.styleName = "ui/common/version_3/D_di/di_4.png";
			temp.width = 570;
			temp.x = 15;
			temp.y = 44;
			return temp;
		}

		private function __TradeInvitePanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/gao_guang.png";
			temp.width = 495;
			temp.x = 48;
			temp.y = 4;
			return temp;
		}

		private function __TradeInvitePanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/L_liebiao/lie_biao_di.png";
			temp.width = 560;
			temp.x = 20;
			temp.y = 48;
			return temp;
		}

		private function __TradeInvitePanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/app/trade/jiao_yi_shen_qing.png";
			temp.x = 262;
			temp.y = 6;
			return temp;
		}

		private function __TradeInvitePanelSkin_VerticalLayout1_i():feathers.layout.VerticalLayout
		{
			var temp:feathers.layout.VerticalLayout = new feathers.layout.VerticalLayout();
			return temp;
		}

		private function autoAgree_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			autoAgree = temp;
			temp.name = "autoAgree";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "拒绝所有交易申请（之后可在系统设置界面进行修改）";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.check.CheckBoxSkin_3);
			temp.textAlign = "left";
			temp.color = 0x9C8049;
			temp.width = 388;
			temp.x = 40;
			temp.y = 264;
			return temp;
		}

		private function cancelAll_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			cancelAll = temp;
			temp.name = "cancelAll";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "全部拒绝";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_e_erjianniu);
			temp.color = 0xF9F0CC;
			temp.width = 117;
			temp.x = 462;
			temp.y = 257;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_g_guanbi);
			temp.x = 574;
			temp.y = 0;
			return temp;
		}

		private function targetList_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			targetList = temp;
			temp.name = "targetList";
			temp.height = 168;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.chat.VScrollBarChatSkin);
			temp.width = 560;
			temp.x = 20;
			temp.y = 73;
			temp.layout = __TradeInvitePanelSkin_VerticalLayout1_i();
			return temp;
		}

	}
}