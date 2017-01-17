package org.mokylin.skin.mainui.chat
{
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.ComboBox;
	import feathers.controls.Group;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.ScrollContainer;
	import org.mokylin.skin.component.scrollbar.ScrollBarSkin_chat;
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
	import org.mokylin.skin.mainui.chat.button.ButtonSkin_channel;

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

		public var btn_geren:feathers.controls.Button;

		public var btn_laba:feathers.controls.Button;

		public var btn_location:feathers.controls.Button;

		public var btn_lock:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;

		public var btn_scale:feathers.controls.Button;

		public var btn_send:feathers.controls.Button;

		public var btn_shejiao:feathers.controls.Button;

		public var btn_shijie:feathers.controls.Button;

		public var btn_siliao:feathers.controls.Button;

		public var btn_zonghe:feathers.controls.Button;

		public var grp_buttom:feathers.controls.Group;

		public var grp_laba:feathers.controls.Group;

		public var grp_laba_bg:feathers.controls.UIAsset;

		public var grp_select:feathers.controls.Group;

		public var grp_top:feathers.controls.Group;

		public var grp_txt:feathers.controls.Group;

		public var inputbg:feathers.controls.UIAsset;

		public var lb_tishi:feathers.controls.UIAsset;

		public var select_bg:feathers.controls.UIAsset;

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
		private function __chat_Skin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['综合','本国','地区','个人','同级','号角','号角'];
			return temp;
		}

		private function __chat_Skin_ComboBox1_i():feathers.controls.ComboBox
		{
			var temp:feathers.controls.ComboBox = new feathers.controls.ComboBox();
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonSkin_channel;
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonSkin_channel;
			temp.x = 153;
			temp.y = 128;
			temp.dataProvider = __chat_Skin_ArrayCollection1_i();
			return temp;
		}

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
			temp.visible = false;
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
			temp.visible = false;
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

		private function btn_geren_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
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
			temp.visible = false;
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

		private function btn_shejiao_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
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
			temp.visible = false;
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
			temp.visible = false;
			temp.width = 50;
			temp.x = 1;
			temp.y = 145;
			return temp;
		}

		private function btn_zonghe_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
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
			temp.elementsContent = [btn_laba_i(),btn_shijie_i(),btn_banghui_i(),btn_duiwu_i(),btn_siliao_i(),btn_dangqian_i(),select_bg_i()];
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
			temp.elementsContent = [bg_i(),btn_scale_i(),vscrollbar_i(),__chat_Skin_ComboBox1_i()];
			return temp;
		}

		private function inputbg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			inputbg = temp;
			temp.name = "inputbg";
			temp.styleName = "ui/component/text/chat_input.png";
			temp.width = 196;
			temp.x = 71;
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

		private function select_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			select_bg = temp;
			temp.name = "select_bg";
			temp.height = 85;
			temp.styleName = "ui/mainui/chat/pindaokuang.png";
			temp.x = 0;
			temp.y = 62;
			return temp;
		}

		private function vscrollbar_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			vscrollbar = temp;
			temp.name = "vscrollbar";
			temp.height = 225;
			temp.styleClass = org.mokylin.skin.component.scrollbar.ScrollBarSkin_chat;
			temp.x = 347;
			temp.y = 27;
			return temp;
		}

	}
}