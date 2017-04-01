package org.mokylin.skin.mainui.chat
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ChatFrameOnRoleSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var arrow:feathers.controls.UIAsset;

		public var bg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ChatFrameOnRoleSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),arrow_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function arrow_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			arrow = temp;
			temp.name = "arrow";
			temp.height = 9;
			temp.styleName = "ui/mainui/chat/san_jiao.png";
			temp.width = 12;
			temp.x = 106;
			temp.y = 94;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 96;
			temp.styleName = "ui/mainui/chat/kuang.png";
			temp.width = 217;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}