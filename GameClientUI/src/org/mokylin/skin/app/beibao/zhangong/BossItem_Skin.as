package org.mokylin.skin.app.beibao.zhangong
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.beibao.zhangong.button.ButtonZhaodou;
	import org.mokylin.skin.component.button.ButtonSkin_putong5;
	import org.mokylin.skin.component.progress.progress_jindutiao;
	import org.mokylin.skin.component.uinumber.UINumberZhanli_min;

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

		public var lbLevelCurrent:feathers.controls.Label;

		public var lbLevelNext:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var lbNum:feathers.controls.Label;

		public var lbNumUp:feathers.controls.Label;

		public var numZhanli:feathers.controls.UINumber;

		public var pro_bar:feathers.controls.ProgressBar;

		public var skBoss:feathers.controls.SkinnableContainer;

		public var uiBg:feathers.controls.UIAsset;

		public var uiDian:feathers.controls.UIAsset;

		public var uiName:feathers.controls.UIAsset;

		public var uiUp:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BossItem_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 192;
			this.width = 210;
			this.elementsContent = [uiBg_i(),skBoss_i(),__BossItem_Skin_UIAsset1_i(),__BossItem_Skin_UIAsset2_i(),__BossItem_Skin_UIAsset3_i(),pro_bar_i(),lbNum_i(),conver_i(),lbLevelNext_i(),lbLevelCurrent_i(),btnDao_i(),lbName_i(),btnUp_i(),uiDian_i(),uiUp_i(),lbNumUp_i(),uiName_i(),numZhanli_i()];
			
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
			temp.styleName = "ui/app/beibao/zhangong/wenzidi1.png";
			temp.x = 20;
			temp.y = 4;
			return temp;
		}

		private function __BossItem_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/zhangong/guaiwuxinxibg.png";
			temp.x = 1;
			temp.y = 126;
			return temp;
		}

		private function __BossItem_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/progress/jindutiao/jdtbg.png";
			temp.width = 99;
			temp.x = 57;
			temp.y = 152;
			return temp;
		}

		private function btnDao_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnDao = temp;
			temp.name = "btnDao";
			temp.styleClass = org.mokylin.skin.app.beibao.zhangong.button.ButtonZhaodou;
			temp.x = 133;
			temp.y = 10;
			return temp;
		}

		private function btnUp_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnUp = temp;
			temp.name = "btnUp";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "升级";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong5;
			temp.color = 0xCFC6AE;
			temp.width = 64;
			temp.x = 75;
			temp.y = 168;
			return temp;
		}

		private function conver_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			conver = temp;
			temp.name = "conver";
			temp.height = 192;
			temp.styleName = "ui/app/beibao/zhangong/xuankuang.png";
			temp.width = 210;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbLevelCurrent_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLevelCurrent = temp;
			temp.name = "lbLevelCurrent";
			temp.fontSize = 12;
			temp.text = "LV.0";
			temp.textAlign = "right";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 50;
			temp.x = 7;
			temp.y = 150;
			return temp;
		}

		private function lbLevelNext_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLevelNext = temp;
			temp.name = "lbLevelNext";
			temp.fontSize = 12;
			temp.text = "LV.1";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 50;
			temp.x = 157;
			temp.y = 150;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.letterSpacing = 1;
			temp.fontSize = 12;
			temp.text = "腥红小婊贝";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 82;
			temp.x = 60;
			temp.y = 8;
			return temp;
		}

		private function lbNumUp_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNumUp = temp;
			temp.name = "lbNumUp";
			temp.fontSize = 12;
			temp.text = "123";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 35;
			temp.x = 166;
			temp.y = 132;
			return temp;
		}

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.fontSize = 12;
			temp.text = "0/1";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 86;
			temp.x = 65;
			temp.y = 151;
			return temp;
		}

		private function numZhanli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numZhanli = temp;
			temp.name = "numZhanli";
			temp.height = 19;
			temp.label = "x12";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberZhanli_min;
			temp.width = 55;
			temp.x = 71;
			temp.y = 131;
			return temp;
		}

		private function pro_bar_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_bar = temp;
			temp.name = "pro_bar";
			temp.styleClass = org.mokylin.skin.component.progress.progress_jindutiao;
			temp.value = 40;
			temp.x = 64;
			temp.y = 154;
			return temp;
		}

		private function skBoss_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skBoss = temp;
			temp.name = "skBoss";
			temp.height = 192;
			temp.width = 211;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiBg = temp;
			temp.name = "uiBg";
			temp.styleName = "ui/big_bg/beibao/zhangong/guaiwubeijing.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiDian_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiDian = temp;
			temp.name = "uiDian";
			temp.styleName = "ui/common/tubiao/tishi.png";
			temp.x = 121;
			temp.y = 172;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.styleName = "ui/app/beibao/zhangong/jiacheng/shengming.png";
			temp.x = 28;
			temp.y = 130;
			return temp;
		}

		private function uiUp_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiUp = temp;
			temp.name = "uiUp";
			temp.styleName = "ui/common/tubiao/tu_up.png";
			temp.x = 157;
			temp.y = 132;
			return temp;
		}

	}
}