package org.mokylin.skin.app.banghui.wangcheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Tips_WangCheng2 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var grpicon1:feathers.controls.Group;

		public var grpicon2:feathers.controls.Group;

		public var icon1_1:feathers.controls.UIAsset;

		public var icon1_2:feathers.controls.UIAsset;

		public var icon1_3:feathers.controls.UIAsset;

		public var icon1_4:feathers.controls.UIAsset;

		public var icon2_1:feathers.controls.UIAsset;

		public var icon2_2:feathers.controls.UIAsset;

		public var icon2_3:feathers.controls.UIAsset;

		public var icon2_4:feathers.controls.UIAsset;

		public var imgBG:feathers.controls.UIAsset;

		public var imgLine1:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_WangCheng2()
		{
			super();
			
			this.currentState = "normal";
			this.height = 212;
			this.width = 240;
			this.elementsContent = [imgBG_i(),imgLine1_i(),__Tips_WangCheng2_Label1_i(),__Tips_WangCheng2_Label2_i(),__Tips_WangCheng2_Label3_i(),grpicon1_i(),grpicon2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Tips_WangCheng2_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "【王城】";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 111;
			temp.x = 4;
			temp.y = 10;
			return temp;
		}

		private function __Tips_WangCheng2_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "占领福利（官员）：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 140;
			temp.x = 10;
			temp.y = 48;
			return temp;
		}

		private function __Tips_WangCheng2_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "占领福利（帮众）：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 140;
			temp.x = 10;
			temp.y = 128;
			return temp;
		}

		private function grpicon1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpicon1 = temp;
			temp.name = "grpicon1";
			temp.x = 12;
			temp.y = 69;
			temp.elementsContent = [icon1_1_i(),icon1_2_i(),icon1_3_i(),icon1_4_i()];
			return temp;
		}

		private function grpicon2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpicon2 = temp;
			temp.name = "grpicon2";
			temp.x = 12;
			temp.y = 149;
			temp.elementsContent = [icon2_1_i(),icon2_2_i(),icon2_3_i(),icon2_4_i()];
			return temp;
		}

		private function icon1_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1_1 = temp;
			temp.name = "icon1_1";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function icon1_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1_2 = temp;
			temp.name = "icon1_2";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 55;
			temp.y = 0;
			return temp;
		}

		private function icon1_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1_3 = temp;
			temp.name = "icon1_3";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 110;
			temp.y = 0;
			return temp;
		}

		private function icon1_4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1_4 = temp;
			temp.name = "icon1_4";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 165;
			temp.y = 0;
			return temp;
		}

		private function icon2_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2_1 = temp;
			temp.name = "icon2_1";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function icon2_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2_2 = temp;
			temp.name = "icon2_2";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 55;
			temp.y = 0;
			return temp;
		}

		private function icon2_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2_3 = temp;
			temp.name = "icon2_3";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 110;
			temp.y = 0;
			return temp;
		}

		private function icon2_4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2_4 = temp;
			temp.name = "icon2_4";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 165;
			temp.y = 0;
			return temp;
		}

		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.height = 212;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 240;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgLine1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLine1 = temp;
			temp.name = "imgLine1";
			temp.styleName = "ui/common/tips/xian.png";
			temp.width = 220;
			temp.x = 11;
			temp.y = 39;
			return temp;
		}

	}
}