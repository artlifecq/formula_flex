package org.mokylin.skin.app.meiren
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
	public class MeiRenGuanKa_Tips extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var icon1:feathers.controls.UIAsset;

		public var icon2:feathers.controls.UIAsset;

		public var icon3:feathers.controls.UIAsset;

		public var icon4:feathers.controls.UIAsset;

		public var imgBg:feathers.controls.UIAsset;

		public var lbZhanli:feathers.controls.Label;

		public var lbZhuangtai:feathers.controls.Label;

		public var lb_name:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MeiRenGuanKa_Tips()
		{
			super();
			
			this.currentState = "normal";
			this.height = 154;
			this.width = 238;
			this.elementsContent = [imgBg_i(),lb_name_i(),__MeiRenGuanKa_Tips_Label1_i(),lbZhanli_i(),lbZhuangtai_i(),__MeiRenGuanKa_Tips_Label2_i(),__MeiRenGuanKa_Tips_Label3_i(),icon1_i(),icon2_i(),icon3_i(),icon4_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MeiRenGuanKa_Tips_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "推荐战力：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 80;
			temp.x = 10;
			temp.y = 31;
			return temp;
		}

		private function __MeiRenGuanKa_Tips_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "通关状态：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 80;
			temp.x = 10;
			temp.y = 51;
			return temp;
		}

		private function __MeiRenGuanKa_Tips_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "关卡奖励：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 94;
			temp.x = 10;
			temp.y = 71;
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 13;
			temp.y = 92;
			return temp;
		}

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 66;
			temp.y = 92;
			return temp;
		}

		private function icon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon3 = temp;
			temp.name = "icon3";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 120;
			temp.y = 92;
			return temp;
		}

		private function icon4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon4 = temp;
			temp.name = "icon4";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 174;
			temp.y = 92;
			return temp;
		}

		private function imgBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBg = temp;
			temp.name = "imgBg";
			temp.height = 154;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 238;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbZhanli_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZhanli = temp;
			temp.name = "lbZhanli";
			temp.bold = true;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "652315";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 173;
			temp.x = 85;
			temp.y = 31;
			return temp;
		}

		private function lbZhuangtai_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZhuangtai = temp;
			temp.name = "lbZhuangtai";
			temp.bold = true;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "已通关";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 173;
			temp.x = 85;
			temp.y = 51;
			return temp;
		}

		private function lb_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_name = temp;
			temp.name = "lb_name";
			temp.bold = true;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "【关卡信息】";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 131;
			temp.x = 5;
			temp.y = 10;
			return temp;
		}

	}
}