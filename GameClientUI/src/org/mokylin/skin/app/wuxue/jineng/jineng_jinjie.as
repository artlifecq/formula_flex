package org.mokylin.skin.app.wuxue.jineng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class jineng_jinjie extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icon_jineng:feathers.controls.UIAsset;

		public var Icon_jineng2:feathers.controls.UIAsset;

		public var Icon_lock:feathers.controls.UIAsset;

		public var btn_jinjie:feathers.controls.Button;

		public var eft_name:feathers.controls.UIAsset;

		public var grp_tiaojian:feathers.controls.Group;

		public var lb_daoju:feathers.controls.Label;

		public var lb_daoju1:feathers.controls.Label;

		public var lb_dengji:feathers.controls.Label;

		public var lb_jihuo:feathers.controls.Label;

		public var lb_jinengdengji:feathers.controls.Label;

		public var lb_leixing:feathers.controls.Label;

		public var lb_lengque:feathers.controls.Label;

		public var lb_miaoshu:feathers.controls.Label;

		public var lb_name:feathers.controls.Label;

		public var lb_name2:feathers.controls.Label;

		public var lb_renwudengji:feathers.controls.Label;

		public var lb_weijihuo:feathers.controls.Label;

		public var lb_xiaohao:feathers.controls.Label;

		public var lb_yinliang:feathers.controls.Label;

		public var lb_zhenqi:feathers.controls.Label;

		public var tj_name:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function jineng_jinjie()
		{
			super();
			
			this.currentState = "normal";
			this.height = 394;
			this.width = 340;
			this.elementsContent = [__jineng_jinjie_UIAsset1_i(),Icon_jineng_i(),__jineng_jinjie_UIAsset2_i(),lb_name_i(),lb_dengji_i(),lb_xiaohao_i(),lb_leixing_i(),lb_lengque_i(),lb_weijihuo_i(),lb_jihuo_i(),Icon_jineng2_i(),Icon_lock_i(),__jineng_jinjie_UIAsset3_i(),lb_name2_i(),lb_miaoshu_i(),grp_tiaojian_i(),btn_jinjie_i(),eft_name_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icon_jineng2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon_jineng2 = temp;
			temp.name = "Icon_jineng2";
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 4;
			temp.y = 117;
			return temp;
		}

		private function Icon_jineng_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon_jineng = temp;
			temp.name = "Icon_jineng";
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 4;
			temp.y = 11;
			return temp;
		}

		private function Icon_lock_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon_lock = temp;
			temp.name = "Icon_lock";
			temp.styleName = "ui/app/wuxue/jineng/suo.png";
			temp.x = 8;
			temp.y = 120;
			return temp;
		}

		private function __jineng_jinjie_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/wuxue/jineng/kuantiao.png";
			temp.width = 331;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __jineng_jinjie_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/wuxue/jineng/mzd.png";
			temp.x = 86;
			temp.y = 10;
			return temp;
		}

		private function __jineng_jinjie_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/wuxue/jineng/mzd.png";
			temp.x = 86;
			temp.y = 116;
			return temp;
		}

		private function btn_jinjie_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jinjie = temp;
			temp.name = "btn_jinjie";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "技能进阶";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 132;
			temp.y = 357;
			return temp;
		}

		private function eft_name_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			eft_name = temp;
			temp.name = "eft_name";
			temp.styleName = "ui/app/wuxue/jineng/jnjjxg.png";
			temp.x = 3;
			temp.y = 97;
			return temp;
		}

		private function grp_tiaojian_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_tiaojian = temp;
			temp.name = "grp_tiaojian";
			temp.height = 131;
			temp.width = 331;
			temp.x = 3;
			temp.y = 205;
			temp.elementsContent = [lb_jinengdengji_i(),lb_renwudengji_i(),lb_zhenqi_i(),lb_yinliang_i(),lb_daoju_i(),lb_daoju1_i(),tj_name_i()];
			return temp;
		}

		private function lb_daoju1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_daoju1 = temp;
			temp.name = "lb_daoju1";
			temp.height = 24;
			temp.letterSpacing = 1;
			temp.text = "技能书残页(0/1)";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 220;
			temp.x = 70;
			temp.y = 80;
			return temp;
		}

		private function lb_daoju_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_daoju = temp;
			temp.name = "lb_daoju";
			temp.height = 24;
			temp.letterSpacing = 1;
			temp.text = "消耗道具：";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 80;
			temp.x = 0;
			temp.y = 80;
			return temp;
		}

		private function lb_dengji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_dengji = temp;
			temp.name = "lb_dengji";
			temp.text = "等级:1/30";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 88;
			temp.y = 40;
			return temp;
		}

		private function lb_jihuo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_jihuo = temp;
			temp.name = "lb_jihuo";
			temp.fontSize = 16;
			temp.text = "【已激活】";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 261;
			temp.y = 118;
			return temp;
		}

		private function lb_jinengdengji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_jinengdengji = temp;
			temp.name = "lb_jinengdengji";
			temp.htmlText = "人物等级：<font color='#CFC6AE'>56</font>";
			temp.letterSpacing = 1;
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 320;
			temp.x = 0;
			temp.y = 18;
			return temp;
		}

		private function lb_leixing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_leixing = temp;
			temp.name = "lb_leixing";
			temp.text = "技能类型：瞬发";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 182;
			temp.y = 40;
			return temp;
		}

		private function lb_lengque_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_lengque = temp;
			temp.name = "lb_lengque";
			temp.text = "时间冷却：无";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 182;
			temp.y = 62;
			return temp;
		}

		private function lb_miaoshu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_miaoshu = temp;
			temp.name = "lb_miaoshu";
			temp.height = 21;
			temp.leading = 6;
			temp.letterSpacing = 1;
			temp.text = "每击中一个目标额外产生3点怒气";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 239;
			temp.x = 89;
			temp.y = 142;
			return temp;
		}

		private function lb_name2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_name2 = temp;
			temp.name = "lb_name2";
			temp.fontSize = 16;
			temp.text = "怒火中烧";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 100;
			temp.x = 93;
			temp.y = 117;
			return temp;
		}

		private function lb_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_name = temp;
			temp.name = "lb_name";
			temp.fontSize = 16;
			temp.text = "技能名字";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 93;
			temp.x = 93;
			temp.y = 11;
			return temp;
		}

		private function lb_renwudengji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_renwudengji = temp;
			temp.name = "lb_renwudengji";
			temp.letterSpacing = 1;
			temp.text = "技能等级：56";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 320;
			temp.x = 0;
			temp.y = 19;
			return temp;
		}

		private function lb_weijihuo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_weijihuo = temp;
			temp.name = "lb_weijihuo";
			temp.fontSize = 16;
			temp.text = "【未激活】";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 261;
			temp.y = 118;
			return temp;
		}

		private function lb_xiaohao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_xiaohao = temp;
			temp.name = "lb_xiaohao";
			temp.text = "消耗：无";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 88;
			temp.y = 62;
			return temp;
		}

		private function lb_yinliang_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_yinliang = temp;
			temp.name = "lb_yinliang";
			temp.letterSpacing = 1;
			temp.text = "消耗绑银：5636";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 320;
			temp.x = 0;
			temp.y = 59;
			return temp;
		}

		private function lb_zhenqi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_zhenqi = temp;
			temp.name = "lb_zhenqi";
			temp.letterSpacing = 1;
			temp.text = "消耗真气：54124";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 320;
			temp.x = 0;
			temp.y = 39;
			return temp;
		}

		private function tj_name_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			tj_name = temp;
			temp.name = "tj_name";
			temp.styleName = "ui/app/wuxue/jineng/jnsjtj.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}