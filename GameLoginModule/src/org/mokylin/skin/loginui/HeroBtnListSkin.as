package org.mokylin.skin.loginui
{
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.loginui.button.ButtonSkin_loginBack;
	import org.mokylin.skin.loginui.button.ButtonSkin_loginNext;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HeroBtnListSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var backBtn:feathers.controls.Button;

		public var nextBtn:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HeroBtnListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 924;
			this.width = 1643;
			this.elementsContent = [nextBtn_i(),backBtn_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function backBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			backBtn = temp;
			temp.name = "backBtn";
			temp.height = 49;
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_loginBack;
			temp.width = 181;
			temp.x = 50;
			temp.y = 830;
			return temp;
		}

		private function nextBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			nextBtn = temp;
			temp.name = "nextBtn";
			temp.height = 49;
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_loginNext;
			temp.width = 181;
			temp.x = 1388;
			temp.y = 830;
			return temp;
		}

	}
}