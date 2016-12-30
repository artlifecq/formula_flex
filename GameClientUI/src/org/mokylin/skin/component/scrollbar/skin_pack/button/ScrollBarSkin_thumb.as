package org.mokylin.skin.component.scrollbar.skin_pack.button
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ScrollBarSkin_thumb extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __ScrollBarSkin_thumb_UIAsset1:feathers.controls.UIAsset;

		public var __ScrollBarSkin_thumb_UIAsset2:feathers.controls.UIAsset;

		public var __ScrollBarSkin_thumb_UIAsset3:feathers.controls.UIAsset;

		public var __ScrollBarSkin_thumb_UIAsset4:feathers.controls.UIAsset;

		public var __ScrollBarSkin_thumb_UIAsset5:feathers.controls.UIAsset;

		public var __ScrollBarSkin_thumb_UIAsset6:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ScrollBarSkin_thumb()
		{
			super();
			
			this.currentState = "up";
			this.height = 30;
			this.elementsContent = [];
			__ScrollBarSkin_thumb_UIAsset1_i();
			__ScrollBarSkin_thumb_UIAsset2_i();
			__ScrollBarSkin_thumb_UIAsset3_i();
			__ScrollBarSkin_thumb_UIAsset4_i();
			__ScrollBarSkin_thumb_UIAsset5_i();
			__ScrollBarSkin_thumb_UIAsset6_i();
			
			
			states = {
			};
			skinNames={"down":"ui/component/scrollbar/skin_pack/button/skin_thumb/fangkuai_di.png,ui/component/scrollbar/skin_pack/button/skin_thumb/fangkuai.png", "hover":"ui/component/scrollbar/skin_pack/button/skin_thumb/fangkuai_di.png,ui/component/scrollbar/skin_pack/button/skin_thumb/fangkuai.png", "up":"ui/component/scrollbar/skin_pack/button/skin_thumb/fangkuai_di.png,ui/component/scrollbar/skin_pack/button/skin_thumb/fangkuai.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ScrollBarSkin_thumb_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ScrollBarSkin_thumb_UIAsset1 = temp;
			temp.bottom = 0;
			temp.styleName = "ui/component/scrollbar/skin_pack/button/skin_thumb/fangkuai_di.png";
			temp.top = 0;
			temp.x = 1;
			return temp;
		}

		private function __ScrollBarSkin_thumb_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ScrollBarSkin_thumb_UIAsset2 = temp;
			temp.styleName = "ui/component/scrollbar/skin_pack/button/skin_thumb/fangkuai.png";
			temp.verticalCenter = 0;
			temp.x = 0;
			return temp;
		}

		private function __ScrollBarSkin_thumb_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ScrollBarSkin_thumb_UIAsset3 = temp;
			temp.bottom = 0;
			temp.styleName = "ui/component/scrollbar/skin_pack/button/skin_thumb/fangkuai_di.png";
			temp.top = 0;
			temp.x = 1;
			return temp;
		}

		private function __ScrollBarSkin_thumb_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ScrollBarSkin_thumb_UIAsset4 = temp;
			temp.styleName = "ui/component/scrollbar/skin_pack/button/skin_thumb/fangkuai.png";
			temp.verticalCenter = 0;
			temp.x = 0;
			return temp;
		}

		private function __ScrollBarSkin_thumb_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ScrollBarSkin_thumb_UIAsset5 = temp;
			temp.bottom = 0;
			temp.styleName = "ui/component/scrollbar/skin_pack/button/skin_thumb/fangkuai_di.png";
			temp.top = 0;
			temp.x = 1;
			return temp;
		}

		private function __ScrollBarSkin_thumb_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ScrollBarSkin_thumb_UIAsset6 = temp;
			temp.styleName = "ui/component/scrollbar/skin_pack/button/skin_thumb/fangkuai.png";
			temp.verticalCenter = 0;
			temp.x = 0;
			return temp;
		}

	}
}