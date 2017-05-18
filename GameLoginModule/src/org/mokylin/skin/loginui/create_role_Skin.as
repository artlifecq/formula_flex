package org.mokylin.skin.loginui
{
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import org.mokylin.skin.loginui.button.ButtonSkin_bingjia;
	import org.mokylin.skin.loginui.button.ButtonSkin_create;
	import org.mokylin.skin.loginui.button.ButtonSkin_mojia;
	import org.mokylin.skin.loginui.button.ButtonSkin_sex;
	import org.mokylin.skin.loginui.button.ButtonSkin_yijia;
	import org.mokylin.skin.loginui.create_input_Skin;
	import org.mokylin.skin.loginui.mc.UIMovieClipSaizi;
	import org.mokylin.skin.loginui.select_binjia_Skin;
	import org.mokylin.skin.loginui.select_mojia_Skin;
	import org.mokylin.skin.loginui.select_yijia_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class create_role_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_bingjia:feathers.controls.Radio;

		public var btn_create:feathers.controls.Button;

		public var btn_man:feathers.controls.Radio;

		public var btn_mojia:feathers.controls.Radio;

		public var btn_woman:feathers.controls.Radio;

		public var btn_yijia:feathers.controls.Radio;

		public var cont_binjia:feathers.controls.SkinnableContainer;

		public var cont_mojia:feathers.controls.SkinnableContainer;

		public var cont_yijia:feathers.controls.SkinnableContainer;

		public var grp_input:feathers.controls.Group;

		public var grp_sex:feathers.controls.Group;

		public var num_saizi:feathers.controls.UIMovieClip;

		public var nv_bg:feathers.controls.UIAsset;

		public var roleZone:feathers.controls.UIAsset;

		public var text_input:feathers.controls.TextInput;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function create_role_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 900;
			this.width = 1600;
			this.elementsContent = [__create_role_Skin_UIAsset1_i(),nv_bg_i(),btn_bingjia_i(),btn_yijia_i(),btn_mojia_i(),grp_sex_i(),__create_role_Skin_Group1_i(),grp_input_i(),btn_create_i(),__create_role_Skin_UIAsset6_i(),cont_mojia_i(),cont_yijia_i(),cont_binjia_i(),roleZone_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __create_role_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 1166;
			temp.y = 15;
			temp.elementsContent = [__create_role_Skin_UIAsset4_i(),__create_role_Skin_UIAsset5_i()];
			return temp;
		}

		private function __create_role_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "男性";
			temp.color = 0xb7ae9e;
			temp.x = 17;
			temp.y = 71;
			return temp;
		}

		private function __create_role_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "女性";
			temp.color = 0xb7ae9e;
			temp.x = 17;
			temp.y = 191;
			return temp;
		}

		private function __create_role_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/denglu_beijing.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __create_role_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/loginui/zhishi.png";
			temp.x = 68;
			temp.y = 26;
			return temp;
		}

		private function __create_role_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/loginui/zhishi_1.png";
			temp.x = 68;
			temp.y = 135;
			return temp;
		}

		private function __create_role_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 26;
			temp.styleName = "ui/loginui/xuanzezhiye_di.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __create_role_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/loginui/xuanzezhiye.png";
			temp.x = 11;
			temp.y = 3;
			return temp;
		}

		private function __create_role_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/loginui/di.png";
			temp.x = 156;
			temp.y = 35;
			return temp;
		}

		private function btn_bingjia_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_bingjia = temp;
			temp.name = "btn_bingjia";
			temp.groupName = "rdo_select";
			temp.height = 159;
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_bingjia;
			temp.width = 151;
			temp.x = 1363;
			temp.y = 65;
			return temp;
		}

		private function btn_create_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_create = temp;
			temp.name = "btn_create";
			temp.height = 78;
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_create;
			temp.width = 270;
			temp.x = 1276;
			temp.y = 785;
			return temp;
		}

		private function btn_man_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_man = temp;
			temp.name = "btn_man";
			temp.groupName = "rdo_sex";
			temp.height = 67;
			temp.label = "男性";
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_sex;
			temp.width = 66;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_mojia_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_mojia = temp;
			temp.name = "btn_mojia";
			temp.groupName = "rdo_select";
			temp.height = 159;
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_mojia;
			temp.width = 151;
			temp.x = 1363;
			temp.y = 484;
			return temp;
		}

		private function btn_woman_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_woman = temp;
			temp.name = "btn_woman";
			temp.groupName = "rdo_sex";
			temp.height = 64;
			temp.label = "女性";
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_sex;
			temp.width = 66;
			temp.x = 0;
			temp.y = 126;
			return temp;
		}

		private function btn_yijia_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_yijia = temp;
			temp.name = "btn_yijia";
			temp.groupName = "rdo_select";
			temp.height = 159;
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_yijia;
			temp.width = 151;
			temp.x = 1363;
			temp.y = 285;
			return temp;
		}

		private function cont_binjia_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			cont_binjia = temp;
			temp.name = "cont_binjia";
			temp.height = 554;
			var skin:StateSkin = new org.mokylin.skin.loginui.select_binjia_Skin()
			temp.skin = skin
			temp.width = 306;
			temp.x = 75;
			temp.y = 17;
			return temp;
		}

		private function cont_mojia_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			cont_mojia = temp;
			temp.name = "cont_mojia";
			temp.height = 554;
			var skin:StateSkin = new org.mokylin.skin.loginui.select_mojia_Skin()
			temp.skin = skin
			temp.width = 306;
			temp.x = 75;
			temp.y = 17;
			return temp;
		}

		private function cont_yijia_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			cont_yijia = temp;
			temp.name = "cont_yijia";
			temp.height = 554;
			var skin:StateSkin = new org.mokylin.skin.loginui.select_yijia_Skin()
			temp.skin = skin
			temp.width = 306;
			temp.x = 75;
			temp.y = 17;
			return temp;
		}

		private function grp_input_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_input = temp;
			temp.name = "grp_input";
			temp.x = 1275;
			temp.y = 741;
			temp.elementsContent = [text_input_i(),num_saizi_i()];
			return temp;
		}

		private function grp_sex_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_sex = temp;
			temp.name = "grp_sex";
			temp.height = 221;
			temp.x = 1268;
			temp.y = 472;
			temp.elementsContent = [__create_role_Skin_UIAsset2_i(),__create_role_Skin_UIAsset3_i(),btn_man_i(),btn_woman_i(),__create_role_Skin_Label1_i(),__create_role_Skin_Label2_i()];
			return temp;
		}

		private function num_saizi_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			num_saizi = temp;
			temp.name = "num_saizi";
			temp.autoPlay = false;
			temp.height = 64;
			temp.styleClass = org.mokylin.skin.loginui.mc.UIMovieClipSaizi;
			temp.width = 64;
			temp.x = 220;
			temp.y = -13;
			return temp;
		}

		private function nv_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			nv_bg = temp;
			temp.name = "nv_bg";
			temp.height = 903;
			temp.styleName = "ui/loginui/bg.png";
			temp.width = 459;
			temp.x = 1142;
			temp.y = 0;
			return temp;
		}

		private function roleZone_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			roleZone = temp;
			temp.name = "roleZone";
			temp.alpha = 0;
			temp.height = 716;
			temp.styleName = "ui/loginui/IDkuang.png";
			temp.width = 776;
			temp.x = 410;
			temp.y = 131;
			return temp;
		}

		private function text_input_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			text_input = temp;
			temp.name = "text_input";
			temp.height = 42;
			temp.styleClass = org.mokylin.skin.loginui.create_input_Skin;
			temp.width = 276;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}