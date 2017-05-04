package org.mokylin.skin.app.beibao.zhangong
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.beibao.zhangong.Progress_dengji;
	import org.mokylin.skin.component.button.ButtonSkin_putong4;

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
		public var btnUp:feathers.controls.Button;

		public var conver:feathers.controls.UIAsset;

		public var lbLevelCurrent:feathers.controls.Label;

		public var lbLevelNext:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var lbNum:feathers.controls.Label;

		public var lbShengming:feathers.controls.Label;

		public var pro_bar:feathers.controls.ProgressBar;

		public var skBoss:feathers.controls.SkinnableContainer;

		public var uiDao:feathers.controls.UIAsset;

		public var uiType:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BossItem_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 192;
			this.width = 210;
			this.elementsContent = [__BossItem_Skin_UIAsset1_i(),conver_i(),skBoss_i(),__BossItem_Skin_UIAsset2_i(),uiDao_i(),__BossItem_Skin_UIAsset3_i(),uiType_i(),__BossItem_Skin_UIAsset4_i(),lbShengming_i(),lbLevelNext_i(),lbLevelCurrent_i(),pro_bar_i(),lbNum_i(),lbName_i(),btnUp_i()];
			
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
			temp.styleName = "ui/app/beibao/zhangong/guaiwubeijing.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __BossItem_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/zhangong/wenzidi1.png";
			temp.x = 37;
			temp.y = 3;
			return temp;
		}

		private function __BossItem_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/zhangong/guaiwuxinxibg.png";
			temp.x = 1;
			temp.y = 123;
			return temp;
		}

		private function __BossItem_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/zhangong/jindutiao/jdtbg.png";
			temp.width = 99;
			temp.x = 57;
			temp.y = 144;
			return temp;
		}

		private function btnUp_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnUp = temp;
			temp.name = "btnUp";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "升 级";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong4;
			temp.color = 0xCFC6AE;
			temp.x = 68;
			temp.y = 160;
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
			temp.fontSize = 14;
			temp.text = "LV.0";
			temp.textAlign = "right";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 53;
			temp.x = 4;
			temp.y = 142;
			return temp;
		}

		private function lbLevelNext_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLevelNext = temp;
			temp.name = "lbLevelNext";
			temp.text = "LV.1";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 53;
			temp.x = 157;
			temp.y = 141;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.letterSpacing = 1;
			temp.text = "腥红小婊贝";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 82;
			temp.x = 58;
			temp.y = 6;
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
			temp.width = 57;
			temp.x = 78;
			temp.y = 143;
			return temp;
		}

		private function lbShengming_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbShengming = temp;
			temp.name = "lbShengming";
			temp.text = "+12";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 53;
			temp.x = 67;
			temp.y = 125;
			return temp;
		}

		private function pro_bar_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_bar = temp;
			temp.name = "pro_bar";
			temp.styleClass = org.mokylin.skin.app.beibao.zhangong.Progress_dengji;
			temp.value = 40;
			temp.x = 64;
			temp.y = 146;
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

		private function uiDao_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiDao = temp;
			temp.name = "uiDao";
			temp.styleName = "ui/app/beibao/zhangong/zhandoutubiao.png";
			temp.x = 137;
			temp.y = 7;
			return temp;
		}

		private function uiType_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiType = temp;
			temp.name = "uiType";
			temp.styleName = "ui/app/beibao/zhangong/jiacheng/huigen.png";
			temp.x = 28;
			temp.y = 126;
			return temp;
		}

	}
}