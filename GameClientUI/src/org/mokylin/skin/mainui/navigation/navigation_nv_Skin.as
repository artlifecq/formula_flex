package org.mokylin.skin.mainui.navigation
{
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.mainui.navigation.nv_erjibtn_Skin;
	
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
		public var btn_n1:feathers.controls.Button;
		
		public var btn_n2:feathers.controls.Button;
		
		public var grpBtn_nv:feathers.controls.Group;
		
		public var nv_bg:feathers.controls.UIAsset;
		
		
		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function navigation_nv_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 66;
			this.width = 57;
			this.elementsContent = [nv_bg_i(),grpBtn_nv_i()];
			
			states = {
			};
			skinNames={};
		}
		
		
		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btn_n1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_n1 = temp;
			temp.name = "btn_n1";
			temp.isEnabled = true;
			temp.height = 20;
			temp.label = "帮派";
			temp.styleClass = org.mokylin.skin.mainui.navigation.nv_erjibtn_Skin;
			temp.width = 51;
			temp.x = 0;
			temp.y = 25;
			return temp;
		}
		
		private function btn_n2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_n2 = temp;
			temp.name = "btn_n2";
			temp.isEnabled = true;
			temp.height = 20;
			temp.label = "组队";
			temp.styleClass = org.mokylin.skin.mainui.navigation.nv_erjibtn_Skin;
			temp.width = 51;
			temp.x = 0;
			temp.y = 1;
			return temp;
		}
		
		private function grpBtn_nv_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpBtn_nv = temp;
			temp.name = "grpBtn_nv";
			temp.bottom = 12;
			temp.left = 3;
			temp.right = 3;
			temp.top = 3;
			temp.elementsContent = [btn_n1_i(),btn_n2_i()];
			return temp;
		}
		
		private function nv_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			nv_bg = temp;
			temp.name = "nv_bg";
			temp.height = 66;
			temp.left = 0;
			temp.repeatScale9Skin = true;
			temp.right = 0;
			temp.styleName = "ui/mainui/navigation/di.png";
			temp.y = 0;
			return temp;
		}
		
	}
}