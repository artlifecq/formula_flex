package org.mokylin.skin.app.wuxue.jineng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class jineng_shengji extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icon_jineng:feathers.controls.UIAsset;

		public var arrow1:feathers.controls.UIAsset;

		public var arrow2:feathers.controls.UIAsset;

		public var btn_shengji:feathers.controls.Button;

		public var eft1:feathers.controls.Label;

		public var eft2:feathers.controls.Label;

		public var eft_name:feathers.controls.UIAsset;

		public var lb_dengji:feathers.controls.Label;

		public var lb_leixing:feathers.controls.Label;

		public var lb_lengque:feathers.controls.Label;

		public var lb_name:feathers.controls.Label;

		public var lb_renwudengji:feathers.controls.Label;

		public var lb_xiaohao:feathers.controls.Label;

		public var lb_yinliang:feathers.controls.Label;

		public var lb_zhenqi:feathers.controls.Label;

		public var ms_txt:feathers.controls.Label;

		public var tj_name:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function jineng_shengji()
		{
			super();
			
			this.currentState = "normal";
			this.height = 394;
			this.width = 340;
			this.elementsContent = [__jineng_shengji_UIAsset2_i(),Icon_jineng_i(),__jineng_shengji_UIAsset3_i(),lb_name_i(),lb_dengji_i(),lb_xiaohao_i(),lb_leixing_i(),lb_lengque_i(),__jineng_shengji_UIAsset4_i(),ms_txt_i(),eft1_i(),eft2_i(),arrow1_i(),arrow2_i(),lb_renwudengji_i(),lb_zhenqi_i(),lb_yinliang_i(),btn_shengji_i(),eft_name_i(),tj_name_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
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

		private function __jineng_shengji_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/wuxue/jineng/kuantiao.png";
			temp.width = 331;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __jineng_shengji_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/wuxue/jineng/mzd.png";
			temp.x = 85;
			temp.y = 10;
			return temp;
		}

		private function __jineng_shengji_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/wuxue/jineng/jnxg.png";
			temp.x = 4;
			temp.y = 95;
			return temp;
		}

		private function arrow1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			arrow1 = temp;
			temp.name = "arrow1";
			temp.styleName = "ui/common/tubiao/jobup.png";
			temp.x = 5;
			temp.y = 205;
			return temp;
		}

		private function arrow2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			arrow2 = temp;
			temp.name = "arrow2";
			temp.styleName = "ui/common/tubiao/jobup.png";
			temp.x = 5;
			temp.y = 224;
			return temp;
		}

		private function btn_shengji_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shengji = temp;
			temp.name = "btn_shengji";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "技能升级";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 132;
			temp.y = 357;
			return temp;
		}

		private function eft1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			eft1 = temp;
			temp.name = "eft1";
			temp.letterSpacing = 1;
			temp.text = "技能可升至31级";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 20;
			temp.y = 203;
			return temp;
		}

		private function eft2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			eft2 = temp;
			temp.name = "eft2";
			temp.letterSpacing = 1;
			temp.text = "8%单次伤害秒伤";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 23;
			temp.y = 222;
			return temp;
		}

		private function eft_name_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			eft_name = temp;
			temp.name = "eft_name";
			temp.styleName = "ui/app/wuxue/jineng/xyjxg.png";
			temp.x = 4;
			temp.y = 183;
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
			temp.x = 92;
			temp.y = 11;
			return temp;
		}

		private function lb_renwudengji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_renwudengji = temp;
			temp.name = "lb_renwudengji";
			temp.height = 19;
			temp.letterSpacing = 1;
			temp.text = "人物等级：56";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 330;
			temp.x = 3;
			temp.y = 273;
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
			temp.text = "消耗绑银：214461";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 330;
			temp.x = 3;
			temp.y = 319;
			return temp;
		}

		private function lb_zhenqi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_zhenqi = temp;
			temp.name = "lb_zhenqi";
			temp.letterSpacing = 1;
			temp.text = "消耗真气：54124";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 330;
			temp.x = 3;
			temp.y = 295;
			return temp;
		}

		private function ms_txt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			ms_txt = temp;
			temp.name = "ms_txt";
			temp.height = 66;
			temp.leading = 6;
			temp.letterSpacing = 1;
			temp.text = "挥动长枪扫除一片火焰，对自身前方60度半径10米的扇形范围内的敌人造成3次伤害，每次伤害25%秒伤，每击中1个目标可产生2点怒气值";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 337;
			temp.x = 2;
			temp.y = 114;
			return temp;
		}

		private function tj_name_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			tj_name = temp;
			temp.name = "tj_name";
			temp.styleName = "ui/app/wuxue/jineng/jnjjtj.png";
			temp.x = 4;
			temp.y = 254;
			return temp;
		}

	}
}