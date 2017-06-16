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
		public var imgBg:feathers.controls.UIAsset;

		public var imgLine0:feathers.controls.UIAsset;

		public var imgLine1:feathers.controls.UIAsset;

		public var imgStone:feathers.controls.UIAsset;

		public var lab_condition:feathers.controls.Label;

		public var lb_Stone:feathers.controls.Label;

		public var lb_jihuo:feathers.controls.Label;

		public var lb_name:feathers.controls.Label;

		public var uiName1:feathers.controls.UIAsset;

		public var uiName2:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Xinfa_Tips()
		{
			super();
			
			this.currentState = "normal";
			this.height = 260;
			this.elementsContent = [imgBg_i(),__Xinfa_Tips_UIAsset1_i(),imgLine1_i(),imgLine0_i(),lb_name_i(),lb_jihuo_i(),uiName1_i(),lb_Stone_i(),imgStone_i(),lab_condition_i(),uiName2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Xinfa_Tips_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/tiao.png";
			temp.x = 12;
			temp.y = 19;
			return temp;
		}

		private function imgBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBg = temp;
			temp.name = "imgBg";
			temp.height = 260;
			temp.styleName = "ui/common/tips/diban3.png";
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
			temp.y = 53;
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
			temp.y = 146;
			return temp;
		}

		private function imgStone_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgStone = temp;
			temp.name = "imgStone";
			temp.styleName = "ui/app/beibao/icons/icon/baojibianshi/huangse.png";
			temp.x = 18;
			temp.y = 200;
			return temp;
		}

		private function lab_condition_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_condition = temp;
			temp.name = "lab_condition";
			temp.text = "角色等级：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 203;
			temp.x = 13;
			temp.y = 92;
			return temp;
		}

		private function lb_Stone_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_Stone = temp;
			temp.name = "lb_Stone";
			temp.height = 50;
			temp.leading = 5;
			temp.letterSpacing = 0;
			temp.text = "可镶嵌$获得砭石属性加成";
			temp.textAlign = "left";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 218;
			temp.x = 53;
			temp.y = 199;
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
			temp.x = 222;
			temp.y = 22;
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
			temp.text = "节点名称";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 131;
			temp.x = 13;
			temp.y = 21;
			return temp;
		}

		private function uiName1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName1 = temp;
			temp.name = "uiName1";
			temp.styleName = "ui/common/tips/tipswenzi/jineng/jihuotiaojian.png";
			temp.x = 15;
			temp.y = 67;
			return temp;
		}

		private function uiName2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName2 = temp;
			temp.name = "uiName2";
			temp.styleName = "ui/common/tips/tipswenzi/jineng/xiangqianshuoming.png";
			temp.x = 15;
			temp.y = 161;
			return temp;
		}

	}
}