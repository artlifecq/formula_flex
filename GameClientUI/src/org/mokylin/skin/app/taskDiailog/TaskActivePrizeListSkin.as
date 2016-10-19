package org.mokylin.skin.app.taskDiailog
{
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TaskActivePrizeListSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var awardTips:feathers.controls.UIAsset;

		public var grid0:feathers.controls.UIAsset;

		public var grid1:feathers.controls.UIAsset;

		public var grid2:feathers.controls.UIAsset;

		public var grid3:feathers.controls.UIAsset;

		public var grid4:feathers.controls.UIAsset;

		public var grid5:feathers.controls.UIAsset;

		public var gridsGroup:feathers.controls.Group;

		public var lbAdditional:feathers.controls.Label;

		public var lbExp:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TaskActivePrizeListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 130;
			this.width = 576;
			this.elementsContent = [__TaskActivePrizeListSkin_UIAsset1_i(),__TaskActivePrizeListSkin_UIAsset2_i(),lbExp_i(),lbAdditional_i(),gridsGroup_i(),__TaskActivePrizeListSkin_UIAsset3_i(),__TaskActivePrizeListSkin_UIAsset4_i(),awardTips_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TaskActivePrizeListSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 4;
			return temp;
		}

		private function __TaskActivePrizeListSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/npc/exp.png";
			temp.x = 9;
			temp.y = 26;
			return temp;
		}

		private function __TaskActivePrizeListSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/npc/rw_award.png";
			temp.x = 233;
			temp.y = 0;
			return temp;
		}

		private function __TaskActivePrizeListSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/bar/fenge1.png";
			temp.x = 123;
			temp.y = 11;
			return temp;
		}

		private function __TaskActivePrizeListSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/bar/fenge2.png";
			temp.x = 336;
			temp.y = 12;
			return temp;
		}

		private function awardTips_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			awardTips = temp;
			temp.name = "awardTips";
			temp.styleName = "ui/common/version_3/T_tubiao/T_tongyongxiaotubiao/ling_qu_jiang_li.png";
			temp.x = 65;
			temp.y = 25;
			return temp;
		}

		private function grid0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid0 = temp;
			temp.name = "grid0";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grid1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid1 = temp;
			temp.name = "grid1";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 64;
			temp.y = 0;
			return temp;
		}

		private function grid2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid2 = temp;
			temp.name = "grid2";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 128;
			temp.y = 0;
			return temp;
		}

		private function grid3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid3 = temp;
			temp.name = "grid3";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 193;
			temp.y = 0;
			return temp;
		}

		private function grid4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid4 = temp;
			temp.name = "grid4";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 259;
			temp.y = 0;
			return temp;
		}

		private function grid5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid5 = temp;
			temp.name = "grid5";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 327;
			temp.y = 0;
			return temp;
		}

		private function gridsGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gridsGroup = temp;
			temp.name = "gridsGroup";
			temp.height = 55;
			temp.width = 346;
			temp.x = 18;
			temp.y = 70;
			temp.layout = __TaskActivePrizeListSkin_HorizontalLayout1_i();
			temp.elementsContent = [grid0_i(),grid1_i(),grid2_i(),grid3_i(),grid4_i(),grid5_i()];
			return temp;
		}

		private function lbAdditional_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbAdditional = temp;
			temp.name = "lbAdditional";
			temp.height = 24;
			temp.leading = 5;
			temp.letterSpacing = NaN;
			temp.fontSize = 14;
			temp.color = 0x4EFD6F;
			temp.width = 294;
			temp.x = 230;
			temp.y = 30;
			return temp;
		}

		private function lbExp_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbExp = temp;
			temp.name = "lbExp";
			temp.height = 24;
			temp.leading = 5;
			temp.letterSpacing = NaN;
			temp.fontSize = 14;
			temp.color = 0x4EFD6F;
			temp.width = 431;
			temp.x = 92;
			temp.y = 30;
			return temp;
		}

	}
}