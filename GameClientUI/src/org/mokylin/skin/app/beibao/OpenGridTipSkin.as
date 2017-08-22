package org.mokylin.skin.app.beibao
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
	public class OpenGridTipSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var ico0:feathers.controls.UIAsset;

		public var ico1:feathers.controls.UIAsset;

		public var ico2:feathers.controls.UIAsset;

		public var imgBG:feathers.controls.UIAsset;

		public var lb_time:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function OpenGridTipSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 165;
			this.width = 275;
			this.elementsContent = [imgBG_i(),ico0_i(),ico2_i(),ico1_i(),__OpenGridTipSkin_Label1_i(),__OpenGridTipSkin_Label2_i(),__OpenGridTipSkin_Label3_i(),lb_time_i(),__OpenGridTipSkin_Label4_i(),__OpenGridTipSkin_Label5_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __OpenGridTipSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "开启说明";
			temp.textAlign = "center";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 108;
			temp.y = 6;
			return temp;
		}

		private function __OpenGridTipSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "保持在线，背包和仓库会自动开启";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 15;
			temp.y = 34;
			return temp;
		}

		private function __OpenGridTipSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "开启剩余时间";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 15;
			temp.y = 54;
			return temp;
		}

		private function __OpenGridTipSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "点击可加速开启";
			temp.color = 0x9D4AA8;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 15;
			temp.y = 74;
			return temp;
		}

		private function __OpenGridTipSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "开启奖励：";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 15;
			temp.y = 94;
			return temp;
		}

		private function ico0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico0 = temp;
			temp.name = "ico0";
			temp.styleName = "ui/common/grid/normal/36.png";
			temp.x = 50;
			temp.y = 114;
			return temp;
		}

		private function ico1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico1 = temp;
			temp.name = "ico1";
			temp.styleName = "ui/common/grid/normal/36.png";
			temp.x = 100;
			temp.y = 114;
			return temp;
		}

		private function ico2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico2 = temp;
			temp.name = "ico2";
			temp.styleName = "ui/common/grid/normal/36.png";
			temp.x = 150;
			temp.y = 114;
			return temp;
		}

		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.top = 0;
			return temp;
		}

		private function lb_time_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_time = temp;
			temp.name = "lb_time";
			temp.text = "00：00：00";
			temp.x = 107;
			temp.y = 54;
			return temp;
		}

	}
}