package org.mokylin.skin.app.maps
{
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.button.ButtonSkin_send;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class EndFly extends feathers.controls.StateSkin
	{
		public var btnSend_endFly:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function EndFly()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [btnSend_endFly_i()];
			
			states = {
			};
			skinNames={};
		}


		private function btnSend_endFly_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnSend_endFly = temp;
			temp.name = "btnSend_endFly";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_send;
			return temp;
		}

	}
}