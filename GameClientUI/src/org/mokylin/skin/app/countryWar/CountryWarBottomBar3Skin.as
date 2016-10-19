package org.mokylin.skin.app.countryWar
{
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CountryWarBottomBar3Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnGetOff:feathers.controls.Button;

		public var btnGetOn:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CountryWarBottomBar3Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [btnGetOff_i(),btnGetOn_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btnGetOff_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnGetOff = temp;
			temp.name = "btnGetOff";
			temp.label = "下车";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
			temp.x = 4;
			temp.y = -143;
			return temp;
		}

		private function btnGetOn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnGetOn = temp;
			temp.name = "btnGetOn";
			temp.label = "上车";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
			temp.x = -76;
			temp.y = -143;
			return temp;
		}

	}
}