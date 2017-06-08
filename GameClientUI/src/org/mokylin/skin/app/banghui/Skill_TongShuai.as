package org.mokylin.skin.app.banghui
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.banghui.button.ButtonJinengup;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Skill_TongShuai extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnUP:feathers.controls.Button;

		public var icon:feathers.controls.UIAsset;

		public var lbFangyu:feathers.controls.Label;

		public var lbGongji:feathers.controls.Label;

		public var lbShengming:feathers.controls.Label;

		public var lbUp:feathers.controls.Label;

		public var lbXiaohao:feathers.controls.Label;

		public var lbYuanbao:feathers.controls.Label;

		public var uiUp:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Skill_TongShuai()
		{
			super();
			
			this.currentState = "normal";
			this.height = 506;
			this.width = 788;
			this.elementsContent = [__Skill_TongShuai_UIAsset1_i(),icon_i(),__Skill_TongShuai_UIAsset2_i(),__Skill_TongShuai_UIAsset3_i(),__Skill_TongShuai_UIAsset4_i(),__Skill_TongShuai_UIAsset5_i(),__Skill_TongShuai_UIAsset6_i(),lbGongji_i(),lbFangyu_i(),lbShengming_i(),uiUp_i(),lbUp_i(),__Skill_TongShuai_Label1_i(),__Skill_TongShuai_UIAsset7_i(),lbYuanbao_i(),lbXiaohao_i(),btnUP_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Skill_TongShuai_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "统帅技能将在每周日24时重置，重置后技能将变成未激活状态";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 24;
			temp.y = 479;
			return temp;
		}

		private function __Skill_TongShuai_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/banghui/bg4_2.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Skill_TongShuai_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/shuxingjiacheng.png";
			temp.x = 25;
			temp.y = 349;
			return temp;
		}

		private function __Skill_TongShuai_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.scaleX = -1;
			temp.styleName = "ui/app/banghui/huawen1.png";
			temp.x = 162;
			temp.y = 355;
			return temp;
		}

		private function __Skill_TongShuai_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/gongji.png";
			temp.x = 26;
			temp.y = 378;
			return temp;
		}

		private function __Skill_TongShuai_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/fangyu.png";
			temp.x = 25;
			temp.y = 404;
			return temp;
		}

		private function __Skill_TongShuai_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/shengmin.png";
			temp.x = 25;
			temp.y = 431;
			return temp;
		}

		private function __Skill_TongShuai_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 455;
			temp.y = 475;
			return temp;
		}

		private function btnUP_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnUP = temp;
			temp.name = "btnUP";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "升级到LV1";
			temp.fontSize = 18;
			temp.styleClass = org.mokylin.skin.app.banghui.button.ButtonJinengup;
			temp.color = 0xCFC6AE;
			temp.x = 598;
			temp.y = 416;
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.styleName = "ui/app/banghui/tubiaokuang.png";
			temp.x = 41;
			temp.y = 265;
			return temp;
		}

		private function lbFangyu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbFangyu = temp;
			temp.name = "lbFangyu";
			temp.text = "防御：0";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 47;
			temp.y = 405;
			return temp;
		}

		private function lbGongji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbGongji = temp;
			temp.name = "lbGongji";
			temp.text = "攻击：100";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 47;
			temp.y = 378;
			return temp;
		}

		private function lbShengming_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbShengming = temp;
			temp.name = "lbShengming";
			temp.text = "生命：0";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 47;
			temp.y = 432;
			return temp;
		}

		private function lbUp_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbUp = temp;
			temp.name = "lbUp";
			temp.text = "+10";
			temp.color = 0x6BCC08;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 40;
			temp.x = 136;
			temp.y = 378;
			return temp;
		}

		private function lbXiaohao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbXiaohao = temp;
			temp.name = "lbXiaohao";
			temp.htmlText = "本次花费元宝<font color='#5DBD37'>9999</font>";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 164;
			temp.x = 614;
			temp.y = 478;
			return temp;
		}

		private function lbYuanbao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbYuanbao = temp;
			temp.name = "lbYuanbao";
			temp.text = "元宝：99999999999";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 130;
			temp.x = 480;
			temp.y = 479;
			return temp;
		}

		private function uiUp_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiUp = temp;
			temp.name = "uiUp";
			temp.scaleY = -1;
			temp.styleName = "ui/app/banghui/jiantou.png";
			temp.x = 118;
			temp.y = 393;
			return temp;
		}

	}
}