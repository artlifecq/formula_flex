package org.mokylin.skin.common
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TongYongHead3 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var drag_panel1:feathers.controls.UIAsset;

		public var drag_panel2:feathers.controls.UIAsset;

		public var drag_panel3:feathers.controls.UIAsset;

		public var drag_panel4:feathers.controls.UIAsset;

		public var drag_panel5:feathers.controls.UIAsset;

		public var drag_panel6:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TongYongHead3()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [drag_panel6_i(),drag_panel5_i(),drag_panel4_i(),drag_panel3_i(),drag_panel2_i(),drag_panel1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function drag_panel1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			drag_panel1 = temp;
			temp.name = "drag_panel1";
			temp.scaleX = -1;
			temp.styleName = "ui/alphapng/background/head_8.png";
			temp.x = 450;
			temp.y = -8;
			return temp;
		}

		private function drag_panel2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			drag_panel2 = temp;
			temp.name = "drag_panel2";
			temp.styleName = "ui/alphapng/background/head_8.png";
			temp.x = -13;
			temp.y = -8;
			return temp;
		}

		private function drag_panel3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			drag_panel3 = temp;
			temp.name = "drag_panel3";
			temp.styleName = "ui/common/background/head_6.png";
			temp.width = 213;
			temp.x = 112;
			temp.y = -5;
			return temp;
		}

		private function drag_panel4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			drag_panel4 = temp;
			temp.name = "drag_panel4";
			temp.scaleX = -1;
			temp.styleName = "ui/common/background/head_3.png";
			temp.x = 345;
			temp.y = 4;
			return temp;
		}

		private function drag_panel5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			drag_panel5 = temp;
			temp.name = "drag_panel5";
			temp.styleName = "ui/common/background/head_3.png";
			temp.x = 92;
			temp.y = 4;
			return temp;
		}

		private function drag_panel6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			drag_panel6 = temp;
			temp.name = "drag_panel6";
			temp.styleName = "ui/common/background/head_10.png";
			temp.x = -2;
			temp.y = 36;
			return temp;
		}

	}
}