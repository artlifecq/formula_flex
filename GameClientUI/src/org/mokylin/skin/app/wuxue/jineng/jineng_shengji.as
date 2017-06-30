package org.mokylin.skin.app.wuxue.jineng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_putong;

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

		public var eft_name:feathers.controls.Label;

		public var lb_dengji:feathers.controls.Label;

		public var lb_leixing:feathers.controls.Label;

		public var lb_lengque:feathers.controls.Label;

		public var lb_name:feathers.controls.Label;

		public var lb_renwudengji:feathers.controls.Label;

		public var lb_xiaohao:feathers.controls.Label;

		public var lb_yinliang:feathers.controls.Label;

		public var lb_zhenqi:feathers.controls.Label;

		public var line1:feathers.controls.UIAsset;

		public var line2:feathers.controls.UIAsset;

		public var ms_txt:feathers.controls.Label;

		public var tj_name:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function jineng_shengji()
		{
			super();
			
			this.currentState = "normal";
			this.height = 422;
			this.width = 362;
			this.elementsContent = [__jineng_shengji_UIAsset3_i(),line1_i(),line2_i(),Icon_jineng_i(),lb_name_i(),lb_dengji_i(),lb_xiaohao_i(),lb_leixing_i(),lb_lengque_i(),__jineng_shengji_Label1_i(),ms_txt_i(),eft_name_i(),arrow1_i(),arrow2_i(),eft1_i(),eft2_i(),tj_name_i(),lb_renwudengji_i(),lb_zhenqi_i(),lb_yinliang_i(),btn_shengji_i()];
			
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
			temp.styleName = "ui/app/wuxue/jineng/jinengkuang.png";
			temp.x = 16;
			temp.y = 21;
			return temp;
		}

		private function __jineng_shengji_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "技能效果";
			temp.color = 0xe8c958;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 146;
			temp.y = 98;
			return temp;
		}

		private function __jineng_shengji_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/wuxue/jineng/fengexian.png";
			temp.width = 332;
			temp.x = 14;
			temp.y = 89;
			return temp;
		}

		private function arrow1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			arrow1 = temp;
			temp.name = "arrow1";
			temp.styleName = "ui/common/tubiao/tu_up.png";
			temp.x = 119;
			temp.y = 227;
			return temp;
		}

		private function arrow2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			arrow2 = temp;
			temp.name = "arrow2";
			temp.styleName = "ui/common/tubiao/tu_up.png";
			temp.x = 119;
			temp.y = 250;
			return temp;
		}

		private function btn_shengji_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shengji = temp;
			temp.name = "btn_shengji";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "技能升级";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xFFFFFF;
			temp.width = 90;
			temp.x = 136;
			temp.y = 372;
			return temp;
		}

		private function eft1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			eft1 = temp;
			temp.name = "eft1";
			temp.htmlText = "技能可升至<font color='#5DBD37'>31</font>级";
			temp.letterSpacing = 1;
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 129;
			temp.y = 224;
			return temp;
		}

		private function eft2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			eft2 = temp;
			temp.name = "eft2";
			temp.htmlText = "<font color='#5DBD37'>8%</font>单次伤害秒伤";
			temp.letterSpacing = 1;
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 132;
			temp.y = 247;
			return temp;
		}

		private function eft_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			eft_name = temp;
			temp.name = "eft_name";
			temp.fontSize = 16;
			temp.text = "下一级效果";
			temp.textAlign = "center";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 139;
			temp.y = 198;
			return temp;
		}

		private function lb_dengji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_dengji = temp;
			temp.name = "lb_dengji";
			temp.text = "等级:1/30";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 84;
			temp.y = 43;
			return temp;
		}

		private function lb_leixing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_leixing = temp;
			temp.name = "lb_leixing";
			temp.text = "技能类型：瞬发";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 227;
			temp.y = 43;
			return temp;
		}

		private function lb_lengque_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_lengque = temp;
			temp.name = "lb_lengque";
			temp.text = "时间冷却：无";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 227;
			temp.y = 61;
			return temp;
		}

		private function lb_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_name = temp;
			temp.name = "lb_name";
			temp.fontSize = 16;
			temp.text = "侵掠如火";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 83;
			temp.y = 14;
			return temp;
		}

		private function lb_renwudengji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_renwudengji = temp;
			temp.name = "lb_renwudengji";
			temp.height = 19;
			temp.htmlText = "人物等级：<font color='#CFC6AE'>56</font>";
			temp.letterSpacing = 1;
			temp.textAlign = "left";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 330;
			temp.x = 16;
			temp.y = 302;
			return temp;
		}

		private function lb_xiaohao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_xiaohao = temp;
			temp.name = "lb_xiaohao";
			temp.text = "消耗：无";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 84;
			temp.y = 61;
			return temp;
		}

		private function lb_yinliang_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_yinliang = temp;
			temp.name = "lb_yinliang";
			temp.htmlText = "消耗绑银：<font color='#CFC6AE'>214461</font>";
			temp.letterSpacing = 1;
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 330;
			temp.x = 16;
			temp.y = 348;
			return temp;
		}

		private function lb_zhenqi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_zhenqi = temp;
			temp.name = "lb_zhenqi";
			temp.htmlText = "消耗真气：<font color='#CFC6AE'>54124</font>";
			temp.letterSpacing = 1;
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 330;
			temp.x = 16;
			temp.y = 324;
			return temp;
		}

		private function line1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line1 = temp;
			temp.name = "line1";
			temp.styleName = "ui/app/wuxue/jineng/fengexian.png";
			temp.width = 332;
			temp.x = 14;
			temp.y = 191;
			return temp;
		}

		private function line2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line2 = temp;
			temp.name = "line2";
			temp.styleName = "ui/app/wuxue/jineng/fengexian.png";
			temp.width = 332;
			temp.x = 14;
			temp.y = 270;
			return temp;
		}

		private function ms_txt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			ms_txt = temp;
			temp.name = "ms_txt";
			temp.height = 66;
			temp.htmlText = "挥动长枪扫除一片火焰，对自身前方<font color='#5DBD37'>60</font>度半径<font color='#5DBD37'>10</font>米的扇形范围内的敌人造成<font color='#5DBD37'>3</font>次伤害，每次伤害<font color='#5DBD37'>25%</font>秒伤，每击中<font color='#5DBD37'>1</font>个目标可产生<font color='#5DBD37'>2</font>点怒气值";
			temp.leading = 6;
			temp.letterSpacing = 1;
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 337;
			temp.x = 15;
			temp.y = 124;
			return temp;
		}

		private function tj_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			tj_name = temp;
			temp.name = "tj_name";
			temp.fontSize = 16;
			temp.text = "升级条件";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 146;
			temp.y = 278;
			return temp;
		}

	}
}