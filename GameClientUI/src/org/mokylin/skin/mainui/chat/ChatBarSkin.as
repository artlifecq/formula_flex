package org.mokylin.skin.mainui.chat
{
	import feathers.themes.GuiThemeStyle;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.controls.ScrollContainer;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_btn_set;
	import org.mokylin.skin.component.button.ButtonSkin_chat_anniu1;
	import org.mokylin.skin.component.button.ButtonSkin_chat_fsan;
	import org.mokylin.skin.component.button.ButtonTopRightArrow;
	import org.mokylin.skin.mainui.chat.VScrollBarChatSkin;
	import org.mokylin.skin.mainui.chat.button.ButtonSkin_channel;
	import org.mokylin.skin.mainui.chat.button.ButtonSkin_face;
	import org.mokylin.skin.mainui.chat.button.ButtonSkin_location;
	import org.mokylin.skin.mainui.chat.button.ButtonSkin_min;
	import org.mokylin.skin.mainui.chat.button.ButtonSkin_scale;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ChatBarSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __ChatBarSkin_HorizontalLayout1:feathers.layout.HorizontalLayout;

		public var bgContentText:feathers.controls.UIAsset;

		public var bgInput:feathers.controls.UIAsset;

		public var btnChannel:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var btnFace:feathers.controls.Button;

		public var btnLocation:feathers.controls.Button;

		public var btnOpen:feathers.controls.Button;

		public var btnScale:feathers.controls.Button;

		public var btnSend:feathers.controls.Button;

		public var btnSet:feathers.controls.Button;

		public var scroller:feathers.controls.ScrollContainer;

		public var tabBar:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ChatBarSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 312;
			this.width = 432;
			this.elementsContent = [bgContentText_i(),btnSend_i(),btnFace_i(),scroller_i(),btnOpen_i(),btnClose_i(),btnScale_i(),tabBar_i(),btnSet_i(),btnChannel_i(),btnLocation_i(),bgInput_i()];
			
			states = {
				init:[
						{target:"__ChatBarSkin_HorizontalLayout1",
							name:"paddingLeft",
							value:2
						}
					]
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ChatBarSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['综合','本国','地区','个人','同级','号角','号角'];
			return temp;
		}

		private function __ChatBarSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 1;
			__ChatBarSkin_HorizontalLayout1 = temp;
			temp.paddingRight = 2;
			return temp;
		}

		private function bgContentText_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bgContentText = temp;
			temp.name = "bgContentText";
			temp.height = 267;
			temp.touchable = false;
			temp.styleName = "ui/mainui/chat/liaotiankuang_di.png";
			temp.width = 432;
			temp.x = 1;
			temp.y = 20;
			return temp;
		}

		private function bgInput_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bgInput = temp;
			temp.name = "bgInput";
			temp.height = 26;
			temp.styleName = "ui/mainui/chat/shurukuang.png";
			temp.width = 283;
			temp.x = 79;
			temp.y = 287;
			return temp;
		}

		private function btnChannel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnChannel = temp;
			temp.name = "btnChannel";
			temp.label = "综合";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_chat_anniu1);
			temp.x = 25;
			temp.y = 288;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.chat.button.ButtonSkin_min);
			temp.x = 1;
			temp.y = 288;
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
			temp.x = 363;
			temp.y = 290;
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
			temp.x = 384;
			temp.y = 290;
			return temp;
		}

		private function btnOpen_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOpen = temp;
			temp.name = "btnOpen";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonTopRightArrow);
			temp.x = 1;
			temp.y = 287;
			return temp;
		}

		private function btnScale_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnScale = temp;
			temp.name = "btnScale";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.chat.button.ButtonSkin_scale);
			temp.x = 417;
			temp.y = 19;
			return temp;
		}

		private function btnSend_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnSend = temp;
			temp.name = "btnSend";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_chat_fsan);
			temp.x = 405;
			temp.y = 290;
			return temp;
		}

		private function btnSet_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnSet = temp;
			temp.name = "btnSet";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_btn_set);
			temp.x = 406;
			temp.y = -2;
			return temp;
		}

		private function scroller_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			scroller = temp;
			temp.name = "scroller";
			temp.height = 267;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.chat.VScrollBarChatSkin);
			temp.width = 432;
			temp.x = 1;
			temp.y = 20;
			return temp;
		}

		private function tabBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar = temp;
			temp.name = "tabBar";
			temp.btnWidth = 57;
			temp.height = 23;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.chat.button.ButtonSkin_channel);
			temp.width = 310;
			temp.x = 2;
			temp.y = 0;
			temp.layout = __ChatBarSkin_HorizontalLayout1_i();
			temp.dataProvider = __ChatBarSkin_ArrayCollection1_i();
			return temp;
		}

	}
}