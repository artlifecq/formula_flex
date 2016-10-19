package org.mokylin.skin.app.team
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_green2;
	import org.mokylin.skin.component.text.TextAreaLvSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TeamSearchTeamSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnJoin:feathers.controls.Button;

		public var btnUpdate:feathers.controls.Button;

		public var labLevel:feathers.controls.Label;

		public var labManCount:feathers.controls.Label;

		public var labName:feathers.controls.Label;

		public var labPlace:feathers.controls.Label;

		public var labType:feathers.controls.Label;

		public var labTypeLevel:feathers.controls.Label;

		public var list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TeamSearchTeamSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 316;
			this.width = 532;
			this.elementsContent = [btnJoin_i(),btnUpdate_i(),list_i(),__TeamSearchTeamSkin_UIAsset1_i(),labName_i(),labTypeLevel_i(),labType_i(),labLevel_i(),labPlace_i(),labManCount_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TeamSearchTeamSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/kang/liebiao_dikuang/biaoti_dikuang.png";
			temp.width = 523;
			temp.x = 4;
			temp.y = 4;
			return temp;
		}

		private function btnJoin_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJoin = temp;
			temp.name = "btnJoin";
			temp.label = "加  入";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 70;
			temp.x = 80;
			temp.y = 276;
			return temp;
		}

		private function btnUpdate_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnUpdate = temp;
			temp.name = "btnUpdate";
			temp.label = "随机刷新";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 70;
			temp.x = 379;
			temp.y = 276;
			return temp;
		}

		private function labLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labLevel = temp;
			temp.name = "labLevel";
			temp.text = "等级限制";
			temp.textAlign = "center";
			temp.color = 0xC9B48A;
			temp.width = 64;
			temp.x = 320;
			temp.y = 7;
			return temp;
		}

		private function labManCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labManCount = temp;
			temp.name = "labManCount";
			temp.text = "空缺人数";
			temp.textAlign = "center";
			temp.color = 0xC9B48A;
			temp.width = 57;
			temp.x = 451;
			temp.y = 7;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.text = "队长";
			temp.textAlign = "center";
			temp.color = 0xC9B48A;
			temp.width = 147;
			temp.x = 12;
			temp.y = 7;
			return temp;
		}

		private function labPlace_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labPlace = temp;
			temp.name = "labPlace";
			temp.text = "地区";
			temp.textAlign = "center";
			temp.color = 0xC9B48A;
			temp.width = 51;
			temp.x = 395;
			temp.y = 7;
			return temp;
		}

		private function labTypeLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTypeLevel = temp;
			temp.name = "labTypeLevel";
			temp.text = "刷新等级";
			temp.textAlign = "center";
			temp.color = 0xC9B48A;
			temp.width = 75;
			temp.x = 168;
			temp.y = 7;
			return temp;
		}

		private function labType_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labType = temp;
			temp.name = "labType";
			temp.text = "类型";
			temp.textAlign = "center";
			temp.color = 0xC9B48A;
			temp.width = 56;
			temp.x = 256;
			temp.y = 7;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 229;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextAreaLvSkin);
			temp.width = 519;
			temp.x = 5;
			temp.y = 34;
			return temp;
		}

	}
}