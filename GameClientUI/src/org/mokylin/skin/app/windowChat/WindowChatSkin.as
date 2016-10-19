package org.mokylin.skin.app.windowChat
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_faSong_btn;
	import org.mokylin.skin.component.button.ButtonSkin_face;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.mainui.chat.VScrollBarChatSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class WindowChatSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var btnFace:feathers.controls.Button;

		public var chatInfoList:feathers.controls.List;

		public var levelLab:feathers.controls.Label;

		public var moodLab:feathers.controls.Label;

		public var nickLab:feathers.controls.Label;

		public var playerList:feathers.controls.List;

		public var sendBtn:feathers.controls.Button;

		public var targetList:feathers.controls.List;

		public var title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function WindowChatSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__WindowChatSkin_UIAsset1_i(),btnClose_i(),title_i(),__WindowChatSkin_UIAsset2_i(),__WindowChatSkin_UIAsset3_i(),__WindowChatSkin_UIAsset4_i(),targetList_i(),nickLab_i(),levelLab_i(),moodLab_i(),playerList_i(),chatInfoList_i(),btnFace_i(),sendBtn_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __WindowChatSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 451;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/er_ji_mian_ban.png";
			temp.width = 611;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __WindowChatSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 400;
			temp.styleName = "ui/common/backgound/sanjimianban.png";
			temp.width = 175;
			temp.x = 15;
			temp.y = 36;
			return temp;
		}

		private function __WindowChatSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 282;
			temp.styleName = "ui/common/backgound/sanjimianban.png";
			temp.width = 410;
			temp.x = 187;
			temp.y = 88;
			return temp;
		}

		private function __WindowChatSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 67;
			temp.styleName = "ui/common/backgound/sanjimianban.png";
			temp.width = 360;
			temp.x = 188;
			temp.y = 368;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_g_guanbi);
			temp.x = 572;
			temp.y = 8;
			return temp;
		}

		private function btnFace_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnFace = temp;
			temp.name = "btnFace";
			temp.height = 18;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_face);
			temp.width = 23;
			temp.x = 551;
			temp.y = 377;
			return temp;
		}

		private function chatInfoList_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			chatInfoList = temp;
			temp.name = "chatInfoList";
			temp.height = 266;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.chat.VScrollBarChatSkin);
			temp.width = 399;
			temp.x = 194;
			temp.y = 94;
			return temp;
		}

		private function levelLab_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			levelLab = temp;
			temp.name = "levelLab";
			temp.text = "标签";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 58;
			temp.x = 371;
			temp.y = 43;
			return temp;
		}

		private function moodLab_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			moodLab = temp;
			temp.name = "moodLab";
			temp.text = "标签";
			temp.color = 0x9C8049;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 177;
			temp.x = 235;
			temp.y = 67;
			return temp;
		}

		private function nickLab_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nickLab = temp;
			temp.name = "nickLab";
			temp.height = 25;
			temp.fontSize = 16;
			temp.text = "七个字的名字叫啥";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 141;
			temp.x = 231;
			temp.y = 40;
			return temp;
		}

		private function playerList_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			playerList = temp;
			temp.name = "playerList";
			temp.height = 380;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.chat.VScrollBarChatSkin);
			temp.width = 160;
			temp.x = 21;
			temp.y = 45;
			return temp;
		}

		private function sendBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sendBtn = temp;
			temp.name = "sendBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_faSong_btn);
			temp.x = 554;
			temp.y = 406;
			return temp;
		}

		private function targetList_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			targetList = temp;
			temp.name = "targetList";
			temp.height = 385;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.chat.VScrollBarChatSkin);
			temp.visible = false;
			temp.width = 165;
			temp.x = 20;
			temp.y = 42;
			return temp;
		}

		private function title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			title = temp;
			temp.name = "title";
			temp.fontSize = 16;
			temp.text = "聊天系统设置";
			temp.textAlign = "center";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 349;
			temp.x = 140;
			temp.y = 9;
			return temp;
		}

	}
}