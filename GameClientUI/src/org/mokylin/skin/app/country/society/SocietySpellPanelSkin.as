package org.mokylin.skin.app.country.society
{
	import feathers.controls.text.Fontter;
	import feathers.layout.IVirtualLayout;
	import feathers.layout.TiledRowsLayout;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_button;
	import org.mokylin.skin.component.check.CheckBoxSkin_3;
	import org.mokylin.skin.component.list.ListSkin2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class SocietySpellPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __SocietySpellPanelSkin_TileLayout1:feathers.layout.IVirtualLayout;

		public var bindMoneyTxt:feathers.controls.Label;

		public var contributeValueTxt:feathers.controls.Label;

		public var costContributeValue:feathers.controls.Label;

		public var costExpValue:feathers.controls.Label;

		public var costMoneyValue:feathers.controls.Label;

		public var currLevelDesc:feathers.controls.Label;

		public var levelTxt:feathers.controls.Label;

		public var list:feathers.controls.List;

		public var moneyTxt:feathers.controls.Label;

		public var mySpellBtn:feathers.controls.Label;

		public var mySpellIcon:feathers.controls.UIAsset;

		public var nextLevelDesc:feathers.controls.Label;

		public var priorUseMoney:feathers.controls.Check;

		public var shuYuanLevel:feathers.controls.Label;

		public var spellGrid:feathers.controls.UIAsset;

		public var spellName:feathers.controls.Label;

		public var upgradeBtn:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SocietySpellPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 496;
			this.width = 883;
			this.elementsContent = [list_i(),__SocietySpellPanelSkin_UIAsset1_i(),__SocietySpellPanelSkin_UIAsset2_i(),contributeValueTxt_i(),__SocietySpellPanelSkin_UIAsset3_i(),shuYuanLevel_i(),mySpellBtn_i(),currLevelDesc_i(),nextLevelDesc_i(),mySpellIcon_i(),__SocietySpellPanelSkin_UIAsset4_i(),spellGrid_i(),spellName_i(),__SocietySpellPanelSkin_Label1_i(),levelTxt_i(),__SocietySpellPanelSkin_Label2_i(),__SocietySpellPanelSkin_UIAsset5_i(),__SocietySpellPanelSkin_UIAsset6_i(),__SocietySpellPanelSkin_UIAsset7_i(),__SocietySpellPanelSkin_Label3_i(),__SocietySpellPanelSkin_UIAsset8_i(),costContributeValue_i(),__SocietySpellPanelSkin_UIAsset9_i(),moneyTxt_i(),__SocietySpellPanelSkin_UIAsset10_i(),bindMoneyTxt_i(),costMoneyValue_i(),__SocietySpellPanelSkin_Label4_i(),__SocietySpellPanelSkin_UIAsset11_i(),costExpValue_i(),upgradeBtn_i(),__SocietySpellPanelSkin_Label5_i(),__SocietySpellPanelSkin_Label6_i(),priorUseMoney_i()];
			
			states = {
				init:[
						{target:"__SocietySpellPanelSkin_TileLayout1",
							name:"paddingLeft",
							value:0
						}
					]
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __SocietySpellPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "个人贡献：";
			temp.textAlign = "left";
			temp.color = 0xC4A689;
			temp.width = 82;
			temp.x = 652;
			temp.y = 244;
			return temp;
		}

		private function __SocietySpellPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 12;
			temp.text = "提示：书院升级，可开启新技能并提升技能等级上限。";
			temp.textAlign = "left";
			temp.color = 0x1F9A0F;
			temp.width = 400;
			temp.x = 170;
			temp.y = 12;
			return temp;
		}

		private function __SocietySpellPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "绑    银：";
			temp.textAlign = "left";
			temp.color = 0xC4A689;
			temp.width = 82;
			temp.x = 652;
			temp.y = 273;
			return temp;
		}

		private function __SocietySpellPanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "经    验：";
			temp.textAlign = "left";
			temp.color = 0xC4A689;
			temp.width = 82;
			temp.x = 652;
			temp.y = 302;
			return temp;
		}

		private function __SocietySpellPanelSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "我的银子：";
			temp.textAlign = "left";
			temp.color = 0xF4BD63;
			temp.width = 80;
			temp.x = 409;
			temp.y = 454;
			return temp;
		}

		private function __SocietySpellPanelSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "我的绑银：";
			temp.textAlign = "left";
			temp.color = 0xF4BD63;
			temp.width = 80;
			temp.x = 624;
			temp.y = 454;
			return temp;
		}

		private function __SocietySpellPanelSkin_TileLayout1_i():feathers.layout.TiledRowsLayout
		{
			var temp:feathers.layout.TiledRowsLayout = new feathers.layout.TiledRowsLayout();
			temp.horizontalAlign = "left";
			temp.horizontalGap = 0;
			temp.padding = 0;
			temp.paddingBottom = 0;
			__SocietySpellPanelSkin_TileLayout1 = temp;
			temp.paddingRight = 0;
			temp.paddingTop = 0;
			temp.requestedColumnCount = 3;
			temp.requestedRowCount = 5;
			temp.verticalAlign = "top";
			temp.verticalGap = 0;
			return temp;
		}

		private function __SocietySpellPanelSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/common/kang/shurukuang/shurukuang.png";
			temp.width = 127;
			temp.x = 700;
			temp.y = 451;
			return temp;
		}

		private function __SocietySpellPanelSkin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/common/kang/shurukuang/shurukuang.png";
			temp.width = 127;
			temp.x = 732;
			temp.y = 299;
			return temp;
		}

		private function __SocietySpellPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 3;
			temp.styleName = "ui/app/country/heng.png";
			temp.width = 873;
			temp.x = 5;
			temp.y = 413;
			return temp;
		}

		private function __SocietySpellPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/bangpai/gerengongxian.png";
			temp.x = 0;
			temp.y = 412;
			return temp;
		}

		private function __SocietySpellPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/bangpai/fubiaotidi.png";
			temp.x = 10;
			temp.y = 8;
			return temp;
		}

		private function __SocietySpellPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 73;
			temp.styleName = "ui/common/kang/tubiaodikuang_1.png";
			temp.width = 233;
			temp.x = 639;
			temp.y = 12;
			return temp;
		}

		private function __SocietySpellPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 408;
			temp.styleName = "ui/app/country/shu.png";
			temp.width = 3;
			temp.x = 632;
			temp.y = 6;
			return temp;
		}

		private function __SocietySpellPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/bangpai/sheng_ji_xiao_hao.png";
			temp.x = 630;
			temp.y = 212;
			return temp;
		}

		private function __SocietySpellPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/common/kang/shurukuang/shurukuang.png";
			temp.width = 127;
			temp.x = 732;
			temp.y = 241;
			return temp;
		}

		private function __SocietySpellPanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/common/kang/shurukuang/shurukuang.png";
			temp.width = 127;
			temp.x = 732;
			temp.y = 270;
			return temp;
		}

		private function __SocietySpellPanelSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/common/kang/shurukuang/shurukuang.png";
			temp.width = 127;
			temp.x = 485;
			temp.y = 451;
			return temp;
		}

		private function bindMoneyTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			bindMoneyTxt = temp;
			temp.name = "bindMoneyTxt";
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "10000";
			temp.textAlign = "left";
			temp.color = 0xC4A689;
			temp.width = 118;
			temp.x = 704;
			temp.y = 454;
			return temp;
		}

		private function contributeValueTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			contributeValueTxt = temp;
			temp.name = "contributeValueTxt";
			temp.bold = false;
			temp.height = 28;
			temp.fontSize = 18;
			temp.text = "9999";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 150;
			temp.x = 126;
			temp.y = 439;
			return temp;
		}

		private function costContributeValue_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			costContributeValue = temp;
			temp.name = "costContributeValue";
			temp.bold = false;
			temp.height = 22;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "10000";
			temp.textAlign = "left";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 120;
			temp.x = 736;
			temp.y = 244;
			return temp;
		}

		private function costExpValue_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			costExpValue = temp;
			temp.name = "costExpValue";
			temp.bold = false;
			temp.height = 22;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "10000";
			temp.textAlign = "left";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 120;
			temp.x = 736;
			temp.y = 302;
			return temp;
		}

		private function costMoneyValue_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			costMoneyValue = temp;
			temp.name = "costMoneyValue";
			temp.bold = false;
			temp.height = 22;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "10000";
			temp.textAlign = "left";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 120;
			temp.x = 736;
			temp.y = 273;
			return temp;
		}

		private function currLevelDesc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			currLevelDesc = temp;
			temp.name = "currLevelDesc";
			temp.bold = false;
			temp.height = 50;
			temp.fontSize = 14;
			temp.text = "本级效果：攻击力+10";
			temp.textAlign = "left";
			temp.color = 0xC4A689;
			temp.width = 226;
			temp.x = 642;
			temp.y = 94;
			return temp;
		}

		private function levelTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			levelTxt = temp;
			temp.name = "levelTxt";
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "1/10级";
			temp.textAlign = "left";
			temp.color = 0x1F9A0F;
			temp.width = 150;
			temp.x = 713;
			temp.y = 49;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 375;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin2;
			temp.width = 620;
			temp.x = 10;
			temp.y = 35;
			temp.layout = __SocietySpellPanelSkin_TileLayout1_i();
			return temp;
		}

		private function moneyTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			moneyTxt = temp;
			temp.name = "moneyTxt";
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "10000";
			temp.textAlign = "left";
			temp.color = 0xC4A689;
			temp.width = 118;
			temp.x = 489;
			temp.y = 454;
			return temp;
		}

		private function mySpellBtn_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			mySpellBtn = temp;
			temp.name = "mySpellBtn";
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 12;
			temp.text = "我的技能";
			temp.textAlign = "left";
			temp.color = 0xF4BD63;
			temp.underline = true;
			temp.width = 70;
			temp.x = 550;
			temp.y = 392;
			return temp;
		}

		private function mySpellIcon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			mySpellIcon = temp;
			temp.name = "mySpellIcon";
			temp.styleName = "ui/common/tubiao/tongyongtubiao_xiao/bangji.png";
			temp.x = 526;
			temp.y = 388;
			return temp;
		}

		private function nextLevelDesc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nextLevelDesc = temp;
			temp.name = "nextLevelDesc";
			temp.bold = false;
			temp.height = 50;
			temp.fontSize = 14;
			temp.text = "下级效果：攻击力+10";
			temp.textAlign = "left";
			temp.color = 0xC4A689;
			temp.width = 226;
			temp.x = 642;
			temp.y = 150;
			return temp;
		}

		private function priorUseMoney_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			priorUseMoney = temp;
			temp.name = "priorUseMoney";
			temp.label = "使用银子";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_3;
			temp.color = 0xFABA5B;
			temp.width = 90;
			temp.x = 782;
			temp.y = 330;
			return temp;
		}

		private function shuYuanLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			shuYuanLevel = temp;
			temp.name = "shuYuanLevel";
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "书院等级：10级";
			temp.textAlign = "left";
			temp.color = 0xF4BD63;
			temp.width = 150;
			temp.x = 20;
			temp.y = 11;
			return temp;
		}

		private function spellGrid_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			spellGrid = temp;
			temp.name = "spellGrid";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 651;
			temp.y = 22;
			return temp;
		}

		private function spellName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			spellName = temp;
			temp.name = "spellName";
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "技能名称";
			temp.textAlign = "left";
			temp.color = 0xC4A689;
			temp.width = 150;
			temp.x = 713;
			temp.y = 24;
			return temp;
		}

		private function upgradeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			upgradeBtn = temp;
			temp.name = "upgradeBtn";
			temp.height = 35;
			temp.label = "升    级";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_button;
			temp.width = 113;
			temp.x = 700;
			temp.y = 365;
			return temp;
		}

	}
}