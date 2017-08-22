package org.mokylin.skin.app.beibao.zhangong
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.beibao.zhangong.Pro_Zhangong;
	import org.mokylin.skin.app.beibao.zhangong.button.ButtonShengjibtn;
	import org.mokylin.skin.app.beibao.zhangong.uinumber.UINumberZhangongNo;
	import org.mokylin.skin.component.button.ButtonSkin_send;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BossItem_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnDao:feathers.controls.Button;

		public var btnUp:feathers.controls.Button;

		public var conver:feathers.controls.UIAsset;

		public var grpUp:feathers.controls.Group;

		public var lbLevelCurrent:feathers.controls.Label;

		public var lbLevelNext:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var lbNum:feathers.controls.Label;

		public var lbNumUp:feathers.controls.Label;

		public var numZhanli:feathers.controls.UINumber;

		public var pro_bar:feathers.controls.ProgressBar;

		public var skBoss:feathers.controls.SkinnableContainer;

		public var ui:feathers.controls.Group;

		public var uiBg:feathers.controls.UIAsset;

		public var uiDian:feathers.controls.UIAsset;

		public var uiName:feathers.controls.UIAsset;

		public var uiUp:feathers.controls.UIAsset;

		public var ui_nameBg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BossItem_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 199;
			this.width = 217;
			this.elementsContent = [uiBg_i(),skBoss_i(),__BossItem_Skin_UIAsset1_i(),__BossItem_Skin_UIAsset2_i(),pro_bar_i(),lbNum_i(),conver_i(),lbLevelNext_i(),lbLevelCurrent_i(),uiName_i(),numZhanli_i(),grpUp_i(),btnUp_i(),uiDian_i(),ui_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __BossItem_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/zhangong/xinxibg.png";
			temp.x = 4;
			temp.y = 113;
			return temp;
		}

		private function __BossItem_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/zhangong/jindutiaodi.png";
			temp.x = 7;
			temp.y = 152;
			return temp;
		}

		private function btnDao_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnDao = temp;
			temp.name = "btnDao";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_send;
			temp.x = 53;
			temp.y = 0;
			return temp;
		}

		private function btnUp_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnUp = temp;
			temp.name = "btnUp";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "升 级";
			temp.labelOffsetY = 2;
			temp.styleClass = org.mokylin.skin.app.beibao.zhangong.button.ButtonShengjibtn;
			temp.color = 0xEAEABC;
			temp.x = 68;
			temp.y = 169;
			return temp;
		}

		private function conver_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			conver = temp;
			temp.name = "conver";
			temp.height = 199;
			temp.styleName = "ui/app/beibao/zhangong/over.png";
			temp.width = 217;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grpUp_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpUp = temp;
			temp.name = "grpUp";
			temp.x = 66;
			temp.y = 133;
			temp.elementsContent = [uiUp_i(),lbNumUp_i()];
			return temp;
		}

		private function lbLevelCurrent_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLevelCurrent = temp;
			temp.name = "lbLevelCurrent";
			temp.fontSize = 14;
			temp.text = "Lv0";
			temp.textAlign = "left";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 50;
			temp.x = 5;
			temp.y = 174;
			return temp;
		}

		private function lbLevelNext_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLevelNext = temp;
			temp.name = "lbLevelNext";
			temp.fontSize = 14;
			temp.text = "Lv1";
			temp.textAlign = "right";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 50;
			temp.x = 157;
			temp.y = 173;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.letterSpacing = 1;
			temp.fontSize = 14;
			temp.text = "BOSS名";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 82;
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function lbNumUp_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNumUp = temp;
			temp.name = "lbNumUp";
			temp.fontSize = 14;
			temp.text = "+16";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 35;
			temp.x = 9;
			temp.y = 0;
			return temp;
		}

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.fontSize = 14;
			temp.text = "3/9";
			temp.textAlign = "center";
			temp.color = 0xFFFFFF;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 86;
			temp.x = 69;
			temp.y = 150;
			return temp;
		}

		private function numZhanli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numZhanli = temp;
			temp.name = "numZhanli";
			temp.gap = -2;
			temp.height = 19;
			temp.label = "+12";
			temp.styleClass = org.mokylin.skin.app.beibao.zhangong.uinumber.UINumberZhangongNo;
			temp.width = 55;
			temp.x = 39;
			temp.y = 137;
			return temp;
		}

		private function pro_bar_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_bar = temp;
			temp.name = "pro_bar";
			temp.minimum = 50;
			temp.styleClass = org.mokylin.skin.app.beibao.zhangong.Pro_Zhangong;
			temp.x = 16;
			temp.y = 154;
			return temp;
		}

		private function skBoss_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skBoss = temp;
			temp.name = "skBoss";
			temp.height = 199;
			temp.width = 217;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiBg = temp;
			temp.name = "uiBg";
			temp.styleName = "ui/app/beibao/zhangong/itembg.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiDian_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiDian = temp;
			temp.name = "uiDian";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/common/tubiao/tishi.png";
			temp.x = 129;
			temp.y = 172;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.styleName = "ui/app/beibao/zhangong/jiacheng/shengming.png";
			temp.x = 6;
			temp.y = 134;
			return temp;
		}

		private function uiUp_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiUp = temp;
			temp.name = "uiUp";
			temp.styleName = "ui/app/beibao/zhangong/min_up.png";
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function ui_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			ui = temp;
			temp.name = "ui";
			temp.x = 6;
			temp.y = 112;
			temp.elementsContent = [ui_nameBg_i(),lbName_i(),btnDao_i()];
			return temp;
		}

		private function ui_nameBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_nameBg = temp;
			temp.name = "ui_nameBg";
			temp.height = 22;
			temp.styleName = "ui/common/hover/xuanqukuang2_alpha.png";
			temp.width = 75;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}