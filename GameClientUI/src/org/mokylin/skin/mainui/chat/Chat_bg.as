package org.mokylin.skin.mainui.chat
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Chat_bg extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Chat_bg()
		{
			super();
			
			this.currentState = "normal";
			this.height = 306;
			this.width = 364;
			this.elementsContent = [__Chat_bg_UIAsset1_i(),__Chat_bg_UIAsset2_i(),__Chat_bg_UIAsset3_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Chat_bg_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/mainui/chat/di.png";
			temp.top = 52;
			return temp;
		}

		private function __Chat_bg_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 49;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/mainui/chat/di.png";
			temp.top = 0;
			return temp;
		}

		private function __Chat_bg_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/mainui/chat/liaotiankuang.png";
			temp.top = 49;
			return temp;
		}

	}
}