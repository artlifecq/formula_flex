package org.mokylin.skin.app.shejiao
{
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.app.shejiao.button.ButtonZudui;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Shejiao_Daohang extends feathers.controls.StateSkin
	{
		public var btn_zudui:feathers.controls.Radio;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Shejiao_Daohang()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [btn_zudui_i()];
			
			states = {
			};
			skinNames={};
		}


		private function btn_zudui_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_zudui = temp;
			temp.name = "btn_zudui";
			temp.groupName = "rdo_shejiao";
			temp.styleClass = org.mokylin.skin.app.shejiao.button.ButtonZudui;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}