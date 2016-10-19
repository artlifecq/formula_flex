package org.mokylin.skin.app.team
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_green2;
	import org.mokylin.skin.component.check.CheckBoxSkin_gold;
	import org.mokylin.skin.component.text.TextInput2Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TeamSearchMemberSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnCJoin:feathers.controls.Check;

		public var btnCannel:feathers.controls.Button;

		public var btnCountryWar:feathers.controls.Check;

		public var btnCreate:feathers.controls.Button;

		public var btnJoin:feathers.controls.Check;

		public var btnMonster:feathers.controls.Check;

		public var btnOther:feathers.controls.Check;

		public var btnTask:feathers.controls.Check;

		public var inputMemberLevel:feathers.controls.TextInput;

		public var inputMemberMaxLevel:feathers.controls.TextInput;

		public var labJoinTitle:feathers.controls.Label;

		public var labMaxLevel:feathers.controls.Label;

		public var labMemberLevel:feathers.controls.Label;

		public var labMonsterLevel:feathers.controls.Label;

		public var labMonsterLevelTitle:feathers.controls.Label;

		public var labTypeTitle:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TeamSearchMemberSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 316;
			this.width = 532;
			this.elementsContent = [__TeamSearchMemberSkin_UIAsset1_i(),__TeamSearchMemberSkin_UIAsset2_i(),__TeamSearchMemberSkin_UIAsset3_i(),labTypeTitle_i(),labJoinTitle_i(),labMonsterLevelTitle_i(),labMemberLevel_i(),btnMonster_i(),btnTask_i(),btnCountryWar_i(),inputMemberLevel_i(),inputMemberMaxLevel_i(),labMaxLevel_i(),btnCJoin_i(),btnJoin_i(),labMonsterLevel_i(),btnOther_i(),btnCreate_i(),btnCannel_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TeamSearchMemberSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/kang/xian/hengxian.png";
			temp.width = 500;
			temp.x = 16;
			temp.y = 188;
			return temp;
		}

		private function __TeamSearchMemberSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/kang/xian/hengxian.png";
			temp.width = 500;
			temp.x = 16;
			temp.y = 77;
			return temp;
		}

		private function __TeamSearchMemberSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/kang/shurukuang/shurukuang.png";
			temp.width = 183;
			temp.x = 128;
			temp.y = 105;
			return temp;
		}

		private function btnCJoin_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			btnCJoin = temp;
			temp.name = "btnCJoin";
			temp.label = "队长批准";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.check.CheckBoxSkin_gold);
			temp.width = 83;
			temp.x = 98;
			temp.y = 215;
			return temp;
		}

		private function btnCannel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCannel = temp;
			temp.name = "btnCannel";
			temp.label = "取 消";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 70;
			temp.x = 323;
			temp.y = 276;
			return temp;
		}

		private function btnCountryWar_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			btnCountryWar = temp;
			temp.name = "btnCountryWar";
			temp.label = "出国征战";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.check.CheckBoxSkin_gold);
			temp.width = 86;
			temp.x = 271;
			temp.y = 30;
			return temp;
		}

		private function btnCreate_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCreate = temp;
			temp.name = "btnCreate";
			temp.label = "创 建";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 70;
			temp.x = 118;
			temp.y = 276;
			return temp;
		}

		private function btnJoin_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			btnJoin = temp;
			temp.name = "btnJoin";
			temp.label = "直接加入";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.check.CheckBoxSkin_gold);
			temp.width = 87;
			temp.x = 192;
			temp.y = 215;
			return temp;
		}

		private function btnMonster_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			btnMonster = temp;
			temp.name = "btnMonster";
			temp.label = "刷怪";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.check.CheckBoxSkin_gold);
			temp.width = 60;
			temp.x = 100;
			temp.y = 30;
			return temp;
		}

		private function btnOther_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			btnOther = temp;
			temp.name = "btnOther";
			temp.label = "其他";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.check.CheckBoxSkin_gold);
			temp.width = 64;
			temp.x = 370;
			temp.y = 30;
			return temp;
		}

		private function btnTask_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			btnTask = temp;
			temp.name = "btnTask";
			temp.label = "任务";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.check.CheckBoxSkin_gold);
			temp.width = 62;
			temp.x = 192;
			temp.y = 30;
			return temp;
		}

		private function inputMemberLevel_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			inputMemberLevel = temp;
			temp.name = "inputMemberLevel";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput2Skin);
			temp.text = "1111";
			temp.color = 0xC9B48A;
			temp.width = 65;
			temp.x = 122;
			temp.y = 147;
			return temp;
		}

		private function inputMemberMaxLevel_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			inputMemberMaxLevel = temp;
			temp.name = "inputMemberMaxLevel";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput2Skin);
			temp.text = "1111";
			temp.color = 0xC9B48A;
			temp.width = 68;
			temp.x = 311;
			temp.y = 147;
			return temp;
		}

		private function labJoinTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labJoinTitle = temp;
			temp.name = "labJoinTitle";
			temp.text = "招收方式：";
			temp.color = 0xC9B48A;
			temp.x = 28;
			temp.y = 217;
			return temp;
		}

		private function labMaxLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labMaxLevel = temp;
			temp.name = "labMaxLevel";
			temp.text = "队员等级上限：";
			temp.color = 0xC9B48A;
			temp.x = 223;
			temp.y = 150;
			return temp;
		}

		private function labMemberLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labMemberLevel = temp;
			temp.name = "labMemberLevel";
			temp.text = "队员等级下限：";
			temp.color = 0xC9B48A;
			temp.x = 28;
			temp.y = 150;
			return temp;
		}

		private function labMonsterLevelTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labMonsterLevelTitle = temp;
			temp.name = "labMonsterLevelTitle";
			temp.text = "怪物等级：";
			temp.color = 0xC9B48A;
			temp.x = 28;
			temp.y = 108.5;
			return temp;
		}

		private function labMonsterLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labMonsterLevel = temp;
			temp.name = "labMonsterLevel";
			temp.text = "标签";
			temp.textAlign = "center";
			temp.color = 0xC9B48A;
			temp.width = 150;
			temp.x = 140;
			temp.y = 109;
			return temp;
		}

		private function labTypeTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTypeTitle = temp;
			temp.name = "labTypeTitle";
			temp.text = "组队类型：";
			temp.color = 0xC9B48A;
			temp.x = 28;
			temp.y = 30;
			return temp;
		}

	}
}