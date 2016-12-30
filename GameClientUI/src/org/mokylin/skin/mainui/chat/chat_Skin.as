package org.mokylin.skin.mainui.chat
{
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import feathers.controls.ScrollContainer;
	import org.mokylin.skin.component.scrollbar.ScrollBarSkin_chat;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_bang;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_dinwei;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_dui;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_fasong;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_geren;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_jiahao;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_liaotianjilu;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_ling;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_pu;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_qu;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_sanjiao;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_shejiao;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_shezhi;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_shi;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_shouhui;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_si;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_suo;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_xitong;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_zhandou;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_zhankai;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_zonghe;
	import org.mokylin.skin.mainui.chat.mc.UIMovieClipSkin_chat;

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

		public var btn_add:feathers.controls.Button;

		public var btn_bl0:feathers.controls.Button;

		public var btn_bl1:feathers.controls.Button;

		public var btn_bl2:feathers.controls.Button;

		public var btn_bl3:feathers.controls.Button;

		public var btn_bl4:feathers.controls.Button;

		public var btn_bl5:feathers.controls.Button;

		public var btn_bl6:feathers.controls.Button;

		public var btn_br0:feathers.controls.Button;

		public var btn_br1:feathers.controls.Button;

		public var btn_br2:feathers.controls.Button;

		public var btn_br3:feathers.controls.Button;

		public var btn_close:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;

		public var btn_scale:feathers.controls.Button;

		public var btn_send:feathers.controls.Button;

		public var btn_to0:feathers.controls.Button;

		public var btn_to1:feathers.controls.Button;

		public var btn_to2:feathers.controls.Button;

		public var btn_to3:feathers.controls.Button;

		public var btn_to4:feathers.controls.Button;

		public var btn_type:feathers.controls.UIMovieClip;

		public var grp_buttom:feathers.controls.Group;

		public var grp_buttomL:feathers.controls.Group;

		public var grp_buttomR:feathers.controls.Group;

		public var grp_top:feathers.controls.Group;

		public var grp_txt:feathers.controls.Group;

		public var inputbg:feathers.controls.UIAsset;

		public var vscrollbar:feathers.controls.ScrollContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function chat_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 305;
			this.width = 348;
			this.elementsContent = [grp_txt_i(),grp_top_i(),grp_buttomL_i(),grp_buttomR_i(),grp_buttom_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 280;
			temp.styleName = "ui/mainui/chat/di.png";
			temp.width = 348;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_add_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_add = temp;
			temp.name = "btn_add";
			temp.height = 14;
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_jiahao;
			temp.width = 14;
			temp.x = 185;
			temp.y = 6;
			return temp;
		}

		private function btn_bl0_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_bl0 = temp;
			temp.name = "btn_bl0";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_ling;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_bl1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_bl1 = temp;
			temp.name = "btn_bl1";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_shi;
			temp.x = 26;
			temp.y = 0;
			return temp;
		}

		private function btn_bl2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_bl2 = temp;
			temp.name = "btn_bl2";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_qu;
			temp.x = 52;
			temp.y = 0;
			return temp;
		}

		private function btn_bl3_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_bl3 = temp;
			temp.name = "btn_bl3";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_bang;
			temp.x = 79;
			temp.y = 0;
			return temp;
		}

		private function btn_bl4_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_bl4 = temp;
			temp.name = "btn_bl4";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_dui;
			temp.x = 105;
			temp.y = 0;
			return temp;
		}

		private function btn_bl5_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_bl5 = temp;
			temp.name = "btn_bl5";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_si;
			temp.x = 131;
			temp.y = 0;
			return temp;
		}

		private function btn_bl6_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_bl6 = temp;
			temp.name = "btn_bl6";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_pu;
			temp.x = 157;
			temp.y = 0;
			return temp;
		}

		private function btn_br0_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_br0 = temp;
			temp.name = "btn_br0";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_suo;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_br1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_br1 = temp;
			temp.name = "btn_br1";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_shezhi;
			temp.x = 26;
			temp.y = 0;
			return temp;
		}

		private function btn_br2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_br2 = temp;
			temp.name = "btn_br2";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_dinwei;
			temp.x = 52;
			temp.y = 0;
			return temp;
		}

		private function btn_br3_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_br3 = temp;
			temp.name = "btn_br3";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_liaotianjilu;
			temp.x = 78;
			temp.y = 0;
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

		private function btn_open_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_open = temp;
			temp.name = "btn_open";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_zhankai;
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
			temp.x = 336;
			temp.y = 1;
			return temp;
		}

		private function btn_send_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_send = temp;
			temp.name = "btn_send";
			temp.height = 26;
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_fasong;
			temp.width = 43;
			temp.x = 299;
			temp.y = 0;
			return temp;
		}

		private function btn_to0_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_to0 = temp;
			temp.name = "btn_to0";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_zonghe;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_to1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_to1 = temp;
			temp.name = "btn_to1";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_xitong;
			temp.x = 48;
			temp.y = 0;
			return temp;
		}

		private function btn_to2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_to2 = temp;
			temp.name = "btn_to2";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_zhandou;
			temp.x = 96;
			temp.y = 0;
			return temp;
		}

		private function btn_to3_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_to3 = temp;
			temp.name = "btn_to3";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_geren;
			temp.x = 144;
			temp.y = 0;
			return temp;
		}

		private function btn_to4_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_to4 = temp;
			temp.name = "btn_to4";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_shejiao;
			temp.x = 192;
			temp.y = 0;
			return temp;
		}

		private function btn_type_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			btn_type = temp;
			temp.name = "btn_type";
			temp.autoPlay = false;
			temp.height = 26;
			temp.styleClass = org.mokylin.skin.mainui.chat.mc.UIMovieClipSkin_chat;
			temp.width = 46;
			temp.x = 18;
			temp.y = 0;
			return temp;
		}

		private function grp_buttomL_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_buttomL = temp;
			temp.name = "grp_buttomL";
			temp.x = 1;
			temp.y = 254;
			temp.elementsContent = [btn_bl0_i(),btn_bl1_i(),btn_bl2_i(),btn_bl3_i(),btn_bl4_i(),btn_bl5_i(),btn_bl6_i(),btn_add_i()];
			return temp;
		}

		private function grp_buttomR_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_buttomR = temp;
			temp.name = "grp_buttomR";
			temp.x = 241;
			temp.y = 254;
			temp.elementsContent = [btn_br0_i(),btn_br1_i(),btn_br2_i(),btn_br3_i()];
			return temp;
		}

		private function grp_buttom_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_buttom = temp;
			temp.name = "grp_buttom";
			temp.x = 0;
			temp.y = 279;
			temp.elementsContent = [btn_close_i(),btn_open_i(),btn_type_i(),btn_send_i(),inputbg_i()];
			return temp;
		}

		private function grp_top_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_top = temp;
			temp.name = "grp_top";
			temp.x = 1;
			temp.y = 0;
			temp.elementsContent = [btn_to0_i(),btn_to1_i(),btn_to2_i(),btn_to3_i(),btn_to4_i()];
			return temp;
		}

		private function grp_txt_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_txt = temp;
			temp.name = "grp_txt";
			temp.x = 0;
			temp.y = 24;
			temp.elementsContent = [bg_i(),btn_scale_i(),vscrollbar_i()];
			return temp;
		}

		private function inputbg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			inputbg = temp;
			temp.name = "inputbg";
			temp.height = 22;
			temp.styleName = "ui/component/text/duihuankuangInput.png";
			temp.width = 232;
			temp.x = 65;
			temp.y = 2;
			return temp;
		}

		private function vscrollbar_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			vscrollbar = temp;
			temp.name = "vscrollbar";
			temp.height = 225;
			temp.styleClass = org.mokylin.skin.component.scrollbar.ScrollBarSkin_chat;
			temp.x = 5;
			temp.y = 3;
			return temp;
		}

	}
}