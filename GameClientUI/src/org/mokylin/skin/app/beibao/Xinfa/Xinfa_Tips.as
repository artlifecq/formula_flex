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

		public var imgLine:feathers.controls.UIAsset;

		public var imgStone:feathers.controls.UIAsset;

		public var lab_condition:feathers.controls.Label;

		public var lb_Stone:feathers.controls.Label;

		public var lb_jihuo:feathers.controls.Label;

		public var lb_name:feathers.controls.Label;

		public var lb_tile2:feathers.controls.Label;

		public var lb_title1:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Xinfa_Tips()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [imgBg_i(),lb_name_i(),lb_jihuo_i(),lb_title1_i(),imgLine_i(),lb_tile2_i(),lb_Stone_i(),imgStone_i(),lab_condition_i()];
			
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
			temp.height = 231;
			temp.styleName = "ui/common/tips/tips_1.png";
			temp.width = 241;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgLine_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLine = temp;
			temp.name = "imgLine";
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width = 224;
			temp.x = 9;
			temp.y = 137;
			return temp;
		}

		private function imgStone_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgStone = temp;
			temp.name = "imgStone";
			temp.styleName = "ui/app/beibao/icons/icon/baojibianshi/huangse.png";
			temp.x = 20;
			temp.y = 178;
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
			temp.x = 21;
			temp.y = 72;
			return temp;
		}

		private function lb_Stone_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_Stone = temp;
			temp.name = "lb_Stone";
			temp.height = 62;
			temp.leading = 5;
			temp.letterSpacing = 0;
			temp.text = "可镶嵌@及以上等级获得砭石属性加成";
			temp.textAlign = "left";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 166;
			temp.x = 51;
			temp.y = 177;
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
			temp.x = 183;
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
			temp.text = "节点名称";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 19;
			temp.y = 9;
			return temp;
		}

		private function lb_tile2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_tile2 = temp;
			temp.name = "lb_tile2";
			temp.text = "【镶嵌说明】";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 12;
			temp.y = 150;
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
			temp.x = 12;
			temp.y = 50;
			return temp;
		}

	}
}