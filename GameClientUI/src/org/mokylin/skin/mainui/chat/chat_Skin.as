package org.mokylin.skin.mainui.chat
{
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.ScrollContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.ToggleButton;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.component.scrollbar.ScrollBarSkin_chat;
	import org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;
	import org.mokylin.skin.mainui.chat.pingdaoItems;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_banghui;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_biaoqiang;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_dangqian;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_dinwei;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_duiwu;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_fasong;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_geren;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_laba1;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_sanjiao;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_shejiao;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_shijie;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_shouhui;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_siliao;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_suo;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_zhankai;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_zonghe;

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
		public var bg:feathers.controls.UIAsset;

		public var btn_banghui:feathers.controls.Button;

		public var btn_close:feathers.controls.Button;

		public var btn_dangqian:feathers.controls.Button;

		public var btn_duiwu:feathers.controls.Button;

		public var btn_face:feathers.controls.Button;

		public var btn_geren:feathers.controls.ToggleButton;

		public var btn_laba:feathers.controls.Button;

		public var btn_location:feathers.controls.Button;

		public var btn_lock:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;

		public var btn_scale:feathers.controls.Button;

		public var btn_send:feathers.controls.Button;

		public var btn_shejiao:feathers.controls.ToggleButton;

		public var btn_shijie:feathers.controls.Button;

		public var btn_siliao:feathers.controls.Button;

		public var btn_zonghe:feathers.controls.ToggleButton;

		public var grp_buttom:feathers.controls.Group;

		public var grp_channel:feathers.controls.Group;

		public var grp_laba:feathers.controls.Group;

		public var grp_laba_bg:feathers.controls.UIAsset;

		public var grp_select:feathers.controls.Group;

		public var grp_top:feathers.controls.Group;

		public var grp_txt:feathers.controls.Group;

		public var inputbg:feathers.controls.UIAsset;

		public var lb_tishi:feathers.controls.UIAsset;

		public var select_banghui:feathers.controls.Button;

		public var select_bg:feathers.controls.UIAsset;

		public var select_dangqian:feathers.controls.Button;

		public var select_duiwu:feathers.controls.Button;

		public var select_laba:feathers.controls.Button;

		public var select_shijie:feathers.controls.Button;

		public var select_siliao:feathers.controls.Button;

		public var vscrollbar:feathers.controls.ScrollContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function chat_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 335;
			this.width = 364;
			this.elementsContent = [grp_txt_i(),grp_top_i(),btn_lock_i(),grp_buttom_i(),lb_tishi_i(),grp_laba_i(),grp_select_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __chat_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/chat/laba.png";
			temp.x = 5;
			temp.y = 5;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 282;
			temp.styleName = "ui/mainui/chat/di.png";
			temp.width = 364;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_banghui_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_banghui = temp;
			temp.name = "btn_banghui";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_banghui;
			temp.width = 50;
			temp.x = 1;
			temp.y = 145;
			return temp;
		}

		private function btn_close_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_close = temp;
			temp.name = "btn_close";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_shouhui;
			temp.width = 20;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_dangqian_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_dangqian = temp;
			temp.name = "btn_dangqian";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_dangqian;
			temp.width = 50;
			temp.x = 1;
			temp.y = 145;
			return temp;
		}

		private function btn_duiwu_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_duiwu = temp;
			temp.name = "btn_duiwu";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_duiwu;
			temp.width = 50;
			temp.x = 1;
			temp.y = 145;
			return temp;
		}

		private function btn_face_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_face = temp;
			temp.name = "btn_face";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_biaoqiang;
			temp.x = 294;
			temp.y = 3;
			return temp;
		}

		private function btn_geren_i():feathers.controls.ToggleButton
		{
			var temp:feathers.controls.ToggleButton = new feathers.controls.ToggleButton();
			btn_geren = temp;
			temp.name = "btn_geren";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_geren;
			temp.x = 100;
			temp.y = 0;
			return temp;
		}

		private function btn_laba_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_laba = temp;
			temp.name = "btn_laba";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_laba1;
			temp.width = 50;
			temp.x = 1;
			temp.y = 145;
			return temp;
		}

		private function btn_location_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_location = temp;
			temp.name = "btn_location";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_dinwei;
			temp.x = 270;
			temp.y = 1;
			return temp;
		}

		private function btn_lock_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_lock = temp;
			temp.name = "btn_lock";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_suo;
			temp.x = 319;
			temp.y = 54;
			return temp;
		}

		private function btn_open_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_open = temp;
			temp.name = "btn_open";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_zhankai;
			temp.width = 20;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_scale_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_scale = temp;
			temp.name = "btn_scale";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_sanjiao;
			temp.x = 344;
			temp.y = 0;
			return temp;
		}

		private function btn_send_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_send = temp;
			temp.name = "btn_send";
			temp.height = 26;
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_fasong;
			temp.width = 49;
			temp.x = 317;
			temp.y = 0;
			return temp;
		}

		private function btn_shejiao_i():feathers.controls.ToggleButton
		{
			var temp:feathers.controls.ToggleButton = new feathers.controls.ToggleButton();
			btn_shejiao = temp;
			temp.name = "btn_shejiao";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_shejiao;
			temp.x = 50;
			temp.y = 0;
			return temp;
		}

		private function btn_shijie_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shijie = temp;
			temp.name = "btn_shijie";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_shijie;
			temp.width = 50;
			temp.x = 1;
			temp.y = 145;
			return temp;
		}

		private function btn_siliao_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_siliao = temp;
			temp.name = "btn_siliao";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_siliao;
			temp.width = 50;
			temp.x = 1;
			temp.y = 145;
			return temp;
		}

		private function btn_zonghe_i():feathers.controls.ToggleButton
		{
			var temp:feathers.controls.ToggleButton = new feathers.controls.ToggleButton();
			btn_zonghe = temp;
			temp.name = "btn_zonghe";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_zonghe;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grp_buttom_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_buttom = temp;
			temp.name = "grp_buttom";
			temp.x = 0;
			temp.y = 308;
			temp.elementsContent = [btn_close_i(),btn_open_i(),btn_send_i(),inputbg_i(),btn_location_i(),btn_face_i()];
			return temp;
		}

		private function grp_channel_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_channel = temp;
			temp.name = "grp_channel";
			temp.height = 149;
			temp.width = 54;
			temp.x = 0;
			temp.y = -5;
			return temp;
		}

		private function grp_laba_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grp_laba_bg = temp;
			temp.name = "grp_laba_bg";
			temp.height = 28;
			temp.styleName = "ui/mainui/chat/di_laba.png";
			temp.width = 362;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grp_laba_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_laba = temp;
			temp.name = "grp_laba";
			temp.x = 2;
			temp.y = 0;
			temp.elementsContent = [grp_laba_bg_i(),__chat_Skin_UIAsset2_i()];
			return temp;
		}

		private function grp_select_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_select = temp;
			temp.name = "grp_select";
			temp.x = 17;
			temp.y = 163;
			temp.elementsContent = [btn_laba_i(),btn_shijie_i(),btn_banghui_i(),btn_duiwu_i(),btn_siliao_i(),btn_dangqian_i(),select_laba_i(),select_shijie_i(),select_banghui_i(),select_duiwu_i(),select_siliao_i(),select_dangqian_i(),select_bg_i(),grp_channel_i()];
			return temp;
		}

		private function grp_top_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_top = temp;
			temp.name = "grp_top";
			temp.x = 1;
			temp.y = 53;
			temp.elementsContent = [btn_zonghe_i(),btn_geren_i(),btn_shejiao_i()];
			return temp;
		}

		private function grp_txt_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_txt = temp;
			temp.name = "grp_txt";
			temp.width = 364;
			temp.x = 0;
			temp.y = 52;
			temp.elementsContent = [bg_i(),btn_scale_i(),vscrollbar_i()];
			return temp;
		}

		private function inputbg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			inputbg = temp;
			temp.name = "inputbg";
			temp.styleName = "ui/component/text/chat_input.png";
			temp.width = 200;
			temp.x = 67;
			temp.y = 1;
			return temp;
		}

		private function lb_tishi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			lb_tishi = temp;
			temp.name = "lb_tishi";
			temp.styleName = "ui/mainui/chat/meishuzi.png";
			temp.x = 4;
			temp.y = 30;
			return temp;
		}

		private function select_banghui_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			select_banghui = temp;
			temp.name = "select_banghui";
			temp.height = 20;
			temp.label = "帮会";
			temp.styleClass = org.mokylin.skin.mainui.chat.pingdaoItems;
			temp.width = 40;
			temp.x = 6;
			temp.y = 48;
			return temp;
		}

		private function select_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			select_bg = temp;
			temp.name = "select_bg";
			temp.height = 148;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 52;
			temp.x = 1;
			temp.y = 1;
			return temp;
		}

		private function select_dangqian_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			select_dangqian = temp;
			temp.name = "select_dangqian";
			temp.height = 20;
			temp.label = "当前";
			temp.styleClass = org.mokylin.skin.mainui.chat.pingdaoItems;
			temp.width = 40;
			temp.x = 6;
			temp.y = 119;
			return temp;
		}

		private function select_duiwu_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			select_duiwu = temp;
			temp.name = "select_duiwu";
			temp.height = 20;
			temp.label = "队伍";
			temp.styleClass = org.mokylin.skin.mainui.chat.pingdaoItems;
			temp.width = 40;
			temp.x = 6;
			temp.y = 72;
			return temp;
		}

		private function select_laba_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			select_laba = temp;
			temp.name = "select_laba";
			temp.height = 20;
			temp.label = "喇叭";
			temp.styleClass = org.mokylin.skin.mainui.chat.pingdaoItems;
			temp.width = 40;
			temp.x = 6;
			temp.y = 0;
			return temp;
		}

		private function select_shijie_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			select_shijie = temp;
			temp.name = "select_shijie";
			temp.height = 20;
			temp.label = "世界";
			temp.styleClass = org.mokylin.skin.mainui.chat.pingdaoItems;
			temp.width = 40;
			temp.x = 6;
			temp.y = 24;
			return temp;
		}

		private function select_siliao_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			select_siliao = temp;
			temp.name = "select_siliao";
			temp.height = 20;
			temp.label = "私聊";
			temp.styleClass = org.mokylin.skin.mainui.chat.pingdaoItems;
			temp.width = 40;
			temp.x = 6;
			temp.y = 96;
			return temp;
		}

		private function vscrollbar_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			vscrollbar = temp;
			temp.name = "vscrollbar";
			temp.height = 225;
			temp.styleClass = org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;
			temp.x = 347;
			temp.y = 27;
			return temp;
		}

	}
}