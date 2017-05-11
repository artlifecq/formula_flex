package org.mokylin.skin.mainui.shortcut
{
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	
	import org.mokylin.skin.component.button.ButtonSkin_putong;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MessageFriendIconSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn:feathers.controls.Button;

		public var numTxt:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MessageFriendIconSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [btn_i(),numTxt_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn = temp;
			temp.name = "btn";
			temp.height = 40;
			temp.label = "友";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.width = 40;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function numTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			numTxt = temp;
			temp.name = "numTxt";
			temp.touchable = false;
			temp.text = "10";
			temp.color = 0xFFFFFF;
			temp.x = 22;
			temp.y = 0;
			return temp;
		}

	}
}