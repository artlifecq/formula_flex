package org.mokylin.skin.app.banghui
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.banghui.button.ButtonJinengup;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhujuezhandouli;

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

		public var imgmax:feathers.controls.UIAsset;

		public var lbXiaohao:feathers.controls.Label;

		public var lbYuanbao:feathers.controls.Label;

		public var skinFangyu:feathers.controls.UINumber;

		public var skinGongji:feathers.controls.UINumber;

		public var skinShengming:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Skill_TongShuai()
		{
			super();
			
			this.currentState = "normal";
			this.height = 506;
			this.width = 785;
			this.elementsContent = [__Skill_TongShuai_UIAsset1_i(),__Skill_TongShuai_UIAsset2_i(),__Skill_TongShuai_UIAsset3_i(),lbYuanbao_i(),lbXiaohao_i(),btnUP_i(),icon_i(),__Skill_TongShuai_UIAsset4_i(),imgmax_i(),skinGongji_i(),skinFangyu_i(),skinShengming_i(),__Skill_TongShuai_Label1_i(),__Skill_TongShuai_Label2_i()];
			
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
			temp.height = 62;
			temp.leading = 5;
			temp.text = "统帅技能在每周日24时重置，重置后技能将变为激活状态";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 135;
			temp.x = 62;
			temp.y = 303;
			return temp;
		}

		private function __Skill_TongShuai_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 62;
			temp.leading = 5;
			temp.text = "统帅技能赋予属性仅会在争霸战中生效";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 135;
			temp.x = 57;
			temp.y = 369;
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
			temp.styleName = "ui/big_bg/banghui/qizi.png";
			temp.x = 26;
			temp.y = 23;
			return temp;
		}

		private function __Skill_TongShuai_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 488;
			temp.y = 477;
			return temp;
		}

		private function __Skill_TongShuai_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/icon/11.png";
			temp.x = 70;
			temp.y = 53;
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
			temp.x = 581;
			temp.y = 422;
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.styleName = "ui/app/banghui/tubiaokuang.png";
			temp.x = 65;
			temp.y = 48;
			return temp;
		}

		private function imgmax_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgmax = temp;
			temp.name = "imgmax";
			temp.styleName = "ui/app/banghui/yimanji.png";
			temp.x = 600;
			temp.y = 400;
			return temp;
		}

		private function lbXiaohao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbXiaohao = temp;
			temp.name = "lbXiaohao";
			temp.htmlText = "本次花费元宝：<font color='#00ff33'>9999</font>";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 144;
			temp.x = 601;
			temp.y = 482;
			return temp;
		}

		private function lbYuanbao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbYuanbao = temp;
			temp.name = "lbYuanbao";
			temp.text = "9999999999";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 85;
			temp.x = 515;
			temp.y = 481;
			return temp;
		}

		private function skinFangyu_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			skinFangyu = temp;
			temp.name = "skinFangyu";
			temp.gap = -5;
			temp.height = 25;
			temp.label = "x6298";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhujuezhandouli;
			temp.width = 94;
			temp.x = 104;
			temp.y = 227;
			return temp;
		}

		private function skinGongji_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			skinGongji = temp;
			temp.name = "skinGongji";
			temp.gap = -5;
			temp.height = 25;
			temp.label = "x6298";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhujuezhandouli;
			temp.width = 94;
			temp.x = 104;
			temp.y = 196;
			return temp;
		}

		private function skinShengming_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			skinShengming = temp;
			temp.name = "skinShengming";
			temp.gap = -5;
			temp.height = 25;
			temp.label = "x6298";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhujuezhandouli;
			temp.width = 94;
			temp.x = 104;
			temp.y = 258;
			return temp;
		}

	}
}