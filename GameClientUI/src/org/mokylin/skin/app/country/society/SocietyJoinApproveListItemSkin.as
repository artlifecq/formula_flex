package org.mokylin.skin.app.country.society
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_anniu4;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class SocietyJoinApproveListItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var agreeBtn:feathers.controls.Button;

		public var combatTxt:feathers.controls.Label;

		public var itemBg:feathers.controls.UIAsset;

		public var levelTxt:feathers.controls.Label;

		public var nameTxt:feathers.controls.Label;

		public var refuseBtn:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SocietyJoinApproveListItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 28;
			this.width = 570;
			this.elementsContent = [itemBg_i(),nameTxt_i(),levelTxt_i(),combatTxt_i(),agreeBtn_i(),refuseBtn_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function agreeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			agreeBtn = temp;
			temp.name = "agreeBtn";
			temp.height = 23;
			temp.label = "同意";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_anniu4);
			temp.width = 40;
			temp.x = 445;
			temp.y = 3;
			return temp;
		}

		private function combatTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			combatTxt = temp;
			temp.name = "combatTxt";
			temp.bold = false;
			temp.height = 22;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "99999";
			temp.textAlign = "center";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 100;
			temp.x = 278;
			temp.y = 4;
			return temp;
		}

		private function itemBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemBg = temp;
			temp.name = "itemBg";
			temp.height = 28;
			temp.styleName = "ui/common/liebiao/liebiaotiao.png";
			temp.width = 570;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function levelTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			levelTxt = temp;
			temp.name = "levelTxt";
			temp.bold = false;
			temp.height = 22;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "99";
			temp.textAlign = "center";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 60;
			temp.x = 157;
			temp.y = 4;
			return temp;
		}

		private function nameTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nameTxt = temp;
			temp.name = "nameTxt";
			temp.bold = false;
			temp.height = 22;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "玩家名字";
			temp.textAlign = "center";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 120;
			temp.x = 11;
			temp.y = 4;
			return temp;
		}

		private function refuseBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			refuseBtn = temp;
			temp.name = "refuseBtn";
			temp.height = 23;
			temp.label = "拒绝";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_anniu4);
			temp.width = 40;
			temp.x = 494;
			temp.y = 3;
			return temp;
		}

	}
}