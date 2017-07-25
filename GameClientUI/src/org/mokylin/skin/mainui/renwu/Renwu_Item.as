package org.mokylin.skin.mainui.renwu
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.button.ButtonSkin_send;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Renwu_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_send:feathers.controls.Button;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Renwu_Item()
		{
			super();
			
			this.currentState = "normal";
			this.width = 169;
			this.elementsContent = [labelDisplay_i(),btn_send_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btn_send_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_send = temp;
			temp.name = "btn_send";
			temp.right = 0;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_send;
			temp.top = 1;
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.htmlText = "<font color='#eaeabc'>击杀：</font><u>少林杖僧(15/40)</u>";
			temp.left = 0;
			temp.color = 0x00ff33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.top = 3;
			return temp;
		}

	}
}