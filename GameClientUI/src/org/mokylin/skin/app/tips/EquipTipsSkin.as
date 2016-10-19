package org.mokylin.skin.app.tips
{
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.layout.VerticalLayout;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class EquipTipsSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __EquipTipsSkin_VerticalLayout1:feathers.layout.VerticalLayout;

		public var baseGroup:feathers.controls.Group;

		public var baseStatTitle:feathers.controls.Group;

		public var equipLvl:feathers.controls.Label;

		public var equipNaijiu:feathers.controls.Label;

		public var equipType:feathers.controls.Label;

		public var equipType0:feathers.controls.Label;

		public var generalName:feathers.controls.Label;

		public var generalStatTitle:feathers.controls.Group;

		public var generalTaozName:feathers.controls.Label;

		public var icon:feathers.controls.UIAsset;

		public var imgBG:feathers.controls.UIAsset;

		public var isBind:feathers.controls.UIAsset;

		public var labDecTitle:feathers.controls.Label;

		public var labName:feathers.controls.Label;

		public var line0:feathers.controls.UIAsset;

		public var line1:feathers.controls.UIAsset;

		public var line2:feathers.controls.UIAsset;

		public var pinfenGroup:feathers.controls.Group;

		public var pingfen:feathers.controls.Label;

		public var qualityBg0:feathers.controls.UIAsset;

		public var qualityBg1:feathers.controls.UIAsset;

		public var qualityBg2:feathers.controls.UIAsset;

		public var qualityBg3:feathers.controls.UIAsset;

		public var qualityBg4:feathers.controls.UIAsset;

		public var randomStatTitile:feathers.controls.Group;

		public var refine:feathers.controls.Label;

		public var sell:feathers.controls.Label;

		public var xiuliCost:feathers.controls.Label;

		public var xiuliCostGroup:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function EquipTipsSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 466;
			this.width = 270;
			this.elementsContent = [imgBG_i(),qualityBg0_i(),qualityBg1_i(),qualityBg2_i(),qualityBg3_i(),qualityBg4_i(),__EquipTipsSkin_UIAsset1_i(),labName_i(),equipType_i(),icon_i(),__EquipTipsSkin_Label1_i(),equipType0_i(),__EquipTipsSkin_Label2_i(),equipLvl_i(),__EquipTipsSkin_Label3_i(),equipNaijiu_i(),__EquipTipsSkin_Label4_i(),refine_i(),__EquipTipsSkin_UIAsset2_i(),isBind_i(),baseGroup_i(),__EquipTipsSkin_UIAsset7_i()];
			
			states = {
				init:[
						{target:"__EquipTipsSkin_VerticalLayout1",
							name:"paddingLeft",
							value:5
						}
					]
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __EquipTipsSkin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.width = 240;
			temp.x = 0;
			temp.y = 228;
			temp.elementsContent = [sell_i(),__EquipTipsSkin_Label8_i()];
			return temp;
		}

		private function __EquipTipsSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 16;
			temp.fontSize = 12;
			temp.text = "装备类型：";
			temp.color = 0xD4C996;
			temp.width = 70;
			temp.x = 120;
			temp.y = 67;
			return temp;
		}

		private function __EquipTipsSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 12;
			temp.text = "装备位置：";
			temp.color = 0xD4C996;
			temp.width = 70;
			temp.x = 120;
			temp.y = 86;
			return temp;
		}

		private function __EquipTipsSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 16;
			temp.fontSize = 12;
			temp.text = "需要等级：";
			temp.color = 0xD4C996;
			temp.width = 70;
			temp.x = 120;
			temp.y = 105;
			return temp;
		}

		private function __EquipTipsSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 16;
			temp.fontSize = 12;
			temp.text = "耐 久 度：";
			temp.color = 0xD4C996;
			temp.width = 70;
			temp.x = 120;
			temp.y = 124;
			return temp;
		}

		private function __EquipTipsSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 21;
			temp.fontSize = 12;
			temp.text = "基础属性";
			temp.color = 0x0066FF;
			temp.width = 107;
			temp.x = 15;
			temp.y = 0;
			return temp;
		}

		private function __EquipTipsSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 21;
			temp.fontSize = 12;
			temp.text = "随机属性";
			temp.color = 0x0066FF;
			temp.width = 107;
			temp.x = 15;
			temp.y = 0;
			return temp;
		}

		private function __EquipTipsSkin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 21;
			temp.fontSize = 12;
			temp.text = "名将属性";
			temp.color = 0x0066FF;
			temp.width = 107;
			temp.x = 15;
			temp.y = 0;
			return temp;
		}

		private function __EquipTipsSkin_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 21;
			temp.fontSize = 12;
			temp.text = "出售价格：";
			temp.color = 0xD4C996;
			temp.width = 70;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __EquipTipsSkin_Label9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 21;
			temp.fontSize = 12;
			temp.text = "修理价格：";
			temp.color = 0xD4C996;
			temp.width = 70;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __EquipTipsSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tip/equipTips/dikuang/tipsdiwen.png";
			temp.width = 260;
			temp.x = 5;
			temp.y = 15;
			return temp;
		}

		private function __EquipTipsSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 3;
			temp.styleName = "ui/common/tip/equipTips/dikuang/taitoufengexian.png";
			temp.width = 255;
			temp.x = 8;
			temp.y = 173;
			return temp;
		}

		private function __EquipTipsSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tip/equipTips/dian.png";
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function __EquipTipsSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tip/equipTips/dian.png";
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function __EquipTipsSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tip/equipTips/dian.png";
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function __EquipTipsSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 51;
			temp.styleName = "ui/common/tip/equipTips/zhuangbeipf.png";
			temp.width = 115;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __EquipTipsSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 3;
			temp.styleName = "ui/common/tip/equipTips/dikuang/taitoufengexian.png";
			temp.width = 255;
			temp.x = 8;
			temp.y = 55;
			return temp;
		}

		private function __EquipTipsSkin_VerticalLayout1_i():feathers.layout.VerticalLayout
		{
			var temp:feathers.layout.VerticalLayout = new feathers.layout.VerticalLayout();
			__EquipTipsSkin_VerticalLayout1 = temp;
			return temp;
		}

		private function baseGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			baseGroup = temp;
			temp.name = "baseGroup";
			temp.height = 265;
			temp.width = 255;
			temp.x = 7;
			temp.y = 182;
			temp.layout = __EquipTipsSkin_VerticalLayout1_i();
			temp.elementsContent = [baseStatTitle_i(),randomStatTitile_i(),generalStatTitle_i(),generalName_i(),generalTaozName_i(),line0_i(),labDecTitle_i(),line1_i(),pinfenGroup_i(),line2_i(),__EquipTipsSkin_Group1_i(),xiuliCostGroup_i()];
			return temp;
		}

		private function baseStatTitle_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			baseStatTitle = temp;
			temp.name = "baseStatTitle";
			temp.width = 156;
			temp.x = 2;
			temp.y = 0;
			temp.elementsContent = [__EquipTipsSkin_Label5_i(),__EquipTipsSkin_UIAsset3_i()];
			return temp;
		}

		private function equipLvl_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			equipLvl = temp;
			temp.name = "equipLvl";
			temp.height = 18;
			temp.fontSize = 14;
			temp.text = "99";
			temp.color = 0xD4C996;
			temp.width = 80;
			temp.x = 185;
			temp.y = 103;
			return temp;
		}

		private function equipNaijiu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			equipNaijiu = temp;
			temp.name = "equipNaijiu";
			temp.height = 18;
			temp.fontSize = 14;
			temp.text = "100/100";
			temp.color = 0xD4C996;
			temp.width = 80;
			temp.x = 185;
			temp.y = 122;
			return temp;
		}

		private function equipType0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			equipType0 = temp;
			temp.name = "equipType0";
			temp.height = 18;
			temp.fontSize = 12;
			temp.text = "主手";
			temp.color = 0xF6D621;
			temp.width = 80;
			temp.x = 185;
			temp.y = 84;
			return temp;
		}

		private function equipType_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			equipType = temp;
			temp.name = "equipType";
			temp.height = 18;
			temp.fontSize = 12;
			temp.text = "霸刀";
			temp.color = 0xF6D621;
			temp.width = 80;
			temp.x = 185;
			temp.y = 65;
			return temp;
		}

		private function generalName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			generalName = temp;
			temp.name = "generalName";
			temp.height = 21;
			temp.fontSize = 12;
			temp.text = "XXX的武器";
			temp.color = 0xF09E01;
			temp.width = 147;
			temp.x = 5;
			temp.y = 73;
			return temp;
		}

		private function generalStatTitle_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			generalStatTitle = temp;
			temp.name = "generalStatTitle";
			temp.width = 156;
			temp.x = 2;
			temp.y = 50;
			temp.elementsContent = [__EquipTipsSkin_Label7_i(),__EquipTipsSkin_UIAsset5_i()];
			return temp;
		}

		private function generalTaozName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			generalTaozName = temp;
			temp.name = "generalTaozName";
			temp.height = 21;
			temp.fontSize = 12;
			temp.text = "XXX的套装(2/6)";
			temp.color = 0xF09E01;
			temp.width = 155;
			temp.x = 4;
			temp.y = 89;
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.styleName = "ui/common/grid/normal/60.png";
			temp.x = 30;
			temp.y = 67;
			return temp;
		}

		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.height = 461;
			temp.styleName = "ui/common/tip/tips_di.png";
			temp.width = 270;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function isBind_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			isBind = temp;
			temp.name = "isBind";
			temp.styleName = "ui/common/tip/equipTips/zhuangbeibd/zhuangbeibd.png";
			temp.x = 39;
			temp.y = 117;
			return temp;
		}

		private function labDecTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labDecTitle = temp;
			temp.name = "labDecTitle";
			temp.leading = 8;
			temp.maxWidth = 270;
			temp.fontSize = 12;
			temp.text = "装备描述";
			temp.textAlign = "left";
			temp.color = 0x98692D;
			temp.width = 247;
			temp.x = 2;
			temp.y = 120;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.bold = false;
			temp.height = 27;
			temp.fontSize = 18;
			temp.text = "装备名称";
			temp.textAlign = "center";
			temp.color = 0xF09E01;
			temp.width = 260;
			temp.x = 5;
			temp.y = 20;
			return temp;
		}

		private function line0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line0 = temp;
			temp.name = "line0";
			temp.height = 3;
			temp.styleName = "ui/common/tip/equipTips/dikuang/taitoufengexian.png";
			temp.width = 245;
			temp.x = 0;
			temp.y = 111;
			return temp;
		}

		private function line1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line1 = temp;
			temp.name = "line1";
			temp.height = 3;
			temp.styleName = "ui/common/tip/equipTips/dikuang/taitoufengexian.png";
			temp.width = 245;
			temp.x = 0;
			temp.y = 141;
			return temp;
		}

		private function line2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line2 = temp;
			temp.name = "line2";
			temp.height = 3;
			temp.styleName = "ui/common/tip/equipTips/dikuang/taitoufengexian.png";
			temp.width = 245;
			temp.x = 0;
			temp.y = 211;
			return temp;
		}

		private function pinfenGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			pinfenGroup = temp;
			temp.name = "pinfenGroup";
			temp.height = 51;
			temp.width = 247;
			temp.x = 2;
			temp.y = 151;
			temp.elementsContent = [pingfen_i(),__EquipTipsSkin_UIAsset6_i()];
			return temp;
		}

		private function pingfen_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			pingfen = temp;
			temp.name = "pingfen";
			temp.height = 34;
			temp.fontSize = 22;
			temp.text = "9999";
			temp.color = 0xD4C996;
			temp.width = 110;
			temp.x = 133;
			temp.y = 14;
			return temp;
		}

		private function qualityBg0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			qualityBg0 = temp;
			temp.name = "qualityBg0";
			temp.styleName = "ui/common/tip/equipTips/pinzidi/lv.png";
			temp.width = 260;
			temp.x = 4;
			temp.y = 32;
			return temp;
		}

		private function qualityBg1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			qualityBg1 = temp;
			temp.name = "qualityBg1";
			temp.styleName = "ui/common/tip/equipTips/pinzidi/lan.png";
			temp.width = 260;
			temp.x = 4;
			temp.y = 32;
			return temp;
		}

		private function qualityBg2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			qualityBg2 = temp;
			temp.name = "qualityBg2";
			temp.styleName = "ui/common/tip/equipTips/pinzidi/cheng.png";
			temp.width = 260;
			temp.x = 4;
			temp.y = 32;
			return temp;
		}

		private function qualityBg3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			qualityBg3 = temp;
			temp.name = "qualityBg3";
			temp.styleName = "ui/common/tip/equipTips/pinzidi/bai.png";
			temp.width = 260;
			temp.x = 4;
			temp.y = 32;
			return temp;
		}

		private function qualityBg4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			qualityBg4 = temp;
			temp.name = "qualityBg4";
			temp.styleName = "ui/common/tip/equipTips/pinzidi/zi.png";
			temp.width = 260;
			temp.x = 4;
			temp.y = 32;
			return temp;
		}

		private function randomStatTitile_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			randomStatTitile = temp;
			temp.name = "randomStatTitile";
			temp.width = 156;
			temp.x = 2;
			temp.y = 22;
			temp.elementsContent = [__EquipTipsSkin_Label6_i(),__EquipTipsSkin_UIAsset4_i()];
			return temp;
		}

		private function refine_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			refine = temp;
			temp.name = "refine";
			temp.height = 20;
			temp.color = 0xFFD000;
			temp.width = 214;
			temp.x = 30;
			temp.y = 152;
			return temp;
		}

		private function sell_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sell = temp;
			temp.name = "sell";
			temp.fontSize = 12;
			temp.text = "99";
			temp.color = 0xD4C996;
			temp.width = 160;
			temp.x = 83;
			temp.y = 0;
			return temp;
		}

		private function xiuliCostGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			xiuliCostGroup = temp;
			temp.name = "xiuliCostGroup";
			temp.visible = false;
			temp.width = 241;
			temp.x = 0;
			temp.y = 247;
			temp.elementsContent = [xiuliCost_i(),__EquipTipsSkin_Label9_i()];
			return temp;
		}

		private function xiuliCost_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			xiuliCost = temp;
			temp.name = "xiuliCost";
			temp.fontSize = 12;
			temp.text = "100/100";
			temp.color = 0xD4C996;
			temp.width = 108;
			temp.x = 83;
			temp.y = 0;
			return temp;
		}

	}
}