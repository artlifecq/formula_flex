package org.mokylin.skin.app.mount.item
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_xiala_shang;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_xiala_xia;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MountItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnLast:feathers.controls.Button;

		public var btnNext:feathers.controls.Button;

		public var group:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MountItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 515;
			this.width = 68;
			this.elementsContent = [btnLast_i(),btnNext_i(),group_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btnLast_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnLast = temp;
			temp.name = "btnLast";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_xiala_shang);
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnNext_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnNext = temp;
			temp.name = "btnNext";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_xiala_xia);
			temp.x = 0;
			temp.y = 493;
			return temp;
		}

		private function group_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			group = temp;
			temp.name = "group";
			temp.height = 465;
			temp.width = 68;
			temp.x = 0;
			temp.y = 22;
			return temp;
		}

	}
}