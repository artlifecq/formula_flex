package org.mokylin.skin.loginui
{
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.loginui.button.ButtonSkin_bingjia;
	import org.mokylin.skin.loginui.button.ButtonSkin_create;
	import org.mokylin.skin.loginui.button.ButtonSkin_mojia;
	import org.mokylin.skin.loginui.button.ButtonSkin_sex;
	import org.mokylin.skin.loginui.button.ButtonSkin_shaizi;
	import org.mokylin.skin.loginui.button.ButtonSkin_yijia;
	import org.mokylin.skin.loginui.create_input_Skin;
	import org.mokylin.skin.loginui.select_mojia_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class bakSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_create:feathers.controls.Button;

		public var btn_man:feathers.controls.Button;

		public var btn_nv1:feathers.controls.Button;

		public var btn_nv2:feathers.controls.Button;

		public var btn_nv3:feathers.controls.Button;

		public var btn_random:feathers.controls.Button;

		public var btn_woman:feathers.controls.Button;

		public var grp_input:feathers.controls.Group;

		public var grp_sex:feathers.controls.Group;

		public var nv_bg:feathers.controls.UIAsset;

		public var text_input:feathers.controls.TextInput;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function bakSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__bakSkin_UIAsset1_i(),__bakSkin_UIAsset2_i(),nv_bg_i(),btn_nv1_i(),btn_nv2_i(),btn_nv3_i(),grp_sex_i(),__bakSkin_Group1_i(),grp_input_i(),btn_create_i(),__bakSkin_UIAsset8_i(),__bakSkin_SkinnableContainer1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __bakSkin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 1166;
			temp.y = 15;
			temp.elementsContent = [__bakSkin_UIAsset6_i(),__bakSkin_UIAsset7_i()];
			return temp;
		}

		private function __bakSkin_SkinnableContainer1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			temp.height = 554;
			var skin:StateSkin = new org.mokylin.skin.loginui.select_mojia_Skin()
			temp.skin = skin
			temp.width = 306;
			temp.x = 75;
			temp.y = 17;
			return temp;
		}

		private function __bakSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/denglu_beijing1.jpg";
			temp.width = 958;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __bakSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/denglu_beijing2.jpg";
			temp.x = 958;
			temp.y = 0;
			return temp;
		}

		private function __bakSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/loginui/zhishi.png";
			temp.x = 68;
			temp.y = 26;
			return temp;
		}

		private function __bakSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/loginui/zhishi_1.png";
			temp.x = 68;
			temp.y = 135;
			return temp;
		}

		private function __bakSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 26;
			temp.styleName = "ui/loginui/xuanzezhiye_di.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __bakSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/loginui/xuanzezhiye.png";
			temp.x = 11;
			temp.y = 3;
			return temp;
		}

		private function __bakSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/loginui/di.png";
			temp.x = 156;
			temp.y = 35;
			return temp;
		}

		private function btn_create_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_create = temp;
			temp.name = "btn_create";
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_create;
			temp.x = 1276;
			temp.y = 785;
			return temp;
		}

		private function btn_man_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_man = temp;
			temp.name = "btn_man";
			temp.label = "男性";
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_sex;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_nv1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_nv1 = temp;
			temp.name = "btn_nv1";
			temp.height = 159;
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_bingjia;
			temp.width = 151;
			temp.x = 1363;
			temp.y = 65;
			return temp;
		}

		private function btn_nv2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_nv2 = temp;
			temp.name = "btn_nv2";
			temp.height = 159;
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_yijia;
			temp.width = 151;
			temp.x = 1363;
			temp.y = 285;
			return temp;
		}

		private function btn_nv3_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_nv3 = temp;
			temp.name = "btn_nv3";
			temp.height = 159;
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_mojia;
			temp.width = 151;
			temp.x = 1363;
			temp.y = 484;
			return temp;
		}

		private function btn_random_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_random = temp;
			temp.name = "btn_random";
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_shaizi;
			temp.x = 233;
			temp.y = 2;
			return temp;
		}

		private function btn_woman_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_woman = temp;
			temp.name = "btn_woman";
			temp.label = "女性";
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_sex;
			temp.x = 0;
			temp.y = 126;
			return temp;
		}

		private function grp_input_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_input = temp;
			temp.name = "grp_input";
			temp.x = 1275;
			temp.y = 741;
			temp.elementsContent = [text_input_i(),btn_random_i()];
			return temp;
		}

		private function grp_sex_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_sex = temp;
			temp.name = "grp_sex";
			temp.x = 1268;
			temp.y = 472;
			temp.elementsContent = [__bakSkin_UIAsset4_i(),__bakSkin_UIAsset5_i(),btn_man_i(),btn_woman_i()];
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

		private function text_input_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			text_input = temp;
			temp.name = "text_input";
			temp.styleClass = org.mokylin.skin.loginui.create_input_Skin;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}