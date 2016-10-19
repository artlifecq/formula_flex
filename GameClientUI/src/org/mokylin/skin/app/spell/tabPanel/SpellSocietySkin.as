package org.mokylin.skin.app.spell.tabPanel
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_da;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class SpellSocietySkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnAddFamilyWar:feathers.controls.Button;

		public var btnSpell:feathers.controls.Button;

		public var charTypeGroup:feathers.controls.Group;

		public var grid0:feathers.controls.UIAsset;

		public var grid1:feathers.controls.UIAsset;

		public var grid2:feathers.controls.UIAsset;

		public var grid3:feathers.controls.UIAsset;

		public var grid4:feathers.controls.UIAsset;

		public var grid5:feathers.controls.UIAsset;

		public var gridGroup:feathers.controls.Group;

		public var groupButtom:feathers.controls.Group;

		public var imgBg:feathers.controls.UIAsset;

		public var labConditions:feathers.controls.Label;

		public var labConditons:feathers.controls.Label;

		public var labDesc:feathers.controls.Label;

		public var labLv:feathers.controls.Label;

		public var labSpellAll:feathers.controls.Label;

		public var labSpellPoint:feathers.controls.Label;

		public var maskGroup:feathers.controls.Group;

		public var uiAss0:feathers.controls.UIAsset;

		public var uiAss1:feathers.controls.UIAsset;

		public var uiAss2:feathers.controls.UIAsset;

		public var uiAss3:feathers.controls.UIAsset;

		public var uiAss4:feathers.controls.UIAsset;

		public var uiAss5:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SpellSocietySkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 483;
			this.width = 677;
			this.elementsContent = [__SpellSocietySkin_Group1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __SpellSocietySkin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.height = 483;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [imgBg_i(),__SpellSocietySkin_Group2_i(),groupButtom_i(),maskGroup_i(),gridGroup_i(),charTypeGroup_i(),btnAddFamilyWar_i(),labConditions_i()];
			return temp;
		}

		private function __SpellSocietySkin_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.height = 333;
			temp.x = 450;
			temp.y = 60;
			temp.elementsContent = [btnSpell_i(),__SpellSocietySkin_Label1_i(),labLv_i(),__SpellSocietySkin_Label2_i(),labConditons_i(),__SpellSocietySkin_Label3_i(),labDesc_i()];
			return temp;
		}

		private function __SpellSocietySkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 16;
			temp.text = "技能研究状况：";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __SpellSocietySkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 16;
			temp.text = "学习条件：";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 45;
			return temp;
		}

		private function __SpellSocietySkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 16;
			temp.text = "功能描述：";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 130;
			return temp;
		}

		private function __SpellSocietySkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 65;
			temp.styleName = "ui/common/version_3/D_di/di.png";
			temp.width = 678;
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function btnAddFamilyWar_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnAddFamilyWar = temp;
			temp.name = "btnAddFamilyWar";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "加入家族";
			temp.fontSize = 18;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_da);
			temp.color = 0xDDDABA;
			temp.x = 260;
			temp.y = 250;
			return temp;
		}

		private function btnSpell_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnSpell = temp;
			temp.name = "btnSpell";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "技能学习";
			temp.fontSize = 18;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_da);
			temp.color = 0xDDDABA;
			temp.x = 25;
			temp.y = 245;
			return temp;
		}

		private function charTypeGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			charTypeGroup = temp;
			temp.name = "charTypeGroup";
			temp.x = 34;
			temp.y = 108;
			temp.elementsContent = [uiAss0_i(),uiAss1_i(),uiAss2_i(),uiAss3_i(),uiAss4_i(),uiAss5_i()];
			return temp;
		}

		private function grid0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid0 = temp;
			temp.name = "grid0";
			temp.height = 50;
			temp.width = 50;
			temp.x = 1;
			temp.y = 0;
			return temp;
		}

		private function grid1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid1 = temp;
			temp.name = "grid1";
			temp.height = 50;
			temp.width = 50;
			temp.x = 129;
			temp.y = 0;
			return temp;
		}

		private function grid2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid2 = temp;
			temp.name = "grid2";
			temp.height = 50;
			temp.width = 50;
			temp.x = 255;
			temp.y = 0;
			return temp;
		}

		private function grid3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid3 = temp;
			temp.name = "grid3";
			temp.height = 50;
			temp.width = 50;
			temp.x = 0;
			temp.y = 128;
			return temp;
		}

		private function grid4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid4 = temp;
			temp.name = "grid4";
			temp.height = 50;
			temp.width = 50;
			temp.x = 128;
			temp.y = 128;
			return temp;
		}

		private function grid5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid5 = temp;
			temp.name = "grid5";
			temp.height = 50;
			temp.width = 50;
			temp.x = 253;
			temp.y = 128;
			return temp;
		}

		private function gridGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gridGroup = temp;
			temp.name = "gridGroup";
			temp.x = 48;
			temp.y = 117;
			temp.elementsContent = [grid0_i(),grid1_i(),grid2_i(),grid3_i(),grid4_i(),grid5_i()];
			return temp;
		}

		private function groupButtom_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupButtom = temp;
			temp.name = "groupButtom";
			temp.width = 678;
			temp.x = 0;
			temp.y = 415;
			temp.elementsContent = [__SpellSocietySkin_UIAsset1_i(),labSpellPoint_i(),labSpellAll_i()];
			return temp;
		}

		private function imgBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBg = temp;
			temp.name = "imgBg";
			temp.height = 357;
			temp.styleName = "ui/app/spell/di_jz.jpg";
			temp.width = 677;
			temp.y = 48;
			return temp;
		}

		private function labConditions_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labConditions = temp;
			temp.name = "labConditions";
			temp.height = 47;
			temp.leading = 10;
			temp.text = "家族技能可以提供多种强大只用的能力，但是必须在进入家族后才能学习，20级即可加入家族";
			temp.textAlign = "center";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 313;
			temp.x = 170;
			temp.y = 160;
			return temp;
		}

		private function labConditons_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labConditons = temp;
			temp.name = "labConditons";
			temp.height = 65;
			temp.leading = 7;
			temp.text = "    家族功勋360  英雄等级80";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 214;
			temp.x = 0;
			temp.y = 65;
			return temp;
		}

		private function labDesc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labDesc = temp;
			temp.name = "labDesc";
			temp.height = 88;
			temp.leading = 7;
			temp.text = "    家族被动技能，永久增加自身生命上限1000点";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 204;
			temp.x = 0;
			temp.y = 155;
			return temp;
		}

		private function labLv_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labLv = temp;
			temp.name = "labLv";
			temp.text = "    家族韧性2级";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 195;
			temp.x = 0;
			temp.y = 23;
			return temp;
		}

		private function labSpellAll_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labSpellAll = temp;
			temp.name = "labSpellAll";
			temp.bold = true;
			temp.height = 25;
			temp.text = "家族被动技能属性附加：物理防御1000   法术防御1000   生命上限1000";
			temp.color = 0xDDDABA;
			temp.width = 542;
			temp.x = 137;
			temp.y = 39;
			return temp;
		}

		private function labSpellPoint_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labSpellPoint = temp;
			temp.name = "labSpellPoint";
			temp.bold = true;
			temp.text = "家族功勋：1000";
			temp.color = 0xDDDABA;
			temp.width = 542;
			temp.x = 135;
			temp.y = 13;
			return temp;
		}

		private function maskGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			maskGroup = temp;
			temp.name = "maskGroup";
			temp.height = 357;
			temp.width = 677;
			temp.x = 0;
			temp.y = 48;
			return temp;
		}

		private function uiAss0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiAss0 = temp;
			temp.name = "uiAss0";
			temp.height = 19;
			temp.width = 33;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiAss1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiAss1 = temp;
			temp.name = "uiAss1";
			temp.height = 19;
			temp.width = 33;
			temp.x = 128;
			temp.y = 1;
			return temp;
		}

		private function uiAss2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiAss2 = temp;
			temp.name = "uiAss2";
			temp.height = 19;
			temp.width = 33;
			temp.x = 254;
			temp.y = 1;
			return temp;
		}

		private function uiAss3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiAss3 = temp;
			temp.name = "uiAss3";
			temp.height = 19;
			temp.width = 33;
			temp.x = 0;
			temp.y = 128;
			return temp;
		}

		private function uiAss4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiAss4 = temp;
			temp.name = "uiAss4";
			temp.height = 19;
			temp.width = 33;
			temp.x = 129;
			temp.y = 128;
			return temp;
		}

		private function uiAss5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiAss5 = temp;
			temp.name = "uiAss5";
			temp.height = 19;
			temp.width = 33;
			temp.x = 254;
			temp.y = 128;
			return temp;
		}

	}
}