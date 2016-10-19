package org.mokylin.skin.component.scrollbar.skin_red.button
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonSkin_incre extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __ButtonSkin_incre_UIAsset1:feathers.controls.UIAsset;

		public var __ButtonSkin_incre_UIAsset2:feathers.controls.UIAsset;

		public var __ButtonSkin_incre_UIAsset3:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonSkin_incre()
		{
			super();
			
			this.currentState = "up";
			this.elementsContent = [];
			__ButtonSkin_incre_UIAsset1_i();
			__ButtonSkin_incre_UIAsset2_i();
			__ButtonSkin_incre_UIAsset3_i();
			
			
			states = {
			};
			skinNames={"down":"ui/component/scrollbar/skin_red/button/skin_incre/down.png", "hover":"ui/component/scrollbar/skin_red/button/skin_incre/over.png", "up":"ui/component/scrollbar/skin_red/button/skin_incre/up.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ButtonSkin_incre_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ButtonSkin_incre_UIAsset1 = temp;
			temp.styleName = "ui/component/scrollbar/skin_red/button/skin_incre/down.png";
			return temp;
		}

		private function __ButtonSkin_incre_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ButtonSkin_incre_UIAsset2 = temp;
			temp.styleName = "ui/component/scrollbar/skin_red/button/skin_incre/over.png";
			return temp;
		}

		private function __ButtonSkin_incre_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ButtonSkin_incre_UIAsset3 = temp;
			temp.styleName = "ui/component/scrollbar/skin_red/button/skin_incre/up.png";
			return temp;
		}

	}
}