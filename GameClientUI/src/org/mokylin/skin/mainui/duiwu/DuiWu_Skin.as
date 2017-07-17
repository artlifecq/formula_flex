package org.mokylin.skin.mainui.duiwu
{
	import feathers.controls.Button;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.mainui.duiwu.button.ButtonTuianniu;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class DuiWu_Skin extends feathers.controls.StateSkin
	{
		public var btnExit:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function DuiWu_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 97;
			this.width = 227;
			this.elementsContent = [btnExit_i()];
			
			states = {
			};
			skinNames={};
		}


		private function btnExit_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnExit = temp;
			temp.name = "btnExit";
			temp.styleClass = org.mokylin.skin.mainui.duiwu.button.ButtonTuianniu;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}