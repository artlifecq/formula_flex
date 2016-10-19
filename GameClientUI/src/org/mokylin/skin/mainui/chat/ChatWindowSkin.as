package org.mokylin.skin.mainui.chat
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.TextArea;
	import feathers.controls.UIAsset;
	import feathers.controls.ScrollContainer;
	import org.mokylin.skin.component.button.ButtonSkin_faSong_btn;
	import org.mokylin.skin.component.button.ButtonSkin_minimize;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.text.TextAreaSkin;
	import org.mokylin.skin.mainui.chat.VScrollBarChatSkin;
	import org.mokylin.skin.mainui.chat.button.ButtonSkin_face;
	import org.mokylin.skin.mainui.chat.button.ButtonSkin_location;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ChatWindowSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var btnFace:feathers.controls.Button;

		public var btnLocation:feathers.controls.Button;

		public var btnMinimize:feathers.controls.Button;

		public var imageHead:feathers.controls.UIAsset;

		public var moodLab:feathers.controls.Label;

		public var nickLab:feathers.controls.Label;

		public var playerList:feathers.controls.List;

		public var scroller:feathers.controls.ScrollContainer;

		public var sendBtn:feathers.controls.Button;

		public var textInput:feathers.controls.TextArea;

		public var title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ChatWindowSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__ChatWindowSkin_UIAsset1_i(),btnClose_i(),btnMinimize_i(),title_i(),__ChatWindowSkin_UIAsset2_i(),__ChatWindowSkin_UIAsset3_i(),nickLab_i(),moodLab_i(),playerList_i(),sendBtn_i(),scroller_i(),textInput_i(),btnFace_i(),btnLocation_i(),imageHead_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ChatWindowSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 451;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/er_ji_mian_ban.png";
			temp.width = 611;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __ChatWindowSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 400;
			temp.styleName = "ui/common/kang/nei_kuang.png";
			temp.width = 175;
			temp.x = 15;
			temp.y = 36;
			return temp;
		}

		private function __ChatWindowSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 282;
			temp.styleName = "ui/common/kang/nei_kuang.png";
			temp.width = 410;
			temp.x = 187;
			temp.y = 88;
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
			temp.height = 20;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.chat.button.ButtonSkin_face);
			temp.width = 20;
			temp.x = 547;
			temp.y = 377;
			return temp;
		}

		private function btnLocation_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnLocation = temp;
			temp.name = "btnLocation";
			temp.height = 20;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.chat.button.ButtonSkin_location);
			temp.width = 20;
			temp.x = 570;
			temp.y = 377;
			return temp;
		}

		private function btnMinimize_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnMinimize = temp;
			temp.name = "btnMinimize";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_minimize);
			temp.x = 544;
			temp.y = 8;
			return temp;
		}

		private function imageHead_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageHead = temp;
			temp.name = "imageHead";
			temp.scaleX = 0.6;
			temp.scaleY = 0.6;
			temp.styleName = "ui/mainui/head/renwutouxiang.png";
			temp.x = 200;
			temp.y = 41;
			return temp;
		}

		private function moodLab_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			moodLab = temp;
			temp.name = "moodLab";
			temp.text = "标签";
			temp.color = 0x98692D;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 177;
			temp.x = 258;
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
			temp.underline = true;
			temp.width = 254;
			temp.x = 254;
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

		private function scroller_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			scroller = temp;
			temp.name = "scroller";
			temp.height = 266;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.chat.VScrollBarChatSkin);
			temp.width = 399;
			temp.x = 193;
			temp.y = 95;
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

		private function textInput_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			textInput = temp;
			temp.name = "textInput";
			temp.height = 60;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextAreaSkin);
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 356;
			temp.x = 190;
			temp.y = 370;
			return temp;
		}

		private function title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			title = temp;
			temp.name = "title";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "对话";
			temp.textAlign = "center";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 349;
			temp.x = 140;
			temp.y = 14;
			return temp;
		}

	}
}