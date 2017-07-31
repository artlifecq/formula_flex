package org.mokylin.skin.mainui.chat
{
	import feathers.controls.text.Fontter;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.Radio;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.ToggleButton;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.list.ListSkin2;
	import org.mokylin.skin.mainui.chat.Chat_bg;
	import org.mokylin.skin.mainui.chat.button.ButtonChatClose;
	import org.mokylin.skin.mainui.chat.button.ButtonChatInfo;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_Type1;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_banghui;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_biaoqiang;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_dangqian;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_dinwei;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_duiwu;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_fasong;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_laba1;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_sanjiao;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_shijie;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_siliao;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_suo;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class chat_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnBang:feathers.controls.Radio;

		public var btnDang:feathers.controls.Radio;

		public var btnDui:feathers.controls.Radio;

		public var btnShi:feathers.controls.Radio;

		public var btnSi:feathers.controls.Radio;

		public var btn_close:feathers.controls.Button;

		public var btn_face:feathers.controls.Button;

		public var btn_laba2:feathers.controls.Radio;

		public var btn_location:feathers.controls.Button;

		public var btn_lock:feathers.controls.ToggleButton;

		public var btn_open:feathers.controls.Button;

		public var btn_scale:feathers.controls.Button;

		public var btn_send:feathers.controls.Button;

		public var btns:feathers.controls.Group;

		public var grp_buttom:feathers.controls.Group;

		public var grp_laba:feathers.controls.Group;

		public var grp_laba_bg:feathers.controls.UIAsset;

		public var grp_txt:feathers.controls.Group;

		public var inputbg:feathers.controls.UIAsset;

		public var lb_pindao:feathers.controls.Label;

		public var lb_tishi:feathers.controls.UIAsset;

		public var listBar:feathers.controls.List;

		public var tab_Type:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function chat_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 335;
			this.width = 365;
			this.elementsContent = [grp_txt_i(),btn_lock_i(),grp_buttom_i(),lb_tishi_i(),grp_laba_i(),tab_Type_i(),btns_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __chat_Skin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['综合','社交','个人'];
			return temp;
		}

		private function __chat_Skin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 1;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 307;
			var skin:StateSkin = new org.mokylin.skin.mainui.chat.Chat_bg()
			temp.skin = skin
			temp.width = 365;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnBang_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btnBang = temp;
			temp.name = "btnBang";
			temp.groupName = "radioGroupChat";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_banghui;
			temp.x = 27;
			temp.y = 0;
			return temp;
		}

		private function btnDang_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btnDang = temp;
			temp.name = "btnDang";
			temp.groupName = "radioGroupChat";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_dangqian;
			temp.x = 108;
			temp.y = 0;
			return temp;
		}

		private function btnDui_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btnDui = temp;
			temp.name = "btnDui";
			temp.groupName = "radioGroupChat";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_duiwu;
			temp.x = 54;
			temp.y = 0;
			return temp;
		}

		private function btnShi_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btnShi = temp;
			temp.name = "btnShi";
			temp.groupName = "radioGroupChat";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_shijie;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnSi_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btnSi = temp;
			temp.name = "btnSi";
			temp.groupName = "radioGroupChat";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_siliao;
			temp.x = 81;
			temp.y = 0;
			return temp;
		}

		private function btn_close_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_close = temp;
			temp.name = "btn_close";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChatClose;
			temp.width = 20;
			temp.x = 1;
			temp.y = 2;
			return temp;
		}

		private function btn_face_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_face = temp;
			temp.name = "btn_face";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_biaoqiang;
			temp.x = 295;
			temp.y = 3;
			return temp;
		}

		private function btn_laba2_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_laba2 = temp;
			temp.name = "btn_laba2";
			temp.groupName = "radioGroupChat";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_laba1;
			temp.x = 135;
			temp.y = 0;
			return temp;
		}

		private function btn_location_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_location = temp;
			temp.name = "btn_location";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_dinwei;
			temp.x = 274;
			temp.y = 3;
			return temp;
		}

		private function btn_lock_i():feathers.controls.ToggleButton
		{
			var temp:feathers.controls.ToggleButton = new feathers.controls.ToggleButton();
			btn_lock = temp;
			temp.name = "btn_lock";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_suo;
			temp.x = 318;
			temp.y = 53;
			return temp;
		}

		private function btn_open_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_open = temp;
			temp.name = "btn_open";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChatInfo;
			temp.x = 1;
			temp.y = -6;
			return temp;
		}

		private function btn_scale_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_scale = temp;
			temp.name = "btn_scale";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_sanjiao;
			temp.x = 346;
			temp.y = 24;
			return temp;
		}

		private function btn_send_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_send = temp;
			temp.name = "btn_send";
			temp.height = 26;
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_fasong;
			temp.x = 320;
			temp.y = 1;
			return temp;
		}

		private function btns_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			btns = temp;
			temp.name = "btns";
			temp.x = 1;
			temp.y = 282;
			temp.elementsContent = [btnShi_i(),btnBang_i(),btnDui_i(),btnSi_i(),btnDang_i(),btn_laba2_i()];
			return temp;
		}

		private function grp_buttom_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_buttom = temp;
			temp.name = "grp_buttom";
			temp.x = 0;
			temp.y = 308;
			temp.elementsContent = [btn_close_i(),btn_open_i(),btn_send_i(),inputbg_i(),btn_location_i(),btn_face_i(),lb_pindao_i()];
			return temp;
		}

		private function grp_laba_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grp_laba_bg = temp;
			temp.name = "grp_laba_bg";
			temp.height = 28;
			temp.styleName = "ui/mainui/chat/liaotiankuang1.png";
			temp.width = 365;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grp_laba_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_laba = temp;
			temp.name = "grp_laba";
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [grp_laba_bg_i()];
			return temp;
		}

		private function grp_txt_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_txt = temp;
			temp.name = "grp_txt";
			temp.width = 364;
			temp.x = 0;
			temp.y = 28;
			temp.elementsContent = [bg_i(),btn_scale_i(),listBar_i()];
			return temp;
		}

		private function inputbg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			inputbg = temp;
			temp.name = "inputbg";
			temp.styleName = "ui/component/text/chat_input.png";
			temp.width = 252;
			temp.x = 67;
			temp.y = 2;
			return temp;
		}

		private function lb_pindao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_pindao = temp;
			temp.name = "lb_pindao";
			temp.text = "世界";
			temp.color = 0xBCA78A;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 39;
			temp.x = 27;
			temp.y = 4;
			return temp;
		}

		private function lb_tishi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			lb_tishi = temp;
			temp.name = "lb_tishi";
			temp.styleName = "ui/mainui/chat/meishuzi.png";
			temp.x = 5;
			temp.y = 30;
			return temp;
		}

		private function listBar_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			listBar = temp;
			temp.name = "listBar";
			temp.height = 197;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin2;
			temp.width = 363;
			temp.x = 1;
			temp.y = 54;
			return temp;
		}

		private function tab_Type_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tab_Type = temp;
			temp.name = "tab_Type";
			temp.btnWidth = 49;
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_Type1;
			temp.x = 2;
			temp.y = 53;
			temp.layout = __chat_Skin_HorizontalLayout1_i();
			temp.dataProvider = __chat_Skin_ArrayCollection1_i();
			return temp;
		}

	}
}