package org.mokylin.skin.mainui.guaji
{
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.mainui.guaji.button.ButtonGuaji;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class GuaJi_Skin extends feathers.controls.StateSkin
	{
		public var btnGuaji:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function GuaJi_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [btnGuaji_i()];
			
			states = {
			};
			skinNames={};
		}


		private function btnGuaji_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnGuaji = temp;
			temp.name = "btnGuaji";
			temp.styleClass = org.mokylin.skin.mainui.guaji.button.ButtonGuaji;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}