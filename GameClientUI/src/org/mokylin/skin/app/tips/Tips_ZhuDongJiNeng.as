package org.mokylin.skin.app.tips
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
	public class Tips_ZhuDongJiNeng extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icon1:feathers.controls.UIAsset;

		public var Icon2:feathers.controls.UIAsset;

		public var grpContent:feathers.controls.Group;

		public var imgLine1:feathers.controls.UIAsset;

		public var lbJinjie:feathers.controls.Label;

		public var lbJinjie2:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var lbShuoming:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;

		public var lbType:feathers.controls.Label;

		public var lbXiaohao:feathers.controls.Label;

		public var skill_name:feathers.controls.Label;

		public var tipbg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_ZhuDongJiNeng()
		{
			super();
			
			this.currentState = "normal";
			this.height = 380;
			this.width = 280;
			this.elementsContent = [tipbg_i(),imgLine1_i(),skill_name_i(),Icon1_i(),__Tips_ZhuDongJiNeng_Label1_i(),lbType_i(),__Tips_ZhuDongJiNeng_Label2_i(),__Tips_ZhuDongJiNeng_Label3_i(),lbXiaohao_i(),lbTime_i(),__Tips_ZhuDongJiNeng_UIAsset1_i(),lbShuoming_i(),grpContent_i()];
			
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
			temp.styleName = "ui/common/tips/jinengkuang.png";
			temp.x = 12;
			temp.y = 13;
			return temp;
		}

		private function Icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon2 = temp;
			temp.name = "Icon2";
			temp.styleName = "ui/common/tips/jinengkuang.png";
			temp.x = 68;
			temp.y = 28;
			return temp;
		}

		private function __Tips_ZhuDongJiNeng_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "技能类型：";
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 102;
			temp.y = 35;
			return temp;
		}

		private function __Tips_ZhuDongJiNeng_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "消耗：";
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 102;
			temp.y = 54;
			return temp;
		}

		private function __Tips_ZhuDongJiNeng_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "冷却时间：";
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 102;
			temp.y = 73;
			return temp;
		}

		private function __Tips_ZhuDongJiNeng_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/tipswenzi/jineng/jinengshuoming.png";
			temp.x = 13;
			temp.y = 116;
			return temp;
		}

		private function __Tips_ZhuDongJiNeng_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/jinjiexiaoguo.png";
			temp.x = 77;
			temp.y = 0;
			return temp;
		}

		private function __Tips_ZhuDongJiNeng_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_2.png";
			temp.x = 146;
			temp.y = 5;
			return temp;
		}

		private function __Tips_ZhuDongJiNeng_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_1.png";
			temp.x = 4;
			temp.y = 5;
			return temp;
		}

		private function grpContent_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpContent = temp;
			temp.name = "grpContent";
			temp.x = 30;
			temp.y = 193;
			temp.elementsContent = [__Tips_ZhuDongJiNeng_UIAsset2_i(),Icon2_i(),lbName_i(),lbJinjie_i(),lbJinjie2_i(),__Tips_ZhuDongJiNeng_UIAsset3_i(),__Tips_ZhuDongJiNeng_UIAsset4_i()];
			return temp;
		}

		private function imgLine1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLine1 = temp;
			temp.name = "imgLine1";
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 7;
			temp.y = 102;
			return temp;
		}

		private function lbJinjie2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJinjie2 = temp;
			temp.name = "lbJinjie2";
			temp.height = 18;
			temp.text = "每击中一个目标额外产生3点怒气";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 220;
			temp.x = 0;
			temp.y = 157;
			return temp;
		}

		private function lbJinjie_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJinjie = temp;
			temp.name = "lbJinjie";
			temp.height = 18;
			temp.text = "(侵略如火10级可进阶)";
			temp.textAlign = "center";
			temp.color = 0xA18F51;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 220;
			temp.x = 0;
			temp.y = 138;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.text = "怒火中烧";
			temp.textAlign = "center";
			temp.color = 0xE2D8BE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 79;
			temp.x = 72;
			temp.y = 118;
			return temp;
		}

		private function lbShuoming_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbShuoming = temp;
			temp.name = "lbShuoming";
			temp.text = "挥动武器横扫三次，每次造成25%+1伤害，每次攻击产生2点怒气值";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 268;
			temp.x = 6;
			temp.y = 137;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "无";
			temp.color = 0xE2D8BE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 58;
			temp.x = 170;
			temp.y = 73;
			return temp;
		}

		private function lbType_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbType = temp;
			temp.name = "lbType";
			temp.text = "瞬发";
			temp.color = 0xE2D8BE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 58;
			temp.x = 170;
			temp.y = 35;
			return temp;
		}

		private function lbXiaohao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbXiaohao = temp;
			temp.name = "lbXiaohao";
			temp.text = "无";
			temp.color = 0xE2D8BE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 62;
			temp.x = 144;
			temp.y = 54;
			return temp;
		}

		private function skill_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			skill_name = temp;
			temp.name = "skill_name";
			temp.fontSize = 16;
			temp.text = "技能名字";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 167;
			temp.x = 102;
			temp.y = 13;
			return temp;
		}

		private function tipbg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			tipbg = temp;
			temp.name = "tipbg";
			temp.height = 380;
			temp.styleName = "ui/common/tips/jinengdi.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}