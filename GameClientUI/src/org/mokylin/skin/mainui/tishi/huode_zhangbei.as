package org.mokylin.skin.mainui.tishi
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class huode_zhangbei extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icon1:feathers.controls.UIAsset;

		public var Icon2:feathers.controls.UIAsset;

		public var Icon3:feathers.controls.UIAsset;

		public var Icon4:feathers.controls.UIAsset;

		public var Icon5:feathers.controls.UIAsset;

		public var Icon6:feathers.controls.UIAsset;

		public var Icon7:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function huode_zhangbei()
		{
			super();
			
			this.currentState = "normal";
			this.height = 102;
			this.width = 485;
			this.elementsContent = [__huode_zhangbei_UIAsset1_i(),__huode_zhangbei_UIAsset2_i(),Icon1_i(),Icon2_i(),Icon3_i(),Icon4_i(),Icon5_i(),Icon6_i(),Icon7_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon1 = temp;
			temp.name = "Icon1";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 20;
			temp.y = 41;
			return temp;
		}

		private function Icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon2 = temp;
			temp.name = "Icon2";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 85;
			temp.y = 41;
			return temp;
		}

		private function Icon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon3 = temp;
			temp.name = "Icon3";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 150;
			temp.y = 41;
			return temp;
		}

		private function Icon4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon4 = temp;
			temp.name = "Icon4";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 216;
			temp.y = 41;
			return temp;
		}

		private function Icon5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon5 = temp;
			temp.name = "Icon5";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 281;
			temp.y = 41;
			return temp;
		}

		private function Icon6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon6 = temp;
			temp.name = "Icon6";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 346;
			temp.y = 41;
			return temp;
		}

		private function Icon7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon7 = temp;
			temp.name = "Icon7";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 411;
			temp.y = 41;
			return temp;
		}

		private function __huode_zhangbei_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 102;
			temp.styleName = "ui/mainui/tishi/kuangzi.png";
			temp.width = 485;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __huode_zhangbei_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/tishi/gxnhdxzb.png";
			temp.x = 138;
			temp.y = 13;
			return temp;
		}

	}
}