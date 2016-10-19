package org.mokylin.skin.mainui.shortcut
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.mainui.shortcut.button.ButtonBeibao;
	import org.mokylin.skin.mainui.shortcut.button.ButtonChengjiu;
	import org.mokylin.skin.mainui.shortcut.button.ButtonHaoyou;
	import org.mokylin.skin.mainui.shortcut.button.ButtonJiaoyi;
	import org.mokylin.skin.mainui.shortcut.button.ButtonJiashu;
	import org.mokylin.skin.mainui.shortcut.button.ButtonJineng;
	import org.mokylin.skin.mainui.shortcut.button.ButtonJuese;
	import org.mokylin.skin.mainui.shortcut.button.ButtonRenwu;
	import org.mokylin.skin.mainui.shortcut.button.ButtonZudui;
	import org.mokylin.skin.mainui.shortcut.button.ButtonZuoqi;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShortcutSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var botBgBar:feathers.controls.UIAsset;

		public var btnBackpack:feathers.controls.Button;

		public var btnChengJiu:feathers.controls.Button;

		public var btnHaoYou:feathers.controls.Button;

		public var btnMount:feathers.controls.Button;

		public var btnRole:feathers.controls.Button;

		public var btnShangDian:feathers.controls.Button;

		public var btnSheHui:feathers.controls.Button;

		public var btnSpell:feathers.controls.Button;

		public var btnTask:feathers.controls.Button;

		public var btnZudui:feathers.controls.Button;

		public var grpKimg:feathers.controls.Group;

		public var grpTopGrids:feathers.controls.Group;

		public var imgExp:feathers.controls.UIAsset;

		public var imgExpBg:feathers.controls.UIAsset;

		public var imgExpK1:feathers.controls.UIAsset;

		public var imgExpK2:feathers.controls.UIAsset;

		public var imgExpK3:feathers.controls.UIAsset;

		public var imgExpK4:feathers.controls.UIAsset;

		public var imgExpK5:feathers.controls.UIAsset;

		public var imgExpK6:feathers.controls.UIAsset;

		public var imgExpK7:feathers.controls.UIAsset;

		public var imgExpK8:feathers.controls.UIAsset;

		public var imgExpK9:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShortcutSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 124;
			this.width = 1125;
			this.elementsContent = [botBgBar_i(),imgExpBg_i(),imgExp_i(),grpKimg_i(),__ShortcutSkin_UIAsset1_i(),grpTopGrids_i(),btnRole_i(),btnTask_i(),btnSpell_i(),btnBackpack_i(),btnMount_i(),btnSheHui_i(),btnHaoYou_i(),btnChengJiu_i(),btnZudui_i(),btnShangDian_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ShortcutSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/k.png";
			temp.x = 441;
			temp.y = -5;
			return temp;
		}

		private function __ShortcutSkin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/k.png";
			temp.x = 496;
			temp.y = -5;
			return temp;
		}

		private function __ShortcutSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/shortcut/zmb.png";
			temp.x = 0;
			temp.y = 49;
			return temp;
		}

		private function __ShortcutSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/k.png";
			temp.x = 0;
			temp.y = -5;
			return temp;
		}

		private function __ShortcutSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/k.png";
			temp.x = 55;
			temp.y = -5;
			return temp;
		}

		private function __ShortcutSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/k.png";
			temp.x = 110;
			temp.y = -5;
			return temp;
		}

		private function __ShortcutSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/k.png";
			temp.x = 165;
			temp.y = -5;
			return temp;
		}

		private function __ShortcutSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/k.png";
			temp.x = 220;
			temp.y = -5;
			return temp;
		}

		private function __ShortcutSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/k.png";
			temp.x = 331;
			temp.y = -5;
			return temp;
		}

		private function __ShortcutSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/k.png";
			temp.x = 386;
			temp.y = -5;
			return temp;
		}

		private function __ShortcutSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/k.png";
			temp.x = 276;
			temp.y = -5;
			return temp;
		}

		private function botBgBar_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			botBgBar = temp;
			temp.name = "botBgBar";
			temp.styleName = "ui/mainui/shortcut/zmb_di.png";
			temp.width = 1124;
			temp.y = 92;
			return temp;
		}

		private function btnBackpack_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnBackpack = temp;
			temp.name = "btnBackpack";
			temp.height = 44;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.shortcut.button.ButtonBeibao);
			temp.width = 44;
			temp.x = 173;
			temp.y = 68;
			return temp;
		}

		private function btnChengJiu_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnChengJiu = temp;
			temp.name = "btnChengJiu";
			temp.height = 44;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.shortcut.button.ButtonChengjiu);
			temp.width = 44;
			temp.x = 955;
			temp.y = 68;
			return temp;
		}

		private function btnHaoYou_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnHaoYou = temp;
			temp.name = "btnHaoYou";
			temp.height = 44;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.shortcut.button.ButtonHaoyou);
			temp.width = 44;
			temp.x = 910;
			temp.y = 68;
			return temp;
		}

		private function btnMount_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnMount = temp;
			temp.name = "btnMount";
			temp.height = 44;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.shortcut.button.ButtonZuoqi);
			temp.width = 44;
			temp.x = 218;
			temp.y = 68;
			return temp;
		}

		private function btnRole_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnRole = temp;
			temp.name = "btnRole";
			temp.height = 44;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.shortcut.button.ButtonJuese);
			temp.width = 44;
			temp.x = 39;
			temp.y = 68;
			return temp;
		}

		private function btnShangDian_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnShangDian = temp;
			temp.name = "btnShangDian";
			temp.height = 44;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.shortcut.button.ButtonJiaoyi);
			temp.width = 44;
			temp.x = 1044;
			temp.y = 68;
			return temp;
		}

		private function btnSheHui_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnSheHui = temp;
			temp.name = "btnSheHui";
			temp.height = 44;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.shortcut.button.ButtonJiashu);
			temp.width = 44;
			temp.x = 865;
			temp.y = 68;
			return temp;
		}

		private function btnSpell_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnSpell = temp;
			temp.name = "btnSpell";
			temp.height = 44;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.shortcut.button.ButtonJineng);
			temp.width = 44;
			temp.x = 129;
			temp.y = 68;
			return temp;
		}

		private function btnTask_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnTask = temp;
			temp.name = "btnTask";
			temp.height = 44;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.shortcut.button.ButtonRenwu);
			temp.width = 44;
			temp.x = 84;
			temp.y = 68;
			return temp;
		}

		private function btnZudui_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnZudui = temp;
			temp.name = "btnZudui";
			temp.height = 44;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.shortcut.button.ButtonZudui);
			temp.width = 44;
			temp.x = 999;
			temp.y = 68;
			return temp;
		}

		private function grpKimg_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpKimg = temp;
			temp.name = "grpKimg";
			temp.width = 1114;
			temp.x = 0;
			temp.y = 114;
			temp.elementsContent = [imgExpK1_i(),imgExpK2_i(),imgExpK3_i(),imgExpK4_i(),imgExpK5_i(),imgExpK6_i(),imgExpK7_i(),imgExpK8_i(),imgExpK9_i()];
			return temp;
		}

		private function grpTopGrids_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpTopGrids = temp;
			temp.name = "grpTopGrids";
			temp.height = 108;
			temp.width = 551;
			temp.x = 288;
			temp.y = 0;
			temp.elementsContent = [__ShortcutSkin_UIAsset2_i(),__ShortcutSkin_UIAsset3_i(),__ShortcutSkin_UIAsset4_i(),__ShortcutSkin_UIAsset5_i(),__ShortcutSkin_UIAsset6_i(),__ShortcutSkin_UIAsset7_i(),__ShortcutSkin_UIAsset8_i(),__ShortcutSkin_UIAsset9_i(),__ShortcutSkin_UIAsset10_i(),__ShortcutSkin_UIAsset11_i()];
			return temp;
		}

		private function imgExpBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgExpBg = temp;
			temp.name = "imgExpBg";
			temp.height = 14;
			temp.styleName = "ui/mainui/shortcut/exp/jytd.png";
			temp.width = 1127;
			temp.x = 0;
			temp.y = 112;
			return temp;
		}

		private function imgExpK1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgExpK1 = temp;
			temp.name = "imgExpK1";
			temp.styleName = "ui/mainui/shortcut/exp/jygd.png";
			temp.x = 559;
			temp.y = 2;
			return temp;
		}

		private function imgExpK2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgExpK2 = temp;
			temp.name = "imgExpK2";
			temp.styleName = "ui/mainui/shortcut/exp/jygd.png";
			temp.x = 183;
			temp.y = 2;
			return temp;
		}

		private function imgExpK3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgExpK3 = temp;
			temp.name = "imgExpK3";
			temp.styleName = "ui/mainui/shortcut/exp/jygd.png";
			temp.x = 308;
			temp.y = 2;
			return temp;
		}

		private function imgExpK4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgExpK4 = temp;
			temp.name = "imgExpK4";
			temp.styleName = "ui/mainui/shortcut/exp/jygd.png";
			temp.x = 434;
			temp.y = 2;
			return temp;
		}

		private function imgExpK5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgExpK5 = temp;
			temp.name = "imgExpK5";
			temp.styleName = "ui/mainui/shortcut/exp/jygd.png";
			temp.x = 58;
			temp.y = 2;
			return temp;
		}

		private function imgExpK6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgExpK6 = temp;
			temp.name = "imgExpK6";
			temp.styleName = "ui/mainui/shortcut/exp/jygd.png";
			temp.x = 684;
			temp.y = 2;
			return temp;
		}

		private function imgExpK7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgExpK7 = temp;
			temp.name = "imgExpK7";
			temp.styleName = "ui/mainui/shortcut/exp/jygd.png";
			temp.x = 810;
			temp.y = 2;
			return temp;
		}

		private function imgExpK8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgExpK8 = temp;
			temp.name = "imgExpK8";
			temp.styleName = "ui/mainui/shortcut/exp/jygd.png";
			temp.x = 935;
			temp.y = 2;
			return temp;
		}

		private function imgExpK9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgExpK9 = temp;
			temp.name = "imgExpK9";
			temp.styleName = "ui/mainui/shortcut/exp/jygd.png";
			temp.x = 1061;
			temp.y = 2;
			return temp;
		}

		private function imgExp_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgExp = temp;
			temp.name = "imgExp";
			temp.height = 5;
			temp.styleName = "ui/mainui/shortcut/exp/jyt.png";
			temp.width = 1089;
			temp.x = 17;
			temp.y = 117;
			return temp;
		}

	}
}