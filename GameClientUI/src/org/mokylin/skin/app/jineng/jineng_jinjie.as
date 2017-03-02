package org.mokylin.skin.app.jineng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.jineng.button.ButtonShengji;
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

		public var btn_jinjie:feathers.controls.Button;

		public var btn_jinnengUp:feathers.controls.Button;

		public var txt_daoju:feathers.controls.Label;

		public var txt_daojuNum:feathers.controls.Label;

		public var txt_dengji:feathers.controls.Label;

		public var txt_leixing:feathers.controls.Label;

		public var txt_lengque:feathers.controls.Label;

		public var txt_miaoshu:feathers.controls.Label;

		public var txt_renwudengji:feathers.controls.Label;

		public var txt_xiaohao:feathers.controls.Label;

		public var txt_yinliang:feathers.controls.Label;

		public var txt_zhenqi:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function jineng_jinjie()
		{
			super();
			
			this.currentState = "normal";
			this.height = 435;
			this.width = 362;
			this.elementsContent = [__jineng_jinjie_UIAsset2_i(),__jineng_jinjie_UIAsset3_i(),__jineng_jinjie_UIAsset4_i(),Icon_jineng_i(),__jineng_jinjie_Label1_i(),txt_dengji_i(),txt_xiaohao_i(),txt_leixing_i(),txt_lengque_i(),__jineng_jinjie_Label2_i(),__jineng_jinjie_Label3_i(),Icon_jineng2_i(),__jineng_jinjie_Label4_i(),txt_miaoshu_i(),__jineng_jinjie_Label5_i(),__jineng_jinjie_Label6_i(),__jineng_jinjie_Label7_i(),__jineng_jinjie_Label8_i(),__jineng_jinjie_Label9_i(),txt_renwudengji_i(),txt_zhenqi_i(),txt_yinliang_i(),txt_daoju_i(),txt_daojuNum_i(),btn_jinjie_i(),btn_jinnengUp_i()];
			
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
			temp.styleName = "ui/app/jineng/jinengkuang.png";
			temp.x = 16;
			temp.y = 148;
			return temp;
		}

		private function Icon_jineng_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon_jineng = temp;
			temp.name = "Icon_jineng";
			temp.styleName = "ui/app/jineng/jinengkuang.png";
			temp.x = 16;
			temp.y = 48;
			return temp;
		}

		private function __jineng_jinjie_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "侵掠如火";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 83;
			temp.y = 41;
			return temp;
		}

		private function __jineng_jinjie_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "技能进阶效果";
			temp.color = 0xe8c958;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 147;
			temp.y = 127;
			return temp;
		}

		private function __jineng_jinjie_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "【未激活】";
			temp.color = 0xD02525;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 276;
			temp.y = 127;
			return temp;
		}

		private function __jineng_jinjie_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "怒火中烧";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 83;
			temp.y = 155;
			return temp;
		}

		private function __jineng_jinjie_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "技能进阶条件";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 147;
			temp.y = 227;
			return temp;
		}

		private function __jineng_jinjie_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "技能等级： ";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 120;
			temp.y = 256;
			return temp;
		}

		private function __jineng_jinjie_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "消耗真气：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 120;
			temp.y = 278;
			return temp;
		}

		private function __jineng_jinjie_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "消耗绑银：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 120;
			temp.y = 302;
			return temp;
		}

		private function __jineng_jinjie_Label9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "消耗道具：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 120;
			temp.y = 324;
			return temp;
		}

		private function __jineng_jinjie_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/jineng/fengexian.png";
			temp.width = 332;
			temp.x = 14;
			temp.y = 116;
			return temp;
		}

		private function __jineng_jinjie_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/jineng/fengexian.png";
			temp.width = 332;
			temp.x = 14;
			temp.y = 218;
			return temp;
		}

		private function __jineng_jinjie_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/jineng/jinengjinjie.png";
			temp.x = 127;
			temp.y = 9;
			return temp;
		}

		private function btn_jinjie_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jinjie = temp;
			temp.name = "btn_jinjie";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "技能升级";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.width = 90;
			temp.x = 136;
			temp.y = 394;
			return temp;
		}

		private function btn_jinnengUp_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jinnengUp = temp;
			temp.name = "btn_jinnengUp";
			temp.styleClass = org.mokylin.skin.app.jineng.button.ButtonShengji;
			temp.x = 293;
			temp.y = 371;
			return temp;
		}

		private function txt_daojuNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_daojuNum = temp;
			temp.name = "txt_daojuNum";
			temp.letterSpacing = 0;
			temp.text = "（0/1）";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 258;
			temp.y = 324;
			return temp;
		}

		private function txt_daoju_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_daoju = temp;
			temp.name = "txt_daoju";
			temp.letterSpacing = 0;
			temp.text = "技能书残页";
			temp.color = 0x6BCC08;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 192;
			temp.y = 324;
			return temp;
		}

		private function txt_dengji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_dengji = temp;
			temp.name = "txt_dengji";
			temp.text = "等级:1/30";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 84;
			temp.y = 70;
			return temp;
		}

		private function txt_leixing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_leixing = temp;
			temp.name = "txt_leixing";
			temp.text = "技能类型：瞬发";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 227;
			temp.y = 70;
			return temp;
		}

		private function txt_lengque_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_lengque = temp;
			temp.name = "txt_lengque";
			temp.text = "时间冷却：无";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 227;
			temp.y = 88;
			return temp;
		}

		private function txt_miaoshu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_miaoshu = temp;
			temp.name = "txt_miaoshu";
			temp.height = 21;
			temp.leading = 6;
			temp.letterSpacing = 1;
			temp.text = "每击中一个目标额外产生3点怒气";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 239;
			temp.x = 83;
			temp.y = 184;
			return temp;
		}

		private function txt_renwudengji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_renwudengji = temp;
			temp.name = "txt_renwudengji";
			temp.letterSpacing = 1;
			temp.text = "30级";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 192;
			temp.y = 256;
			return temp;
		}

		private function txt_xiaohao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_xiaohao = temp;
			temp.name = "txt_xiaohao";
			temp.text = "消耗：无";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 84;
			temp.y = 88;
			return temp;
		}

		private function txt_yinliang_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_yinliang = temp;
			temp.name = "txt_yinliang";
			temp.letterSpacing = 1;
			temp.text = "214461";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 192;
			temp.y = 302;
			return temp;
		}

		private function txt_zhenqi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_zhenqi = temp;
			temp.name = "txt_zhenqi";
			temp.letterSpacing = 1;
			temp.text = "54124";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 192;
			temp.y = 278;
			return temp;
		}

	}
}