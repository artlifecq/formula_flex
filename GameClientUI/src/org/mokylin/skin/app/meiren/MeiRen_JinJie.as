package org.mokylin.skin.app.meiren
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.meiren.Pro_Meiren;
	import org.mokylin.skin.common.TongYongTanKuang_bg;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MeiRen_JinJie extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var barJindu:feathers.controls.ProgressBar;

		public var bg:feathers.controls.SkinnableContainer;

		public var btnClose:feathers.controls.Button;

		public var btnJinjie:feathers.controls.Button;

		public var btnStop:feathers.controls.Button;

		public var btnZidong:feathers.controls.Button;

		public var cboxTip:feathers.controls.Check;

		public var grpBar:feathers.controls.Group;

		public var lbCailiao:feathers.controls.Label;

		public var lbInfo:feathers.controls.Label;

		public var lbJindu:feathers.controls.Label;

		public var uiLevel:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MeiRen_JinJie()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),__MeiRen_JinJie_UIAsset1_i(),__MeiRen_JinJie_UIAsset2_i(),btnClose_i(),__MeiRen_JinJie_UIAsset3_i(),uiLevel_i(),__MeiRen_JinJie_Label1_i(),lbCailiao_i(),cboxTip_i(),lbInfo_i(),grpBar_i(),btnJinjie_i(),btnZidong_i(),btnStop_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MeiRen_JinJie_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "消耗：";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 14;
			temp.y = 478;
			return temp;
		}

		private function __MeiRen_JinJie_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 518;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 309;
			temp.x = 6;
			temp.y = 33;
			return temp;
		}

		private function __MeiRen_JinJie_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/meiren/bg2.jpg";
			temp.x = 8;
			temp.y = 39;
			return temp;
		}

		private function __MeiRen_JinJie_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/meiren/meirenjinjie2.png";
			temp.x = 116;
			temp.y = 7;
			return temp;
		}

		private function __MeiRen_JinJie_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/progress/jindutiao2/jdt_di.png";
			temp.width = 265;
			temp.x = -1;
			temp.y = 0;
			return temp;
		}

		private function barJindu_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			barJindu = temp;
			temp.name = "barJindu";
			temp.styleClass = org.mokylin.skin.app.meiren.Pro_Meiren;
			temp.value = 100;
			temp.x = 20;
			temp.y = 3;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 557;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg()
			temp.skin = skin
			temp.width = 321;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 289;
			temp.y = 3;
			return temp;
		}

		private function btnJinjie_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJinjie = temp;
			temp.name = "btnJinjie";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "美人进阶";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.x = 43;
			temp.y = 502;
			return temp;
		}

		private function btnStop_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnStop = temp;
			temp.name = "btnStop";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "停止进阶";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.x = 112;
			temp.y = 502;
			return temp;
		}

		private function btnZidong_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnZidong = temp;
			temp.name = "btnZidong";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "自动进阶";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.x = 189;
			temp.y = 502;
			return temp;
		}

		private function cboxTip_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			cboxTip = temp;
			temp.name = "cboxTip";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.labelOffsetY = 3;
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.color = 0x00FF33;
			temp.width = 23;
			temp.x = 184;
			temp.y = 476;
			return temp;
		}

		private function grpBar_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpBar = temp;
			temp.name = "grpBar";
			temp.x = 28;
			temp.y = 445;
			temp.elementsContent = [__MeiRen_JinJie_UIAsset4_i(),barJindu_i(),lbJindu_i()];
			return temp;
		}

		private function lbCailiao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCailiao = temp;
			temp.name = "lbCailiao";
			temp.height = 18;
			temp.text = "美人进阶符*10(100)";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 140;
			temp.x = 50;
			temp.y = 478;
			return temp;
		}

		private function lbInfo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbInfo = temp;
			temp.name = "lbInfo";
			temp.text = "自动购买材料";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 111;
			temp.x = 209;
			temp.y = 478;
			return temp;
		}

		private function lbJindu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJindu = temp;
			temp.name = "lbJindu";
			temp.text = "800/1000";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 223;
			temp.x = 20;
			temp.y = 3;
			return temp;
		}

		private function uiLevel_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLevel = temp;
			temp.name = "uiLevel";
			temp.styleName = "ui/pet/jieshu/12.png";
			temp.x = 267;
			temp.y = 49;
			return temp;
		}

	}
}