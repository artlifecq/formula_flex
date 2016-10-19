package org.mokylin.skin.app.friend
{
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FriendNameInputTextSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __FriendNameInputTextSkin_UIAsset1:feathers.controls.UIAsset;

		public var textDisplay:feathers.controls.text.TextFieldTextEditor;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FriendNameInputTextSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [textDisplay_i()];
			__FriendNameInputTextSkin_UIAsset1_i();
			
			
			states = {
			};
			skinNames={"enabled":"ui/app/friend/shurukuang.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FriendNameInputTextSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__FriendNameInputTextSkin_UIAsset1 = temp;
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/app/friend/shurukuang.png";
			temp.top = 0;
			return temp;
		}

		private function textDisplay_i():feathers.controls.text.TextFieldTextEditor
		{
			var temp:feathers.controls.text.TextFieldTextEditor = new feathers.controls.text.TextFieldTextEditor();
			textDisplay = temp;
			temp.name = "textDisplay";
			temp.height = 20;
			temp.text = "名字名字名字";
			temp.color = 0xFFFFFF;
			temp.width = 225;
			temp.x = 8;
			temp.y = 4;
			return temp;
		}

	}
}