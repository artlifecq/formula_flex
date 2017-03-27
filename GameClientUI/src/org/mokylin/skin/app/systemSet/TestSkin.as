package org.mokylin.skin.app.systemSet
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
	public class TestSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __TestSkin_UIAsset1:feathers.controls.UIAsset;

		public var __TestSkin_UIAsset2:feathers.controls.UIAsset;

		public var __TestSkin_UIAsset3:feathers.controls.UIAsset;

		public var iconDisplay:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TestSkin()
		{
			super();
			
			this.currentState = "down";
			this.height = 22;
			this.width = 68;
			this.elementsContent = [labelDisplay_i(),iconDisplay_i()];
			__TestSkin_UIAsset1_i();
			__TestSkin_UIAsset2_i();
			__TestSkin_UIAsset3_i();
			
			
			states = {
			};
			skinNames={"down":"ui/common/hover/xuanqukuang.png", "hover":"ui/common/hover/xuanqukuang.png", "up":"ui/common/hover/xuanqukuang.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TestSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__TestSkin_UIAsset1 = temp;
			temp.alpha = 1;
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/hover/xuanqukuang.png";
			temp.top = 0;
			return temp;
		}

		private function __TestSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__TestSkin_UIAsset2 = temp;
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/hover/xuanqukuang.png";
			temp.top = 0;
			return temp;
		}

		private function __TestSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__TestSkin_UIAsset3 = temp;
			temp.alpha = 0;
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/hover/xuanqukuang.png";
			temp.top = 0;
			return temp;
		}

		private function iconDisplay_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iconDisplay = temp;
			temp.name = "iconDisplay";
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
			temp.text = "2倍";
			temp.textAlign = "center";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.top = 0;
			temp.verticalAlign = "middle";
			return temp;
		}

	}
}