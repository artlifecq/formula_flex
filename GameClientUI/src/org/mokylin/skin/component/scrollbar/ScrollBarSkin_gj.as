package org.mokylin.skin.component.scrollbar
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ScrollBarSkin_gj extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __ScrollBarSkin_gj_UIAsset1:feathers.controls.UIAsset;

		public var __ScrollBarSkin_gj_UIAsset10:feathers.controls.UIAsset;

		public var __ScrollBarSkin_gj_UIAsset2:feathers.controls.UIAsset;

		public var __ScrollBarSkin_gj_UIAsset3:feathers.controls.UIAsset;

		public var __ScrollBarSkin_gj_UIAsset4:feathers.controls.UIAsset;

		public var __ScrollBarSkin_gj_UIAsset5:feathers.controls.UIAsset;

		public var __ScrollBarSkin_gj_UIAsset6:feathers.controls.UIAsset;

		public var __ScrollBarSkin_gj_UIAsset7:feathers.controls.UIAsset;

		public var __ScrollBarSkin_gj_UIAsset8:feathers.controls.UIAsset;

		public var __ScrollBarSkin_gj_UIAsset9:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ScrollBarSkin_gj()
		{
			super();
			
			this.currentState = "up";
			this.elementsContent = [];
			__ScrollBarSkin_gj_UIAsset1_i();
			__ScrollBarSkin_gj_UIAsset2_i();
			__ScrollBarSkin_gj_UIAsset3_i();
			__ScrollBarSkin_gj_UIAsset4_i();
			__ScrollBarSkin_gj_UIAsset5_i();
			__ScrollBarSkin_gj_UIAsset6_i();
			__ScrollBarSkin_gj_UIAsset7_i();
			__ScrollBarSkin_gj_UIAsset8_i();
			__ScrollBarSkin_gj_UIAsset9_i();
			__ScrollBarSkin_gj_UIAsset10_i();
			
			
			states = {
			};
			skinNames={"down":"ui/component/scrollbar/skin_gj/decre_down.png,ui/component/scrollbar/skin_gj/incre_down.png,ui/component/scrollbar/skin_gj/thumb_down.png",
			"hover":"ui/component/scrollbar/skin_gj/decre_over.png,ui/component/scrollbar/skin_gj/incre_over.png,ui/component/scrollbar/skin_gj/thumb_over.png",
			"track":"ui/component/scrollbar/skin_gj/track.png",
			"up":"ui/component/scrollbar/skin_gj/decre_up.png,ui/component/scrollbar/skin_gj/incre_up.png,ui/component/scrollbar/skin_gj/thumb_up.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ScrollBarSkin_gj_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ScrollBarSkin_gj_UIAsset10 = temp;
			temp.styleName = "ui/component/scrollbar/skin_gj/track.png";
			return temp;
		}

		private function __ScrollBarSkin_gj_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ScrollBarSkin_gj_UIAsset1 = temp;
			temp.styleName = "ui/component/scrollbar/skin_gj/decre_down.png";
			return temp;
		}

		private function __ScrollBarSkin_gj_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ScrollBarSkin_gj_UIAsset2 = temp;
			temp.styleName = "ui/component/scrollbar/skin_gj/decre_over.png";
			return temp;
		}

		private function __ScrollBarSkin_gj_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ScrollBarSkin_gj_UIAsset3 = temp;
			temp.styleName = "ui/component/scrollbar/skin_gj/decre_up.png";
			return temp;
		}

		private function __ScrollBarSkin_gj_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ScrollBarSkin_gj_UIAsset4 = temp;
			temp.styleName = "ui/component/scrollbar/skin_gj/incre_down.png";
			return temp;
		}

		private function __ScrollBarSkin_gj_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ScrollBarSkin_gj_UIAsset5 = temp;
			temp.styleName = "ui/component/scrollbar/skin_gj/incre_over.png";
			return temp;
		}

		private function __ScrollBarSkin_gj_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ScrollBarSkin_gj_UIAsset6 = temp;
			temp.styleName = "ui/component/scrollbar/skin_gj/incre_up.png";
			return temp;
		}

		private function __ScrollBarSkin_gj_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ScrollBarSkin_gj_UIAsset7 = temp;
			temp.styleName = "ui/component/scrollbar/skin_gj/thumb_down.png";
			return temp;
		}

		private function __ScrollBarSkin_gj_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ScrollBarSkin_gj_UIAsset8 = temp;
			temp.styleName = "ui/component/scrollbar/skin_gj/thumb_over.png";
			return temp;
		}

		private function __ScrollBarSkin_gj_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ScrollBarSkin_gj_UIAsset9 = temp;
			temp.styleName = "ui/component/scrollbar/skin_gj/thumb_up.png";
			return temp;
		}

	}
}