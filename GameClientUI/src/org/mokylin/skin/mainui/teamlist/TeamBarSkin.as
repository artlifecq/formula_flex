package org.mokylin.skin.mainui.teamlist
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_left;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_right;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TeamBarSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnBig:feathers.controls.Button;

		public var btnSmall:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TeamBarSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 250;
			this.width = 370;
			this.elementsContent = [btnSmall_i(),btnBig_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btnBig_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnBig = temp;
			temp.name = "btnBig";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_right);
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnSmall_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnSmall = temp;
			temp.name = "btnSmall";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_left);
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}