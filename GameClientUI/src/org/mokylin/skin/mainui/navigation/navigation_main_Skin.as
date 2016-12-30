package org.mokylin.skin.mainui.navigation
{
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.button.ButtonSkin_shouhui;
	import org.mokylin.skin.component.button.ButtonSkin_zhankai;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_banghui;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_beibao;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_jineng;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_juese;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_shangcheng;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_shejiao;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class navigation_main_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_close:feathers.controls.Button;

		public var btn_n1:feathers.controls.Button;

		public var btn_n2:feathers.controls.Button;

		public var btn_n3:feathers.controls.Button;

		public var btn_n4:feathers.controls.Button;

		public var btn_n5:feathers.controls.Button;

		public var btn_n6:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function navigation_main_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 51;
			this.width = 294;
			this.elementsContent = [btn_close_i(),btn_open_i(),__navigation_main_Skin_Group1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __navigation_main_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [btn_n1_i(),btn_n2_i(),btn_n3_i(),btn_n4_i(),btn_n5_i(),btn_n6_i()];
			return temp;
		}

		private function btn_close_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_close = temp;
			temp.name = "btn_close";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_shouhui;
			temp.x = 275;
			temp.y = 14;
			return temp;
		}

		private function btn_n1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_n1 = temp;
			temp.name = "btn_n1";
			temp.styleClass = org.mokylin.skin.mainui.navigation.button.ButtonSkin_juese;
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function btn_n2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_n2 = temp;
			temp.name = "btn_n2";
			temp.styleClass = org.mokylin.skin.mainui.navigation.button.ButtonSkin_beibao;
			temp.x = 44;
			temp.y = 4;
			return temp;
		}

		private function btn_n3_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_n3 = temp;
			temp.name = "btn_n3";
			temp.styleClass = org.mokylin.skin.mainui.navigation.button.ButtonSkin_jineng;
			temp.x = 87;
			temp.y = 4;
			return temp;
		}

		private function btn_n4_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_n4 = temp;
			temp.name = "btn_n4";
			temp.styleClass = org.mokylin.skin.mainui.navigation.button.ButtonSkin_banghui;
			temp.x = 134;
			temp.y = 4;
			return temp;
		}

		private function btn_n5_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_n5 = temp;
			temp.name = "btn_n5";
			temp.styleClass = org.mokylin.skin.mainui.navigation.button.ButtonSkin_shejiao;
			temp.x = 180;
			temp.y = 4;
			return temp;
		}

		private function btn_n6_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_n6 = temp;
			temp.name = "btn_n6";
			temp.styleClass = org.mokylin.skin.mainui.navigation.button.ButtonSkin_shangcheng;
			temp.x = 221;
			temp.y = 4;
			return temp;
		}

		private function btn_open_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_open = temp;
			temp.name = "btn_open";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_zhankai;
			temp.x = 275;
			temp.y = 14;
			return temp;
		}

	}
}