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
		public var btn_banghui:feathers.controls.Button;

		public var btn_beibao:feathers.controls.Button;

		public var btn_close:feathers.controls.Button;

		public var btn_jineng:feathers.controls.Button;

		public var btn_juese:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;

		public var btn_shangcheng:feathers.controls.Button;

		public var btn_shejiao:feathers.controls.Button;

		public var btns:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function navigation_main_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 51;
			this.width = 294;
			this.elementsContent = [btn_close_i(),btn_open_i(),btns_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btn_banghui_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_banghui = temp;
			temp.name = "btn_banghui";
			temp.styleClass = org.mokylin.skin.mainui.navigation.button.ButtonSkin_banghui;
			temp.x = 134;
			temp.y = 4;
			return temp;
		}

		private function btn_beibao_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_beibao = temp;
			temp.name = "btn_beibao";
			temp.styleClass = org.mokylin.skin.mainui.navigation.button.ButtonSkin_beibao;
			temp.x = 44;
			temp.y = 4;
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

		private function btn_jineng_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jineng = temp;
			temp.name = "btn_jineng";
			temp.styleClass = org.mokylin.skin.mainui.navigation.button.ButtonSkin_jineng;
			temp.x = 87;
			temp.y = 4;
			return temp;
		}

		private function btn_juese_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_juese = temp;
			temp.name = "btn_juese";
			temp.styleClass = org.mokylin.skin.mainui.navigation.button.ButtonSkin_juese;
			temp.x = 0;
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

		private function btn_shangcheng_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shangcheng = temp;
			temp.name = "btn_shangcheng";
			temp.styleClass = org.mokylin.skin.mainui.navigation.button.ButtonSkin_shangcheng;
			temp.x = 221;
			temp.y = 4;
			return temp;
		}

		private function btn_shejiao_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shejiao = temp;
			temp.name = "btn_shejiao";
			temp.styleClass = org.mokylin.skin.mainui.navigation.button.ButtonSkin_shejiao;
			temp.x = 180;
			temp.y = 4;
			return temp;
		}

		private function btns_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			btns = temp;
			temp.name = "btns";
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [btn_juese_i(),btn_beibao_i(),btn_jineng_i(),btn_banghui_i(),btn_shejiao_i(),btn_shangcheng_i()];
			return temp;
		}

	}
}