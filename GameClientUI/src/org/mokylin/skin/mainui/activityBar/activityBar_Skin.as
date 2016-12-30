package org.mokylin.skin.mainui.activityBar
{
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.button.ButtonSkin_shouhui;
	import org.mokylin.skin.component.button.ButtonSkin_zhankai;
	import org.mokylin.skin.mainui.activityBar.button.ButtonMeiribizuo;
	import org.mokylin.skin.mainui.activityBar.button.ButtonWanfatuijian;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class activityBar_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_close:feathers.controls.Button;

		public var btn_meiri:feathers.controls.Button;

		public var btn_opem:feathers.controls.Button;

		public var btn_wanfa:feathers.controls.Button;

		public var grp_active:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function activityBar_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 65;
			this.width = 157;
			this.elementsContent = [btn_close_i(),btn_opem_i(),grp_active_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btn_close_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_close = temp;
			temp.name = "btn_close";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_shouhui;
			temp.x = 138;
			temp.y = 2;
			return temp;
		}

		private function btn_meiri_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_meiri = temp;
			temp.name = "btn_meiri";
			temp.styleClass = org.mokylin.skin.mainui.activityBar.button.ButtonMeiribizuo;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_opem_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_opem = temp;
			temp.name = "btn_opem";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_zhankai;
			temp.x = 138;
			temp.y = 2;
			return temp;
		}

		private function btn_wanfa_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_wanfa = temp;
			temp.name = "btn_wanfa";
			temp.styleClass = org.mokylin.skin.mainui.activityBar.button.ButtonWanfatuijian;
			temp.x = 66;
			temp.y = 0;
			return temp;
		}

		private function grp_active_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_active = temp;
			temp.name = "grp_active";
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [btn_meiri_i(),btn_wanfa_i()];
			return temp;
		}

	}
}