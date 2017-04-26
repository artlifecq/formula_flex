package org.mokylin.skin.app.wuxue
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
	public class Tips_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var imgBg:feathers.controls.UIAsset;

		public var imgLine:feathers.controls.UIAsset;

		public var lb_dengji:feathers.controls.Label;

		public var lb_jihuo:feathers.controls.Label;

		public var lb_name:feathers.controls.Label;

		public var lb_shengming:feathers.controls.Label;

		public var lb_tile2:feathers.controls.Label;

		public var lb_title1:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [imgBg_i(),lb_name_i(),lb_jihuo_i(),lb_title1_i(),lb_dengji_i(),imgLine_i(),lb_tile2_i(),lb_shengming_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function imgBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBg = temp;
			temp.name = "imgBg";
			temp.height = 184;
			temp.styleName = "ui/common/tips/tips_1.png";
			temp.top = 0;
			temp.width = 241;
			temp.x = 0;
			return temp;
		}

		private function imgLine_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLine = temp;
			temp.name = "imgLine";
			temp.left = 9;
			temp.right = 8;
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.y = 108;
			return temp;
		}

		private function lb_dengji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_dengji = temp;
			temp.name = "lb_dengji";
			temp.leading = 0;
			temp.letterSpacing = -1;
			temp.text = "60级开启";
			temp.color = 0x25931B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 214;
			temp.x = 15;
			temp.y = 73;
			return temp;
		}

		private function lb_jihuo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_jihuo = temp;
			temp.name = "lb_jihuo";
			temp.leading = 0;
			temp.letterSpacing = -1;
			temp.text = "未激活";
			temp.color = 0xD02525;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 50;
			temp.x = 184;
			temp.y = 13;
			return temp;
		}

		private function lb_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_name = temp;
			temp.name = "lb_name";
			temp.bold = true;
			temp.letterSpacing = 0;
			temp.fontSize = 16;
			temp.text = "亡魂悲歌";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 19;
			temp.y = 9;
			return temp;
		}

		private function lb_shengming_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_shengming = temp;
			temp.name = "lb_shengming";
			temp.letterSpacing = 0;
			temp.text = "打怪经验获得提高50%";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 213;
			temp.x = 15;
			temp.y = 149;
			return temp;
		}

		private function lb_tile2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_tile2 = temp;
			temp.name = "lb_tile2";
			temp.text = "【效果】";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 100;
			temp.x = 10;
			temp.y = 126;
			return temp;
		}

		private function lb_title1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_title1 = temp;
			temp.name = "lb_title1";
			temp.leading = 0;
			temp.text = "【激活条件】";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 100;
			temp.x = 10;
			temp.y = 48;
			return temp;
		}

	}
}