package org.mokylin.skin.app.jineng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.jineng.button.ButtonJinjie;
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

		public var btn_jinjie:feathers.controls.Button;

		public var btn_shengji:feathers.controls.Button;

		public var txt_dengji:feathers.controls.Label;

		public var txt_leixing:feathers.controls.Label;

		public var txt_lengque:feathers.controls.Label;

		public var txt_miaoshu:feathers.controls.Label;

		public var txt_renwudengji:feathers.controls.Label;

		public var txt_shengji:feathers.controls.Label;

		public var txt_xiaohao:feathers.controls.Label;

		public var txt_yinliang:feathers.controls.Label;

		public var txt_zhenqi:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function jineng_shengji()
		{
			super();
			
			this.currentState = "normal";
			this.height = 435;
			this.width = 362;
			this.elementsContent = [__jineng_shengji_UIAsset2_i(),__jineng_shengji_UIAsset3_i(),__jineng_shengji_UIAsset4_i(),__jineng_shengji_UIAsset5_i(),Icon_jineng_i(),__jineng_shengji_Label1_i(),txt_dengji_i(),txt_xiaohao_i(),txt_leixing_i(),txt_lengque_i(),__jineng_shengji_Label2_i(),txt_miaoshu_i(),__jineng_shengji_Label3_i(),txt_shengji_i(),__jineng_shengji_Label4_i(),__jineng_shengji_Label5_i(),__jineng_shengji_Label6_i(),__jineng_shengji_Label7_i(),txt_renwudengji_i(),txt_zhenqi_i(),txt_yinliang_i(),btn_shengji_i(),btn_jinjie_i()];
			
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
			temp.styleName = "ui/app/jineng/jinengkuang.png";
			temp.x = 16;
			temp.y = 48;
			return temp;
		}

		private function __jineng_shengji_Label1_i():feathers.controls.Label
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

		private function __jineng_shengji_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "技能效果";
			temp.color = 0xe8c958;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 147;
			temp.y = 127;
			return temp;
		}

		private function __jineng_shengji_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "升级效果";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 147;
			temp.y = 227;
			return temp;
		}

		private function __jineng_shengji_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "升级条件";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 147;
			temp.y = 289;
			return temp;
		}

		private function __jineng_shengji_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "人物等级：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 120;
			temp.y = 316;
			return temp;
		}

		private function __jineng_shengji_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "消耗真气：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 120;
			temp.y = 338;
			return temp;
		}

		private function __jineng_shengji_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "消耗绑银：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 120;
			temp.y = 362;
			return temp;
		}

		private function __jineng_shengji_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/jineng/fengexian.png";
			temp.width = 332;
			temp.x = 14;
			temp.y = 116;
			return temp;
		}

		private function __jineng_shengji_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/jineng/fengexian.png";
			temp.width = 332;
			temp.x = 14;
			temp.y = 218;
			return temp;
		}

		private function __jineng_shengji_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/jineng/fengexian.png";
			temp.width = 332;
			temp.x = 14;
			temp.y = 277;
			return temp;
		}

		private function __jineng_shengji_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/jineng/jinengshengji.png";
			temp.x = 127;
			temp.y = 9;
			return temp;
		}

		private function btn_jinjie_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jinjie = temp;
			temp.name = "btn_jinjie";
			temp.styleClass = org.mokylin.skin.app.jineng.button.ButtonJinjie;
			temp.x = 293;
			temp.y = 371;
			return temp;
		}

		private function btn_shengji_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shengji = temp;
			temp.name = "btn_shengji";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "技能升级";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.width = 90;
			temp.x = 136;
			temp.y = 394;
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
			temp.height = 66;
			temp.htmlText = "挥动长枪扫除一片火焰，对自身前方<font color='#5DBD37'>60</font>度半径<font color='#5DBD37'>10</font>米的扇形范围内的敌人造成<font color='#5DBD37'>3</font>次伤害，每次伤害<font color='#5DBD37'>25%</font>秒伤，每击中<font color='#5DBD37'>1</font>个目标可产生<font color='#5DBD37'>2</font>点怒气值";
			temp.leading = 6;
			temp.letterSpacing = 1;
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 337;
			temp.x = 15;
			temp.y = 151;
			return temp;
		}

		private function txt_renwudengji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_renwudengji = temp;
			temp.name = "txt_renwudengji";
			temp.letterSpacing = 1;
			temp.text = "56";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 192;
			temp.y = 316;
			return temp;
		}

		private function txt_shengji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_shengji = temp;
			temp.name = "txt_shengji";
			temp.height = 19;
			temp.htmlText = "技能可升至<font color='#5DBD31'>60</font>级，<font color='#5DBD37'>8%</font>单次伤害秒伤";
			temp.letterSpacing = 1;
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 288;
			temp.x = 64;
			temp.y = 252;
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
			temp.y = 362;
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
			temp.y = 338;
			return temp;
		}

	}
}