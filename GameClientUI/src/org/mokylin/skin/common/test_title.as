package org.mokylin.skin.common
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class test_title extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg1:feathers.controls.UIAsset;

		public var bg2:feathers.controls.UIAsset;

		public var bg3:feathers.controls.UIAsset;

		public var yuantu:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function test_title()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg1_i(),bg2_i(),bg3_i(),yuantu_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg1 = temp;
			temp.name = "bg1";
			temp.styleName = "ui/common/test/1.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg2 = temp;
			temp.name = "bg2";
			temp.styleName = "ui/common/test/2.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg3 = temp;
			temp.name = "bg3";
			temp.styleName = "ui/common/test/3.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function yuantu_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			yuantu = temp;
			temp.name = "yuantu";
			temp.styleName = "ui/common/test/4.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}