package org.mokylin.skin.component.check
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CheckBoxSkin_1 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __CheckBoxSkin_1_UIAsset1:feathers.controls.UIAsset;

		public var __CheckBoxSkin_1_UIAsset2:feathers.controls.UIAsset;

		public var __CheckBoxSkin_1_UIAsset3:feathers.controls.UIAsset;

		public var __CheckBoxSkin_1_UIAsset4:feathers.controls.UIAsset;

		public var __CheckBoxSkin_1_UIAsset5:feathers.controls.UIAsset;

		public var __CheckBoxSkin_1_UIAsset6:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CheckBoxSkin_1()
		{
			super();
			
			this.currentState = "upAndSelected";
			this.elementsContent = [];
			labelDisplay_i();
			__CheckBoxSkin_1_UIAsset1_i();
			__CheckBoxSkin_1_UIAsset2_i();
			__CheckBoxSkin_1_UIAsset3_i();
			__CheckBoxSkin_1_UIAsset4_i();
			__CheckBoxSkin_1_UIAsset5_i();
			__CheckBoxSkin_1_UIAsset6_i();
			
			
	
			skinNames={"down":"ui/component/check/skin_1/down.png",
			"downAndSelected":"ui/component/check/skin_1/downAndSelected.png",
			"hover":"ui/component/check/skin_1/over.png",
			"overAndSelected":"ui/component/check/skin_1/overAndSelected.png",
			"up":"ui/component/check/skin_1/up.png",
			"upAndSelected":"ui/component/check/skin_1/upAndSelected.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CheckBoxSkin_1_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__CheckBoxSkin_1_UIAsset1 = temp;
			temp.left = 0;
			temp.styleName = "ui/component/check/skin_1/down.png";
			temp.top = 0;
			return temp;
		}

		private function __CheckBoxSkin_1_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__CheckBoxSkin_1_UIAsset2 = temp;
			temp.left = 0;
			temp.styleName = "ui/component/check/skin_1/downAndSelected.png";
			temp.top = 0;
			return temp;
		}

		private function __CheckBoxSkin_1_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__CheckBoxSkin_1_UIAsset3 = temp;
			temp.left = 0;
			temp.styleName = "ui/component/check/skin_1/over.png";
			temp.top = 0;
			return temp;
		}

		private function __CheckBoxSkin_1_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__CheckBoxSkin_1_UIAsset4 = temp;
			temp.left = 0;
			temp.styleName = "ui/component/check/skin_1/overAndSelected.png";
			temp.top = 0;
			return temp;
		}

		private function __CheckBoxSkin_1_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__CheckBoxSkin_1_UIAsset5 = temp;
			temp.left = 0;
			temp.styleName = "ui/component/check/skin_1/up.png";
			temp.top = 0;
			return temp;
		}

		private function __CheckBoxSkin_1_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__CheckBoxSkin_1_UIAsset6 = temp;
			temp.left = 0;
			temp.styleName = "ui/component/check/skin_1/upAndSelected.png";
			temp.top = 0;
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.height = 23;
			temp.left = 28;
			temp.text = "复选框";
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.top = 0;
			temp.verticalAlign = "middle";
			return temp;
		}

	}
}