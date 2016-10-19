package org.mokylin.skin.component.radio
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class RadioSkin_1 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __RadioSkin_1_UIAsset1:feathers.controls.UIAsset;

		public var __RadioSkin_1_UIAsset2:feathers.controls.UIAsset;

		public var __RadioSkin_1_UIAsset3:feathers.controls.UIAsset;

		public var __RadioSkin_1_UIAsset4:feathers.controls.UIAsset;

		public var __RadioSkin_1_UIAsset5:feathers.controls.UIAsset;

		public var __RadioSkin_1_UIAsset6:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function RadioSkin_1()
		{
			super();
			
			this.elementsContent = [labelDisplay_i()];
			__RadioSkin_1_UIAsset1_i();
			__RadioSkin_1_UIAsset2_i();
			__RadioSkin_1_UIAsset3_i();
			__RadioSkin_1_UIAsset4_i();
			__RadioSkin_1_UIAsset5_i();
			__RadioSkin_1_UIAsset6_i();
			
			
			skinNames={"normal_down":"ui/component/radio/skin_1/normal_down.png",
			"normal_over":"ui/component/radio/skin_1/normal_over.png",
			"normal_up":"ui/component/radio/skin_1/normal_up.png",
			"select_down":"ui/component/radio/skin_1/select_down.png",
			"select_over":"ui/component/radio/skin_1/select_over.png",
			"select_up":"ui/component/radio/skin_1/select_up.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __RadioSkin_1_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__RadioSkin_1_UIAsset1 = temp;
			temp.styleName = "ui/component/radio/skin_1/normal_down.png";
			return temp;
		}

		private function __RadioSkin_1_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__RadioSkin_1_UIAsset2 = temp;
			temp.styleName = "ui/component/radio/skin_1/normal_over.png";
			return temp;
		}

		private function __RadioSkin_1_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__RadioSkin_1_UIAsset3 = temp;
			temp.styleName = "ui/component/radio/skin_1/normal_up.png";
			return temp;
		}

		private function __RadioSkin_1_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__RadioSkin_1_UIAsset4 = temp;
			temp.styleName = "ui/component/radio/skin_1/select_down.png";
			return temp;
		}

		private function __RadioSkin_1_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__RadioSkin_1_UIAsset5 = temp;
			temp.styleName = "ui/component/radio/skin_1/select_over.png";
			return temp;
		}

		private function __RadioSkin_1_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__RadioSkin_1_UIAsset6 = temp;
			temp.styleName = "ui/component/radio/skin_1/select_up.png";
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.text = "";
			temp.textAlign = "center";
			temp.color = 0xFFFFFF;
			temp.top = 0;
			return temp;
		}

	}
}