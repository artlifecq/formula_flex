package org.mokylin.skin.app.tips
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class SpellTipsSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var groupButtom:feathers.controls.Group;

		public var groupDesc:feathers.controls.Group;

		public var groupNeed:feathers.controls.Group;

		public var groupTitle:feathers.controls.Group;

		public var imgBG:feathers.controls.UIAsset;

		public var imgChar:feathers.controls.UIAsset;

		public var imgIcon:feathers.controls.UIAsset;

		public var imgIcon1:feathers.controls.UIAsset;

		public var imgIcon2:feathers.controls.UIAsset;

		public var imgIcon3:feathers.controls.UIAsset;

		public var imgSpellType:feathers.controls.UIAsset;

		public var labBook:feathers.controls.Label;

		public var labCurCD:feathers.controls.Label;

		public var labCurDec:feathers.controls.Label;

		public var labCurDis:feathers.controls.Label;

		public var labCurMagic:feathers.controls.Label;

		public var labCurNeedLevel:feathers.controls.Label;

		public var labExp:feathers.controls.Label;

		public var labMoney:feathers.controls.Label;

		public var labName:feathers.controls.Label;

		public var labName1:feathers.controls.Label;

		public var labName2:feathers.controls.Label;

		public var labName3:feathers.controls.Label;

		public var labNextCD:feathers.controls.Label;

		public var labNextDec:feathers.controls.Label;

		public var labNextLevelTitle:feathers.controls.Label;

		public var labNextMagic:feathers.controls.Label;

		public var labNextNeedLevel:feathers.controls.Label;

		public var labNextSpellLevel:feathers.controls.Label;

		public var labPreSpell:feathers.controls.Label;

		public var labRaceSpellAllPoint:feathers.controls.Label;

		public var labSpellPoint:feathers.controls.Label;

		public var labTishi:feathers.controls.Label;

		public var labUseDec:feathers.controls.Label;

		public var labWeapenType:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SpellTipsSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 660;
			this.width = 245;
			this.elementsContent = [imgBG_i(),groupTitle_i(),groupDesc_i(),groupNeed_i(),groupButtom_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __SpellTipsSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "推荐技能搭配";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 235;
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __SpellTipsSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 18;
			temp.fontSize = 14;
			temp.text = "替换";
			temp.textAlign = "center";
			temp.color = 0xE530EC;
			temp.width = 44;
			temp.x = 93;
			temp.y = 69;
			return temp;
		}

		private function __SpellTipsSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_kuang_46_4.png";
			temp.x = 0;
			temp.y = 10;
			return temp;
		}

		private function __SpellTipsSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 25;
			temp.styleName = "ui/common/version_3/L_liebiao/lie_biao_di.png";
			temp.width = 225;
			temp.x = 5;
			temp.y = 0;
			return temp;
		}

		private function __SpellTipsSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/B_bujian/jian_tou_xiao.png";
			temp.x = 75;
			temp.y = 82;
			return temp;
		}

		private function __SpellTipsSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_kuang_46_4.png";
			temp.x = 20;
			temp.y = 75;
			return temp;
		}

		private function __SpellTipsSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_kuang_46_4.png";
			temp.x = 155;
			temp.y = 35;
			return temp;
		}

		private function __SpellTipsSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_kuang_46_4.png";
			temp.x = 155;
			temp.y = 115;
			return temp;
		}

		private function groupButtom_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupButtom = temp;
			temp.name = "groupButtom";
			temp.height = 200;
			temp.x = 5;
			temp.y = 445;
			temp.elementsContent = [__SpellTipsSkin_UIAsset2_i(),__SpellTipsSkin_Label1_i(),__SpellTipsSkin_UIAsset3_i(),__SpellTipsSkin_Label2_i(),__SpellTipsSkin_UIAsset4_i(),labName1_i(),imgIcon1_i(),__SpellTipsSkin_UIAsset5_i(),labName2_i(),imgIcon2_i(),__SpellTipsSkin_UIAsset6_i(),labName3_i(),imgIcon3_i()];
			return temp;
		}

		private function groupDesc_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupDesc = temp;
			temp.name = "groupDesc";
			temp.x = 15;
			temp.y = 81;
			temp.elementsContent = [labTishi_i(),labCurNeedLevel_i(),labCurCD_i(),labCurMagic_i(),labCurDec_i(),labNextLevelTitle_i(),labNextSpellLevel_i(),labNextNeedLevel_i(),labNextCD_i(),labNextMagic_i(),labNextDec_i()];
			return temp;
		}

		private function groupNeed_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupNeed = temp;
			temp.name = "groupNeed";
			temp.width = 221;
			temp.x = 15;
			temp.y = 320;
			temp.elementsContent = [labMoney_i(),labExp_i(),labRaceSpellAllPoint_i(),labSpellPoint_i(),labWeapenType_i(),labPreSpell_i(),labBook_i()];
			return temp;
		}

		private function groupTitle_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupTitle = temp;
			temp.name = "groupTitle";
			temp.height = 70;
			temp.x = 20;
			temp.y = 8;
			temp.elementsContent = [__SpellTipsSkin_UIAsset1_i(),imgIcon_i(),imgSpellType_i(),imgChar_i(),labName_i(),labUseDec_i(),labCurDis_i()];
			return temp;
		}

		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.height = 655;
			temp.styleName = "ui/common/tip/tips_di.png";
			temp.width = 245;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgChar_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgChar = temp;
			temp.name = "imgChar";
			temp.styleName = "ui/app/spell/tipsCharType/bei_dong.png";
			temp.x = 184;
			temp.y = 0;
			return temp;
		}

		private function imgIcon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgIcon1 = temp;
			temp.name = "imgIcon1";
			temp.height = 46;
			temp.width = 46;
			temp.x = 21;
			temp.y = 77;
			return temp;
		}

		private function imgIcon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgIcon2 = temp;
			temp.name = "imgIcon2";
			temp.height = 46;
			temp.width = 46;
			temp.x = 157;
			temp.y = 37;
			return temp;
		}

		private function imgIcon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgIcon3 = temp;
			temp.name = "imgIcon3";
			temp.height = 46;
			temp.width = 46;
			temp.x = 157;
			temp.y = 117;
			return temp;
		}

		private function imgIcon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgIcon = temp;
			temp.name = "imgIcon";
			temp.height = 46;
			temp.width = 46;
			temp.x = 2;
			temp.y = 12;
			return temp;
		}

		private function imgSpellType_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgSpellType = temp;
			temp.name = "imgSpellType";
			temp.height = 43;
			temp.styleName = "ui/common/version_3/B_bujian/hong_3_jiao.png";
			temp.width = 55;
			temp.x = 162;
			temp.y = 0;
			return temp;
		}

		private function labBook_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labBook = temp;
			temp.name = "labBook";
			temp.height = 16;
			temp.text = "需要技能书：$";
			temp.color = 0x4EFD6F;
			temp.width = 200;
			temp.x = 0;
			temp.y = 101;
			return temp;
		}

		private function labCurCD_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labCurCD = temp;
			temp.name = "labCurCD";
			temp.text = "冷却时间：$秒";
			temp.color = 0xEFEFF3;
			temp.width = 200;
			temp.x = 0;
			temp.y = 62;
			return temp;
		}

		private function labCurDec_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labCurDec = temp;
			temp.name = "labCurDec";
			temp.height = 19;
			temp.text = "当前等级描述";
			temp.color = 0xE530EC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 210;
			temp.x = 0;
			temp.y = 99;
			return temp;
		}

		private function labCurDis_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labCurDis = temp;
			temp.name = "labCurDis";
			temp.height = 16;
			temp.text = "攻击距离：$米";
			temp.color = 0xEFEFF3;
			temp.width = 150;
			temp.x = 70;
			temp.y = 49;
			return temp;
		}

		private function labCurMagic_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labCurMagic = temp;
			temp.name = "labCurMagic";
			temp.text = "法术消耗：$点";
			temp.color = 0xEFEFF3;
			temp.width = 200;
			temp.x = 0;
			temp.y = 79;
			return temp;
		}

		private function labCurNeedLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labCurNeedLevel = temp;
			temp.name = "labCurNeedLevel";
			temp.text = "需要等级：$";
			temp.color = 0x4EFD6F;
			temp.width = 200;
			temp.x = 0;
			temp.y = 44;
			return temp;
		}

		private function labExp_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labExp = temp;
			temp.name = "labExp";
			temp.height = 16;
			temp.text = "需要经验值：$";
			temp.color = 0x4EFD6F;
			temp.width = 200;
			temp.x = 0;
			temp.y = 18;
			return temp;
		}

		private function labMoney_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labMoney = temp;
			temp.name = "labMoney";
			temp.height = 16;
			temp.text = "需要金钱：$";
			temp.color = 0x4EFD6F;
			temp.width = 200;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labName1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName1 = temp;
			temp.name = "labName1";
			temp.bold = true;
			temp.height = 18;
			temp.fontSize = 14;
			temp.text = "回身斩";
			temp.textAlign = "center";
			temp.color = 0xE530EC;
			temp.width = 90;
			temp.x = 5;
			temp.y = 134;
			return temp;
		}

		private function labName2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName2 = temp;
			temp.name = "labName2";
			temp.bold = true;
			temp.height = 18;
			temp.fontSize = 14;
			temp.text = "回身斩";
			temp.textAlign = "center";
			temp.color = 0xE530EC;
			temp.width = 90;
			temp.x = 140;
			temp.y = 94;
			return temp;
		}

		private function labName3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName3 = temp;
			temp.name = "labName3";
			temp.bold = true;
			temp.height = 18;
			temp.fontSize = 14;
			temp.text = "回身斩";
			temp.textAlign = "center";
			temp.color = 0xE530EC;
			temp.width = 90;
			temp.x = 140;
			temp.y = 174;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.bold = true;
			temp.height = 18;
			temp.fontSize = 14;
			temp.text = "回身斩";
			temp.color = 0xE530EC;
			temp.width = 110;
			temp.x = 70;
			temp.y = 9;
			return temp;
		}

		private function labNextCD_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labNextCD = temp;
			temp.name = "labNextCD";
			temp.text = "冷却时间：$秒";
			temp.color = 0xEFEFF3;
			temp.width = 200;
			temp.x = 0;
			temp.y = 178;
			return temp;
		}

		private function labNextDec_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labNextDec = temp;
			temp.name = "labNextDec";
			temp.height = 21;
			temp.text = "当前等级描述";
			temp.color = 0xE530EC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 210;
			temp.x = 0;
			temp.y = 214;
			return temp;
		}

		private function labNextLevelTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labNextLevelTitle = temp;
			temp.name = "labNextLevelTitle";
			temp.text = "下一等级：";
			temp.color = 0xEFEFF3;
			temp.width = 200;
			temp.x = 0;
			temp.y = 119;
			return temp;
		}

		private function labNextMagic_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labNextMagic = temp;
			temp.name = "labNextMagic";
			temp.text = "法术消耗：$点";
			temp.color = 0xEFEFF3;
			temp.width = 200;
			temp.x = 0;
			temp.y = 195;
			return temp;
		}

		private function labNextNeedLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labNextNeedLevel = temp;
			temp.name = "labNextNeedLevel";
			temp.text = "需要等级：$";
			temp.color = 0x4EFD6F;
			temp.width = 200;
			temp.x = 0;
			temp.y = 158;
			return temp;
		}

		private function labNextSpellLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labNextSpellLevel = temp;
			temp.name = "labNextSpellLevel";
			temp.text = "技能等级$级";
			temp.color = 0xEFEFF3;
			temp.width = 200;
			temp.x = 0;
			temp.y = 139;
			return temp;
		}

		private function labPreSpell_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labPreSpell = temp;
			temp.name = "labPreSpell";
			temp.height = 16;
			temp.text = "需要技能点数：$$点";
			temp.color = 0x4EFD6F;
			temp.width = 200;
			temp.x = 0;
			temp.y = 85;
			return temp;
		}

		private function labRaceSpellAllPoint_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labRaceSpellAllPoint = temp;
			temp.name = "labRaceSpellAllPoint";
			temp.height = 16;
			temp.text = "需要前提技能点数之和：$点";
			temp.color = 0x4EFD6F;
			temp.width = 200;
			temp.x = 0;
			temp.y = 32;
			return temp;
		}

		private function labSpellPoint_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labSpellPoint = temp;
			temp.name = "labSpellPoint";
			temp.height = 16;
			temp.text = "需要技能点数：$点";
			temp.color = 0x4EFD6F;
			temp.width = 200;
			temp.x = 0;
			temp.y = 48;
			return temp;
		}

		private function labTishi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTishi = temp;
			temp.name = "labTishi";
			temp.height = 46;
			temp.text = "按左键可拖至快捷栏";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 222;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labUseDec_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labUseDec = temp;
			temp.name = "labUseDec";
			temp.height = 16;
			temp.text = "左键单击释放";
			temp.color = 0xEFEFF3;
			temp.width = 150;
			temp.x = 70;
			temp.y = 29;
			return temp;
		}

		private function labWeapenType_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labWeapenType = temp;
			temp.name = "labWeapenType";
			temp.height = 16;
			temp.text = "需要武器类型：$";
			temp.color = 0x4EFD6F;
			temp.width = 200;
			temp.x = 0;
			temp.y = 67;
			return temp;
		}

	}
}