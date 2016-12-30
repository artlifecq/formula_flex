package org.mokylin.skin.mainui.navigation
{
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.mainui.navigation.button.nv_btn1_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class navigation_nv_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_n0:feathers.controls.Button;

		public var btn_n1:feathers.controls.Button;

		public var btn_n2:feathers.controls.Button;

		public var btn_over:feathers.controls.UIAsset;

		public var grpBtn_nv:feathers.controls.Group;

		public var lbl0:feathers.controls.Label;

		public var lbl1:feathers.controls.Label;

		public var lbl2:feathers.controls.Label;

		public var nv_bg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function navigation_nv_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 86;
			this.width = 57;
			this.elementsContent = [nv_bg_i(),btn_over_i(),grpBtn_nv_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btn_n0_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_n0 = temp;
			temp.name = "btn_n0";
			temp.label = "帮盟";
			temp.styleClass = org.mokylin.skin.mainui.navigation.button.nv_btn1_Skin;
			temp.x = 4;
			temp.y = 50;
			return temp;
		}

		private function btn_n1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_n1 = temp;
			temp.name = "btn_n1";
			temp.label = "帮盟";
			temp.styleClass = org.mokylin.skin.mainui.navigation.button.nv_btn1_Skin;
			temp.x = 4;
			temp.y = 25;
			return temp;
		}

		private function btn_n2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_n2 = temp;
			temp.name = "btn_n2";
			temp.label = "帮盟";
			temp.styleClass = org.mokylin.skin.mainui.navigation.button.nv_btn1_Skin;
			temp.x = 4;
			temp.y = 1;
			return temp;
		}

		private function btn_over_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			btn_over = temp;
			temp.name = "btn_over";
			temp.styleName = "ui/mainui/navigation/zhishi.png";
			temp.width = 52;
			temp.x = 3;
			temp.y = 54;
			return temp;
		}

		private function grpBtn_nv_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpBtn_nv = temp;
			temp.name = "grpBtn_nv";
			temp.height = 74;
			temp.width = 55;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [btn_n0_i(),btn_n1_i(),btn_n2_i()];
			return temp;
		}

		private function nv_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			nv_bg = temp;
			temp.name = "nv_bg";
			temp.bottom = 0;
			temp.styleName = "ui/mainui/navigation/di.png";
			temp.top = 0;
			temp.x = 0;
			return temp;
		}

	}
}