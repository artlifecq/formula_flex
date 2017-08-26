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
	public class Tips_BeiDongJiNeng extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icon1:feathers.controls.UIAsset;

		public var jihuogroup:feathers.controls.Group;

		public var lbDengji:feathers.controls.Label;

		public var lbJIhuo:feathers.controls.Label;

		public var lbShuoming:feathers.controls.Label;

		public var lbType:feathers.controls.Label;

		public var skill_name:feathers.controls.Label;

		public var tipbg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_BeiDongJiNeng()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [tipbg_i(),__Tips_BeiDongJiNeng_UIAsset1_i(),skill_name_i(),Icon1_i(),__Tips_BeiDongJiNeng_Label1_i(),lbType_i(),lbJIhuo_i(),lbShuoming_i(),jihuogroup_i(),__Tips_BeiDongJiNeng_UIAsset5_i()];
			
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

		private function __Tips_BeiDongJiNeng_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "技能类型：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 102;
			temp.y = 35;
			return temp;
		}

		private function __Tips_BeiDongJiNeng_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 9;
			temp.y = 105;
			return temp;
		}

		private function __Tips_BeiDongJiNeng_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/art_txt/common/tips/jihuotiaojian.png";
			temp.x = 105;
			temp.y = 0;
			return temp;
		}

		private function __Tips_BeiDongJiNeng_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_2.png";
			temp.x = 175;
			temp.y = 6;
			return temp;
		}

		private function __Tips_BeiDongJiNeng_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_1.png";
			temp.x = 33;
			temp.y = 6;
			return temp;
		}

		private function __Tips_BeiDongJiNeng_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/art_txt/common/tips/tipswenzi/jineng/jinengshuoming.png";
			temp.x = 15;
			temp.y = 117;
			return temp;
		}

		private function jihuogroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			jihuogroup = temp;
			temp.name = "jihuogroup";
			temp.height = 48;
			temp.left = 3;
			temp.right = 3;
			temp.y = 198;
			temp.elementsContent = [__Tips_BeiDongJiNeng_UIAsset2_i(),lbDengji_i(),__Tips_BeiDongJiNeng_UIAsset3_i(),__Tips_BeiDongJiNeng_UIAsset4_i()];
			return temp;
		}

		private function lbDengji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDengji = temp;
			temp.name = "lbDengji";
			temp.height = 18;
			temp.text = "角色等级达到20级";
			temp.textAlign = "center";
			temp.color = 0xD02525;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 220;
			temp.x = 26;
			temp.y = 27;
			return temp;
		}

		private function lbJIhuo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJIhuo = temp;
			temp.name = "lbJIhuo";
			temp.text = "未激活";
			temp.color = 0xD02525;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 53;
			temp.x = 225;
			temp.y = 75;
			return temp;
		}

		private function lbShuoming_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbShuoming = temp;
			temp.name = "lbShuoming";
			temp.height = 55;
			temp.htmlText = "挥动武器横扫三次，每次造成<font color='#5DBD37'>25%+1</font>伤害，<br>每次攻击产生<font color='#5DBD37'>2</font>点怒气值";
			temp.leading = 1;
			temp.letterSpacing = 0;
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 268;
			temp.x = 11;
			temp.y = 136;
			return temp;
		}

		private function lbType_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbType = temp;
			temp.name = "lbType";
			temp.text = "被动技能";
			temp.color = 0xE2D8BE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 69;
			temp.x = 170;
			temp.y = 35;
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
			temp.height = 252;
			temp.styleName = "ui/common/tips/jinengdi.png";
			temp.width = 280;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}