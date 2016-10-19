package org.mokylin.skin.mainui.chat
{
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_decre;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_incre;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_thumb;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_track;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class VScrollBarChatSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var decrement:feathers.controls.Button;

		public var increment:feathers.controls.Button;

		public var thumb:feathers.controls.Button;

		public var track:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function VScrollBarChatSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [track_i(),thumb_i(),increment_i(),decrement_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function decrement_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			decrement = temp;
			temp.name = "decrement";
			temp.right = 0;
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_decre;
			temp.top = 0;
			return temp;
		}

		private function increment_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			increment = temp;
			temp.name = "increment";
			temp.bottom = 0;
			temp.right = 0;
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_incre;
			return temp;
		}

		private function thumb_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			thumb = temp;
			temp.name = "thumb";
			temp.right = 1;
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_thumb;
			temp.y = 52;
			return temp;
		}

		private function track_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			track = temp;
			temp.name = "track";
			temp.right = 2;
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_track;
			temp.y = 0;
			return temp;
		}

	}
}