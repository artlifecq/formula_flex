package org.mokylin.skin.app.friend
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.list.ListSkin2;
	import org.mokylin.skin.component.text.TextInputChatSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FindPlayerSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var addBlack:feathers.controls.Button;

		public var addFriend:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var list:feathers.controls.List;

		public var seePlayer:feathers.controls.Button;

		public var selectPlayer:feathers.controls.Button;

		public var writeMood:feathers.controls.TextInput;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FindPlayerSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__FindPlayerSkin_UIAsset1_i(),__FindPlayerSkin_UIAsset2_i(),addFriend_i(),selectPlayer_i(),addBlack_i(),seePlayer_i(),__FindPlayerSkin_UIAsset3_i(),list_i(),__FindPlayerSkin_Label1_i(),__FindPlayerSkin_Label2_i(),__FindPlayerSkin_Label3_i(),__FindPlayerSkin_Label4_i(),__FindPlayerSkin_Label5_i(),writeMood_i(),btnClose_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FindPlayerSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "玩家名称";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 53;
			temp.y = 78;
			return temp;
		}

		private function __FindPlayerSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "等级";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 173;
			temp.y = 79;
			return temp;
		}

		private function __FindPlayerSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "国家";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 271;
			temp.y = 79;
			return temp;
		}

		private function __FindPlayerSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "查找玩家";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 156;
			temp.y = 13;
			return temp;
		}

		private function __FindPlayerSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "输入玩家名:";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 24;
			temp.y = 44;
			return temp;
		}

		private function __FindPlayerSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 453;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/er_ji_mian_ban.png";
			temp.width = 365;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __FindPlayerSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 325;
			temp.styleName = "ui/mainui/chat/shurukuang.png";
			temp.width = 340;
			temp.x = 13;
			temp.y = 69;
			return temp;
		}

		private function __FindPlayerSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/L_liebiao/lie_biao_di_1.png";
			temp.width = 333;
			temp.x = 17;
			temp.y = 73;
			return temp;
		}

		private function addBlack_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			addBlack = temp;
			temp.name = "addBlack";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 32;
			temp.label = "屏蔽此人";
			temp.fontSize = 16;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_e_erjianniu);
			temp.color = 0xF9F0CC;
			temp.width = 97;
			temp.x = 138;
			temp.y = 400;
			return temp;
		}

		private function addFriend_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			addFriend = temp;
			temp.name = "addFriend";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 32;
			temp.label = "加为好友";
			temp.fontSize = 16;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_e_erjianniu);
			temp.color = 0xF9F0CC;
			temp.width = 97;
			temp.x = 247;
			temp.y = 400;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.height = 29;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_g_guanbi);
			temp.width = 30;
			temp.x = 329;
			temp.y = 6;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 285;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListSkin2);
			temp.width = 328;
			temp.x = 20;
			temp.y = 102;
			return temp;
		}

		private function seePlayer_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			seePlayer = temp;
			temp.name = "seePlayer";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 32;
			temp.label = "查 看";
			temp.fontSize = 16;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_e_erjianniu);
			temp.color = 0xF9F0CC;
			temp.width = 97;
			temp.x = 29;
			temp.y = 400;
			return temp;
		}

		private function selectPlayer_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			selectPlayer = temp;
			temp.name = "selectPlayer";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 32;
			temp.label = "搜索";
			temp.fontSize = 16;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_e_erjianniu);
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.width = 82;
			temp.x = 268;
			temp.y = 39;
			return temp;
		}

		private function writeMood_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			writeMood = temp;
			temp.name = "writeMood";
			temp.height = 28;
			temp.prompt = "支持模糊搜索";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInputChatSkin);
			temp.width = 158;
			temp.x = 105;
			temp.y = 41;
			return temp;
		}

	}
}