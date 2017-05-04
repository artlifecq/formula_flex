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

		public var skill_name:feathers.controls.UIAsset;

		public var tipbg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_BeiDongJiNeng()
		{
			super();
			
			this.currentState = "normal";
			this.height = 349;
			this.width = 281;
			this.elementsContent = [tipbg_i(),__Tips_BeiDongJiNeng_UIAsset1_i(),skill_name_i(),Icon1_i(),__Tips_BeiDongJiNeng_Label1_i(),lbJIhuo_i(),__Tips_BeiDongJiNeng_UIAsset2_i(),lbShuoming_i(),jihuogroup_i()];
			
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
			temp.x = 106;
			temp.y = 41;
			return temp;
		}

		private function __Tips_BeiDongJiNeng_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "被动技能";
			temp.color = 0xE2D8BE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 31;
			temp.y = 128;
			return temp;
		}

		private function __Tips_BeiDongJiNeng_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 9;
			temp.y = 163;
			return temp;
		}

		private function __Tips_BeiDongJiNeng_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/jinengshuoming.png";
			temp.x = 106;
			temp.y = 182;
			return temp;
		}

		private function __Tips_BeiDongJiNeng_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/tou.png";
			temp.x = 48;
			temp.y = 12;
			return temp;
		}

		private function __Tips_BeiDongJiNeng_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/jihuotiaojian.png";
			temp.x = 108;
			temp.y = 10;
			return temp;
		}

		private function jihuogroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			jihuogroup = temp;
			temp.name = "jihuogroup";
			temp.height = 83;
			temp.left = 3;
			temp.right = 3;
			temp.y = 263;
			temp.elementsContent = [__Tips_BeiDongJiNeng_UIAsset3_i(),__Tips_BeiDongJiNeng_UIAsset4_i(),lbDengji_i()];
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
			temp.x = 30;
			temp.y = 39;
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
			temp.width = 58;
			temp.x = 189;
			temp.y = 128;
			return temp;
		}

		private function lbShuoming_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbShuoming = temp;
			temp.name = "lbShuoming";
			temp.height = 55;
			temp.text = "挥动武器横扫三次，每次造成25%+1伤害，每次攻击产生2点怒气值";
			temp.color = 0xA18F51;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 225;
			temp.x = 31;
			temp.y = 210;
			return temp;
		}

		private function skill_name_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			skill_name = temp;
			temp.name = "skill_name";
			temp.styleName = "ui/common/tips/jinengming/qingnueruhuo.png";
			temp.x = 89;
			temp.y = 10;
			return temp;
		}

		private function tipbg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			tipbg = temp;
			temp.name = "tipbg";
			temp.height = 349;
			temp.styleName = "ui/common/tips/diban2.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}