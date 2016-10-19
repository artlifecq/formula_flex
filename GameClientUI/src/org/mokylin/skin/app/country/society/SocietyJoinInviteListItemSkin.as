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
	public class SocietyJoinInviteListItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var agreeBtn:feathers.controls.Button;

		public var itemBg:feathers.controls.UIAsset;

		public var nameTxt:feathers.controls.Label;

		public var refuseBtn:feathers.controls.Button;

		public var societyNameTxt:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SocietyJoinInviteListItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 28;
			this.width = 570;
			this.elementsContent = [itemBg_i(),nameTxt_i(),societyNameTxt_i(),agreeBtn_i(),refuseBtn_i()];
			
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
			temp.color = 0xDB9736;
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

		private function societyNameTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			societyNameTxt = temp;
			temp.name = "societyNameTxt";
			temp.bold = false;
			temp.height = 22;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "帮会名称啊啊啊";
			temp.textAlign = "center";
			temp.color = 0xDB9736;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 160;
			temp.x = 186;
			temp.y = 4;
			return temp;
		}

	}
}