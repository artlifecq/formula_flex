package org.mokylin.skin.app.trade
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.layout.VerticalLayout;
	import org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
	import org.mokylin.skin.component.button.ButtonV3_e_erjianniuhuang;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.button.ButtonV3_s_sanjianniu;
	import org.mokylin.skin.component.list.EquipListSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TradePanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var alert:feathers.controls.Label;

		public var cancel:feathers.controls.Button;

		public var closeBtn:feathers.controls.Button;

		public var lock:feathers.controls.Button;

		public var mineList:feathers.controls.List;

		public var mineLock:feathers.controls.UIAsset;

		public var mineName:feathers.controls.Label;

		public var mineSilver:feathers.controls.Label;

		public var silverBtn:feathers.controls.Button;

		public var targetList:feathers.controls.List;

		public var targetLock:feathers.controls.UIAsset;

		public var targetName:feathers.controls.Label;

		public var targetSilver:feathers.controls.Label;

		public var targetSilver0:feathers.controls.Label;

		public var targetSilver1:feathers.controls.Label;

		public var trade:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TradePanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 626;
			this.width = 485;
			this.elementsContent = [__TradePanelSkin_UIAsset1_i(),__TradePanelSkin_UIAsset2_i(),__TradePanelSkin_UIAsset3_i(),__TradePanelSkin_UIAsset4_i(),__TradePanelSkin_UIAsset5_i(),__TradePanelSkin_UIAsset6_i(),__TradePanelSkin_UIAsset7_i(),targetName_i(),mineName_i(),targetList_i(),mineList_i(),__TradePanelSkin_UIAsset8_i(),__TradePanelSkin_UIAsset9_i(),targetSilver_i(),targetSilver0_i(),alert_i(),mineSilver_i(),lock_i(),silverBtn_i(),trade_i(),cancel_i(),closeBtn_i(),__TradePanelSkin_UIAsset10_i(),__TradePanelSkin_UIAsset11_i(),__TradePanelSkin_UIAsset12_i(),__TradePanelSkin_UIAsset13_i(),__TradePanelSkin_UIAsset14_i(),__TradePanelSkin_UIAsset15_i(),__TradePanelSkin_Label1_i(),__TradePanelSkin_Label2_i(),targetLock_i(),mineLock_i(),__TradePanelSkin_UIAsset16_i(),targetSilver1_i(),__TradePanelSkin_UIAsset17_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TradePanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "对方交易物品栏";
			temp.textAlign = "center";
			temp.color = 0xFF4500;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 123;
			temp.x = 107;
			temp.y = 78;
			return temp;
		}

		private function __TradePanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "我方交易物品栏";
			temp.textAlign = "center";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 123;
			temp.x = 335;
			temp.y = 78;
			return temp;
		}

		private function __TradePanelSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_di_kuang.png";
			temp.x = 21;
			temp.y = 45;
			return temp;
		}

		private function __TradePanelSkin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_di_kuang.png";
			temp.x = 251;
			temp.y = 45;
			return temp;
		}

		private function __TradePanelSkin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 565;
			temp.styleName = "ui/app/trade/fen_ge_xian.png";
			temp.x = 242;
			temp.y = 41;
			return temp;
		}

		private function __TradePanelSkin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/app/trade/jiao_yi.png";
			temp.x = 222;
			temp.y = 7;
			return temp;
		}

		private function __TradePanelSkin_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/trade/lan.png";
			temp.x = 101;
			temp.y = 79;
			return temp;
		}

		private function __TradePanelSkin_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/trade/lan.png";
			temp.x = 327;
			temp.y = 79;
			return temp;
		}

		private function __TradePanelSkin_UIAsset16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tubiao/T_tongyongxiaotubiao/yin_zi.png";
			temp.x = 38;
			temp.y = 533;
			return temp;
		}

		private function __TradePanelSkin_UIAsset17_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tubiao/T_tongyongxiaotubiao/yin_zi.png";
			temp.x = 248;
			temp.y = 534;
			return temp;
		}

		private function __TradePanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 623;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/di_ban.png";
			temp.width = 485;
			return temp;
		}

		private function __TradePanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/gao_guang.png";
			temp.width = 386;
			temp.x = 48;
			temp.y = 4;
			return temp;
		}

		private function __TradePanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 570;
			temp.styleName = "ui/common/version_3/D_di/di_2.png";
			temp.width = 454;
			temp.x = 16;
			temp.y = 38;
			return temp;
		}

		private function __TradePanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/trade/ren_cheng_di.png";
			temp.x = 84;
			temp.y = 39;
			return temp;
		}

		private function __TradePanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/trade/ren_cheng_di.png";
			temp.x = 311;
			temp.y = 39;
			return temp;
		}

		private function __TradePanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 471;
			temp.styleName = "ui/common/version_3/D_di/di_1.png";
			temp.width = 215;
			temp.x = 23;
			temp.y = 45;
			return temp;
		}

		private function __TradePanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 471;
			temp.styleName = "ui/common/version_3/D_di/di_1.png";
			temp.width = 215;
			temp.x = 247;
			temp.y = 45;
			return temp;
		}

		private function __TradePanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/S_shurukuang/shu_ru_kuang_1.png";
			temp.width = 116;
			temp.x = 102;
			temp.y = 532;
			return temp;
		}

		private function __TradePanelSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/S_shurukuang/shu_ru_kuang_1.png";
			temp.width = 116;
			temp.x = 309;
			temp.y = 532;
			return temp;
		}

		private function __TradePanelSkin_VerticalLayout1_i():feathers.layout.VerticalLayout
		{
			var temp:feathers.layout.VerticalLayout = new feathers.layout.VerticalLayout();
			temp.gap = 65;
			return temp;
		}

		private function __TradePanelSkin_VerticalLayout2_i():feathers.layout.VerticalLayout
		{
			var temp:feathers.layout.VerticalLayout = new feathers.layout.VerticalLayout();
			temp.gap = 65;
			return temp;
		}

		private function alert_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			alert = temp;
			temp.name = "alert";
			temp.fontSize = 14;
			temp.text = "对方正在交易";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 203;
			temp.x = 30;
			temp.y = 570;
			return temp;
		}

		private function cancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			cancel = temp;
			temp.name = "cancel";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "取 消";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_e_erjianniu);
			temp.color = 0xF9F0CC;
			temp.width = 69;
			temp.x = 394;
			temp.y = 566;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_g_guanbi);
			temp.x = 460;
			temp.y = 0;
			return temp;
		}

		private function lock_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			lock = temp;
			temp.name = "lock";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "锁 定";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_e_erjianniuhuang);
			temp.color = 0xF9F0CC;
			temp.x = 249;
			temp.y = 566;
			return temp;
		}

		private function mineList_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			mineList = temp;
			temp.name = "mineList";
			temp.height = 390;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.EquipListSkin);
			temp.width = 206;
			temp.x = 254;
			temp.y = 121;
			temp.layout = __TradePanelSkin_VerticalLayout2_i();
			return temp;
		}

		private function mineLock_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			mineLock = temp;
			temp.name = "mineLock";
			temp.height = 514;
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_suo_ding.png";
			temp.visible = false;
			temp.width = 218;
			temp.x = 246;
			temp.y = 45;
			return temp;
		}

		private function mineName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			mineName = temp;
			temp.name = "mineName";
			temp.fontSize = 14;
			temp.text = "目标名称";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = true;
			temp.width = 149;
			temp.x = 321;
			temp.y = 42;
			return temp;
		}

		private function mineSilver_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			mineSilver = temp;
			temp.name = "mineSilver";
			temp.height = 24;
			temp.fontSize = 14;
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 126;
			temp.x = 310;
			temp.y = 530;
			return temp;
		}

		private function silverBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			silverBtn = temp;
			temp.name = "silverBtn";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "输入";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_s_sanjianniu);
			temp.color = 0xE9C099;
			temp.width = 37;
			temp.x = 428;
			temp.y = 532;
			return temp;
		}

		private function targetList_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			targetList = temp;
			temp.name = "targetList";
			temp.height = 390;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.EquipListSkin);
			temp.width = 206;
			temp.x = 30;
			temp.y = 121;
			temp.layout = __TradePanelSkin_VerticalLayout1_i();
			return temp;
		}

		private function targetLock_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			targetLock = temp;
			temp.name = "targetLock";
			temp.height = 514;
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_suo_ding.png";
			temp.visible = false;
			temp.width = 215;
			temp.x = 25;
			temp.y = 45;
			return temp;
		}

		private function targetName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			targetName = temp;
			temp.name = "targetName";
			temp.fontSize = 14;
			temp.text = "目标名称";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = true;
			temp.width = 149;
			temp.x = 92;
			temp.y = 42;
			return temp;
		}

		private function targetSilver0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			targetSilver0 = temp;
			temp.name = "targetSilver0";
			temp.fontSize = 14;
			temp.text = "银子：";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 60;
			temp.y = 530;
			return temp;
		}

		private function targetSilver1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			targetSilver1 = temp;
			temp.name = "targetSilver1";
			temp.fontSize = 14;
			temp.text = "银子：";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 268;
			temp.y = 530;
			return temp;
		}

		private function targetSilver_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			targetSilver = temp;
			temp.name = "targetSilver";
			temp.height = 24;
			temp.fontSize = 14;
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 124;
			temp.x = 104;
			temp.y = 530;
			return temp;
		}

		private function trade_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			trade = temp;
			temp.name = "trade";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "交 易";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_e_erjianniu);
			temp.color = 0xF9F0CC;
			temp.x = 322;
			temp.y = 566;
			return temp;
		}

	}
}