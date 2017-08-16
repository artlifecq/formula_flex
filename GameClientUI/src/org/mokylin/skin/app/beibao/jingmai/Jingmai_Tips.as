package org.mokylin.skin.app.beibao.jingmai
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
	public class Jingmai_Tips extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var iconbg:feathers.controls.UIAsset;

		public var imgBg:feathers.controls.UIAsset;

		public var imgLine:feathers.controls.UIAsset;

		public var imgLine2:feathers.controls.UIAsset;

		public var imgStone:feathers.controls.UIAsset;

		public var lb_Stone:feathers.controls.Label;

		public var lb_dengji:feathers.controls.Label;

		public var lb_jihuo:feathers.controls.Label;

		public var lb_name:feathers.controls.Label;

		public var lb_shengming:feathers.controls.Label;

		public var uiName1:feathers.controls.UIAsset;

		public var uiName2:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Jingmai_Tips()
		{
			super();
			
			this.currentState = "normal";
			this.height = 187;
			this.width = 280;
			this.elementsContent = [imgBg_i(),lb_name_i(),lb_jihuo_i(),lb_dengji_i(),imgLine2_i(),imgLine_i(),lb_shengming_i(),lb_Stone_i(),iconbg_i(),imgStone_i(),uiName1_i(),uiName2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function iconbg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iconbg = temp;
			temp.name = "iconbg";
			temp.styleName = "ui/common/grid/normal/bianshi_icon.png";
			temp.x = 10;
			temp.y = 145;
			return temp;
		}

		private function imgBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBg = temp;
			temp.name = "imgBg";
			temp.height = 187;
			temp.styleName = "ui/common/tips/jinengdi.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgLine2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLine2 = temp;
			temp.name = "imgLine2";
			temp.styleName = "ui/common/tips/xian.png";
			temp.width = 264;
			temp.x = 9;
			temp.y = 95;
			return temp;
		}

		private function imgLine_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLine = temp;
			temp.name = "imgLine";
			temp.styleName = "ui/common/tips/xian.png";
			temp.width = 264;
			temp.x = 9;
			temp.y = 39;
			return temp;
		}

		private function imgStone_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgStone = temp;
			temp.name = "imgStone";
			temp.styleName = "ui/app/beibao/icons/bianshi/5/4.png";
			temp.x = 12;
			temp.y = 147;
			return temp;
		}

		private function lb_Stone_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_Stone = temp;
			temp.name = "lb_Stone";
			temp.height = 19;
			temp.letterSpacing = 0;
			temp.text = "可镶嵌$获得砭石属性加成";
			temp.textAlign = "left";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 229;
			temp.x = 48;
			temp.y = 150;
			return temp;
		}

		private function lb_dengji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_dengji = temp;
			temp.name = "lb_dengji";
			temp.leading = 0;
			temp.letterSpacing = 0;
			temp.text = "角色等级：50级";
			temp.color = 0xD02525;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 214;
			temp.x = 10;
			temp.y = 68;
			return temp;
		}

		private function lb_jihuo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_jihuo = temp;
			temp.name = "lb_jihuo";
			temp.leading = 0;
			temp.letterSpacing = -1;
			temp.text = "未冲穴";
			temp.color = 0xD02525;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 226;
			temp.y = 10;
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
			temp.text = "穴位名称·奇穴";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 131;
			temp.x = 10;
			temp.y = 10;
			return temp;
		}

		private function lb_shengming_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_shengming = temp;
			temp.name = "lb_shengming";
			temp.letterSpacing = 0;
			temp.text = "生命 +50";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 213;
			temp.x = 10;
			temp.y = 126;
			return temp;
		}

		private function uiName1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName1 = temp;
			temp.name = "uiName1";
			temp.styleName = "ui/common/tips/tipswenzi/jineng/jihuotiaojian.png";
			temp.x = 13;
			temp.y = 51;
			return temp;
		}

		private function uiName2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName2 = temp;
			temp.name = "uiName2";
			temp.styleName = "ui/common/tips/tipswenzi/jineng/jihuoshuxing.png";
			temp.x = 13;
			temp.y = 109;
			return temp;
		}

	}
}