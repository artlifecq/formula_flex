package org.mokylin.skin.component.scrollbar.skin_red.button
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonSkin_thumb extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __ButtonSkin_thumb_UIAsset1:feathers.controls.UIAsset;

		public var __ButtonSkin_thumb_UIAsset2:feathers.controls.UIAsset;

		public var __ButtonSkin_thumb_UIAsset3:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonSkin_thumb()
		{
			super();
			
			this.currentState = "up";
			this.elementsContent = [];
			__ButtonSkin_thumb_UIAsset1_i();
			__ButtonSkin_thumb_UIAsset2_i();
			__ButtonSkin_thumb_UIAsset3_i();
			
			
			states = {
			};
			skinNames={"down":"ui/component/scrollbar/skin_red/button/skin_thumb/down.png", "hover":"ui/component/scrollbar/skin_red/button/skin_thumb/over.png", "up":"ui/component/scrollbar/skin_red/button/skin_thumb/up.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ButtonSkin_thumb_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ButtonSkin_thumb_UIAsset1 = temp;
			temp.styleName = "ui/component/scrollbar/skin_red/button/skin_thumb/down.png";
			return temp;
		}

		private function __ButtonSkin_thumb_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ButtonSkin_thumb_UIAsset2 = temp;
			temp.styleName = "ui/component/scrollbar/skin_red/button/skin_thumb/over.png";
			return temp;
		}

		private function __ButtonSkin_thumb_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ButtonSkin_thumb_UIAsset3 = temp;
			temp.styleName = "ui/component/scrollbar/skin_red/button/skin_thumb/up.png";
			return temp;
		}

	}
}