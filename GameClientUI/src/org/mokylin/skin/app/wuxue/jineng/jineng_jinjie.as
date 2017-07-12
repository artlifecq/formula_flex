package org.mokylin.skin.app.wuxue.jineng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_putong;

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

		public var eft_name:feathers.controls.Label;

		public var grp_tiaojian:feathers.controls.Group;

		public var lb_daoju:feathers.controls.Label;

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

		public var line1:feathers.controls.UIAsset;

		public var line2:feathers.controls.UIAsset;

		public var tj_name:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function jineng_jinjie()
		{
			super();
			
			this.currentState = "normal";
			this.height = 422;
			this.width = 362;
			this.elementsContent = [line1_i(),line2_i(),Icon_jineng_i(),lb_name_i(),lb_dengji_i(),lb_xiaohao_i(),lb_leixing_i(),lb_lengque_i(),eft_name_i(),lb_weijihuo_i(),lb_jihuo_i(),Icon_jineng2_i(),Icon_lock_i(),lb_name2_i(),lb_miaoshu_i(),grp_tiaojian_i(),btn_jinjie_i()];
			
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
			temp.styleName = "ui/app/wuxue/jineng/64dakuang.png";
			temp.x = 16;
			temp.y = 118;
			return temp;
		}

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

		private function Icon_lock_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon_lock = temp;
			temp.name = "Icon_lock";
			temp.styleName = "ui/app/wuxue/jineng/suo.png";
			temp.x = 21;
			temp.y = 121;
			return temp;
		}

		private function btn_jinjie_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jinjie = temp;
			temp.name = "btn_jinjie";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "技能进阶";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xFFFFFF;
			temp.width = 90;
			temp.x = 136;
			temp.y = 367;
			return temp;
		}

		private function eft_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			eft_name = temp;
			temp.name = "eft_name";
			temp.fontSize = 16;
			temp.text = "技能进阶效果";
			temp.textAlign = "center";
			temp.color = 0xe8c958;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 330;
			temp.x = 15;
			temp.y = 99;
			return temp;
		}

		private function grp_tiaojian_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_tiaojian = temp;
			temp.name = "grp_tiaojian";
			temp.height = 131;
			temp.width = 331;
			temp.x = 15;
			temp.y = 227;
			temp.elementsContent = [tj_name_i(),lb_jinengdengji_i(),lb_renwudengji_i(),lb_zhenqi_i(),lb_yinliang_i(),lb_daoju_i()];
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
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 80;
			temp.x = 0;
			temp.y = 106;
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

		private function lb_jihuo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_jihuo = temp;
			temp.name = "lb_jihuo";
			temp.fontSize = 16;
			temp.text = "【已激活】";
			temp.color = 0x55BD15;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 159;
			temp.y = 127;
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
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 320;
			temp.x = 0;
			temp.y = 28;
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

		private function lb_miaoshu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_miaoshu = temp;
			temp.name = "lb_miaoshu";
			temp.height = 21;
			temp.htmlText = "每击中一个目标额外产生3点怒气";
			temp.leading = 6;
			temp.letterSpacing = 1;
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 239;
			temp.x = 98;
			temp.y = 156;
			return temp;
		}

		private function lb_name2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_name2 = temp;
			temp.name = "lb_name2";
			temp.fontSize = 16;
			temp.text = "怒火中烧";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 98;
			temp.y = 127;
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
			temp.htmlText = "技能等级：<font color='#CFC6AE'>56</font>";
			temp.letterSpacing = 1;
			temp.textAlign = "left";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 320;
			temp.x = 0;
			temp.y = 28;
			return temp;
		}

		private function lb_weijihuo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_weijihuo = temp;
			temp.name = "lb_weijihuo";
			temp.fontSize = 16;
			temp.text = "【未激活】";
			temp.color = 0xD23735;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 159;
			temp.y = 127;
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
			temp.htmlText = "消耗绑银：<font color='#CFC6AE'>5636</font>";
			temp.letterSpacing = 1;
			temp.textAlign = "left";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 320;
			temp.x = 0;
			temp.y = 79;
			return temp;
		}

		private function lb_zhenqi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_zhenqi = temp;
			temp.name = "lb_zhenqi";
			temp.htmlText = "消耗真气：<font color='#CFC6AE'>54124</font>";
			temp.letterSpacing = 1;
			temp.textAlign = "left";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 320;
			temp.x = 0;
			temp.y = 52;
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
			temp.y = 89;
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
			temp.y = 218;
			return temp;
		}

		private function tj_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			tj_name = temp;
			temp.name = "tj_name";
			temp.fontSize = 16;
			temp.text = "技能进阶条件";
			temp.textAlign = "center";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 330;
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

	}
}