package org.mokylin.skin.component.scrollbar.skin_chat
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class VScrollBarChatThumbBtnSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __VScrollBarChatThumbBtnSkin_UIAsset1:feathers.controls.UIAsset;

		public var __VScrollBarChatThumbBtnSkin_UIAsset2:feathers.controls.UIAsset;

		public var __VScrollBarChatThumbBtnSkin_UIAsset3:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function VScrollBarChatThumbBtnSkin()
		{
			super();
			
			this.currentState = "down";
			this.height = 20;
			this.width = 10;
			this.elementsContent = [];
			__VScrollBarChatThumbBtnSkin_UIAsset1_i();
			__VScrollBarChatThumbBtnSkin_UIAsset2_i();
			__VScrollBarChatThumbBtnSkin_UIAsset3_i();
			
			
			states = {
			};
			skinNames={"down":"ui/component/scrollbar/skin_chat/thumb_down.png", "hover":"ui/component/scrollbar/skin_chat/thumb_over.png", "up":"ui/component/scrollbar/skin_chat/thumb_up.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __VScrollBarChatThumbBtnSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__VScrollBarChatThumbBtnSkin_UIAsset1 = temp;
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/component/scrollbar/skin_chat/thumb_up.png";
			temp.top = 0;
			return temp;
		}

		private function __VScrollBarChatThumbBtnSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__VScrollBarChatThumbBtnSkin_UIAsset2 = temp;
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/component/scrollbar/skin_chat/thumb_over.png";
			temp.top = 0;
			return temp;
		}

		private function __VScrollBarChatThumbBtnSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__VScrollBarChatThumbBtnSkin_UIAsset3 = temp;
			temp.bottom = 0;
			temp.left = 0;
			temp.styleName = "ui/component/scrollbar/skin_chat/thumb_down.png";
			temp.top = 0;
			temp.width = 10;
			return temp;
		}

	}
}