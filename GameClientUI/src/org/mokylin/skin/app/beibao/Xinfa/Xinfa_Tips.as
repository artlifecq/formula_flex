package org.mokylin.skin.app.beibao.Xinfa
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
	public class Xinfa_Tips extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var icon:feathers.controls.UIAsset;

		public var imgBg:feathers.controls.UIAsset;

		public var imgLine0:feathers.controls.UIAsset;

		public var imgLine1:feathers.controls.UIAsset;

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
		public function Xinfa_Tips()
		{
			super();
			
			this.currentState = "normal";
			this.height = 207;
			this.width = 280;
			this.elementsContent = [imgBg_i(),lb_name_i(),lb_jihuo_i(),lb_dengji_i(),imgLine1_i(),imgLine0_i(),lb_shengming_i(),__Xinfa_Tips_Label1_i(),lb_Stone_i(),imgStone_i(),uiName1_i(),uiName2_i(),icon_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Xinfa_Tips_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.letterSpacing = 0;
			temp.text = "生命：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 53;
			temp.x = 11;
			temp.y = 144;
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.styleName = "ui/app/beibao/jingmai/di_icon.png";
			temp.x = 14;
			temp.y = 14;
			return temp;
		}

		private function imgBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBg = temp;
			temp.name = "imgBg";
			temp.height = 207;
			temp.styleName = "ui/common/tips/jinengdi.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgLine0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLine0 = temp;
			temp.name = "imgLine0";
			temp.styleName = "ui/common/tips/xian.png";
			temp.width = 264;
			temp.x = 9;
			temp.y = 61;
			return temp;
		}

		private function imgLine1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLine1 = temp;
			temp.name = "imgLine1";
			temp.styleName = "ui/common/tips/xian.png";
			temp.width = 264;
			temp.x = 9;
			temp.y = 115;
			return temp;
		}

		private function imgStone_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgStone = temp;
			temp.name = "imgStone";
			temp.styleName = "ui/app/beibao/icons/icon/baojibianshi/huangse.png";
			temp.x = 11;
			temp.y = 164;
			return temp;
		}

		private function lb_Stone_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_Stone = temp;
			temp.name = "lb_Stone";
			temp.height = 34;
			temp.letterSpacing = 0;
			temp.text = "可镶嵌$获得砭石属性加成。砭石类型一致才可镶嵌";
			temp.textAlign = "left";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 229;
			temp.x = 48;
			temp.y = 164;
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
			temp.x = 11;
			temp.y = 89;
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
			temp.x = 59;
			temp.y = 33;
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
			temp.x = 59;
			temp.y = 11;
			return temp;
		}

		private function lb_shengming_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_shengming = temp;
			temp.name = "lb_shengming";
			temp.letterSpacing = 0;
			temp.text = "+50";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 213;
			temp.x = 51;
			temp.y = 144;
			return temp;
		}

		private function uiName1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName1 = temp;
			temp.name = "uiName1";
			temp.styleName = "ui/common/tips/tipswenzi/jineng/jihuotiaojian.png";
			temp.x = 13;
			temp.y = 72;
			return temp;
		}

		private function uiName2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName2 = temp;
			temp.name = "uiName2";
			temp.styleName = "ui/common/tips/tipswenzi/jineng/chongxueshuxing.png";
			temp.x = 13;
			temp.y = 127;
			return temp;
		}

	}
}